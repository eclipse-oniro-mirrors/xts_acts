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

#include <climits>
#include <unistd.h>
#include "test.h"

/*
 * @tc.name      : Getgroups0100
 * @tc.desc      : Getlist of supplementary group IDs
 * @tc.level     : Level 0
 */
void Getgroups0100(void)
{
    gid_t list[NGROUPS_MAX];
    int size = getgroups(sizeof(list) / sizeof(list[0]), list);
    if (size < 0) {
        t_error("%s getgroups failed\n", __func__);
    }
}

/*
 * @tc.name      : Getgroups0200
 * @tc.desc      : test for invalid argument
 * @tc.level     : Level 0
 */
void Getgroups0200(void)
{
    gid_t list[NGROUPS_MAX];
    int size = getgroups(-1, list);
    if (size != -1) {
        t_error("%s getgroups should be failed\n", __func__);
    }
}

static int GetgroupsTestImpl(int argc, char* argv[])
{
    Getgroups0100();
    Getgroups0200();
    return T_STATUS;
}

int GetgroupsTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetgroupsTestImpl(1, libcArgvStub);
}
