/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cerrno>
#include <cstring>
#include <grp.h>
#include "test.h"

/**
 * @tc.name      : GetgrgidR0100
 * @tc.desc      : Query root group information by gid.
 * @tc.level     : Level 0
 */
void GetgrgidR0100(void)
{
    errno = 0;
    char buf[512];
    gid_t gid = 0;

    struct group* grp;
    struct group grpStorage;
    const char* groupName = "root";

    int result = getgrgid_r(gid, &grpStorage, buf, sizeof(buf), &grp);
    if (result != 0) {
        t_error("%s getgrgid_r failed\n", __func__);
    }
    if (errno != 0) {
        t_error("%s errno should be zero\n", __func__);
    }

    if (!grp) {
        t_error("%s failed, grp is nullptr\n", __func__);
    }
    if (strcmp(groupName, grp->gr_name)) {
        t_error("%s grp->gr_name is %s\n", __func__, grp->gr_name);
    }
    if (gid != grp->gr_gid) {
        t_error("%s gr_gid is %d\n", __func__, grp->gr_gid);
    }
    if (!grp->gr_mem) {
        t_error("%s grp->gr_mem is nullptr\n", __func__);
    }
}

/**
 * @tc.name      : GetgrgidR0200
 * @tc.desc      : Invalid parameter test
 * @tc.level     : Level 2
 */
void GetgrgidR0200(void)
{
    char buf[512];
    struct group* grp;
    struct group grpStorage;

    int result = getgrgid_r(-1, &grpStorage, buf, sizeof(buf), &grp);
    if (result) {
        t_error("%s getgrgid_r should be failed\n", __func__);
    }
}

static int GetgrgidRTestImpl(int argc, char* argv[])
{
    GetgrgidR0100();
    GetgrgidR0200();
    return T_STATUS;
}

int GetgrgidRTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetgrgidRTestImpl(1, libcArgvStub);
}
