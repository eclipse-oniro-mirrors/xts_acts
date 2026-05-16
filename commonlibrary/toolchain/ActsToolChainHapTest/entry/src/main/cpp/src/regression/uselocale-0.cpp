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

// commit: 63f4b9f18f3674124d8bcb119739fec85e6da005
// uselocale(0) should not change the current locale
#include <clocale>
#include "libc_test_shim.h"
int Uselocale0Test()
{
    int status = SUCCESS_CODE;

    locale_t c = newlocale(LC_ALL_MASK, "C", nullptr);
    if (c == nullptr) {
        LibcTestError(&status, "newlocale failed\n");
        return status;
    }

    if (!uselocale(c)) {
        LibcTestError(&status, "uselocale(c) failed\n");
    }

    locale_t l1 = uselocale(nullptr);
    if (l1 != c) {
        LibcTestError(&status,
                      "uselocale failed to set locale: "
                      "%p != %p\n",
                      static_cast<void*>(l1),
                      static_cast<void*>(c));
    }

    locale_t l2 = uselocale(nullptr);
    if (l2 != l1) {
        LibcTestError(&status,
                      "uselocale(0) changed locale: "
                      "%p != %p\n",
                      static_cast<void*>(l2),
                      static_cast<void*>(l1));
    }

    return status;
}
