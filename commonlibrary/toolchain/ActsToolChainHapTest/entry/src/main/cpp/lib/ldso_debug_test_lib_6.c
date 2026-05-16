/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "ldso_debug_test_lib_7.h"

#define TEST_LIB_ORDER 6

static int i = 0;

static int debug_test_6(void)
{
    i += debug_test_7();
    return i + TEST_LIB_ORDER;
}

int main(void)
{
    debug_test_6();
    return 0;
}