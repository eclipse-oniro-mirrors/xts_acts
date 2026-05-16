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
#include <cstdio>
#include <cwchar>
#include "test.h"

void RunWcscollCompare(wchar_t* l, wchar_t* r, char* funcName, int wantResult)
{
    int result = wcscoll(l, r);
    if (result != wantResult) {
        t_error("%s wcscoll error get result is %d not want result %d\n", funcName, result, wantResult);
    }
}

static int WcscollTestImpl(int argc, char* argv[])
{
    (void)setlocale(LC_COLLATE, "en_US.utf8");
    /**
     * @tc.name      : wcscoll_0100
     * @tc.desc      : Call wcscoll to compare the precedence of wide characters in the current locale
     * @tc.level     : Level 0
     */
    RunWcscollCompare(L"år", L"ängel", "wcscoll_0100", 1);
    return T_STATUS;
}

int WcscollTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return WcscollTestImpl(1, libcArgvStub);
}
