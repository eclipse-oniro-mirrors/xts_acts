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
#include <ctime>
#include "functionalext.h"

const int32_t SIZE = 5;
const int32_t RANGE = 10;

/**
 * @tc.name      : Rand0100
 * @tc.desc      : Verify rand process success
 * @tc.level     : Level 0
 */
void Rand0100(void)
{
    const time_t seedTime = time(nullptr);
    srand(static_cast<unsigned int>(seedTime));
    int i = 0;
    for (; i < SIZE; ++i) {
        /* Exercises libc rand/srand; not used as a cryptographic RNG. */
        int num = rand() % RANGE;
        EXPECT_LT("Rand0100", num, RANGE);
    }
}

static int RandTestImpl(void)
{
    Rand0100();
    return T_STATUS;
}

int RandTest(void)
{
    return RandTestImpl();
}
