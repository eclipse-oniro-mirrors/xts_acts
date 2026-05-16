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

#include <cstdlib>
#include "functionalext.h"

/**
 * @tc.name      : Labs0100
 * @tc.desc      : Get the absolute value of a long
 * @tc.level     : Level 0
 */
void Labs0100(void)
{
    long rev = labs(1);
    EXPECT_EQ("Labs0100", rev, 1);

    rev = labs(-1);
    EXPECT_EQ("Labs0100", rev, 1);
}

static int LabsTestImpl(void)
{
    Labs0100();
    return T_STATUS;
}

int LabsTest(void)
{
    return LabsTestImpl();
}
