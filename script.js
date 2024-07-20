var questions = [];
var email_valid = false;

function openChatPage() {
    window.location.href = 'chat.html';
}

function closeChat() {
    window.location.href = 'index.html';
}

function sendMessage() {
    var userInput = $('#message-input').val();
    $('#message-input').val('');

    if (userInput.length > 0) {
        if (isValidEmail(userInput) && questions.length == 0) {
            addEmailMessage(userInput);
        } else {
            addMessage(userInput);
        }
    }
}

function addEmailMessage(userInput) {
    // Append user message
    var chatContainer = $('#chat-messages');
    var userMessage = $('<div>').addClass('message user-message').text(userInput);
    chatContainer.append(userMessage);

    var helpMessage = "Thank you for providing your email address! We'll use this to assist you further. How can I help you today?";
    email_valid = true;

    $.ajax({
        url: 'PortalApi.php',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            email_id: userInput
        }),
        headers: {
            'X-Function-Name': 'saveUserEmail'
        },
        success: function (response) {
            console.log(response);
            if (response.status === 'Success') {
                // Append help message
                var helpResponse = $('<div>').addClass('message help-message').text(helpMessage);
                chatContainer.append(helpResponse);

                // Scroll to bottom of chat
                chatContainer.scrollTop(chatContainer[0].scrollHeight);
            } else {
                $('#error-message').text('Failed to create question');
            }
        },
        error: function () {
            $('#error-message').text('Failed to create question');
        }
    });


}

function addMessage(userInput) {
    // Append user message
    var chatContainer = $('#chat-messages');
    var userMessage = $('<div>').addClass('message user-message').text(userInput);
    chatContainer.append(userMessage);

    var department = userInput.trim();
    var helpMessage = '';

    if (questions.length == 0 && !email_valid) {
        helpMessage = 'Sorry, I cannot assist with that request. Could you please provide your email address?';

        // Append help message
        var helpResponse = $('<div>').addClass('message help-message').text(helpMessage);
        chatContainer.append(helpResponse);

        // Scroll to bottom of chat
        chatContainer.scrollTop(chatContainer[0].scrollHeight);
    } else {
        $.ajax({
            url: 'PortalApi.php',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                question: userInput
            }),
            headers: {
                'X-Function-Name': 'responseQuestion'
            },
            success: function (response) {
                console.log(response);
                if (response.status === 'Success') {
                    helpMessage = response.msg;

                    let newQuestion = {
                        id: questions.length + 1,
                        question: userInput
                    };
                    questions.push(newQuestion);
                    console.log(questions);

                    // Append help message
                    var helpResponse = $('<div>').addClass('message help-message').html(helpMessage);
                    chatContainer.append(helpResponse);

                    // Scroll to bottom of chat
                    chatContainer.scrollTop(chatContainer[0].scrollHeight);
                } else {
                    $('#error-message').text('Failed to create question');
                }
            },
            error: function () {
                $('#error-message').text('Failed to create question');
            }
        });


    }

}

function isValidEmail(email) {
    // Very basic email validation
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}
