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

#include <cstdio>
#include "functionalext.h"

const int32_t PUTC_RET = 112;

/**
 * @tc.name      : Putchar0100
 * @tc.desc      : Verify putchar process success
 * @tc.level     : Level 0
 */
void Putchar0100(void)
{
    int32_t ret = putchar('p');
    EXPECT_EQ("Putchar0100", ret, PUTC_RET);
}

static int PutcharTestImpl(int argc, char* argv[])
{
    Putchar0100();
    return T_STATUS;
}

int PutcharTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return PutcharTestImpl(1, libcArgvStub);
}
