@isTest
private class AssistirServiceTest {

    @isTest
    static void testGetHourlyTimeDifference() {
        // Example usage
        Datetime startDateTime = Datetime.newInstanceGmt(2024, 1, 17, 12, 0, 0);
        Datetime endDateTime = Datetime.newInstanceGmt(2024, 1, 18, 15, 30, 0);

        Decimal hourlyDifference = AssistirService.getHourlyTimeDifference(endDateTime, startDateTime);

        // Assert the result
        System.assertEquals(27.5, hourlyDifference, 0.01);
    }

    @isTest
    static void testGetHourlyTimeDifferenceSameDay() {
        // Example usage with same day
        Datetime startDateTime = Datetime.newInstanceGmt(2024, 1, 17, 12, 0, 0);
        Datetime endDateTime = Datetime.newInstanceGmt(2024, 1, 17, 15, 30, 0);

        Decimal hourlyDifference = AssistirService.getHourlyTimeDifference(endDateTime, startDateTime);

        // Assert the result
        System.assertEquals(3.5, hourlyDifference, 0.01);
    }

    @isTest
    static void testGetHourlyTimeDifferenceNegative() {
        // Example usage with endDateTime earlier than startDateTime
        Datetime startDateTime = Datetime.newInstanceGmt(2024, 1, 17, 12, 0, 0);
        Datetime endDateTime = Datetime.newInstanceGmt(2024, 1, 16, 15, 30, 0);

        Decimal hourlyDifference = AssistirService.getHourlyTimeDifference(endDateTime, startDateTime);

        // Assert the result
        System.assertEquals(-20.5, hourlyDifference, 0.01);
    }
}
