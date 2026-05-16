/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#ifndef SECUREC_H
#define SECUREC_H

#include <errno.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EOK
#define EOK 0
#endif

typedef int errno_t;

static inline errno_t memcpy_s(void *dest, size_t destMax, const void *src, size_t count)
{
    if (dest == NULL || src == NULL) {
        return EINVAL;
    }
    if (count > destMax) {
        return ERANGE;
    }
    (void)memcpy(dest, src, count);
    return EOK;
}

static inline int snprintf_s(char *strDest, size_t destMax, size_t count, const char *format, ...)
{
    if (strDest == NULL || format == NULL || destMax == 0) {
        return -1;
    }
    size_t writeCount = count;
    if (writeCount >= destMax) {
        writeCount = destMax - 1;
    }

    va_list args;
    va_start(args, format);
    int ret = vsnprintf(strDest, writeCount + 1, format, args);
    va_end(args);
    return ret;
}

#ifdef __cplusplus
}
#endif

#endif
