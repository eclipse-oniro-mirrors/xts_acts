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

#include <cerrno>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iconv.h>
#include "libc_test_shim.h"

namespace {
constexpr size_t K_ICONV_UTF8_OUTPUT_LEN_UPPER_BOUND = 10U;
} // namespace

static int TestEucKrError(int* status)
{
    iconv_t cd = iconv_open("UTF-8", "EUC-KR");
    if (cd == reinterpret_cast<iconv_t>(static_cast<uintptr_t>(-1))) {
        LibcTestError(status, "iconv_open failed: %s\n", strerror(errno));
        return *status;
    }

    char input[] = "\xC8\x41";
    size_t inLen = 2;

    size_t outbufSize = 6;
    char* outbuf = static_cast<char*>(malloc(outbufSize));
    if (!outbuf) {
        LibcTestError(status, "malloc failed\n");
        iconv_close(cd);
        return *status;
    }

    char* inPtr = input;
    size_t inLeft = inLen;
    char* outPtr = outbuf;
    size_t outLeft = outbufSize;

    size_t ret = iconv(cd, &inPtr, &inLeft, &outPtr, &outLeft);
    if (ret == static_cast<size_t>(-1)) {
        if (errno != EILSEQ) {
            LibcTestError(status, "test failed expect errno=EILSEQ actually get errno=%d\n", errno);
        }
    } else {
        size_t len = outbufSize - outLeft;
        if (len >= K_ICONV_UTF8_OUTPUT_LEN_UPPER_BOUND) {
            LibcTestError(status, "test failed expect 0<=len<=10 actually len=%d\n", static_cast<int>(len));
        }
    }

    free(outbuf);
    iconv_close(cd);
    return *status;
}

int IconvTest()
{
    int status = SUCCESS_CODE;
    return TestEucKrError(&status);
}
