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
#include <cstring>
#include <dlfcn.h>
#include "test.h"

namespace {
using TmpnamFn = char* (*)(char*);
char* TmpnamForLibcTest(char* buf)
{
    static TmpnamFn fn = nullptr;
    if (fn == nullptr) {
        fn = reinterpret_cast<TmpnamFn>(dlsym(RTLD_DEFAULT, "tmpnam"));
    }
    return (fn != nullptr) ? fn(buf) : nullptr;
}
} // namespace

/**
 * @tc.name      : Tmpnam0100
 * @tc.desc      : When buffer is provided, the pointer points to the custom buffer
 * @tc.level     : Level 0
 */
void Tmpnam0100(void)
{
    char buffer[L_tmpnam];
    char* p = TmpnamForLibcTest(buffer);
    if (p == nullptr) {
        t_error("%s tmpnam failed", __func__);
    }
    if (strlen(buffer) == 0) {
        t_error("%s creat temporary name failed", __func__);
    }
}

/**
 * @tc.name      : Tmpnam0200
 * @tc.desc      : When str is a null pointer, returns a pointer to the internal buffer
 * @tc.level     : Level 1
 */
void Tmpnam0200(void)
{
    char* p = TmpnamForLibcTest(nullptr);
    if (p == nullptr) {
        t_error("%s tmpnam failed", __func__);
    }
    if (strlen(p) == 0) {
        t_error("%s creat temporary name failed", __func__);
    }
}

static int TmpnamTestImpl(int argc, char* argv[])
{
    (void)argc;
    (void)argv;
    Tmpnam0100();
    Tmpnam0200();
    return T_STATUS;
}

int TmpnamTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return TmpnamTestImpl(1, libcArgvStub);
}
