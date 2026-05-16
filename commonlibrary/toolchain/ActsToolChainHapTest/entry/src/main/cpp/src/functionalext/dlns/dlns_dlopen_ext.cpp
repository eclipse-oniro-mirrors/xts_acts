/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cerrno>
#include <cstdio>
#include <cstring>
#include <dlfcn.h>
#include <dlfcn_ext.h>

#include "dlns_test.h"
#include "functionalext.h"
#include "libc_test_shim.h"

/**
 * @tc.name      : dlopen_ext_0100
 * @tc.desc      : extinfo flag is 0, call DlopenExt, return handle is not nullptr.
 * @tc.level     : Level 0
 */
void Dlopen0100(void)
{
    DlExtinfo extinfo = {
        .flag = 0,
        .relro_fd = -1,
    };

    Dl_namespace dlns;
    dlns_init(&dlns, "dlns_create_0100");

    void* handle = dlopen_ns_ext(&dlns, DLL_NAME_PATH, RTLD_LAZY, &extinfo);
    EXPECT_PTRNE(__FUNCTION__, handle, nullptr);
    if (handle) {
        dlclose(handle);
    };
}

int DlnsDlopenExtTestTest()
{
    Dlopen0100();
    return T_STATUS;
}