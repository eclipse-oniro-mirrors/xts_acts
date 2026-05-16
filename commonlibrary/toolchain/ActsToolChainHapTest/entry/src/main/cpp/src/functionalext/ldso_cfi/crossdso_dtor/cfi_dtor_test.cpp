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

#include <dlfcn.h>
#include "cfi_util.h"

struct base_t;
void DoF(base_t* ptr);

int CfiCrossDsoDtorTestExeTest()
{
    DoF(nullptr); // do not omit the library
    ClearCfiLog();
    using CreateT = void (*)();
    auto* lib = dlopen("libcfi_cross_dso_dtor_test_use.z.so", RTLD_NOW);
    auto* fn = (CreateT)dlsym(lib, "create");
    if (fn == nullptr) {
        (void)dlclose(lib);
        return 1;
    }
    fn();
    (void)dlclose(lib);
    ExpectCfiOk();
    return 0;
}
