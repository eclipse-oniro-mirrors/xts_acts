/**
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

#include <sys/auxv.h>
#include "functionalext.h"

/*
 * @tc.name      : Getauxval0100
 * @tc.desc      : Verify that the value can be retrieved from the auxiliary vector (parameter is AT_SECURE)
 * @tc.level     : Level 0
 */
void Getauxval0100(void)
{
    EXPECT_EQ("Getauxval0100", getauxval(AT_SECURE), 0);
}

/*
 * @tc.name      : Getauxval0200
 * @tc.desc      : Verify that the value can be retrieved from the auxiliary vector (parameter is AT_SYSINFO)
 * @tc.level     : Level 0
 */
void Getauxval0200(void)
{
    EXPECT_EQ("Getauxval0200", getauxval(AT_SYSINFO), 0);
}

/*
 * @tc.name      : Getauxval0300
 * @tc.desc      : Verify that the value can be retrieved from the auxiliary vector (parameter is AT_SYSINFO_EHDR)
 * @tc.level     : Level 0
 */
void Getauxval0300(void)
{
    EXPECT_TRUE("Getauxval0300", getauxval(AT_SYSINFO_EHDR) != 0);
}

static int GetauxvalTestImpl(int argc, char* argv[])
{
    Getauxval0100();
    Getauxval0200();
    Getauxval0300();
    return T_STATUS;
}

int GetauxvalTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetauxvalTestImpl(1, libcArgvStub);
}
