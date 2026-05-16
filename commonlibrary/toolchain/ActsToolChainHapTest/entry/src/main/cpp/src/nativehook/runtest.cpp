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

#include <climits>
#include <cstddef>
#include <cstdio>
#include <stdatomic.h>
#include "test.h"
#define HOOK_ENABLE
#include "musl_preinit_common.h"

static bool g_clientHookFlag;

bool ClientGetHookFlag()
{
    return g_clientHookFlag;
}

bool ClientSetHookFlag(bool flag)
{
    bool beforeFlag = g_clientHookFlag;
    g_clientHookFlag = flag;
    return beforeFlag;
}

void InstallHookFunction()
{
    for (size_t i = 0; i < LAST_FUNCTION; ++i) {
        function_of_shared_lib[i] = nullptr;
    }
    function_of_shared_lib[GET_HOOK_FLAG_FUNCTION] = reinterpret_cast<void*>(ClientGetHookFlag);
    function_of_shared_lib[SET_HOOK_FLAG_FUNCTION] = reinterpret_cast<void*>(ClientSetHookFlag);
}

static void NativehookCase1()
{
    bool hookFlag;
    volatile const struct MallocDispatchType* mallocDispatchTable;

    printf("Case 1: client shared library has not been loaded.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, static_cast<volatile long long>(0LL), memory_order_seq_cst);
    hookFlag = GetHookFlag();
    if (!(hookFlag == false)) {
        t_error("hookFlag == false failed: hookFlag shoud be false\n");
    }
    mallocDispatchTable = GetCurrentDispatchTable();
    if (!(mallocDispatchTable == nullptr)) {
        t_error("mallocDispatchTable == nullptr failed: mallocDispatchTable shoud be nullptr\n");
    }
}

static void NativehookCase2()
{
    bool hookFlag;
    volatile const struct MallocDispatchType* mallocDispatchTable;

    printf(
        "Case 2: client shared library is loading, no uninstall signal raising, but the functions hasn't been loaded, "
        "using the temporary malloc table.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, static_cast<volatile long long>(-1LL), memory_order_seq_cst);
    atomic_store_explicit(&g_muslLibcGlobals.currentDispatchTable,
                          static_cast<volatile const long long>(0x95919591LL),
                          memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, static_cast<volatile bool>(true), memory_order_seq_cst);
    hookFlag = GetHookFlag();
    if (!(hookFlag == true)) {
        t_error("hookFlag == true failed: hookFlag shoud be true\n");
    }
    mallocDispatchTable = GetCurrentDispatchTable();
    if (!(mallocDispatchTable != nullptr)) {
        t_error("mallocDispatchTable != nullptr failed: mallocDispatchTable shoud be not nullptr\n");
    }
}

static void NativehookCase3()
{
    bool hookFlag;
    volatile const struct MallocDispatchType* mallocDispatchTable;

    printf(
        "Case 3: client shared library is loading, uninstall signal raising, but the functions hasn't been loaded, "
        "using the temporary malloc table.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, static_cast<volatile long long>(-1LL), memory_order_seq_cst);
    atomic_store_explicit(&g_muslLibcGlobals.currentDispatchTable,
                          static_cast<volatile const long long>(0x95919591LL),
                          memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, static_cast<volatile bool>(false), memory_order_seq_cst);
    hookFlag = GetHookFlag();
    if (!(hookFlag == true)) {
        t_error("hookFlag == true failed: hookFlag shoud be true\n");
    }
    mallocDispatchTable = GetCurrentDispatchTable();
    if (!(mallocDispatchTable == nullptr)) {
        t_error("mallocDispatchTable == nullptr failed: mallocDispatchTable shoud be nullptr\n");
    }
}

static void NativehookCase4()
{
    bool hookFlag;
    volatile const struct MallocDispatchType* mallocDispatchTable;
    const volatile long long kLoadedLibHandle = static_cast<volatile long long>(0x10319090LL);

    printf("Case 4: client shared library is loaded, no uninstall signal raising, outside client malloc.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, kLoadedLibHandle, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, static_cast<volatile bool>(true), memory_order_seq_cst);
    SetHookFlag(true);
    hookFlag = GetHookFlag();
    if (!(hookFlag == true)) {
        t_error("hookFlag == true failed: hookFlag shoud be true\n");
    }
    mallocDispatchTable = GetCurrentDispatchTable();
    if (!(mallocDispatchTable != nullptr)) {
        t_error("mallocDispatchTable != nullptr failed: mallocDispatchTable shoud be not nullptr\n");
    }
}

static void NativehookCase5()
{
    bool hookFlag;
    volatile const struct MallocDispatchType* mallocDispatchTable;
    const volatile long long kLoadedLibHandle = static_cast<volatile long long>(0x10319090LL);

    printf("Case 5: client shared library is loaded, no uninstall signal raising, inside client malloc.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, kLoadedLibHandle, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, static_cast<volatile bool>(true), memory_order_seq_cst);
    SetHookFlag(false);
    hookFlag = GetHookFlag();
    if (!(hookFlag == false)) {
        t_error("hookFlag == false failed: hookFlag shoud be false\n");
    }
    mallocDispatchTable = GetCurrentDispatchTable();
    if (!(mallocDispatchTable == nullptr)) {
        t_error("mallocDispatchTable == nullptr failed: mallocDispatchTable shoud be nullptr\n");
    }
}

static void NativehookCase6()
{
    bool hookFlag;
    volatile const struct MallocDispatchType* mallocDispatchTable;
    const volatile long long kLoadedLibHandle = static_cast<volatile long long>(0x10319090LL);

    printf("Case 6: client shared library is loaded, uninstall signal raising, outside client malloc.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, kLoadedLibHandle, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, static_cast<volatile bool>(false), memory_order_seq_cst);
    SetHookFlag(true);
    hookFlag = GetHookFlag();
    if (!(hookFlag == true)) {
        t_error("hookFlag == true failed: hookFlag shoud be true\n");
    }
    mallocDispatchTable = GetCurrentDispatchTable();
    if (!(mallocDispatchTable == nullptr)) {
        t_error("mallocDispatchTable == nullptr failed: mallocDispatchTable shoud be nullptr\n");
    }
}

static void NativehookCase7()
{
    bool hookFlag;
    volatile const struct MallocDispatchType* mallocDispatchTable;
    const volatile long long kLoadedLibHandle = static_cast<volatile long long>(0x10319090LL);

    printf("Case 7: client shared library is loaded, uninstall signal raising, inside client malloc.\n");
    atomic_store_explicit(&g_ohosMallocHookSharedLibrary, kLoadedLibHandle, memory_order_seq_cst);
    atomic_store_explicit(&g_hookEnableHookFlag, static_cast<volatile bool>(false), memory_order_seq_cst);
    SetHookFlag(false);
    hookFlag = GetHookFlag();
    if (!(hookFlag == false)) {
        t_error("hookFlag == false failed: hookFlag shoud be false\n");
    }
    mallocDispatchTable = GetCurrentDispatchTable();
    if (!(mallocDispatchTable == nullptr)) {
        t_error("mallocDispatchTable == nullptr failed: mallocDispatchTable shoud be nullptr\n");
    }
}

static int NativehookTestTestImpl(int argc, char** argv)
{
    (void)argc;
    (void)argv;
    printf("Installing client's functions...");
    InstallHookFunction();
    printf("\nInstallation Completes\n");

    printf("start 7 scenes testing...\n");
    NativehookCase1();
    NativehookCase2();
    NativehookCase3();
    NativehookCase4();
    NativehookCase5();
    NativehookCase6();
    NativehookCase7();

    if (T_STATUS == 0) {
        printf("All test cases passed!\n");
    } else {
        printf("***There are some test cases not passed.\n");
    }
    return T_STATUS;
}

int NativehookTestTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return NativehookTestTestImpl(1, libcArgvStub);
}
