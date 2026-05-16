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

#include <stdatomic.h>
#include "musl_preinit_common.h"

// Minimal stub globals to satisfy nativehook_test linkage in this project.
struct MuslLibcGlobals g_muslLibcGlobals = {};
struct MallocDispatchType g_libcMallocDefaultDispatch = {};
volatile atomic_bool g_hookEnableHookFlag = false;
volatile atomic_bool g_memleakHookFlag = false;
volatile atomic_bool g_customHookFlag = false;
bool g_checkLoadMallocMemTrack = false;
void* function_of_shared_lib[LAST_FUNCTION] = { 0 };
volatile atomic_llong g_ohosMallocHookSharedLibrary = 0;
