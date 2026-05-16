/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <cstdlib>
#include <cstring>
#include <execinfo.h>
#include "functionalext.h"

#define ZERO_LENGTH 0
#define INVALID_LENGTH (-1)
#define VALID_LENGTH 1
#define ZERO_RESULT 0
#define BT_BUF_SIZE 100
#define SUCCESS_RESULT 1
#define FAILURE_RESULT 0

int CheckString(char** btStrings, int btSize)
{
    for (int i = 0; i < btSize; ++i) {
        char* str = btStrings[i];
        char* left = strstr(str, "<");
        char* right = strstr(str, ">");
        if (left == nullptr || right == nullptr || left >= right) {
            continue;
        }
        int flag = 0;
        for (; left < right; left++) {
            if (*left == '?') {
                flag = 1;
                break;
            }
        }
        if (!flag) {
            continue;
        }
        right = strstr(str, "/");
        char* lastPtr = str + strlen(str);
        if (right == nullptr) {
            continue;
        }
        for (; right != lastPtr; ++right) {
            if (*right == '?') {
                break;
            }
        }
        if (right == lastPtr) {
            return FAILURE_RESULT;
        }
    }
    return SUCCESS_RESULT;
}

void Backtrace1001()
{
    void* frames[10];
    EXPECT_EQ("Backtrace1001", ZERO_RESULT, backtrace(frames, ZERO_LENGTH));
}

int Backtrace1002Supplement()
{
    void* frames[10];
    return backtrace(frames, VALID_LENGTH);
}

void Backtrace1002()
{
    EXPECT_LT("Backtrace1002", 0, Backtrace1002Supplement());
}

void Backtrace1003()
{
    void* btBuffer[BT_BUF_SIZE];
    int btSize = backtrace(btBuffer, BT_BUF_SIZE);
    char** btStrings = backtrace_symbols(btBuffer, btSize);
    EXPECT_PTRNE("Backtrace1003", btStrings, nullptr);
    EXPECT_TRUE("backtrace_1003_checkString", CheckString(btStrings, btSize));
    free(btStrings);
}

static int UnittestBacktraceTestImpl()
{
    Backtrace1001();
    Backtrace1002();
    Backtrace1003();
    return T_STATUS;
}

int UnittestBacktraceTest(void)
{
    return UnittestBacktraceTestImpl();
}
