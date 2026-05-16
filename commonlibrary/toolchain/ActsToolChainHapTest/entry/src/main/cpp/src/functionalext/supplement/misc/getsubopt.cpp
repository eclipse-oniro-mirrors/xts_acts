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

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include "functionalext.h"

const int32_t BUF_SIZE = 1024;

/**
 * @tc.name      : Getsubopt0100
 * @tc.desc      : Verify getsubopt process success find subparam
 * @tc.level     : Level 0
 */
void Getsubopt0100(void)
{
    char* tokens[] = { "getsubopt", "test", nullptr };
    char buf[BUF_SIZE];
    (void)std::snprintf(buf, sizeof(buf), "%s", "getsubopt=0100,unknown");
    char* subopts = buf;
    char* value = nullptr;
    EXPECT_EQ("Getsubopt0100", 0, getsubopt(&subopts, tokens, &value));
    EXPECT_STREQ("Getsubopt0100", "0100", value);
}

/**
 * @tc.name      : Getsubopt0200
 * @tc.desc      : Verify getsubopt process fail not find subparam
 * @tc.level     : Level 2
 */
void Getsubopt0200(void)
{
    char* tokens[] = { "getsubopt", "test", nullptr };
    char buf[BUF_SIZE];
    (void)std::snprintf(buf, sizeof(buf), "%s", "0200=unknown, test");
    char* subopts = buf;
    char* value = nullptr;
    EXPECT_EQ("Getsubopt0100", -1, getsubopt(&subopts, tokens, &value));
}

static int GetsuboptTestImpl(void)
{
    Getsubopt0100();
    Getsubopt0200();
    return T_STATUS;
}

int GetsuboptTest(void)
{
    return GetsuboptTestImpl();
}
