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

#include <cctype>
#include "functionalext.h"

namespace {
constexpr int K_ASCII_CODE_COUNT = 128;
constexpr int K_EXPECTED_PUNCT_IN_ASCII = 32;
} // namespace

/**
 * @tc.name      : Ispunct0100
 * @tc.desc      : Determine whether the input character is a punctuation mark or a special symbol.
 * @tc.level     : Level 0
 */
void Ispunct0100(void)
{
    int var1 = 44;
    int ret = ispunct(var1);
    EXPECT_NE("Ispunct0100", ret, 0);
}

/**
 * @tc.name      : Ispunct0200
 * @tc.desc      : Determine whether the input character is a punctuation mark or a special symbol.
 * @tc.level     : Level 0
 */
void Ispunct0200(void)
{
    int var1 = 64;
    int ret = ispunct(var1);
    EXPECT_NE("Ispunct0200", ret, 0);
}

/**
 * @tc.name      : Ispunct0300
 * @tc.desc      : Determine whether the input character is a punctuation mark or a special symbol.
 * @tc.level     : Level 0
 */
void Ispunct0300(void)
{
    int var1 = 94;
    int ret = ispunct(var1);
    EXPECT_NE("Ispunct0300", ret, 0);
}

/**
 * @tc.name      : Ispunct0400
 * @tc.desc      : Determine if the input character is not a punctuation mark or a special symbol.
 * @tc.level     : Level 2
 */
void Ispunct0400(void)
{
    int var1 = 65;
    int ret = ispunct(var1);
    EXPECT_EQ("Ispunct0400", ret, 0);
}

/**
 * @tc.name      : Ispunct0500
 * @tc.desc      : Determine the number of punctuation marks or special symbols in the ascii code table.
 * @tc.level     : Level 1
 */
void Ispunct0500(void)
{
    int cout = 0;
    for (int i = 0; i < K_ASCII_CODE_COUNT; i++) {
        if (ispunct(i)) {
            cout++;
        }
    }
    EXPECT_EQ("Ispunct0500", cout, K_EXPECTED_PUNCT_IN_ASCII);
}

static int IspunctTestImpl(int argc, char* argv[])
{
    Ispunct0100();
    Ispunct0200();
    Ispunct0300();
    Ispunct0400();
    Ispunct0500();
    return T_STATUS;
}

int IspunctTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return IspunctTestImpl(1, libcArgvStub);
}
