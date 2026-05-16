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

#include <arpa/inet.h>
#include <netdb.h>
#include "functionalext.h"

/**
 * @tc.name      : Gethostent0100
 * @tc.desc      : Able to get host information.
 * @tc.level     : Level 0
 */
void Gethostent0100(void)
{
    struct hostent* host = nullptr;
    sethostent(1);
    host = gethostent();
    EXPECT_EQ("Gethostent0100", host, 0);
    endhostent();
}

static int GethostentTestImpl(int argc, char* argv[])
{
    Gethostent0100();
    return T_STATUS;
}

int GethostentTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return GethostentTestImpl(1, libcArgvStub);
}
