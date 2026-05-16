/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include "functionalext.h"

#define BUFFER_SIZE 1024

/* 使用 std::snprintf 替代 sprintf，避免无界写入（C++ 标准库头文件 cstdio）。 */

namespace {
constexpr int K_EXPECTED_LEN_PLAIN_LITERAL = 4;
constexpr int K_FMT_SMALL_INT_A = 1;
constexpr int K_FMT_SMALL_INT_B = 2;
constexpr int K_EXPECTED_LEN_TWO_DECIMAL_INTS = 3;
constexpr unsigned int K_UINT32_ALL_BITS_SET = UINT32_MAX;
constexpr int K_EXPECTED_LEN_TWO_UNSIGNED_INTS = 12;
constexpr int K_OCTAL_SOURCE_NINE = 9;
constexpr int K_EXPECTED_LEN_OCTAL_DIGITS = 2;
constexpr int K_HEX_SOURCE_FIFTEEN = 15;
constexpr int K_EXPECTED_LEN_HEX_PAIR = 3;
constexpr double K_SAMPLE_FLOAT_PAIR = 1.23;
constexpr int K_EXPECTED_LEN_TWO_DEFAULT_FLOAT = 17;
constexpr int K_EXPECTED_LEN_TWO_SCIENTIFIC_FLOAT = 25;
constexpr char K_CHAR_DIGIT_ONE = '1';
constexpr int K_EXPECTED_LEN_SINGLE_CHAR = 1;
constexpr int K_EXPECTED_LEN_TWO_STRINGS_CSV = 7;
constexpr uintptr_t K_POINTER_PATTERN_ADDR = static_cast<uintptr_t>(0x64fe40u);
constexpr int K_EXPECTED_LEN_POINTER_HEX = 8;
constexpr int K_EXPECTED_LEN_ESCAPED_PERCENT_TEST = 5;
constexpr int K_POSITIONAL_FMT_THIRD_INT = 123;
constexpr int K_EXPECTED_LEN_POSITIONAL_ARGS = 8;

constexpr int K_NEGATIVE_ONE = -1;
constexpr int K_EXPECTED_LEN_SIGN_FLAG_LINE = 10;
constexpr int K_EXPECTED_LEN_ALT_OCT_HEX_LINE = 11;
constexpr int K_EXPECTED_LEN_WIDTH_ZERO_PAD_LINE = 17;
constexpr int K_PADDED_INT_SAMPLE = 123;

constexpr int K_SAMPLE_REPEATED_DECIMAL = 12345;
constexpr int K_EXPECTED_LEN_WIDTH_THREE_FIELDS = 22;
constexpr int K_FIELD_WIDTH_TEN = 10;
constexpr int K_EXPECTED_LEN_STAR_WIDTH_FIELD = 10;

constexpr double K_SAMPLE_PRECISION_FLOAT = 1.2345;
constexpr int K_FRACTION_DIGITS_THREE = 3;
constexpr int K_EXPECTED_LEN_TWO_PRECISION_FIELDS = 14;
constexpr int K_EXPECTED_LEN_PRECISION_STAR_FIELD = 5;
} // namespace

void SprintfSpecifierTests(void)
{
    char str[BUFFER_SIZE];
    int ret = 0;

    ret = std::snprintf(str, BUFFER_SIZE, "test");
    EXPECT_EQ("sprintf_specifier_null", ret, K_EXPECTED_LEN_PLAIN_LITERAL);
    EXPECT_STREQ("sprintf_specifier_null", str, "test");

    ret = std::snprintf(str, BUFFER_SIZE, "%d,%i", K_FMT_SMALL_INT_A, K_FMT_SMALL_INT_B);
    EXPECT_EQ("sprintf_specifier_integer", ret, K_EXPECTED_LEN_TWO_DECIMAL_INTS);
    EXPECT_STREQ("sprintf_specifier_integer", str, "1,2");

    ret = std::snprintf(str, BUFFER_SIZE, "%u,%u", K_FMT_SMALL_INT_A, K_UINT32_ALL_BITS_SET);
    EXPECT_EQ("sprintf_specifier_Unsigned_integer", ret, K_EXPECTED_LEN_TWO_UNSIGNED_INTS);
    EXPECT_STREQ("sprintf_specifier_Unsigned_integer", str, "1,4294967295");

    ret = std::snprintf(str, BUFFER_SIZE, "%o", K_OCTAL_SOURCE_NINE);
    EXPECT_EQ("sprintf_specifier_octal_integer", ret, K_EXPECTED_LEN_OCTAL_DIGITS);
    EXPECT_STREQ("sprintf_specifier_octal_integer", str, "11");

    ret = std::snprintf(str, BUFFER_SIZE, "%x,%X", K_HEX_SOURCE_FIFTEEN, K_HEX_SOURCE_FIFTEEN);
    EXPECT_EQ("sprintf_specifier_hexadecimal_integer", ret, K_EXPECTED_LEN_HEX_PAIR);
    EXPECT_STREQ("sprintf_specifier_hexadecimal_integer", str, "f,F");

    ret = std::snprintf(str, BUFFER_SIZE, "%f,%F", K_SAMPLE_FLOAT_PAIR, K_SAMPLE_FLOAT_PAIR);
    EXPECT_EQ("sprintf_specifier_float", ret, K_EXPECTED_LEN_TWO_DEFAULT_FLOAT);
    EXPECT_STREQ("sprintf_specifier_float", str, "1.230000,1.230000");

    ret = std::snprintf(str, BUFFER_SIZE, "%e,%E", K_SAMPLE_FLOAT_PAIR, K_SAMPLE_FLOAT_PAIR);
    EXPECT_EQ("sprintf_specifier_scientific_notation", ret, K_EXPECTED_LEN_TWO_SCIENTIFIC_FLOAT);
    EXPECT_STREQ("sprintf_specifier_scientific_notation", str, "1.230000e+00,1.230000E+00");

    ret = std::snprintf(str, BUFFER_SIZE, "%c", K_CHAR_DIGIT_ONE);
    EXPECT_EQ("sprintf_specifier_char", ret, K_EXPECTED_LEN_SINGLE_CHAR);
    EXPECT_STREQ("sprintf_specifier_char", str, "1");

    ret = std::snprintf(str, BUFFER_SIZE, "%s,%s", "123", "456");
    EXPECT_EQ("sprintf_specifier_str", ret, K_EXPECTED_LEN_TWO_STRINGS_CSV);
    EXPECT_STREQ("sprintf_specifier_str", str, "123,456");

    ret = std::snprintf(str, BUFFER_SIZE, "%p", reinterpret_cast<void*>(K_POINTER_PATTERN_ADDR));
    EXPECT_EQ("sprintf_specifier_pointer_address", ret, K_EXPECTED_LEN_POINTER_HEX);
    EXPECT_STREQ("sprintf_specifier_pointer_address", str, "0x64fe40");

    ret = std::snprintf(str, BUFFER_SIZE, "%%test");
    EXPECT_EQ("sprintf_specifier_double_percent_sign", ret, K_EXPECTED_LEN_ESCAPED_PERCENT_TEST);
    EXPECT_STREQ("sprintf_specifier_double_percent_sign", str, "%test");

    ret = std::snprintf(str, BUFFER_SIZE, "%d,%s,%c", K_POSITIONAL_FMT_THIRD_INT, "bc", 'a');
    EXPECT_EQ("sprintf_$_symbol", ret, K_EXPECTED_LEN_POSITIONAL_ARGS);
    EXPECT_STREQ("sprintf_$_symbol", str, "123,bc,a");
}

void SprintfFlagTests(void)
{
    char str[BUFFER_SIZE];
    int ret = 0;

    ret = std::snprintf(
        str, BUFFER_SIZE, "%+d %+d %d %d", K_NEGATIVE_ONE, K_FMT_SMALL_INT_A, K_NEGATIVE_ONE, K_FMT_SMALL_INT_A);
    EXPECT_EQ("sprintf_flag_+_and_space", ret, K_EXPECTED_LEN_SIGN_FLAG_LINE);
    EXPECT_STREQ("sprintf_flag_+_and_space", str, "-1 +1 -1 1");

    ret = std::snprintf(str, BUFFER_SIZE, "%#o,%#x,%#X", K_OCTAL_SOURCE_NINE, K_OCTAL_SOURCE_NINE, K_OCTAL_SOURCE_NINE);
    EXPECT_EQ("sprintf_flag_#", ret, K_EXPECTED_LEN_ALT_OCT_HEX_LINE);
    EXPECT_STREQ("sprintf_flag_#", str, "011,0x9,0X9");

    ret =
        std::snprintf(str, BUFFER_SIZE, "%5d,%05d,%-5d", K_PADDED_INT_SAMPLE, K_PADDED_INT_SAMPLE, K_PADDED_INT_SAMPLE);
    EXPECT_EQ("sprintf_flag_-_and_0", ret, K_EXPECTED_LEN_WIDTH_ZERO_PAD_LINE);
    EXPECT_STREQ("sprintf_flag_-_and_0", str, "  123,00123,123  ");
}

void SprintfWidthTests(void)
{
    char str[BUFFER_SIZE];
    int ret = 0;
    ret = std::snprintf(str,
                        BUFFER_SIZE,
                        "%d,%3d,%10d",
                        K_SAMPLE_REPEATED_DECIMAL,
                        K_SAMPLE_REPEATED_DECIMAL,
                        K_SAMPLE_REPEATED_DECIMAL);
    EXPECT_EQ("sprintf_width_num", ret, K_EXPECTED_LEN_WIDTH_THREE_FIELDS);
    EXPECT_STREQ("sprintf_width_num", str, "12345,12345,     12345");

    int starFieldWidth = K_FIELD_WIDTH_TEN;
    ret = std::snprintf(str, BUFFER_SIZE, "%*d", starFieldWidth, K_SAMPLE_REPEATED_DECIMAL);
    EXPECT_EQ("sprintf_width_*", ret, K_EXPECTED_LEN_STAR_WIDTH_FIELD);
    EXPECT_STREQ("sprintf_width_*", str, "     12345");
}

void SprintfPrecisionTests(void)
{
    char str[BUFFER_SIZE];
    int ret = 0;
    ret = std::snprintf(str, BUFFER_SIZE, "%f,%.3f", K_SAMPLE_PRECISION_FLOAT, K_SAMPLE_PRECISION_FLOAT);
    EXPECT_EQ("sprintf_precision_num", ret, K_EXPECTED_LEN_TWO_PRECISION_FIELDS);
    EXPECT_STREQ("sprintf_precision_num", str, "1.234500,1.234");

    int starFractionDigits = K_FRACTION_DIGITS_THREE;
    ret = std::snprintf(str, BUFFER_SIZE, "%.*f", starFractionDigits, K_SAMPLE_PRECISION_FLOAT);
    EXPECT_EQ("sprintf_precision_*", ret, K_EXPECTED_LEN_PRECISION_STAR_FIELD);
    EXPECT_STREQ("sprintf_precision_*", str, "1.234");
}

static int SprintfTestImpl(void)
{
    // %[flags][width][.precision][length]specifier
    SprintfSpecifierTests();
    SprintfFlagTests();
    SprintfWidthTests();
    SprintfPrecisionTests();
    return T_STATUS;
}

int SprintfTest(void)
{
    return SprintfTestImpl();
}
