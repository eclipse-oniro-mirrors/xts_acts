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

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>
#include "test.h"

namespace {
using TempnamFn = char* (*)(const char*, const char*);
char* TempnamForLibcTest(const char* dir, const char* pfx)
{
    static TempnamFn fn = nullptr;
    if (fn == nullptr) {
        fn = reinterpret_cast<TempnamFn>(dlsym(RTLD_DEFAULT, "tempnam"));
    }
    return (fn != nullptr) ? fn(dir, pfx) : nullptr;
}
} // namespace

/**
 * @tc.name      : Tempnam0100
 * @tc.desc      : Call the tempnam method to generate a temporary file
 * @tc.level     : Level 0
 */
void Tempnam0100(void)
{
    char* dir = "/data";
    char* pte = "temp";
    char* result = TempnamForLibcTest(dir, pte);
    if (!result) {
        t_error("%s tempnam error cannot create temp file\n", __func__);
    }
    if (!strstr(result, pte)) {
        t_error("%s tempnam get result not contain %s\n", __func__, pte);
    }
    free(result);
}

/**
 * @tc.name      : Tempnam0200
 * @tc.desc      : test tempnam is the result when pfx is empty
 * @tc.level     : Level 1
 */
void Tempnam0200(void)
{
    char* dir = "/data";
    char* pte = nullptr;
    char* result = TempnamForLibcTest(dir, pte);
    if (!result) {
        t_error("%s tempnam error cannot create temp file\n", __func__);
    }
    free(result);
}

/**
 * @tc.name      : Tempnam0300
 * @tc.desc      : test tempnam results when the dir PATH does not exist
 * @tc.level     : Level 1
 */
void Tempnam0300(void)
{
    char* dir = "/file";
    char* pte = "temp";
    char* result = TempnamForLibcTest(dir, pte);
    if (!result) {
        t_error("%s tempnam error cannot create temp file\n", __func__);
    }
    if (!strstr(result, pte)) {
        t_error("%s tempnam get result not contain %s\n", __func__, pte);
    }
    free(result);
}

/**
 * @tc.name      : Tempnam0400
 * @tc.desc      : test tempnam when the dir PATH is a file
 * @tc.level     : Level 1
 */
void Tempnam0400(void)
{
    char* dir = "/file/a.Txt";
    char* pte = "temp";
    char* result = TempnamForLibcTest(dir, pte);
    if (!result) {
        t_error("%s tempnam error cannot create temp file\n", __func__);
    }
    if (!strstr(result, pte)) {
        t_error("%s tempnam get result not contain %s\n", __func__, pte);
    }
    free(result);
}

/**
 * @tc.name      : Tempnam0500
 * @tc.desc      : test tempnam when dir PATH is empty string
 * @tc.level     : Level 1
 */
void Tempnam0500(void)
{
    char* dir = nullptr;
    char* pte = "temp";
    char* result = TempnamForLibcTest(dir, pte);
    if (!result) {
        t_error("%s tempnam error cannot create temp file\n", __func__);
    }
    if (!strstr(result, pte)) {
        t_error("%s tempnam get result not contain %s\n", __func__, pte);
    }
    free(result);
}

static int TempnamTestImpl(int argc, char* argv[])
{
    (void)argc;
    (void)argv;
    Tempnam0100();
    Tempnam0200();
    Tempnam0300();
    Tempnam0400();
    Tempnam0500();
    return T_STATUS;
}

int TempnamTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return TempnamTestImpl(1, libcArgvStub);
}
