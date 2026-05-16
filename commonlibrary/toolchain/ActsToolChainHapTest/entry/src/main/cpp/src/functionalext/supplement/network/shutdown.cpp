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

#include <arpa/inet.h>
#include <cstdio>
#include <cstring>
#include <netinet/in.h>
#include <sys/socket.h>
#include "test.h"

/**
 * @tc.name      : shutdown_0100
 * @tc.desc      : The test stops the socket transmission through the shutdown function
 * @tc.level     : Level 0
 */
void Shutdown0100(void)
{
    constexpr int testPort = 9898;
    constexpr int listenBacklog = 5;
    int sd = socket(AF_INET, SOCK_STREAM, 0);
    struct sockaddr_in serverAddr;
    bzero(&serverAddr, sizeof(serverAddr));
    serverAddr.sin_addr.s_addr = INADDR_ANY;
    serverAddr.sin_addr.s_addr = INADDR_ANY;
    serverAddr.sin_port = htons(testPort);
    serverAddr.sin_family = AF_INET;
    bind(sd, reinterpret_cast<struct sockaddr*>(&serverAddr), sizeof(serverAddr));
    listen(sd, listenBacklog);
    int result = shutdown(sd, 0);
    if (result != 0) {
        t_error("%s shutdown get result is %d are not 0", __func__, result);
    }
    close(sd);
}

static int ShutdownTestImpl(int argc, char* argv[])
{
    Shutdown0100();
    return T_STATUS;
}

int ShutdownTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return ShutdownTestImpl(1, libcArgv);
}
