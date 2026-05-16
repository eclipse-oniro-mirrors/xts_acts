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
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <malloc.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <unistd.h>
#include "libc_common_memfill.h"
#include "libc_test_shim.h"

namespace {
constexpr int K_BINARY_HALVE_DIVISOR = 2;
constexpr size_t K_MEMFILL_MALLOC_ITER_MAX = 1000000U;
} // namespace

static size_t Mmax(int fd, size_t* start)
{
    size_t i;
    size_t n;
    void* p;

    for (i = n = *start; i >= static_cast<size_t>(sysconf(_SC_PAGE_SIZE)); i /= K_BINARY_HALVE_DIVISOR) {
        if ((p = mmap(nullptr, n, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, fd, 0)) == MAP_FAILED) {
            n -= i / K_BINARY_HALVE_DIVISOR;
        } else {
            munmap(p, n);
            if (n == i) {
                *start = n;
            }
            n += i / K_BINARY_HALVE_DIVISOR;
        }
    }
    size_t pageSize = static_cast<size_t>(sysconf(_SC_PAGE_SIZE));
    return n & ~(pageSize - 1);
}

extern "C" int TVmfill(void** p, size_t* n, int len)
{
    int fd = MAP_ANONYMOUS ? -1 : open("/dev/zero", O_RDWR);
    size_t start = static_cast<size_t>(-1) / 2 + 1;
    size_t m;
    void* q;
    int i;

    for (i = 0;; i++) {
        m = Mmax(fd, &start);
        if (!m) {
            break;
        }
        if (i >= len) {
            break;
        }
        q = mmap(nullptr, m, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, fd, 0);
        if (q == MAP_FAILED) {
            return -1;
        }
        p[i] = q;
        n[i] = m;
    }
    return i;
}

extern "C" int TMemfill()
{
    int r = 0;
    if (TVmfill(nullptr, nullptr, 0) < 0) {
        LibcTestError(nullptr, "vmfill failed: %s\n", strerror(errno));
        r = -1;
    }
    if (TSetrlim(RLIMIT_DATA, 0) < 0) {
        r = -1;
    }
    if (!r) {
        for (size_t n = 0; n < K_MEMFILL_MALLOC_ITER_MAX && malloc(1); ++n) {
        }
    }
    return r;
}
