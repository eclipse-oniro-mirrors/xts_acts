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

#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <net/if.h>
#include "test.h"

/**
 * @tc.name      : IfIndextoname0100
 * @tc.desc      : Get network interface by index
 * @tc.level     : Level 0
 */
void IfIndextoname0100(void)
{
    int savedErrno = errno;
    char ifName[IFNAMSIZ] = { '\0' };
    unsigned int ifIndex = static_cast<unsigned int>(atoi("1"));

    char* name = if_indextoname(ifIndex, ifName);
    if (name == nullptr && errno == ENXIO) {
        t_error("%s if_indextoname get name is nullptr", __func__);
    }
}

static int IfIndextonameTestImpl(int argc, char* argv[])
{
    IfIndextoname0100();
    return T_STATUS;
}

int IfIndextonameTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return IfIndextonameTestImpl(1, libcArgvStub);
}
