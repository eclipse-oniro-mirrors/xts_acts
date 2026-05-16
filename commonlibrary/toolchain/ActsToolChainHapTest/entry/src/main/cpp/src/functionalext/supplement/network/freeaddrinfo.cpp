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

#include <cstdio>
#include <netdb.h>
#include "functionalext.h"
#include "test.h"

/**
 * @tc.name      : Freeaddrinfo0100
 * @tc.desc      : Frees the memory that was allocated for the dynamically allocated linked list res
 * @tc.level     : Level 0
 */
void Freeaddrinfo0100(void)
{
    char* host = "127.0.0.1";
    struct addrinfo* ai;

    if (getaddrinfo(host, nullptr, nullptr, &ai) != 0) {
        t_error("%s getaddrinfo failed\n", __func__);
        return;
    }

    if (!ai->ai_flags) {
        EXPECT_TRUE(__FUNCTION__, true);
    } else {
        t_error("%s hint is nullptr, so ai->ai_flags should be 0, but now is %d\n", __func__, ai->ai_flags);
    }
    freeaddrinfo(ai);
}

static int FreeaddrinfoTestImpl(int argc, char* argv[])
{
    Freeaddrinfo0100();
    return T_STATUS;
}

int FreeaddrinfoTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return FreeaddrinfoTestImpl(1, libcArgvStub);
}
