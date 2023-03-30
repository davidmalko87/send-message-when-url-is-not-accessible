# Define the URL to ping
$url = 'google.com'

# Ping the website
$response = Test-NetConnection $url -InformationLevel Quiet

# Check if the website is accessible
if ($response -ne 'True') {
    # Define email parameters
    $sender_email = 'example@example.com'
    $recipient_email = 'example@example.com'
    $sender_password = ''
    $subject = 'Website is down'
    $body = "The website $url is not accessible."

    # Create the email message
    $message = New-Object System.Net.Mail.MailMessage $sender_email, $recipient_email
    $message.Subject = $subject
    $message.Body = $body

    # Create SMTP client and send email
    $smtp_client = New-Object System.Net.Mail.SmtpClient 'localhost', 25
    $smtp_client.Credentials = New-Object System.Net.NetworkCredential $sender_email, $sender_password
    $smtp_client.Send($message)

    Write-Output 'Email sent.'
} else {
    Write-Output 'Website is accessible.'
}