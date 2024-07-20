<?php

require_once 'PortalModel.php'; // Include the PortalModel class
error_reporting(E_ALL);
ini_set("display_errors", 1);
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-Function-Name");

class PortalApi extends PortalModel {

    public $_request;

    public function callProcessApi() {
        if ($_SERVER['REQUEST_METHOD'] == "POST") {
            // Retrieve the raw POST data
            $inputParameters = file_get_contents('php://input');
            // Decode JSON data
            $this->_request = is_null($inputParameters) ? NULL : json_decode($inputParameters, true);

            // Check if JSON decoding was successful
            if (is_null($this->_request)) {
                echo json_encode(['status' => 'error', 'message' => 'Invalid JSON input']);
                return;
            }
        }

        // Retrieve the custom header
        $functionName = isset($_SERVER['HTTP_X_FUNCTION_NAME']) ? $_SERVER['HTTP_X_FUNCTION_NAME'] : null;

        if ($functionName) {
            // Dynamically call the method if it exists
            if (method_exists($this, $functionName)) {
                $this->$functionName();
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Function not found']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Missing function name or email_id']);
        }
    }

    public function saveUserEmail() {
        if ($_SERVER['REQUEST_METHOD'] != "POST") {
            $error = array("status" => "Failed", "code" => 406, "msg" => "Not Acceptable.");
            $this->response($this->json($error), 406);
        }
        $email_id = '';
        if (isset($this->_request['email_id'])) {
            $email_id = $this->_request['email_id'];
        }


        $this->saveCurrentUserEmail($email_id);
    }

    public function createQuestion() {
        if ($_SERVER['REQUEST_METHOD'] != "POST") {
            $error = array("status" => "Failed", "code" => 406, "msg" => "Not Acceptable.");
            $this->response($this->json($error), 406);
        }
        $question = $answer = '';
        if (isset($this->_request['question'])) {
            $question = $this->_request['question'];
        }

        if (isset($this->_request['answer'])) {
            $answer = $this->_request['answer'];
        }
        $this->saveQuestionInDb($question, $answer);
    }

    public function loadQuestions() {
        if ($_SERVER['REQUEST_METHOD'] != "GET") {
            $error = array("status" => "Failed", "code" => 406, "msg" => "Not Acceptable.");
            $this->response($this->json($error), 406);
        }
        $this->getQuestionInDb();
    }

    public function loadSettings() {
        if ($_SERVER['REQUEST_METHOD'] != "GET") {
            $error = array("status" => "Failed", "code" => 406, "msg" => "Not Acceptable.");
            $this->response($this->json($error), 406);
        }
        $this->getSettingsInDb();
    }

    public function editQuestion() {
        if ($_SERVER['REQUEST_METHOD'] != "POST") {
            $error = array("status" => "Failed", "code" => 406, "msg" => "Not Acceptable.");
            $this->response($this->json($error), 406);
        }
        $id = $question = $answer = '';
        if (isset($this->_request['id'])) {
            $id = $this->_request['id'];
        }
        if (isset($this->_request['question'])) {
            $question = $this->_request['question'];
        }

        if (isset($this->_request['answer'])) {
            $answer = $this->_request['answer'];
        }
        $this->updateQuestion($id, $question, $answer);
    }

    public function deleteQuestion() {
        if ($_SERVER['REQUEST_METHOD'] != "POST") {
            $error = array("status" => "Failed", "code" => 406, "msg" => "Not Acceptable.");
            $this->response($this->json($error), 406);
        }
        $id = '';
        if (isset($this->_request['id'])) {
            $id = $this->_request['id'];
        }
        $this->deleteQA($id);
    }

    public function responseQuestion() {
        if ($_SERVER['REQUEST_METHOD'] != "POST") {
            $error = array("status" => "Failed", "code" => 406, "msg" => "Not Acceptable.");
            $this->response($this->json($error), 406);
        }
        $question = '';
        if (isset($this->_request['question'])) {
            $question = $this->_request['question'];
        }
        $this->getQuestionAnswer($question);
    }
    
    public function saveSettings(){
        if ($_SERVER['REQUEST_METHOD'] != "POST") {
            $error = array("status" => "Failed", "code" => 406, "msg" => "Not Acceptable.");
            $this->response($this->json($error), 406);
        }
        $introductionMessage = $noResultsMessage= '';
        if (isset($this->_request['introductionMessage'])) {
            $introductionMessage = $this->_request['introductionMessage'];
        }
         
        if (isset($this->_request['noResultsMessage'])) {
            $noResultsMessage = $this->_request['noResultsMessage'];
        }

        $this->saveSettingsInDb($introductionMessage,$noResultsMessage);
        
    }
    public function getQuestionAnswerCount(){
        if ($_SERVER['REQUEST_METHOD'] != "GET") {
            $error = array("status" => "Failed", "code" => 406, "msg" => "Not Acceptable.");
            $this->response($this->json($error), 406);
        }
        $question = '';
        if (isset($this->_request['question'])) {
            $question = $this->_request['question'];
        }   
        $this->getQuestionAnswerCountInDB($question);

    }

}

// Instantiate the PortalApi class and call the method
$api = new PortalApi();
$api->callProcessApi();
?>
