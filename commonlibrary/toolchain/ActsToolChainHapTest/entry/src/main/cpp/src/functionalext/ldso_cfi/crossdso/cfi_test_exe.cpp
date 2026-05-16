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

#include <cstdio>
#include <cstring>
#include <dlfcn.h>
#include "cfi_util.h"

struct AA {
    virtual void Test();
};

void AA::Test()
{
    printf("AA::Test()\n");
}

void ChangeToAnotherObj()
{
    AA* a = new AA;
    void* handle = dlopen("libcfi_cross_dso_test_lib.z.so", RTLD_NOW);
    if (handle == nullptr) {
        delete a;
        return;
    }
    void* (*createB)() = (void* (*)())dlsym(handle, "CreateObj");
    void* p = createB();
    a->Test();
    {
        unsigned char* pa = reinterpret_cast<unsigned char*>(&a);
        unsigned char* pp = reinterpret_cast<unsigned char*>(&p);
        for (size_t i = 0; i < sizeof(void*); ++i) {
            pa[i] = pp[i];
        }
    }
    a->Test();
    delete a;
    (void)dlclose(handle);
}

int CfiCrossDsoTestExeTest()
{
    if (DEBUG) {
        ShowCfiLogFile();
    }
    ClearCfiLog();
    if (DEBUG) {
        ShowCfiLogFile();
    }
    ChangeToAnotherObj();
    FindAndCheck("runtime error: control flow integrity check for type 'AA' failed during virtual call");
    if (DEBUG) {
        ShowCfiLogFile();
    }
    return 0;
}