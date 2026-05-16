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
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <sys/resource.h>
#include <unistd.h>
#include "libc_common_memfill.h"
#include "libc_test_shim.h"

namespace {
constexpr int K_STACK_RLIMIT_KIBI_BLOCKS = 100;
constexpr int K_KIBI_BYTES = 1024;
constexpr size_t K_SPACE_BEFORE_FLOAT_OFFSET = 3U;
constexpr int K_SSCANF_WANT_FLOAT_AND_CHAR = 2;
} // namespace

int SscanfLongTest()
{
    int status = SUCCESS_CODE;

    enum { N = 8 * 1024 * 1024 };
    char* s = (char*)malloc(N);
    int i;
    float f;
    char c;

    if (!s) {
        LibcTestError(&status, "out of memory");
        return status;
    }
    TSetrlim(RLIMIT_STACK, K_STACK_RLIMIT_KIBI_BLOCKS * K_KIBI_BYTES);

    for (i = 0; i < N; i++) {
        s[i] = '1';
    }
    s[N - K_SPACE_BEFORE_FLOAT_OFFSET] = ' ';
    s[N - 1] = 0;

    /*
     * stack overflow if scanf copies s on the stack (glibc)
     * same issue with %d except then storing the conversion
     * result is undefined behaviour
     */
    i = std::sscanf(s, "%f %c", &f, &c);
    if (i != K_SSCANF_WANT_FLOAT_AND_CHAR) {
        LibcTestError(&status, "sscanf returned %d, want 2\n", i);
    }
    if (f != INFINITY) {
        LibcTestError(&status, "std::sscanf(longnum, \"%%f\") read %f, want INF\n", f);
    }
    if (c != '1') {
        LibcTestError(&status, "std::sscanf(\"1\", %%c) read '%c', want '1'\n", c);
    }
    free(s);
    return status;
}
