<?php
// Enable error reporting for debugging (disable later in production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Function to safely get a POST value
function safePost($key) {
    return isset($_POST[$key]) ? htmlspecialchars($_POST[$key]) : '';
}

// Collect form data safely
$language = safePost('language');
$firstName = safePost('firstName');
$lastName = safePost('lastName');
$email = safePost('email');
$nationality = safePost('nationality');
$countryCodePhone = safePost('countryCodePhone');
$phone = safePost('phone');

$emergencyName = safePost('emergencyName');
$relationship = safePost('relationship');
$countryCodeEmergency = safePost('countryCodeEmergency');
$emergencyContact = safePost('emergencyContact');

$checkIn = safePost('checkIn');
$checkOut = safePost('checkOut');
$roomType = safePost('roomType');
$guests = safePost('guests');
$temperature = safePost('temperature');

$countryCodeBilling = safePost('countryCodeBilling');
$billingContact = safePost('billingContact');
$termsAccepted = isset($_POST['terms']) ? 1 : 0;

// Handle file uploads (Aadhaar & Photo)
$uploadDir = "uploads/";
if (!is_dir($uploadDir)) {
    mkdir($uploadDir, 0777, true);
}

$aadhaarPath = '';
$photoPath = '';

// Aadhaar upload
if (isset($_FILES['aadhaar']) && $_FILES['aadhaar']['error'] === UPLOAD_ERR_OK) {
    $aadhaarName = basename($_FILES['aadhaar']['name']);
    $aadhaarPath = $uploadDir . time() . "_aadhaar_" . $aadhaarName;
    move_uploaded_file($_FILES['aadhaar']['tmp_name'], $aadhaarPath);
}

// Photo upload
if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
    $photoName = basename($_FILES['photo']['name']);
    $photoPath = $uploadDir . time() . "_photo_" . $photoName;
    move_uploaded_file($_FILES['photo']['tmp_name'], $photoPath);
}

// ✅ Database Connection
$servername = "localhost";
$username = "root"; // Change if needed
$password = "";     // Change if needed
$dbname = "hotel_registration";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// ✅ Insert into Database
$stmt = $conn->prepare("
    INSERT INTO guest_registration (
        language, firstName, lastName, email, nationality, 
        countryCodePhone, phone, 
        emergencyName, relationship, countryCodeEmergency, emergencyContact,
        checkIn, checkOut, roomType, guests, temperature,
        countryCodeBilling, billingContact, aadhaarPath, photoPath, termsAccepted
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
");

$stmt->bind_param(
    "sssssssssssssisissssi",
    $language, $firstName, $lastName, $email, $nationality,
    $countryCodePhone, $phone,
    $emergencyName, $relationship, $countryCodeEmergency, $emergencyContact,
    $checkIn, $checkOut, $roomType, $guests, $temperature,
    $countryCodeBilling, $billingContact, $aadhaarPath, $photoPath, $termsAccepted
);

if ($stmt->execute()) {
    echo "<h2>Registration Successful!</h2>";
    echo "<p>Thank you, <strong>$firstName $lastName</strong>, for registering.</p>";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
