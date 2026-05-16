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

#include <cstdlib>
#include <cstring>
#include "libc_test_shim.h"

int PutenvDoublefreeTest()
{
    setenv("A", "1", 1);
    setenv("A", "2", 1);
    char* c = strdup("A=3");
    putenv(c);
    setenv("A", "4", 1);
    free(c);
    return SUCCESS_CODE;
}
