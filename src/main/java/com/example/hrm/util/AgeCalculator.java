package com.example.hrm.util;

import java.time.LocalDate;
import java.time.Period;

public class AgeCalculator {

    public static Integer calculateAge(LocalDate dateOfBirth) {
        if (dateOfBirth == null) {
            return null;
        }
        return Period.between(dateOfBirth, LocalDate.now()).getYears();
    }
    //Alo !
}
