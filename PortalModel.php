<?php

class PortalModel {

    private static $db;

    public function __construct() {
        self::initializeDb();
    }

    private static function initializeDb() {
        if (self::$db === null) {
            self::$db = new mysqli('localhost', 'root', '', 'mce_db');
            if (self::$db->connect_error) {
                die('Connect Error (' . self::$db->connect_errno . ') ' . self::$db->connect_error);
            }
        }
    }

    public static function getDb() {
        self::initializeDb();
        return self::$db;
    }

    public function saveCurrentUserEmail($email_id) {
        $db = self::getDb(); // Ensure the database connection is initialized

        $get_user_email = sprintf("SELECT COUNT(1) FROM `user` WHERE user_email = '%s'", $db->real_escape_string($email_id));
        $get_result = $db->query($get_user_email);

        if (!$get_result) {
            $error_log = array('status' => "Failed", "msg" => "Internal Server Error.", "query" => "$get_user_email");
            $this->response($this->json($error_log), 200);
        } else {
            $num_of_rows = $get_result->fetch_row()[0];
            if ($num_of_rows == 0) {
                $insert_user_email = sprintf("INSERT INTO `user` (`user_email`) VALUES ('%s')", $db->real_escape_string($email_id));
                $result = $db->query($insert_user_email);

                if (!$result) {
                    $error_log = array('status' => "Failed", "msg" => "Internal Server Error.", "query" => "$insert_user_email");
                    $this->response($this->json($error_log), 200);
                } else {
                    $user_id = $db->insert_id;
                    $output = array('status' => "Success", "user_id" => $user_id, "msg" => "Successfully inserted!!!");
                    $this->response($this->json($output), 200);
                }
            } else {
                $output = array('status' => "Exists", "msg" => "Email already exists.");
                $this->response($this->json($output), 200);
            }
        }
    }

    // Helper methods to handle JSON response
    private function json($data) {
        return json_encode($data);
    }

    public function saveQuestionInDb($question, $answer) {
        $db = self::getDb();
        $insert_question = sprintf("INSERT INTO `question_answer` (`question`,`answer`) VALUES ('%s','%s')", $db->real_escape_string($question), $db->real_escape_string($answer));
        $result = $db->query($insert_question);
        if (!$result) {
            $error_log = array('status' => "Failed", "msg" => "Internal Server Error.", "query" => "$insert_question");
            $this->response($this->json($error_log), 200);
        } else {
            $user_id = $db->insert_id;
            $output = array('status' => "Success", "user_id" => $user_id, "msg" => "Question and Answer Successfully inserted!!!");
            $this->response($this->json($output), 200);
        }

    }

    private function response($data, $status = 200) {
        header("HTTP/1.1 " . $status);
        header("Content-Type: application/json");
        echo $data;
        exit;
    }

    public function getQuestionInDb() {
        $output = [];
        $db = self::getDb();
        $get_qa = "SELECT question_id AS id, question, answer AS response FROM `question_answer` where question NOT IN ('introductionMessage', 'noResultsMessage')";
        $get_result = $db->query($get_qa);
        if (!$get_result) {
            $error_log = array('status' => "Failed", "msg" => "Internal Server Error.", "query" => "$get_qa");
            $this->response($this->json($error_log), 200);
        } else {
            // Check if there are rows returned
            if ($get_result->num_rows > 0) {
                while ($row = $get_result->fetch_assoc()) {
                    $output[] = $row;
                }
                $result = array('status' => "Success", "msg" => $output);
                $this->response($this->json($result), 200);
            } else {
                // Handle case where no rows are returned
                $result = array('status' => "Success", "msg" => "No questions found");
                $this->response($this->json($result), 200);
            }
        }
    }

    public function getSettingsInDb() {
        $output = [];
        $db = self::getDb();
        $get_qa = "SELECT question_id AS id, question, answer AS response FROM `question_answer` where question in ('introductionMessage', 'noResultsMessage')";
        $get_result = $db->query($get_qa);
        if (!$get_result) {
            $error_log = array('status' => "Failed", "msg" => "Internal Server Error.", "query" => "$get_qa");
            $this->response($this->json($error_log), 200);
        } else {
            // Check if there are rows returned
            if ($get_result->num_rows > 0) {
                while ($row = $get_result->fetch_assoc()) {
                    $output[] = $row;
                }
                $result = array('status' => "Success", "msg" => $output);
                $this->response($this->json($result), 200);
            } else {
                // Handle case where no rows are returned
                $result = array('status' => "Success", "msg" => "No Settings found");
                $this->response($this->json($result), 200);
            }
        }
    }

    public function updateQuestion($id, $question, $answer) {
        $db = self::getDb();
        $stmt = $db->prepare("UPDATE `question_answer` SET question=?, answer=? WHERE question_id=?");
        $stmt->bind_param('ssi', $question, $answer, $id);
        if ($stmt->execute()) {
            $result = array('status' => "Success", "msg" => "Successfully Updated!!!");
            $this->response($this->json($result), 200);
        } else {
            echo "Error updating record: " . $stmt->error;
        }
        $stmt->close();
    }

    public function deleteQA($id) {
        $db = self::getDb();
        $delete = sprintf("DELETE FROM `question_answer` WHERE question_id=$id");
        $delete_result = $db->query($delete);
        if (!$delete_result) {
            $error_log = array('status' => "Failed", "msg" => "Internal Server Error.", "query" => "$delete");
            $this->response($this->json($error_log), 200);
        } else {
            $result = array('status' => "Success", "msg" => "Deleted Successfully!!!");
            $this->response($this->json($result), 200);
        }
    }

    public function getQuestionAnswer($question) {
        $db = self::getDb();
        $stmt = $db->prepare("SELECT answer,question_id FROM `question_answer` WHERE question = ?");
        $stmt->bind_param('s', $question);
        if (!$stmt) {
            echo "Error preparing statement: " . $db->error;
            return;
        }
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            if ($row = $result->fetch_assoc()) {
               $question_id = $row['question_id'];
                $response = array('status' => "Success", "msg" => $row['answer']);
            } else {
                $response = array('status' => "Error", "msg" => "No answer found for the provided question.");
            }
          
            $stmt = $db->prepare("UPDATE `question_answer` SET asked_count=asked_count+1 WHERE question_id=?");
            $stmt->bind_param('i', $question_id);
            if ($stmt->execute()) {
                $result = array('status' => "Success", "msg" => "Successfully Updated!!!");
                 
            } else {
                echo "Error updating record: " . $stmt->error;
            }
            $stmt->close();

            $this->response($this->json($response), 200);
        } else {
            echo "Error executing statement: " . $stmt->error;
        }

        $stmt->close();
    }

    public function saveSettingsInDb($introductionMessage, $noResultsMessage) {
        $db = self::getDb();
    
        // Check if the introduction message and no results message already exist
        $stmt = $db->prepare("SELECT question FROM `question_answer` WHERE question IN ('introductionMessage', 'noResultsMessage')");
        if (!$stmt) {
            echo "Error preparing statement: " . $db->error;
            return;
        }
    
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $existingQuestions = [];
            while ($row = $result->fetch_assoc()) {
                $existingQuestions[] = $row['question'];
            }
            $stmt->close();
    
            // Update or insert based on existence check
            if (in_array('introductionMessage', $existingQuestions)) {
                $stmt = $db->prepare("UPDATE `question_answer` SET answer=? WHERE question='introductionMessage'");
                $stmt->bind_param('s', $introductionMessage);
                if (!$stmt->execute()) {
                    $stmt->close();
                    $result = array('status' => "Error", "msg" => "Error updating introduction message: " . $stmt->error);
                    $this->response($this->json($result), 500);
                    return;
                }
                $stmt->close();
            } else {
                $stmt = $db->prepare("INSERT INTO `question_answer` (question, answer) VALUES ('introductionMessage', ?)");
                $stmt->bind_param('s', $introductionMessage);
                if (!$stmt->execute()) {
                    $stmt->close();
                    $result = array('status' => "Error", "msg" => "Error inserting introduction message: " . $stmt->error);
                    $this->response($this->json($result), 500);
                    return;
                }
                $stmt->close();
            }
    
            if (in_array('noResultsMessage', $existingQuestions)) {
                $stmt2 = $db->prepare("UPDATE `question_answer` SET answer=? WHERE question='noResultsMessage'");
                $stmt2->bind_param('s', $noResultsMessage);
                if (!$stmt2->execute()) {
                    $stmt2->close();
                    $result = array('status' => "Error", "msg" => "Error updating no results message: " . $stmt2->error);
                    $this->response($this->json($result), 500);
                    return;
                }
                $stmt2->close();
            } else {
                $stmt2 = $db->prepare("INSERT INTO `question_answer` (question, answer) VALUES ('noResultsMessage', ?)");
                $stmt2->bind_param('s', $noResultsMessage);
                if (!$stmt2->execute()) {
                    $stmt2->close();
                    $result = array('status' => "Error", "msg" => "Error inserting no results message: " . $stmt2->error);
                    $this->response($this->json($result), 500);
                    return;
                }
                $stmt2->close();
            }
    
            $result = array('status' => "Success", "msg" => "Successfully Updated!!!");
            $this->response($this->json($result), 200);
        } else {
            $stmt->close();
            $result = array('status' => "Error", "msg" => "Error executing select query: " . $stmt->error);
            $this->response($this->json($result), 500);
        }
    }

    public function getQuestionAnswerCountInDB($question){
        $db = self::getDb();
    
      $stmt = $db->prepare("SELECT question,asked_count FROM `question_answer` where question_id not in (1,2) ORDER BY `asked_count` desc limit 0,6");
        if (!$stmt) {
            echo "Error preparing statement: " . $db->error;
            return;
        }
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $question_count = [];
            while ($row = $result->fetch_assoc()) {
                $question_count[] = $row;
            }
            $stmt->close();
            $result = array('status' => "Success", "msg" => $question_count);
            $this->response($this->json($result), 200);
      }
}
}