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
#include <cstdlib>
#include <cstring>
#include <sys/socket.h>
#include <unistd.h>
#include "test.h"

/**
 * @tc.name      : Socketpair0100
 * @tc.desc      : Use the socketpair function to create a pair of unnamed, interconnected sockets.
 * @tc.level     : Level 0
 */
void Socketpair0100(void)
{
    int fb[2];
    char buf[128] = { 0 };
    char* str = "mgn info is hello world";
    int result = socketpair(AF_UNIX, SOCK_STREAM, 0, fb);
    if (result == -1) {
        t_error("%s socketpair get result error is -1\n", __func__);
    }
    int size = write(fb[0], str, strlen(str));
    read(fb[1], buf, size);
    if (strcmp(buf, str) != 0) {
        t_error("%s socketpair get buf is %s are not %s\n", __func__, buf, str);
    }
}

/**
 * @tc.name      : Socketpair0200
 * @tc.desc      : Pass in AF_INET when testing the socketpair function call
 * @tc.level     : Level 2
 */
void Socketpair0200(void)
{
    int fb[2];
    int result = socketpair(AF_INET, SOCK_STREAM, 0, fb);
    if (result != -1) {
        t_error("%s socketpair get result error is %d not -1\n", __func__, result);
    }
}

/**
 * @tc.name      : Socketpair0300
 * @tc.desc      : test that the length of the array passed two
 * @tc.level     : Level 1
 */
void Socketpair0300(void)
{
    int fb[3];
    char buf[128] = { 0 };
    char* str = "mgn info is hello world";
    int result = socketpair(AF_UNIX, SOCK_STREAM, 0, fb);
    if (result == -1) {
        t_error("%s socketpair get result error is %d not -1\n", __func__, result);
    }
    int size = write(fb[0], str, strlen(str));
    read(fb[1], buf, size);
    if (strcmp(buf, str) != 0) {
        t_error("%s socketpair get buf is %s are not %s\n", __func__, buf, str);
    }
    (void)close(fb[0]);
    (void)close(fb[1]);
}

static int SocketpairTestImpl(int argc, char* argv[])
{
    Socketpair0100();
    Socketpair0200();
    Socketpair0300();
    return T_STATUS;
}

int SocketpairTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SocketpairTestImpl(1, libcArgvStub);
}
