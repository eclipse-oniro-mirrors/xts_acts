/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <search.h>
#include "functionalext.h"

const int KEY = 10;
const int LENGTH1 = 10;
const int LENGTH2 = 5;

int Compare(int *x, int *y)
{
    return (*x - *y);
}

/**
 * @tc.name      : lfind_0100
 * @tc.desc      : Verify lfind process success.
 * @tc.level     : level 0.
 */
void Lfind0100(void)
{
    int array[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    size_t nlength = LENGTH1;
    int key;
    int *ret;
    key = KEY;
    ret =  (int *)lfind(&key, array, &nlength, sizeof(int), (int (*)(const void *, const void *))Compare);
    EXPECT_NE("lfind_0100", *ret, 0);
}

/**
 * @tc.name      : lfind.
 * @tc.desc      : Verify lfind process fail because key not is array.
 * @tc.level     : level 2.
 */
void Lfind0200(void)
{
    int array[5] = {1, 2, 3, 4, 5};
    size_t nlength = LENGTH2;
    int key;
    int *ret;
    key = 0;
    ret =  (int *)lfind(&key, array, &nlength, sizeof(int), (int (*)(const void *, const void *))Compare);
    EXPECT_PTREQ("lfind_0200", ret, NULL);
}

static int LfindTestImpl(void)
{
    Lfind0100();
    Lfind0200();
    return g_tStatus;
}

int LfindTest(void)
{
    return LfindTestImpl();
}
