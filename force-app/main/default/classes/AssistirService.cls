public with sharing class AssistirService {
    public static Decimal getHourlyTimeDifference(Datetime startDate, Datetime endDate) {

        Decimal daysDifference = startDate.date().daysBetween(endDate.date());

        Decimal hoursDifference = daysDifference * 24 + (startDate.hourGmt() - endDate.hourGmt()) + (startDate.minuteGmt() - endDate.minuteGmt()) / 60;

        return hoursDifference;
    }
}