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
#include <fcntl.h>
#include <grp.h>
#include "test.h"

/**
 * @tc.name      : Getgrnam0100
 * @tc.desc      : Verify that the specified group can be retrieved from the group file (parameter valid)
 * @tc.level     : Level 0
 */
void Getgrnam0100(void)
{
    errno = 0;
    const char* groupName = "root";
    gid_t gid = 0;

    struct group* grp = getgrnam(groupName);
    if (errno != 0) {
        t_error("%s failed, errno is %d\n", __func__, errno);
    }
    if (!grp) {
        t_error("%s getgrgid failed\n", __func__);
    }
    if (strcmp(groupName, grp->gr_name)) {
        t_error("%s failed, grp->gr_name is %s\n", __func__, grp->gr_name);
    }
    if (grp->gr_gid != gid) {
        t_error("%s failed, grp->gr_gid is %d\n", __func__, grp->gr_gid);
    }
    if (grp->gr_mem == nullptr) {
        t_error("%s failed, grp->gr_mem is nullptr\n", __func__);
    }
}

/**
 * @tc.name      : Getgrnam0200
 * @tc.desc      : Verify that the specified group cannot be retrieved from the group file
 *                 (the name parameter is invalid)
 * @tc.level     : Level 2
 */
void Getgrnam0200(void)
{
    struct group* result = getgrnam("invalid_name");
    if (result) {
        t_error("%s getgrnam should be failed\n", __func__);
    }
}

static int GetgrnamTestImpl(int argc, char* argv[])
{
    Getgrnam0100();
    Getgrnam0200();
    return T_STATUS;
}

int GetgrnamTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetgrnamTestImpl(1, libcArgvStub);
}
