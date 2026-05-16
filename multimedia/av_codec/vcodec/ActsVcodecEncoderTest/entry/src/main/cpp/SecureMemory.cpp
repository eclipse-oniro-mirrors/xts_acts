/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/SecureMemory.h"

extern "C" {
int SecureMemset(void *dest, size_t destMax, int value, size_t count)
{
    if (dest == nullptr) {
        return EINVAL;
    }
    if (destMax == 0 || destMax > SECUREC_MEM_MAX_LEN) {
        return EINVAL;
    }
    if (count > destMax) {
        return ERANGE;
    }
    unsigned char *ptr = static_cast<unsigned char *>(dest);
    unsigned char val = static_cast<unsigned char>(value);
    for (size_t i = 0; i < count; i++) {
        ptr[i] = val;
    }
    return EOK;
}

int SecureMemcpy(void *dest, size_t destMax, const void *src, size_t count)
{
    if (dest == nullptr || src == nullptr) {
        return EINVAL;
    }
    if (destMax == 0 || destMax > SECUREC_MEM_MAX_LEN) {
        return EINVAL;
    }
    if (count > destMax) {
        return ERANGE;
    }
    if (count == 0) {
        return EOK;
    }
    if ((dest >= src && dest < static_cast<const void*>(static_cast<const char*>(src) + count)) ||
        (src >= dest && src < static_cast<const void*>(static_cast<char*>(dest) + destMax))) {
        return EINVAL;
    }
    unsigned char *dstPtr = static_cast<unsigned char *>(dest);
    const unsigned char *srcPtr = static_cast<const unsigned char *>(src);
    for (size_t i = 0; i < count; i++) {
        dstPtr[i] = srcPtr[i];
    }
    return EOK;
}
}
