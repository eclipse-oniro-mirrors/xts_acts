/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#ifndef CFI_CLASS_HIERARCHY_H
#define CFI_CLASS_HIERARCHY_H

#include "cfi_util.h"

struct A {
    virtual void test();
};

void A::test()
{
    printf("A::test()\n");
}

struct B : A {
    void test() override;
};

void B::test()
{
    printf("B::test()\n");
}

struct C : A {};

struct D {
    virtual void test();
};

void D::test()
{
    printf("D::test()\n");
}

struct CallTestA {
    virtual void VcallFunc();
    void CallFunc();
};

void CallTestA::VcallFunc()
{
    printf("CallTestA::VcallFunc()\n");
}

void CallTestA::CallFunc()
{
    printf("CallTestA::CallFunc()\n");
}

struct CallTestB {
    virtual void VcallFunc();
    void CallFunc();
};

void CallTestB::VcallFunc()
{
    printf("CallTestB::VcallFunc()\n");
}

void CallTestB::CallFunc()
{
    printf("CallTestB::CallFunc()\n");
}

#endif