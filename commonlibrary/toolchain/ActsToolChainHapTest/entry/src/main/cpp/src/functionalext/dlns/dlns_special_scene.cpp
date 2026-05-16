/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "dlns_test.h"
#include "functionalext.h"

/**
 * @tc.name      : DlopenNsSpecial0100
 * @tc.desc      : Loading the same library multiple times from the same namespace.
 * @tc.level     : Level 2
 */
void DlopenNsSpecial0100(void)
{
    Dl_namespace dlns_default;
    dlns_get(nullptr, &dlns_default);
    Dl_namespace dlns;
    dlns_init(&dlns, "ns_no_allowed_libs");
    dlns_inherit(&dlns, &dlns_default, "libc++.so");

    void* handle1 = dlopen_ns(&dlns, DLL_NAME, RTLD_LAZY);
    EXPECT_TRUE("DlopenNsSpecial0100", handle1);

    void* handle2 = dlopen_ns(&dlns, DLL_NAME, RTLD_LAZY);
    EXPECT_TRUE("DlopenNsSpecial0100", handle2);

    void* handle3 = dlopen_ns(&dlns, DLL_NAME, RTLD_LAZY);
    EXPECT_TRUE("DlopenNsSpecial0100", handle3);

    if (handle1) {
        dlclose(handle1);
    }
    if (handle2) {
        dlclose(handle2);
    }
    if (handle3) {
        dlclose(handle3);
    }
}

/**
 * @tc.name      : DlopenNsSpecial0200
 * @tc.desc      : Loading the same library multiple times in different namespaces.
 * @tc.level     : Level 2
 */
void DlopenNsSpecial0200(void)
{
    Dl_namespace dlns_default;
    dlns_get(nullptr, &dlns_default);
    Dl_namespace dlns_no_allowed_libs;
    Dl_namespace dlns_normal;
    Dl_namespace dlns_wrong_lib_path;
    dlns_init(&dlns_no_allowed_libs, "ns_no_allowed_libs");
    dlns_init(&dlns_normal, "ns_normal");
    dlns_init(&dlns_wrong_lib_path, "inherited_class");
    dlns_inherit(&dlns_no_allowed_libs, &dlns_default, "libc++.so");
    dlns_inherit(&dlns_normal, &dlns_default, "libc++.so");
    dlns_inherit(&dlns_wrong_lib_path, &dlns_default, "libc++.so");

    void* handle1 = dlopen_ns(&dlns_no_allowed_libs, DLL_NAME, RTLD_LAZY);
    EXPECT_TRUE("DlopenNsSpecial0200", handle1);

    void* handle2 = dlopen_ns(&dlns_normal, DLL_NAME, RTLD_LAZY);
    EXPECT_TRUE("DlopenNsSpecial0200", handle2);

    void* handle3 = dlopen_ns(&dlns_wrong_lib_path, DLL_NAME, RTLD_LAZY);
    EXPECT_TRUE("DlopenNsSpecial0200", handle3);

    if (handle1) {
        dlclose(handle1);
    }
    if (handle2) {
        dlclose(handle2);
    }
    if (handle3) {
        dlclose(handle3);
    }
}

/**
 * @tc.name      : DlopenNsSysPath0100
 * @tc.desc      : arm platform, lib_paths in the default namespace is the system PATH
 *                  read in the ld-musl-namespace-arm.ini file
 * @tc.level     : Level 2
 */
void DlopenNsSysPath0100(void)
{
    Dl_namespace dlns;
    dlns_init(&dlns, "default");
    void* handle = dlopen_ns(&dlns, DLL_NAME, RTLD_LAZY);
    EXPECT_TRUE("DlopenNsSysPath0100", handle);
    if (handle) {
        dlclose(handle);
    }
}

int DlnsSpecialSceneTestTest(void)
{
    DlopenNsSpecial0100();
    DlopenNsSpecial0200();
    DlopenNsSysPath0100();

    return T_STATUS;
}