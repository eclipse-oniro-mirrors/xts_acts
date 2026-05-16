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

#include <cstdio>
#include <cstdlib>
#include <dlfcn.h>

#define LIB_NAME "liblarge_size.so"
#define SYMBOL_NAME "CreateObj"

struct Test {
    virtual void F1();
    void F2();
};

static int LargeSizeTestTestImpl()
{
    void* h = dlopen(LIB_NAME, RTLD_LAZY);
    if (!h) {
        printf("dlopen %s failed.\n", LIB_NAME);
        exit(1);
    }

    void* (*createObj)() = (void* (*)())dlsym(h, SYMBOL_NAME);
    if (!createObj) {
        printf("dlsym %s failed.\n", SYMBOL_NAME);
        exit(1);
    }
    void* p = createObj();
    if (!p) {
        printf("create obj failed.\n");
        exit(1);
    }
    Test* obj = (Test*)p;
    obj->F1();

    dlclose(h);

    return 0;
}

int LargeSizeTestTest(void)
{
    return LargeSizeTestTestImpl();
}
