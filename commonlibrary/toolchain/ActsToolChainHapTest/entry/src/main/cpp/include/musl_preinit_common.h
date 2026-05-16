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

#ifndef MUSL_PREINIT_COMMON_H
#define MUSL_PREINIT_COMMON_H

#include <stdatomic.h>
#include <stdint.h>
#include "musl_malloc_dispatch.h"
#include "musl_malloc_dispatch_table.h"

extern struct MuslLibcGlobals g_muslLibcGlobals;
extern struct MallocDispatchType g_libcMallocDefaultDispatch;
extern volatile atomic_bool g_hookEnableHookFlag;
extern volatile atomic_bool g_memleakHookFlag;
extern volatile atomic_bool g_customHookFlag;
extern bool g_checkLoadMallocMemTrack;

enum EnumFunc {
    INITIALIZE_FUNCTION,
    FINALIZE_FUNCTION,
    GET_HOOK_FLAG_FUNCTION,
    SET_HOOK_FLAG_FUNCTION,
    ON_START_FUNCTION,
    ON_END_FUNCTION,
    SEND_HOOK_MISC_DATA,
    GET_HOOK_CONFIG,
    LAST_FUNCTION,
};

enum EnumHookMode {
    STARTUP_HOOK_MODE,
    DIRECT_HOOK_MODE,
    STEP_HOOK_MODE,
};

#ifdef HOOK_ENABLE
extern void* function_of_shared_lib[];
extern volatile atomic_llong g_ohosMallocHookSharedLibrary;
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef HOOK_ENABLE
__attribute__((always_inline)) inline volatile void* LoadHookImplHandle()
{
    return reinterpret_cast<volatile void*>(
        static_cast<uintptr_t>(atomic_load_explicit(&g_ohosMallocHookSharedLibrary, memory_order_acquire)));
}

__attribute__((always_inline)) inline bool IsHookLibLoading(volatile void* impl_handle)
{
    return impl_handle == reinterpret_cast<void*>(static_cast<uintptr_t>(-1));
}
#endif

__attribute__((always_inline)) inline bool GetGlobalHookFlag()
{
#ifdef HOOK_ENABLE
    volatile bool g_flag = atomic_load_explicit(&g_hookEnableHookFlag, memory_order_acquire);
    return g_flag;
#else
    return false;
#endif
}

__attribute__((always_inline)) inline bool GetMemleakHookFlag()
{
#ifdef HOOK_ENABLE
    volatile bool memleak_flag = atomic_load_explicit(&g_memleakHookFlag, memory_order_acquire);
    return memleak_flag;
#else
    return false;
#endif
}

__attribute__((always_inline)) inline bool GetCustomHookFlag()
{
#ifdef HOOK_ENABLE
    volatile bool custom_flag = atomic_load_explicit(&g_customHookFlag, memory_order_acquire);
    return custom_flag;
#else
    return false;
#endif
}

__attribute__((always_inline)) inline bool GetHookFlag()
{
#ifdef HOOK_ENABLE
    volatile void* impl_handle = LoadHookImplHandle();
    if (impl_handle == NULL) {
        return false;
    } else if (IsHookLibLoading(impl_handle)) {
        return true;
    }
    GetHookFlagType get_hook_func_ptr =
        reinterpret_cast<GetHookFlagType>(function_of_shared_lib[GET_HOOK_FLAG_FUNCTION]);
    return get_hook_func_ptr();
#else
    return false;
#endif
}

__attribute__((always_inline)) inline bool SetHookFlag(bool flag)
{
#ifdef HOOK_ENABLE
    volatile void* impl_handle = LoadHookImplHandle();
    if (impl_handle == NULL) {
        return false;
    } else if (IsHookLibLoading(impl_handle)) {
        return true;
    }
    SetHookFlagType set_hook_func_ptr =
        reinterpret_cast<SetHookFlagType>(function_of_shared_lib[SET_HOOK_FLAG_FUNCTION]);
    return set_hook_func_ptr(flag);
#else
    return false;
#endif
}

#ifdef HOOK_ENABLE
__attribute__((always_inline)) inline volatile const struct MallocDispatchType*
    NormalizeDispatchByHookFlags(volatile const struct MallocDispatchType* ret)
{
    if (ret == NULL) {
        return NULL;
    }
    if (GetCustomHookFlag()) {
        return ret;
    }
    return (GetGlobalHookFlag() && GetHookFlag()) ? ret : NULL;
}
#endif

__attribute__((always_inline)) inline volatile const struct MallocDispatchType* GetCurrentDispatchTable()
{
#ifdef HOOK_ENABLE
    volatile const struct MallocDispatchType* ret = reinterpret_cast<volatile const struct MallocDispatchType*>(
        static_cast<uintptr_t>(atomic_load_explicit(&g_muslLibcGlobals.currentDispatchTable, memory_order_acquire)));
    return NormalizeDispatchByHookFlags(ret);
#else
    return NULL;
#endif
}

__attribute__((always_inline)) inline bool
    SendHookMiscData(uint64_t id, const char* stackPtr, size_t stackSize, uint32_t type)
{
#ifdef HOOK_ENABLE
    volatile void* impl_handle = LoadHookImplHandle();
    if (impl_handle == NULL || IsHookLibLoading(impl_handle)) {
        return false;
    }
    SendHookMiscDataType send_hook_func_ptr =
        reinterpret_cast<SendHookMiscDataType>(function_of_shared_lib[SEND_HOOK_MISC_DATA]);
    return send_hook_func_ptr(id, stackPtr, stackSize, type);
#else
    return false;
#endif
}

__attribute__((always_inline)) inline void* GetHookConfig()
{
#ifdef HOOK_ENABLE
    volatile void* impl_handle = LoadHookImplHandle();
    if (impl_handle == NULL || IsHookLibLoading(impl_handle)) {
        return NULL;
    }
    GetHookConfigType get_hook_func_ptr = reinterpret_cast<GetHookConfigType>(function_of_shared_lib[GET_HOOK_CONFIG]);
    return get_hook_func_ptr();
#else
    return NULL;
#endif
}

#define MUSL_HOOK_PARAM_NAME "libc.hook_mode"
#define OHOS_PARAM_MAX_SIZE 96
#define FILE_NAME_MAX_SIZE 40

#ifdef __cplusplus
}
#endif

#endif
