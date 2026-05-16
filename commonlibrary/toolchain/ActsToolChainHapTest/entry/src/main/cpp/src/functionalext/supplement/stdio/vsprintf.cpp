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
#include <cstring>
#include "test.h"

namespace {
constexpr size_t K_VSPRINTF_BUF_SIZE = 20U;
constexpr size_t K_FLOAT_OUTPUT_PREFIX_LEN = 3U;
constexpr int K_TEST_INT_ARG = 1;
constexpr float K_TEST_FLOAT_ARG = 3.0f;
} // namespace

/**
 * @tc.name      : Vsprintf0100
 * @tc.desc      : Write formatted data %d to string from variable argument list
 * @tc.level     : Level 0
 */
void Vsprintf0100(char* format, ...)
{
    char buffer[K_VSPRINTF_BUF_SIZE] = { 0 };
    va_list aptr;
    va_start(aptr, format);
    int result = std::vsnprintf(buffer, K_VSPRINTF_BUF_SIZE, format, aptr);
    va_end(aptr);
    if (result < 0) {
        t_error("%s vsnprintf get result is less than 0", __func__);
    }
    if (strcmp(buffer, "1")) {
        t_error("%s wrong string written to buf %s\n", __func__, buffer);
    }
}

/**
 * @tc.name      : Vsprintf0200
 * @tc.desc      : Write formatted data %f to string from variable argument list
 * @tc.level     : Level 1
 */
void Vsprintf0200(char* format, ...)
{
    char buffer[K_VSPRINTF_BUF_SIZE] = { 0 };
    va_list aptr;
    va_start(aptr, format);
    int result = std::vsnprintf(buffer, K_VSPRINTF_BUF_SIZE, format, aptr);
    va_end(aptr);
    if (result < 0) {
        t_error("%s vsnprintf get result is less than 0\n", __func__);
    }
    if (strncmp(buffer, "3.0", K_FLOAT_OUTPUT_PREFIX_LEN)) {
        t_error("%s wrong string written to buf %s\n", __func__, buffer);
    }
}

/**
 * @tc.name      : Vsprintf0300
 * @tc.desc      : Write formatted data %s to string from variable argument list
 * @tc.level     : Level 1
 */
void Vsprintf0300(char* format, ...)
{
    char buffer[K_VSPRINTF_BUF_SIZE];
    va_list aptr;
    va_start(aptr, format);
    int result = std::vsnprintf(buffer, K_VSPRINTF_BUF_SIZE, format, aptr);
    va_end(aptr);
    if (result < 0) {
        t_error("%s vsnprintf get result is less than 0\n", __func__);
    }
    if (strcmp(buffer, "vsprintf test")) {
        t_error("%s wrong string written to buf %s\n", __func__, buffer);
    }
}

static int VsprintfTestImpl(int argc, char* argv[])
{
    int i = K_TEST_INT_ARG;
    float f = K_TEST_FLOAT_ARG;
    char str[] = "vsprintf test";
    Vsprintf0100("%d", i);
    Vsprintf0200("%f", f);
    Vsprintf0300("%s", str);
    return T_STATUS;
}

int VsprintfTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return VsprintfTestImpl(1, libcArgvStub);
}
