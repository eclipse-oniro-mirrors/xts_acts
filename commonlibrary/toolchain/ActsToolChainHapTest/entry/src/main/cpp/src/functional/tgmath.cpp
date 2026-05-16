/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
#include <ctgmath>
#include <complex>
#include "test.h"

// Test constants for mathematical operations
#define TEST_LRINT_FLOAT_INPUT 123456789.1f
#define TEST_LRINT_DOUBLE_INPUT 123456789.1
#define TEST_LRINT_FLOAT_RESULT 123456792
#define TEST_LRINT_DOUBLE_RESULT 123456789
#define TEST_SQRT_FLOAT_INPUT 2.0f
#define TEST_SQRT_DOUBLE_INPUT 2.0
#define TEST_SQRT_INT_INPUT 2
#define TEST_SQRT_FLOAT_RESULT 1.41421353816986083984375
#define TEST_SQRT_DOUBLE_RESULT 1.414213562373095145474621858738828450441360
#define TEST_POW_BASE_INT 8
#define TEST_POW_BASE_FLOAT 2.0f
#define TEST_POW_BASE_DOUBLE 2.0
#define TEST_POW_BASE_INT_SIMPLE 2
#define TEST_POW_EXPONENT_FLOAT 0.5f
#define TEST_POW_EXPONENT_DOUBLE 0.5

static int TgmathTestImpl(void)
{
    long i;

    i = lrint(TEST_LRINT_FLOAT_INPUT) & 0x7fffffff;
    if (i != TEST_LRINT_FLOAT_RESULT) {
        t_error("lrint(123456789.1f)&0x7fffffff want 123456792 got %ld\n", i);
    }
    i = lrint(TEST_LRINT_DOUBLE_INPUT) & 0x7fffffff;
    if (i != TEST_LRINT_DOUBLE_RESULT) {
        t_error("lrint(123456789.1)&0x7fffffff want 123456789 got %ld\n", i);
    }

    if (sqrt(TEST_SQRT_FLOAT_INPUT) != TEST_SQRT_FLOAT_RESULT) {
        t_error("sqrt(2.0f) want 0x1.6a09e6p+0 got %a\n", sqrt(TEST_SQRT_FLOAT_INPUT));
    }
    if (sqrt(TEST_SQRT_DOUBLE_INPUT) != TEST_SQRT_DOUBLE_RESULT) {
        t_error("sqrt(2.0) want 0x1.6a09e667f3bcdp+0 got %a\n", sqrt(TEST_SQRT_DOUBLE_INPUT));
    }
    if (sqrt(TEST_SQRT_INT_INPUT) != TEST_SQRT_DOUBLE_RESULT) {
        t_error("sqrt(2) want 0x1.6a09e667f3bcdp+0 got %a\n", sqrt(TEST_SQRT_DOUBLE_INPUT));
    }

    if (sizeof pow(sqrt(TEST_POW_BASE_INT), TEST_POW_EXPONENT_FLOAT) != sizeof(double)) {
        t_error("sizeof pow(sqrt(8), 0.5f) want %d got %d\n", (int)sizeof(double),
                (int)sizeof pow(sqrt(TEST_POW_BASE_INT), TEST_POW_EXPONENT_FLOAT));
    }
    if (sizeof pow(TEST_POW_BASE_DOUBLE, TEST_POW_EXPONENT_DOUBLE) != sizeof(double)) {
        t_error("sizeof pow(2.0, 0.5) want %d got %d\n", (int)sizeof(double),
                (int)sizeof pow(TEST_POW_BASE_DOUBLE, TEST_POW_EXPONENT_DOUBLE));
    }
    if (sizeof pow(TEST_POW_BASE_FLOAT, TEST_POW_EXPONENT_FLOAT) != sizeof(float)) {
        t_error("sizeof pow(2.0f, 0.5f) want %d got %d\n", (int)sizeof(float),
                (int)sizeof pow(TEST_POW_BASE_FLOAT, TEST_POW_EXPONENT_FLOAT));
    }
    if (sizeof pow(TEST_POW_BASE_DOUBLE, std::complex<double>(TEST_POW_EXPONENT_DOUBLE, 0.0)) !=
        sizeof(std::complex<double>)) {
        t_error("sizeof pow(2.0, complex(0.5,0.0)) want %d got %d\n",
                (int)sizeof(std::complex<double>),
                (int)sizeof pow(TEST_POW_BASE_DOUBLE,
                                std::complex<double>(TEST_POW_EXPONENT_DOUBLE, 0.0)));
    }

    if (pow(TEST_POW_BASE_DOUBLE, TEST_POW_EXPONENT_DOUBLE) != TEST_SQRT_DOUBLE_RESULT) {
        t_error("pow(2.0, 0.5) want 0x1.6a09e667f3bcdp+0 got %a\n",
                pow(TEST_POW_BASE_DOUBLE, TEST_POW_EXPONENT_DOUBLE));
    }

    if (pow(TEST_POW_BASE_INT_SIMPLE, TEST_POW_EXPONENT_DOUBLE) != TEST_SQRT_DOUBLE_RESULT) {
        t_error("pow(2, 0.5) want 0x1.6a09e667f3bcdp+0 got %a\n",
                pow(TEST_POW_BASE_INT_SIMPLE, TEST_POW_EXPONENT_DOUBLE));
    }
    if (pow(TEST_POW_BASE_INT_SIMPLE, TEST_POW_EXPONENT_FLOAT) != TEST_SQRT_DOUBLE_RESULT) {
        t_error("pow(2, 0.5f) want 0x1.6a09e667f3bcdp+0 got %a\n",
                pow(TEST_POW_BASE_INT_SIMPLE, TEST_POW_EXPONENT_FLOAT));
    }

    return g_tStatus;
}

int TgmathTest(void)
{
    return TgmathTestImpl();
}
