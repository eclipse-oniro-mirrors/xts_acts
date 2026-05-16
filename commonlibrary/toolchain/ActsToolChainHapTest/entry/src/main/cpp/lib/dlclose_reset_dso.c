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

#include <stdio.h>
int g_globalVar = 84;

static int statVar = 84;

void TestStaticVar(void)
{
    statVar++;
}

void TestGlobalVar(void)
{
    g_globalVar++;
}

int RetStatic(void)
{
    return statVar;
}

int RetGlobal(void)
{
    return g_globalVar;
}
__attribute__((constructor)) void BeforeMain(void)
{
    printf("before main\n");
}

__attribute__((destructor)) void AfterMain(void)
{
    printf("after main\n");
}
