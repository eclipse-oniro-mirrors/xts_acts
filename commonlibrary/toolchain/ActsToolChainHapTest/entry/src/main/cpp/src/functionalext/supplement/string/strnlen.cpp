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

#include <cstdio>
#include <cstring>
#include "test.h"

/**
 * @tc.name      : Strnlen0100
 * @tc.desc      : test strnlen function to get string length
 * @tc.level     : Level 0
 */
void Strnlen0100(void)
{
    size_t want = 5;
    char* str = "123456";
    size_t result = strnlen(str, 5);
    if (result != want) {
        t_error("%s strnlen get result is %d are not 5\n", __func__, result);
    }
}

/**
 * @tc.name      : Strnlen0200
 * @tc.desc      : The incoming length is greater than the string length
 * @tc.level     : Level 1
 */
void Strnlen0200(void)
{
    size_t want = 6;
    char* str = "123456";
    size_t result = strnlen(str, 9);
    if (result != want) {
        t_error("%s strnlen get result is %d are not 6\n", __func__, result);
    }
}

static int StrnlenTestImpl(int argc, char* argv[])
{
    Strnlen0100();
    Strnlen0200();
    return T_STATUS;
}

int StrnlenTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return StrnlenTestImpl(1, libcArgvStub);
}
