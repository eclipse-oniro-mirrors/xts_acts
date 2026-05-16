/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cfenv>
#include <cfloat>
#include <cmath>
#include <cstdio>
#include "__flt_rounds_impl.h"
#include "test.h"

/**
 * @tc.name      : sendmmsg_0100
 * @tc.desc      : test FltRounds to get the floating point value mode
 * @tc.level     : Level 0
 */
void FltRounds0100(void)
{
    int result = FltRounds();
    if (result != 1) {
        t_error("%s FltRounds error get result is %d are not want 1\n", __func__, result);
    }
}

static int FltRoundsTestWithArgs(int argc, char* argv[])
{
    FltRounds0100();
    return T_STATUS;
}

int FltRoundsTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FltRoundsTestWithArgs(1, libcArgvStub);
}
