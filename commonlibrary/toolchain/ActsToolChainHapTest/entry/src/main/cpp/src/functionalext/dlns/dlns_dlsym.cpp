/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cerrno>
#include <cstdio>
#include <cstring>
#include <dlfcn.h>

#include "dlns_test.h"
#include "functionalext.h"

const char* LIB_NAME_A = "libdlns_dlsym_dep_a.so";
const char* LIB_NAME_B = "libdlns_dlsym_dep_b.so";
const char* LIB_NAME_C = "libdlns_dlsym_dep_c.so";

static inline void dlns_dlsym_0100_init_ns(Dl_namespace* dlnsA, Dl_namespace* dlnsB, Dl_namespace* dlnsC)
{
    dlns_init(dlnsA, "dlns_dlsym_0100_A");
    dlns_init(dlnsB, "dlns_dlsym_0100_B");
    dlns_init(dlnsC, "dlns_dlsym_0100_C");
    EXPECT_EQ(__FUNCTION__, dlns_create(dlnsA, PATH_A), EOK);
    EXPECT_EQ(__FUNCTION__, dlns_create(dlnsB, PATH_B), EOK);
    EXPECT_EQ(__FUNCTION__, dlns_create(dlnsC, PATH_C), EOK);
    EXPECT_EQ(__FUNCTION__, dlns_inherit(dlnsB, dlnsC, nullptr), EOK);
    EXPECT_EQ(__FUNCTION__, dlns_inherit(dlnsA, dlnsB, nullptr), EOK);
}

static inline void CloseSo(void* handle)
{
    if (handle) {
        dlclose(handle);
    }
}

/**
 * @tc.name      : DlnsDlsym0100
 * @tc.desc      : Call the dlsym interface to load libA,LIB_B,LIB_C dynamic library.
 * @tc.level     : Level1
 */
static void DlnsDlsym0100(void)
{
    Dl_namespace dlnsA;
    Dl_namespace dlnsB;
    Dl_namespace dlnsC;
    dlns_dlsym_0100_init_ns(&dlnsA, &dlnsB, &dlnsC);

    void* handleC = dlopen_ns(&dlnsC, LIB_NAME_C, RTLD_NOW);
    EXPECT_PTRNE(__FUNCTION__, handleC, nullptr);
    if (handleC == nullptr) {
        return;
    }

    void* handleB = dlopen_ns(&dlnsB, LIB_NAME_B, RTLD_NOW);
    EXPECT_PTRNE(__FUNCTION__, handleB, nullptr);
    if (handleB == nullptr) {
        CloseSo(handleC);
        return;
    }

    void* handleA = dlopen_ns(&dlnsA, LIB_NAME_A, RTLD_NOW);
    EXPECT_PTRNE(__FUNCTION__, handleA, nullptr);
    if (handleA == nullptr) {
        CloseSo(handleB);
        CloseSo(handleC);
        return;
    }

    int (*testA)(void) = dlsym(handleA, "test");
    EXPECT_PTRNE(__FUNCTION__, testA, nullptr);
    if (testA) {
        EXPECT_EQ(__FUNCTION__, TEST_RESULT_1, testA());
    }

    int (*testB)(void) = dlsym(handleA, "testB");
    EXPECT_PTRNE(__FUNCTION__, testB, nullptr);
    if (testB) {
        EXPECT_EQ(__FUNCTION__, TEST_RESULT_2, testB());
    }

    int (*testC)(void) = dlsym(handleC, "test");
    EXPECT_PTRNE(__FUNCTION__, testC, nullptr);
    if (testC) {
        EXPECT_EQ(__FUNCTION__, TEST_RESULT_3, testC());
    }

    int (*testD)(void) = dlsym(handleC, "testC");
    EXPECT_PTRNE(__FUNCTION__, testD, nullptr);
    if (testD) {
        EXPECT_EQ(__FUNCTION__, TEST_RESULT_4, testD());
    }

    int (*testE)(void) = dlsym(handleA, "testC");
    EXPECT_PTREQ(__FUNCTION__, testE, nullptr);

    CloseSo(handleC);
    CloseSo(handleB);
    CloseSo(handleA);
}

TEST_FUN G_Fun_Array[] = {
    DlnsDlsym0100,
};

int DlnsDlsymTestTest(void)
{
    int num = sizeof(G_Fun_Array) / sizeof(G_Fun_Array[0]);
    for (int pos = 0; pos < num; ++pos) {
        G_Fun_Array[pos]();
    }

    return T_STATUS;
}