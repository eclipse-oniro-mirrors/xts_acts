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

#include <grp.h>
#include "test.h"

/**
 * @tc.name      : Getgrent0100
 * @tc.desc      : Verify that account data can be retrieved from the group file
 * @tc.level     : Level 0
 */
void Getgrent0100(void)
{
    struct group* grp;
    setgrent();
    while ((grp = getgrent()) != nullptr) {
        if (grp->gr_name == nullptr) {
            t_error("%s grp->gr_name is nullptr\n", __func__);
        }

        if (grp->gr_mem == nullptr) {
            t_error("%s gr_mem is nullptr\n", __func__);
        }
    }
    endgrent();
}

static int GetgrentTestImpl(int argc, char* argv[])
{
    Getgrent0100();
    return T_STATUS;
}

int GetgrentTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetgrentTestImpl(1, libcArgvStub);
}
