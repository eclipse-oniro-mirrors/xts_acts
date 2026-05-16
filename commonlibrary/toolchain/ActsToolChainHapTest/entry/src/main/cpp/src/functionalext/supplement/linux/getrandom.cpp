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

#include <cstdlib>
#include "functionalext.h"
#include "sys/random.h"

#define GRND_NONBLOCK 0x0001

/**
 * @tc.name      : Getrandom0100
 * @tc.desc      : Verify getrandom process success
 * @tc.level     : Level 0
 */
void Getrandom0100(void)
{
    unsigned int tmp;

    int32_t ret = getrandom(&tmp, sizeof(unsigned int), GRND_NONBLOCK);
    EXPECT_NE("Getrandom0100", ret, -1);
}

static int GetrandomTestImpl(void)
{
    Getrandom0100();
    return T_STATUS;
}

int GetrandomTest(void)
{
    return GetrandomTestImpl();
}
