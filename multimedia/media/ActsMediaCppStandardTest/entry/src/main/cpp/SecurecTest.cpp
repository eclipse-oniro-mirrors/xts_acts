/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "include/SecurecTest.h"
#include <algorithm>
#include <cstddef>

extern "C" {
int SecureMemset(void* dest, size_t destMax, int c, size_t count)
{
    if (dest == nullptr) {
        return EINVAL;
    }
    if (count > destMax || destMax > SECUREC_MEM_MAX_LEN) {
        return ERANGE;
    }
    unsigned char* p = static_cast<unsigned char*>(dest);
    std::fill_n(p, count, static_cast<unsigned char>(c));
    return EOK;
}

int SecureMemcpy(void* dest, size_t destMax, const void* src, size_t count)
{
    if (dest == nullptr || src == nullptr) {
        return EINVAL;
    }
    if (count > destMax || destMax > SECUREC_MEM_MAX_LEN) {
        return ERANGE;
    }
    const unsigned char* s = static_cast<const unsigned char*>(src);
    unsigned char* d = static_cast<unsigned char*>(dest);
    std::copy_n(s, count, d);
    return EOK;
}

} // extern "C"
