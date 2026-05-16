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

#include <fcntl.h>
#include <mntent.h>
#include "functionalext.h"

const int SIZE = 10;

/**
 * @tc.name      : Hasmntopt0100
 * @tc.desc      : Verify hasmntopt process success
 * @tc.level     : Level 0
 */
void Hasmntopt0100(void)
{
    char* mntOpts = "test_hasmntopt";
    struct mntent ent {};
    ent.mnt_opts = mntOpts;
    char* ret = hasmntopt(&ent, "hasmntopt");
    EXPECT_STREQ("Hasmntopt0100", ret, "hasmntopt");
}

/**
 * @tc.name      : Hasmntopt0200
 * @tc.desc      : Verify hasmntopt process fail. Because opt not in mntOpts
 * @tc.level     : Level 2
 */
void Hasmntopt0200(void)
{
    char* mntOpts = "test_hasmntopt";
    struct mntent ent {};
    ent.mnt_opts = mntOpts;
    char* ret = hasmntopt(&ent, "0200");
    EXPECT_PTREQ("Hasmntopt0100", ret, nullptr);
}

static int HasmntoptTestImpl(void)
{
    Hasmntopt0100();
    Hasmntopt0200();
    return T_STATUS;
}

int HasmntoptTest(void)
{
    return HasmntoptTestImpl();
}
