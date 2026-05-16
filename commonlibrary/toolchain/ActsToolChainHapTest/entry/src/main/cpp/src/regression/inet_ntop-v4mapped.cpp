/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// commit: 1cd417bdf10366d63cc875e285c6418709a58c17 2013-07-25
// inet_ntop should use ipv4 notation for v4mapped addresses
#include <arpa/inet.h>
#include <cstring>
#include "libc_test_shim.h"
int InetNtopV4mappedTest()
{
    int status = SUCCESS_CODE;

    char* expect = "::ffff:192.168.0.1";
    char buf[100];
    char addr[16];
    if (inet_pton(AF_INET6, expect, addr) == 1) {
        if (!inet_ntop(AF_INET6, addr, buf, sizeof buf)) {
            LibcTestError(&status, "inet_ntop failed\n");
        } else if (!strchr(buf, '.')) {
            LibcTestError(&status, "inet_ntop produced %s instead of %s\n", buf, expect);
        }
    } else {
        LibcTestError(&status, "inet_pton failed\n");
    }
    return status;
}
