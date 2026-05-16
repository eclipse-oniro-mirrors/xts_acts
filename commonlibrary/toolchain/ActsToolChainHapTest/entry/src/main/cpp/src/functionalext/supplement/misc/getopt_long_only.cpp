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

#include <getopt.h>
#include "functionalext.h"

namespace {
constexpr int K_MINIMAL_ARGC_WITH_ONE_OPTION = 2;
} // namespace

const int32_t FAILED = -1;

/**
 * @tc.name      : GetoptLongOnly0100
 * @tc.desc      : Each parameter is valid, and the short option command is first parsed with the long parameter.
 * @tc.level     : Level 0
 */
void GetoptLongOnly0100(int a)
{
    EXPECT_NE("GetoptLongOnly0100", a, FAILED);
}

/**
 * @tc.name      : GetoptLongOnly0200
 * @tc.desc      : Invalid argument, command line parsing failed.
 * @tc.level     : Level 2
 */
void GetoptLongOnly0200(int b)
{
    EXPECT_EQ("GetoptLongOnly0200", b, FAILED);
}

static int GetoptLongOnlyTestImpl(int argc, char* argv[])
{
    argc = K_MINIMAL_ARGC_WITH_ONE_OPTION;
    argv[1] = "-n";
    char* const shortOptions = "nbl:";
    struct option longOptions[] = {
        { "name", 0, nullptr, 'n' },
        { "bf_name", 0, nullptr, 'b' },
        { "love", 1, nullptr, 'l' },
        { nullptr, 0, nullptr, 0 },
    };
    int c = getopt_long_only(argc, argv, shortOptions, longOptions, nullptr);
    GetoptLongOnly0100(c);
    c = getopt_long_only(0, nullptr, nullptr, nullptr, nullptr);
    GetoptLongOnly0200(c);

    return T_STATUS;
}

int GetoptLongOnlyTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GetoptLongOnlyTestImpl(1, libcArgvStub);
}
