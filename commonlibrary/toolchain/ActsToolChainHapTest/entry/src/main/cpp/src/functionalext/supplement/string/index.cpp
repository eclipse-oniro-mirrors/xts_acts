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
 * @tc.name      : Index0100
 * @tc.desc      : test the index method to get the position of the first occurrence of the target character
 * @tc.level     : Level 0
 */
void Index0100(void)
{
    char* str = "hello world";
    char* result = index(str, 'e');
    if (strcmp(str + 1, result) != 0) {
        t_error("%s index get result is %s are not  want %s\n", __func__, result, str + 1);
    }
}

/**
 * @tc.name      : Index0200
 * @tc.desc      : The result returned by the index function when the target character appears multiple times in the
 * test string
 * @tc.level     : Level 1
 */
void Index0200(void)
{
    int addSize = 2;
    char* str = "hello world";
    char* result = index(str, 'l');
    if (strcmp(str + addSize, result) != 0) {
        t_error("%s index get result is %s are not  want %s\n", __func__, result, str + addSize);
    }
}

/**
 * @tc.name      : Index0300
 * @tc.desc      : The result returned by the index function when the target character does not appear in the test
 * string
 * @tc.level     : Level 1
 */
void Index0300(void)
{
    char* str = "hello world";
    char* result = index(str, 'a');
    if (result) {
        t_error("%s index get result is %s are not  want ''\n", __func__, result);
    }
}

static int IndexTestImpl(int argc, char* argv[])
{
    Index0100();
    Index0200();
    Index0300();
    return T_STATUS;
}

int IndexTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return IndexTestImpl(1, libcArgvStub);
}
