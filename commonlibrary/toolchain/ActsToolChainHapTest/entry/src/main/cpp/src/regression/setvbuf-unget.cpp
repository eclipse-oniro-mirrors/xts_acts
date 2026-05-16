/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// commit: 9cad27a3dc1a4eb349b6591e4dc8cc89dce32277
// ungetc after setvbuf should not clobber memory below buffer
#include <cstddef>
#include <cstdio>
#include <cstring>
#include "libc_test_shim.h"

namespace {
constexpr size_t K_SETVBUF_USER_BUF_OFFSET = 12U;
} // namespace

int SetvbufUngetTest()
{
    int status = SUCCESS_CODE;

    char buf[1024] = "hello world";
    (void)setvbuf(stdin, buf + K_SETVBUF_USER_BUF_OFFSET, _IOFBF, sizeof buf - K_SETVBUF_USER_BUF_OFFSET);
    int uc;
    while ((uc = ungetc('x', stdin)) != EOF) {
        (void)uc;
    }
    if (strcmp(buf, "hello world")) {
        LibcTestError(
            &status, "ungetc clobbered outside buffer: [%.*s]\n", static_cast<int>(K_SETVBUF_USER_BUF_OFFSET), buf);
    }
    return status;
}
