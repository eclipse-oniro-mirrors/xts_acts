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
#include <cstring>
#include <iconv.h>
#include "test.h"

static void IconvOpenInvalidCodesetCase()
{
    iconv_t cd;
    char* bad = "bad-codeset";

    cd = iconv_open(bad, bad);
    if (cd != reinterpret_cast<iconv_t>(static_cast<uintptr_t>(-1))) {
        t_error("iconv_open(\"%s\",\"%s\") didn't fail\n", bad, bad);
    }
    if (errno != EINVAL) {
        t_error("iconv_open(\"%s\",\"%s\") did not fail with EINVAL, got %s\n", bad, bad, strerror(errno));
    }
}

static void IconvOpenUtf8RoundtripCase()
{
    iconv_t cd;
    char buf[100];
    char* inbuf = "test";
    char* outbuf = buf;
    size_t inlen = strlen(inbuf);
    size_t outlen;
    size_t r;

    errno = 0;
    cd = iconv_open("UTF-8", "UTF-8");
    if (cd == reinterpret_cast<iconv_t>(static_cast<uintptr_t>(-1))) {
        t_error("iconv_open(\"\",\"\") failed: %s\n", strerror(errno));
    }

    errno = 0;
    outlen = 0;
    r = iconv(cd, &inbuf, &inlen, &outbuf, &outlen);
    if (r != -1) {
        t_error("iconv() did not fail with 0 output length\n");
    }
    if (errno != E2BIG) {
        t_error("iconv() did not fail with E2BIG, got %s\n", strerror(errno));
    }

    errno = 0;
    outlen = sizeof buf;
    r = iconv(cd, &inbuf, &inlen, &outbuf, &outlen);
    if (r) {
        t_error("iconv() did not return 0 when converting utf8 to utf8, got %d\n", r);
    }
    if (errno) {
        t_error("iconv() failed: %s\n", strerror(errno));
    }

    r = iconv_close(cd);
    if (r == -1) {
        t_error("iconv_close failed: %s\n", strerror(errno));
    }
}

static int IconvOpenTestImpl(void)
{
    IconvOpenInvalidCodesetCase();
    IconvOpenUtf8RoundtripCase();
    return T_STATUS;
}

int IconvOpenTest(void)
{
    return IconvOpenTestImpl();
}
