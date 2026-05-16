/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "test.h"

namespace {
constexpr int K_VSSCANF_EXPECTED_INT_VALUE = 123;
} // namespace

int GetReturnVaule(char* s, char* fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    int result = std::vsscanf(s, fmt, ap);
    va_end(ap);
    return result;
}

/**
 * @tc.name      : Vsscanf0100
 * @tc.desc      : Call vsscanf to convert and format the data from the data according to format
 * @tc.level     : Level 0
 */
void Vsscanf0100(void)
{
    int val = 0;
    char buffer[100];
    int result = GetReturnVaule("value 123 info", "%s %d", &buffer, &val);
    if (result < 0) {
        t_error("%s vsscanf get result is %d are less 0\n", __func__, result);
    }
    if (strcmp(buffer, "value") != 0) {
        t_error("%s vsscanf get is '%s' are not 'value'\n", __func__, buffer);
    }
    if (val != K_VSSCANF_EXPECTED_INT_VALUE) {
        t_error("%s vsscanf get is %d are not 123\n", __func__, val);
    }
}

/**
 * @tc.name      : Vsscanf0200
 * @tc.desc      : test conversion of different formats
 * @tc.level     : Level 1
 */
void Vsscanf0200(void)
{
    char buffer[100];
    char getVal[100];
    int result = GetReturnVaule("value 123 info", "%s %s", &buffer, &getVal);
    if (result < 0) {
        t_error("%s vsscanf get result is %d are less 0\n", __func__, result);
    }
    if (strcmp(buffer, "value") != 0) {
        t_error("%s vsscanf get is '%s' are not 'value'\n", __func__, buffer);
    }
    if (strcmp(getVal, "123") != 0) {
        t_error("%s vsscanf get is %s are not 123\n", __func__, getVal);
    }
}

/**
 * @tc.name      : Vsscanf0300
 * @tc.desc      : The test corresponding position does not match the format
 * @tc.level     : Level 2
 */
void Vsscanf0300(void)
{
    int val = 0;
    int valTemp = 0;
    int result = GetReturnVaule("value 123 info", "%d %d", &val, &valTemp);
    if (result > 0) {
        t_error("%s vsscanf get result is %d are more than the 0\n", __func__, result);
    }
    if (val != 0) {
        t_error("%s vsscanf get is %d are not 0\n", __func__, val);
    }
    if (valTemp != 0) {
        t_error("%s vsscanf get is %d are not 0\n", __func__, valTemp);
    }
}

static int VsscanfTestImpl(int argc, char* argv[])
{
    Vsscanf0100();
    Vsscanf0200();
    Vsscanf0300();
    return T_STATUS;
}

int VsscanfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return VsscanfTestImpl(1, libcArgvStub);
}
