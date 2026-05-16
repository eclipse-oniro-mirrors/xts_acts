/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <dlfcn.h>
#include <cstdio>
#include "test.h"


typedef int (* TestSVar)();
typedef int (* TestGVar)();
typedef int (* InspSVar)();
typedef int (* InspGVar)();

#define EXPECTED_VAR_VALUE 84


static int DlcloseResetTestWithArgs(int argc, char *argv[])
{
    const char *libPath = "/data/storage/el1/bundle/libs/arm/libdlclose_reset_dso.so";
    void *h = nullptr;
    void *g = nullptr;
    TestSVar testSVar = nullptr;
    TestGVar testGVar = nullptr;
    InspSVar inspSVar = nullptr;
    InspGVar inspGVar = nullptr;

    int sVar = 0;
    int gVar = 0;

    h = dlopen(libPath, RTLD_LAZY | RTLD_LOCAL);
    if (!h) {
        t_error("dlopen %s failed: %s\n", libPath, dlerror());
    }

    testSVar = (TestSVar)dlsym(h, "TestStaticVar");
    if (!testSVar) {
        t_error("dlsym TestStaticVar failed: %s\n", dlerror());
    }

    testGVar = (TestGVar)dlsym(h, "TestGlobalVar");
    if (!testGVar) {
        t_error("dlsyn TestGlobalVar failed: %s\n", dlerror());
    }

    testSVar();
    testGVar();

    if (dlclose(h)) {
        t_error("dlclose failed: %s\n", dlerror());
    }

    g = dlopen(libPath, RTLD_LAZY | RTLD_LOCAL);
    if (!g) {
        t_error("dlopen %s failed: %s\n", libPath, dlerror());
    }

    inspSVar = (InspSVar)dlsym(g, "RetStatic");
    if (!inspSVar) {
        t_error("dlsym RetStatic failed: %s\n", dlerror());
    }

    inspGVar = (InspGVar)dlsym(g, "RetGlobal");
    if (!inspGVar) {
        t_error("dlsyn RetGlobal failed: %s\n", dlerror());
    }

    sVar = inspSVar();
    gVar = inspGVar();

    if (sVar != EXPECTED_VAR_VALUE) {
        t_error("Static variable reset failed: want s_var=%d got s_var=%d\n", EXPECTED_VAR_VALUE, sVar);
    }

    if (gVar != EXPECTED_VAR_VALUE) {
        t_error("Global variable reset failed: want g_var=%d got g_var=%d\n", EXPECTED_VAR_VALUE, gVar);
    }

    if (dlclose(g)) {
        t_error("dlclose failed: %s\n", dlerror());
    }

    return g_tStatus;
}

int DlcloseResetTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return DlcloseResetTestWithArgs(1, libcArgv);
}
