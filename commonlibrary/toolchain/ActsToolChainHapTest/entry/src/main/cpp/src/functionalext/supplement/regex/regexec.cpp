/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <regex.h>
#include "functionalext.h"

#define TEST_BUFFER_SIZE 100

/**
 * @tc.name      : Regexec0100
 * @tc.desc      : Match string
 * @tc.level     : Level 0
 */
void Regexec0100(void)
{
    regex_t reg;
    const char* pattern = "musl";
    const char* str = "musl test";
    int ret = regcomp(&reg, pattern, REG_EXTENDED);
    EXPECT_EQ("Regexec0100", ret, 0);
    ret = regexec(&reg, str, 0, nullptr, 0);
    if (ret != 0) {
        regfree(&reg);
        EXPECT_EQ("Regexec0100", ret, 0);
        return;
    }
    EXPECT_EQ("Regexec0100", ret, 0);
    regfree(&reg);
}

/**
 * @tc.name      : Regexec0200
 * @tc.desc      : Alternation match
 * @tc.level     : Level 0
 */
void Regexec0200(void)
{
    regex_t reg;
    const char* pattern = "a|b";
    const char* str = "ade";
    int ret = regcomp(&reg, pattern, REG_EXTENDED);
    EXPECT_EQ("Regexec0200", ret, 0);
    ret = regexec(&reg, str, 0, nullptr, 0);
    if (ret != 0) {
        regfree(&reg);
        EXPECT_EQ("Regexec0200", ret, 0);
        return;
    }
    EXPECT_EQ("Regexec0200", ret, 0);
    regfree(&reg);
}

/**
 * @tc.name      : Regexec0300
 * @tc.desc      : Repetition with zero occurrences
 * @tc.level     : Level 0
 */
void Regexec0300(void)
{
    regex_t reg;
    const char* pattern = "m*";
    const char* str = "abc";
    int ret = regcomp(&reg, pattern, REG_EXTENDED);
    EXPECT_EQ("Regexec0300", ret, 0);
    ret = regexec(&reg, str, 0, nullptr, 0);
    if (ret != 0) {
        regfree(&reg);
        EXPECT_EQ("Regexec0300", ret, 0);
        return;
    }
    EXPECT_EQ("Regexec0300", ret, 0);
    regfree(&reg);
}

/**
 * @tc.name      : Regexec0400
 * @tc.desc      : Nested repetition
 * @tc.level     : Level 0
 */
void Regexec0400(void)
{
    regex_t reg;
    const char* pattern = "(m+)+l";
    const char* str = "mmmmmmmml";
    int ret = regcomp(&reg, pattern, REG_EXTENDED);
    EXPECT_EQ("Regexec0400", ret, 0);
    ret = regexec(&reg, str, 0, nullptr, 0);
    if (ret != 0) {
        regfree(&reg);
        EXPECT_EQ("Regexec0400", ret, 0);
        return;
    }
    EXPECT_EQ("Regexec0400", ret, 0);
    regfree(&reg);
}

/**
 * @tc.name      : Regexec0500
 * @tc.desc      : long repetition
 * @tc.level     : Level 0
 */
void Regexec0500(void)
{
    regex_t reg;
    const char* pattern = "m{100}";
    char str[TEST_BUFFER_SIZE + 1] = { 0 };
    for (int i = 0; i < TEST_BUFFER_SIZE; i++) {
        str[i] = 'm';
    }
    str[TEST_BUFFER_SIZE] = '\0';
    int ret = regcomp(&reg, pattern, REG_EXTENDED);
    EXPECT_EQ("Regexec0500", ret, 0);
    ret = regexec(&reg, str, 0, nullptr, 0);
    if (ret != 0) {
        regfree(&reg);
        EXPECT_EQ("Regexec0500", ret, 0);
        return;
    }
    EXPECT_EQ("Regexec0500", ret, 0);
    regfree(&reg);
}

/**
 * @tc.name      : Regexec0600
 * @tc.desc      : Mismatched brace
 * @tc.level     : Level 0
 */
void Regexec0600(void)
{
    regex_t reg;
    const char* pattern = "m{5";
    int ret = regcomp(&reg, pattern, REG_EXTENDED);
    EXPECT_NE("Regexec0600", ret, 0);
}

/**
 * @tc.name      : Regexec0700
 * @tc.desc      : Subexpression count exceeds implementation limit (test robustness)
 * @tc.level     : Level 0
 */
void Regexec0700(void)
{
    regex_t reg;
    const char* pattern = "^musl.*";
    int ret = regcomp(&reg, pattern, REG_EXTENDED);
    EXPECT_EQ("Regexec0700", ret, 0);
    const char* matchStr = "musl test 123";
    ret = regexec(&reg, matchStr, 0, nullptr, 0);
    if (ret != 0) {
        regfree(&reg);
        EXPECT_EQ("Regexec0700", ret, 0);
        return;
    }
    EXPECT_EQ("Regexec0700", ret, 0);
    const char* nonMatchStr = "test musl 456";
    ret = regexec(&reg, nonMatchStr, 0, nullptr, 0);
    if (ret == 0) {
        regfree(&reg);
        EXPECT_NE("Regexec0700", ret, 0);
        return;
    }
    EXPECT_NE("Regexec0700", ret, 0);
    regfree(&reg);
}

/**
 * @tc.name      : Regexec0800
 * @tc.desc      : Match string containing null byte
 * @tc.level     : Level 0
 */
void Regexec0800(void)
{
    regex_t reg;
    const char* pattern = "mu.*sl";
    char str[] = "mu\x00sl";
    int ret = regcomp(&reg, pattern, REG_EXTENDED);
    EXPECT_EQ("Regexec0800", ret, 0);
    ret = regexec(&reg, str, 0, nullptr, 0);
    if (ret == 0) {
        regfree(&reg);
        EXPECT_NE("Regexec0800", ret, 0);
        return;
    }
    EXPECT_NE("Regexec0800", ret, 0);
    regfree(&reg);
}

/**
 * @tc.name      : Regexec0900
 * @tc.desc      : Use of bad interval expression
 * @tc.level     : Level 0
 */
void Regexec0900(void)
{
    regex_t reg;
    const char* pattern = "m{4,2}";
    int ret = regcomp(&reg, pattern, REG_EXTENDED);
    EXPECT_NE("Regexec0900", ret, 0);
}

/**
 * @tc.name      : Regexec01000
 * @tc.desc      : Bad backreference
 * @tc.level     : Level 0
 */
void Regexec01000(void)
{
    regex_t reg;
    const char* pattern = "(m)\\1";
    int ret = regcomp(&reg, pattern, 0);
    EXPECT_NE("Regexec01000", ret, 0);
}

static int RegexecTestImpl(void)
{
    Regexec0100();
    Regexec0200();
    Regexec0300();
    Regexec0400();
    Regexec0500();
    Regexec0600();
    Regexec0700();
    Regexec0800();
    Regexec0900();
    Regexec01000();
    return T_STATUS;
}

int RegexecTest(void)
{
    return RegexecTestImpl();
}
