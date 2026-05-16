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

#include <cctype>
#include <cstring>

extern "C" int Strverscmp(const char* l0, const char* r0)
{
    const unsigned char* l = reinterpret_cast<const unsigned char*>(l0);
    const unsigned char* r = reinterpret_cast<const unsigned char*>(r0);
    size_t i;
    size_t dp;
    size_t j;
    int z = 1;

    for (dp = i = 0; l[i] == r[i]; i++) {
        int c = l[i];
        if (!c) {
            return 0;
        }
        if (!isdigit(c)) {
            dp = i + 1;
            z = 1;
        } else if (c != '0') {
            z = 0;
        }
    }

    if (l[dp] - '1' < 9U && r[dp] - '1' < 9U) {
        for (j = i; isdigit(l[j]); j++) {
            if (!isdigit(r[j])) {
                return 1;
            }
        }
        if (isdigit(r[j])) {
            return -1;
        }
    } else if (z && dp < i && (isdigit(l[i]) || isdigit(r[i]))) {
        return static_cast<unsigned char>(l[i] - '0') - static_cast<unsigned char>(r[i] - '0');
    }

    return l[i] - r[i];
}
