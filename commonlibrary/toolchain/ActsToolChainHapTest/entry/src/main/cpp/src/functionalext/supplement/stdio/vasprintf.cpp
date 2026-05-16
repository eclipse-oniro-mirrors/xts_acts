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
constexpr int K_VASPRINTF_FIRST_FORMAT_ARG = 123;
constexpr int K_VASPRINTF_SECOND_FORMAT_ARG = 321;
} // namespace

/**
 * @tc.name      : Vasprintf0100
 * @tc.desc      : Format the output string through vasprintf, the formatted part is a number
 * @tc.level     : Level 0
 */
void Vasprintf0100(char* v, ...)
{
    va_list ap;
    va_start(ap, v);
    char* temp = nullptr;
    int result = vasprintf(&temp, v, ap);
    if (result == 0) {
        t_error("%s vasprintf result value is 0\n", __func__);
    }
    if (temp == nullptr) {
        t_error("%s vasprintf returned null buffer\n", __func__);
        va_end(ap);
        return;
    }
    if (strcmp(temp, "value is 123 and 321.") != 0) {
        t_error("%s vasprintf get tmep is %s are not 'value is 123 and 321.'\n", __func__, temp);
    }
    free(temp);
    va_end(ap);
}

/**
 * @tc.name      : Vasprintf0200
 * @tc.desc      : Format the output string through vasprintf, the formatted part is a string
 * @tc.level     : Level 1
 */
void Vasprintf0200(char* v, ...)
{
    va_list ap;
    va_start(ap, v);
    char* temp = nullptr;
    int result = vasprintf(&temp, v, ap);
    if (result == 0) {
        t_error("%s vasprintf result value is 0\n", __func__);
    }
    if (temp == nullptr) {
        t_error("%s vasprintf returned null buffer\n", __func__);
        va_end(ap);
        return;
    }
    if (strcmp(temp, "value is qer and erq.") != 0) {
        t_error("%s vasprintf get tmep is %s are not 'value is qer and erq.'\n", __func__, temp);
    }
    free(temp);
    va_end(ap);
}

/**
 * @tc.name      : Vasprintf0300
 * @tc.desc      : The parameters passed in when calling vasprintf are inconsistent with the data type to be formatted
 * @tc.level     : Level 2
 */
void Vasprintf0300(char* v, ...)
{
    va_list ap;
    va_start(ap, v);
    char* temp = nullptr;
    int result = vasprintf(&temp, v, ap);
    if (result == 0) {
        t_error("%s vasprintf result value is 0\n", __func__);
    }
    if (temp == nullptr) {
        t_error("%s vasprintf returned null buffer\n", __func__);
        va_end(ap);
        return;
    }
    if (strcmp(temp, "value is qer and erq.") == 0) {
        t_error("%s vasprintf error get tmep is '%s'\n", __func__, temp);
    }
    free(temp);
    va_end(ap);
}

static int VasprintfTestImpl(int argc, char* argv[])
{
    Vasprintf0100("value is %d and %d.", K_VASPRINTF_FIRST_FORMAT_ARG, K_VASPRINTF_SECOND_FORMAT_ARG);
    Vasprintf0200("value is %s and %s.", "qer", "erq");
    Vasprintf0300("value is %s and %d.", "qer", "erq");
    return T_STATUS;
}

int VasprintfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return VasprintfTestImpl(1, libcArgvStub);
}
