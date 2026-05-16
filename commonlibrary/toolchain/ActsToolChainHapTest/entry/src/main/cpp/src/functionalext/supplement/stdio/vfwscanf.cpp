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
#include <clocale>
#include <cwchar>
#include "test.h"

#define ARRAY_SIZE 5
#define STR_LEN 5

static void DealAberrant(int code)
{
    if (code != SIGSEGV) {
        t_error("vfwscanf_0200 code is %d are not SIGSEGV", __func__, code);
    }
    exit(g_tStatus);
}

int ReadFromFile(FILE *fp, const wchar_t *format, ...)
{
    va_list args;
    va_start(args, format);
    int result = vfwscanf(fp, format, args);
    va_end(args);
    return result;
}

/**
 * @tc.name      : vfwscanf_0100
 * @tc.desc      : Test vfwscanf method to read wide string from file
 * @tc.level     : Level 0
 */
void Vfwscanf0100(void)
{
    (void)setlocale(LC_ALL, "en_US.UTF-8");

    wchar_t symbol[] = L"\u0915\u0916\u0917\u0918\u0919";
    wchar_t names[ARRAY_SIZE][STR_LEN] = {L"Ka", L"Kha", L"Ga", L"Gha", L"Nga"};
    FILE *fp = fopen("/data/storage/el2/base/cache/example.txt", "w+");

    for (int i = 0; i < ARRAY_SIZE; i++) {
        (void)fwprintf(fp, L"%lc %ls ", symbol[i], names[i]);
    }
    rewind(fp);

    wchar_t ch;
    wchar_t str[STR_LEN];
    for (int i = 0; i < ARRAY_SIZE; i++) {
        ReadFromFile(fp, L"%lc %ls ", &ch, str);
        if (wcscmp(str, names[i]) != 0) {
            t_error("%s vfwscanf in %d get result is %ls are not want %ls\n", __func__, i, str, names[i]);
        }
    }

    (void)fclose(fp);
    unlink("/data/storage/el2/base/cache/example.txt");
}

/**
 * @tc.name      : vfwscanf_0200
 * @tc.desc      : Test the result of the vfwscanf function when the incoming file is empty
 * @tc.level     : Level 2
 */
void Vfwscanf0200(void)
{
    wchar_t symbol[] = L"\u0915\u0916\u0917\u0918\u0919";
    wchar_t names[ARRAY_SIZE][STR_LEN] = {L"Ka", L"Kha", L"Ga", L"Gha", L"Nga"};
    (void)signal(SIGSEGV, DealAberrant);
    ReadFromFile(nullptr, symbol, names);
}

static int VfwscanfTestImpl(int argc, char *argv[])
{
    Vfwscanf0100();
    Vfwscanf0200();
    return g_tStatus;
}

int VfwscanfTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return VfwscanfTestImpl(1, libcArgv);
}
