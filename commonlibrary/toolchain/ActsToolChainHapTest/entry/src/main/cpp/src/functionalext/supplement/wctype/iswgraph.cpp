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

#include <clocale>
#include <cstdlib>
#include <cwchar>
#include <cwctype>
#include "functionalext.h"

const int COUNT = 94;
const int SIZE = 128;

/*
 * @tc.name      : Iswgraph0100
 * @tc.desc      : Verify iswgraph process success. When that the entered character is a letter (parameter is 'a'
 *                 has a graphical representation).
 * @tc.level     : Level 0
 */
void Iswgraph0100(void)
{
    wchar_t c = 'a';
    int ret = iswgraph(c);
    EXPECT_NE("Iswgraph0100", ret, 0);
}

/*
 * @tc.name      : Iswgraph0200
 * @tc.desc      : Verify iswgraph process success. When that the entered character is not a letter (parameter is '!'
 *                 has a graphical representation).
 * @tc.level     : Level 0
 */
void Iswgraph0200(void)
{
    wchar_t c = '!';
    int ret = iswgraph(c);
    EXPECT_NE("Iswgraph0200", ret, 0);
}

/*
 * @tc.name      : Iswgraph0300
 * @tc.desc      : Verify iswgraph process success. When that the entered character is not has a graphical
 * representation.
 * @tc.level     : Level 2
 */
void Iswgraph0300(void)
{
    wchar_t c = ' ';
    int ret = iswgraph(c);
    EXPECT_EQ("Iswgraph0300", ret, 0);
}

/**
 * @tc.name      : Iswgraph0400
 * @tc.desc      : Verify iswgraph process success. Determine the number of control characters in the ascii code table.
 * @tc.level     : Level 1
 */
void Iswgraph0400(void)
{
    locale_t mLocale = newlocale(LC_ALL_MASK, "en_US.UTF-8", nullptr);
    int total = 0;
    for (int i = 0; i < SIZE; i++) {
        int ret = iswgraph(static_cast<wchar_t>(i));
        if (ret) {
            total++;
        }
    }
    EXPECT_EQ("Iswgraph0400", total, COUNT);
    if (mLocale != nullptr) {
        freelocale(mLocale);
    }
}

static int IswgraphTestImpl(void)
{
    Iswgraph0100();
    Iswgraph0200();
    Iswgraph0300();
    Iswgraph0400();
    return T_STATUS;
}

int IswgraphTest(void)
{
    return IswgraphTestImpl();
}
