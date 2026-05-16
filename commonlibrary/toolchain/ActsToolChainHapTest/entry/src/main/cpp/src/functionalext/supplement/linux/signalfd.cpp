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
#include <csignal>
#include <sys/signalfd.h>

#include "test.h"

const int SIG = SIGALRM;

/**
 * @tc.name      : Signalfd0100
 * @tc.desc      : create a file descriptor for accepting signals
 * @tc.level     : Level 0
 */
void Signalfd0100(void)
{
    sigset_t mask = {};

    int result = sigaddset(&mask, SIG);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    result = sigprocmask(SIG_SETMASK, &mask, nullptr);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    errno = 0;
    int fd = signalfd(-1, &mask, SFD_CLOEXEC);
    if (fd <= 0) {
        t_error("%s failed: fd = %d\n", __func__, fd);
    }

    if (errno != 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }

    (void)raise(SIG);

    struct signalfd_siginfo sfdSi = { 0 };
    ssize_t size = read(fd, &sfdSi, sizeof(sfdSi));
    if (size <= 0) {
        t_error("%s failed: size = %ld\n", __func__, size);
    }

    if (sfdSi.ssi_signo != SIG) {
        t_error("%s failed: sfdSi.ssi_signo = %d\n", __func__, sfdSi.ssi_signo);
    }

    close(fd);
}

/**
 * @tc.name      : Signalfd0200
 * @tc.desc      : create a file descriptor for accepting signals with invalid parameters
 * @tc.level     : Level 2
 */
void Signalfd0200(void)
{
    errno = 0;
    int fd = signalfd(-1, nullptr, -1);
    if (fd > 0) {
        t_error("%s failed: fd = %d\n", __func__, fd);
    }

    if (errno == 0) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }
}

static int SignalfdTestImpl(int argc, char* argv[])
{
    Signalfd0100();
    Signalfd0200();

    return T_STATUS;
}

int SignalfdTest(void)
{
    static char libcProgStub[] = "libc_test";
    char* libcArgvStub[] = { libcProgStub, nullptr };
    return SignalfdTestImpl(1, libcArgvStub);
}
