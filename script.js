$(document).ready(function() {


    $('#registrationForm').on('submit', function(e) {
        e.preventDefault();

        // Basic validation
        var isValid = true;
        var phonePattern = /^\d{10}$/;
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        // Validate phone numbers
        if (!phonePattern.test($('#phone').val())) {
            alert('Please enter a valid 10-digit phone number.');
            isValid = false;
        }
        if (!phonePattern.test($('#emergencyContact').val())) {
            alert('Please enter a valid 10-digit emergency contact number.');
            isValid = false;
        }
        if (!phonePattern.test($('#billingContact').val())) {
            alert('Please enter a valid 10-digit billing contact number.');
            isValid = false;
        }

        // Validate email
        if (!emailPattern.test($('#email').val())) {
            alert('Please enter a valid email address.');
            isValid = false;
        }

        // Validate dates
        var checkIn = new Date($('#checkIn').val());
        var checkOut = new Date($('#checkOut').val());
        if (checkIn >= checkOut) {
            alert('Check-out date must be after check-in date.');
            isValid = false;
        }

        if (isValid) {
            // Submit the form
            this.submit();
        }
    });
});
