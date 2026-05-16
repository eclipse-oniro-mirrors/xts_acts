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

#include <csignal>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <dlfcn.h>
#include <fcntl.h>
#include <sys/select.h>
#include <sys/time.h>
#include <unistd.h>
#include "functionalext.h"

using SelectTime64Func =
    int (*)(int, fd_set* __restrict, fd_set* __restrict, fd_set* __restrict, struct timeval* __restrict);
constexpr const char* SELECT_TIME64_SYMBOL = "__select_time64";
const int32_t COUNT_ZERO = 0;
const int32_t COUNT_FAILED = -1;
constexpr int32_t SELECT_TIMEOUT_SEC = 5;
constexpr int32_t SELECT_INVALID_TIMEOUT_SEC = -50;
constexpr int32_t SELECT_NFDS = 2;
constexpr int32_t SELECT_STDIN_FD = 0;
constexpr int32_t SELECT_STDOUT_FD = 1;

/**
 * @tc.name      : Select0100
 * @tc.desc      : Verify that the monitoring descriptor is successful (valid parameters)
 * @tc.level     : Level 0
 */
void Select0100(void)
{
    struct timeval timeout;
    timeout.tv_sec = SELECT_TIMEOUT_SEC;
    timeout.tv_usec = 0;
    fd_set readfds;
    fd_set writefds;
    FD_ZERO(&readfds);
    FD_ZERO(&writefds);
    FD_SET(SELECT_STDIN_FD, &readfds);
    FD_SET(SELECT_STDOUT_FD, &writefds);
    int result = select(SELECT_NFDS, &readfds, &writefds, nullptr, &timeout);
    EXPECT_TRUE("Select0100", result > 0);
}

/**
 * @tc.name      : Select0200
 * @tc.desc      : Failed to validate monitoring descriptor
 *                 (invalid parameter, microsecond invalid value in timeout structure)
 * @tc.level     : Level 2
 */
void Select0200(void)
{
    struct timeval timeout;
    timeout.tv_sec = SELECT_INVALID_TIMEOUT_SEC;
    fd_set readfds;
    fd_set writefds;
    FD_ZERO(&readfds);
    FD_ZERO(&writefds);
    FD_SET(SELECT_STDIN_FD, &readfds);
    FD_SET(SELECT_STDOUT_FD, &writefds);
    int result = select(SELECT_NFDS, &readfds, &writefds, nullptr, &timeout);
    EXPECT_EQ("Select0200", result, COUNT_FAILED);
}

/**
 * @tc.name      : Select0300
 * @tc.desc      : Validation monitoring descriptor failed
 *                 (invalid parameter, invalid parameter added to descriptor set)
 * @tc.level     : Level 1
 */
void Select0300(void)
{
    struct timeval timeout;
    timeout.tv_sec = 0;
    fd_set readfds;
    fd_set writefds;
    constexpr int32_t selectInvalidFd = 2;
    FD_ZERO(&readfds);
    FD_ZERO(&writefds);
    FD_SET(selectInvalidFd, &readfds);
    FD_SET(selectInvalidFd, &writefds);
    int result = select(SELECT_NFDS, &readfds, &writefds, nullptr, &timeout);
    EXPECT_EQ("Select0300", result, COUNT_ZERO);
}

/**
 * @tc.name      : SelectTime640100
 * @tc.desc      : Verify that the monitoring descriptor is successful (valid parameters)
 * @tc.level     : Level 0
 */
void SelectTime640100(void)
{
    SelectTime64Func selectTime64 = reinterpret_cast<SelectTime64Func>(dlsym(RTLD_DEFAULT, SELECT_TIME64_SYMBOL));
    if (selectTime64 == nullptr) {
        t_error("SelectTime640100 dlsym __select_time64 failed\n");
        return;
    }
    struct timeval timeout;
    timeout.tv_sec = SELECT_TIMEOUT_SEC;
    timeout.tv_usec = 0;
    fd_set readfds;
    fd_set writefds;
    FD_ZERO(&readfds);
    FD_ZERO(&writefds);
    FD_SET(SELECT_STDIN_FD, &readfds);
    FD_SET(SELECT_STDOUT_FD, &writefds);
    int result = selectTime64(SELECT_NFDS, &readfds, &writefds, nullptr, &timeout);
    EXPECT_TRUE("SelectTime640100", result > 0);
}

static int SelectTestImpl(void)
{
    Select0100();
    Select0200();
    Select0300();
    SelectTime640100();
    return T_STATUS;
}

int SelectTest(void)
{
    return SelectTestImpl();
}
