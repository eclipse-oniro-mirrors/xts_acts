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

#include <cmath>
#include <cstdlib>
#include "functionalext.h"

const float ARG_NUM1 = 2.4;
const float ARG_NUM2 = 3.9;
const float ARG_NUM3 = -2.4;
const float ARG_NUM4 = -3.9;

const int32_t RET_NUM1 = 2;
const int32_t RET_NUM2 = 4;
const int32_t RET_NUM3 = -2;
const int32_t RET_NUM4 = -4;

/**
 * @tc.name      : Rint0100
 * @tc.desc      : Verify rint process success and return 0 when param is 2.4
 * @tc.level     : Level 0
 */
void Rint0100(void)
{
    int32_t ret = rint(ARG_NUM1);
    EXPECT_EQ("Rint0100", ret, RET_NUM1);
}

/**
 * @tc.name      : Rint0200
 * @tc.desc      : Verify rint process success and return 0 when param is 3.9
 * @tc.level     : Level 0
 */
void Rint0200(void)
{
    int32_t ret = rint(ARG_NUM2);
    EXPECT_EQ("Rint0200", ret, RET_NUM2);
}

/**
 * @tc.name      : Rint0300
 * @tc.desc      : Verify rint process success and return 0 when param is -2.4
 * @tc.level     : Level 0
 */
void Rint0300(void)
{
    int32_t ret = rint(ARG_NUM3);
    EXPECT_EQ("Rint0300", ret, RET_NUM3);
}

/**
 * @tc.name      : Rint0400
 * @tc.desc      : Verify rint process success and return 0 when param is -3.9
 * @tc.level     : Level 0
 */
void Rint0400(void)
{
    int32_t ret = rint(ARG_NUM4);
    EXPECT_EQ("Rint0300", ret, RET_NUM4);
}

/**
 * @tc.name      : Rint0500
 * @tc.desc      : Verify rint process success and return 0 when param is 0
 * @tc.level     : Level 0
 */
void Rint0500(void)
{
    int32_t ret = rint(0);
    EXPECT_EQ("Rint0400", ret, 0);
}

static int RintExtTestImpl(void)
{
    Rint0100();
    Rint0200();
    Rint0300();
    Rint0400();
    Rint0500();
    return T_STATUS;
}

int RintExtTest(void)
{
    return RintExtTestImpl();
}
