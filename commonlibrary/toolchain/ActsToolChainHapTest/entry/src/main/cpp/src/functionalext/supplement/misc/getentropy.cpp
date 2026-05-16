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

#include <unistd.h>
#include "functionalext.h"

/*
 * @tc.name      : Getentropy0100
 * @tc.desc      : Verify that secure random numbers can be generated
 * @tc.level     : Level 0
 */
void Getentropy0100(void)
{
    char buffer[256];
    int result = getentropy(buffer, 256);
    EXPECT_EQ("getentrcopy_0100", result, 0);
}

/*
 * @tc.name      : Getentropy0200
 * @tc.desc      : Validation cannot generate secure random numbers
 * @tc.level     : Level 2
 */
void Getentropy0200(void)
{
    errno = 0;
    int result = getentropy(nullptr, 1);
    EXPECT_EQ("getentrcopy_0200", result, -1);
    EXPECT_EQ("getentrcopy_0200", errno, EFAULT);
}

static int GetentropyTestImpl(int argc, char* argv[])
{
    Getentropy0100();
    Getentropy0200();
    return T_STATUS;
}

int GetentropyTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetentropyTestImpl(1, libcArgvStub);
}
