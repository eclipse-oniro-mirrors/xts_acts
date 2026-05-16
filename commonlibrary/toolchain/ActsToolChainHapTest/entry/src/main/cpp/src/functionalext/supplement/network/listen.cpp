/**
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
#include <cstring>
#include <netinet/in.h>
#include <sys/socket.h>
#include <unistd.h>
#include "functionalext.h"

/**
 * @tc.name      : listen_0100
 * @tc.desc      : The parameters are valid and can listen for client connections.
 * @tc.level     : Level 0
 */
void Listen0100(void)
{
    int fd = -1;
    fd = socket(AF_INET, SOCK_STREAM, 0);
    EXPECT_NE("listen_0100", fd, -1);
    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    addr.sin_port = 0; // ephemeral port
    int bindRet = bind(fd, reinterpret_cast<struct sockaddr*>(&addr), sizeof(addr));
    EXPECT_EQ("listen_0100", bindRet, 0);
    int ret = listen(fd, 3);
    EXPECT_EQ("listen_0100", ret, 0);
    close(fd);
}

static int ListenTestImpl(int argc, char* argv[])
{
    Listen0100();

    return T_STATUS;
}

int ListenTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return ListenTestImpl(1, libcArgv);
}
