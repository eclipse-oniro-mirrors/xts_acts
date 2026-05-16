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
#include <cstdlib>
#include <csignal>
#include <fcntl.h>
#include <cwchar>
#include "test.h"

static void DealAberrant(int code)
{
    if (code != SIGSEGV) {
        t_error("Vfwprintf0200 code is %d are not SIGSEGV", __func__, code);
    }
    exit(g_tStatus);
}

int ReadFile(FILE *stream, wchar_t *fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    int result = vfwprintf(stream, fmt, ap);
    va_end(ap);
    return result;
}

/**
 * @tc.name      : Vfwprintf0100
 * @tc.desc      : Test vfwprintf method to write wide string to file
 * @tc.level     : Level 0
 */
void Vfwprintf0100(void)
{
    wchar_t *value = L"hello %ls";
    char *fileName = "/data/storage/el2/base/cache/temp_vfwprintf.txt";
    FILE *file = fopen(fileName, "w");
    int resule = ReadFile(file, value, L"world");
    if (resule < 0) {
        t_error("%s vfwprintf error get result is %d are not less 0\n", __func__, resule);
    }
    (void)fclose(file);
    unlink(fileName);
}

/**
 * @tc.name      : Vfwprintf0200
 * @tc.desc      : Test the result of the vfwprintf function when the incoming file is empty
 * @tc.level     : Level 2
 */
void Vfwprintf0200(void)
{
    wchar_t *value = L"hello %ls";
    (void)signal(SIGSEGV, DealAberrant);
    int resule = ReadFile(nullptr, value, L"world");
}

static int VfwprintfTestImpl(int argc, char *argv[])
{
    Vfwprintf0100();
    Vfwprintf0200();
    return g_tStatus;
}

int VfwprintfTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return VfwprintfTestImpl(1, libcArgv);
}
