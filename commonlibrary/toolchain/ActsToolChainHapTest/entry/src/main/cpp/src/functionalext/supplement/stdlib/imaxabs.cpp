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

#include <cinttypes>
#include "functionalext.h"

/**
 * @tc.name      : Imaxabs0100
 * @tc.desc      : Verify imaxabs process success when param is positive integer
 * @tc.level     : Level 0
 */
void Imaxabs0100(void)
{
    intmax_t posmaxT = 1024;
    intmax_t ret = imaxabs(posmaxT);
    EXPECT_EQ("Imaxabs0100", ret, posmaxT);
}

/**
 * @tc.name      : Imaxabs0200
 * @tc.desc      : Verify imaxabs process success when param is negative integer
 * @tc.level     : Level 0
 */
void Imaxabs0200(void)
{
    intmax_t posmaxT = 1024;
    intmax_t negmaxT = -1024;
    intmax_t ret = imaxabs(negmaxT);
    EXPECT_EQ("Imaxabs0200", ret, posmaxT);
}

static int ImaxabsTestImpl(void)
{
    Imaxabs0100();
    Imaxabs0200();
    return T_STATUS;
}

int ImaxabsTest(void)
{
    return ImaxabsTestImpl();
}
