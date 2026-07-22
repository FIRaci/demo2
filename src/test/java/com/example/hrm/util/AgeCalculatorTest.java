package com.example.hrm.util;

import org.junit.jupiter.api.Test;
import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

class AgeCalculatorTest {

    @Test
    void testCalculateAge_Success() {
        LocalDate dob = LocalDate.now().minusYears(25);
        Integer age = AgeCalculator.calculateAge(dob);
        assertEquals(25, age);
    }

    @Test
    void testCalculateAge_NullInput() {
        assertNull(AgeCalculator.calculateAge(null));
    }
}
