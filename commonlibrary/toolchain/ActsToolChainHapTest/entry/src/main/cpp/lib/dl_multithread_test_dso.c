/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
#include <dlfcn.h>

#include "test.h"

const char* LIB_PATH = "/data/storage/el1/bundle/libs/arm/libdlclose_recursive.so";
static void* g_handle = NULL;

__attribute__((constructor)) void CtorDlopen()
{
    g_handle = dlopen(LIB_PATH, RTLD_GLOBAL);
    if (!g_handle) {
        t_error("dlopen %s failed: %s\n", LIB_PATH, dlerror());
    }
}

__attribute__((destructor)) void DtorDlclose()
{
    if (g_handle) {
        dlclose(g_handle);
    }
}
