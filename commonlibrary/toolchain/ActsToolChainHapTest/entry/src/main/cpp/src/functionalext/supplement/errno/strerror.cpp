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
#include <cstring>
#include "functionalext.h"

/**
 * @tc.name      : Strerror0100
 * @tc.desc      : Verify strerror process success when param is EILSEQ
 * @tc.level     : Level 0
 */
void Strerror0100(void)
{
    char* ret = strerror(EILSEQ);
    EXPECT_STREQ("Strerror0100", ret, "Illegal byte sequence");
}

/**
 * @tc.name      : Strerror0200
 * @tc.desc      : Verify strerror process success when param is 0
 * @tc.level     : Level 0
 */
void Strerror0200(void)
{
    char* ret = strerror(0);
    EXPECT_STREQ("Strerror0200", ret, "No error information");
}

static int StrerrorTestImpl(void)
{
    Strerror0100();
    Strerror0200();
    return T_STATUS;
}

int StrerrorTest(void)
{
    return StrerrorTestImpl();
}
