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
#include <ctime>
#include <unistd.h>
#include <dlfcn.h>
#include <cstdio>
#include <pthread.h>

#include "test.h"
#define SIGNUM 40
#define SLEEPTIME 5
static int g_count = 0;

static void Handler(int sig)
{
    g_count++;

    return;
}

/**
 * @tc.name      : TimerCreate0100
 * @tc.desc      : create a per-process timer
 * @tc.level     : Level 0
 */
void TimerCreate0100(void)
{
    struct sigevent sev;
    timer_t timerid;

    sev.sigev_notify = SIGEV_SIGNAL;
    sev.sigev_signo = SIGNUM;
    sev.sigev_value.sival_ptr = &timerid;

    (void)signal(SIGNUM, Handler);

    int result = timer_create(CLOCK_REALTIME, &sev, &timerid);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    struct itimerspec its;
    its.it_value.tv_sec = 1;
    its.it_value.tv_nsec = 0;
    its.it_interval.tv_sec = its.it_value.tv_sec;
    its.it_interval.tv_nsec = its.it_value.tv_nsec;

    result = timer_settime(timerid, 0, &its, nullptr);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    while (g_count <= 0) {
        sleep(1);
    }

    result = timer_delete(timerid);
    if (result != 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }
}

/**
 * @tc.name      : TimerCreate0200
 * @tc.desc      : create a per-process timer with invalid parameters
 * @tc.level     : Level 2
 */
void TimerCreate0200(void)
{
    errno = 0;
    int result = timer_create(-1, nullptr, nullptr);
    if (result == 0) {
        t_error("%s failed: result = %d\n", __func__, result);
    }

    if (errno != EINVAL) {
        t_error("%s failed: errno = %d\n", __func__, errno);
    }
}

void TimerHandler(union sigval sv)
{
    void *data = sv.sival_ptr;
    printf("timer_handler handler: %p \n", data);
    dlclose(data);
    printf("dlclose data \n");
}

/**
 * @tc.name      : TimerCreate0300
 * @tc.desc      : create a per-process timer with SIGEV_THREAD mode
 * @tc.level     : Level 2
 */
void TimerCreate0300(void)
{
    timer_t timerid;
    struct sigevent sev;
    struct itimerspec its;
    int ret;

    void* handle = dlopen("/data/storage/el1/bundle/libs/arm/libtls_timer.so", RTLD_LAZY);
    if (handle == nullptr) {
        t_error("%s dlopen error \n", __func__);
        return;
    }

    sev.sigev_notify = SIGEV_THREAD;
    sev.sigev_notify_function = TimerHandler;
    sev.sigev_notify_attributes = nullptr;
    sev.sigev_value.sival_ptr = handle;

    ret = timer_create(CLOCK_REALTIME, &sev, &timerid);
    if (ret == -1) {
        t_error("%s timer_create failed \n", __func__);
        return;
    }
    printf("timer_create succeed: %lu \n", reinterpret_cast<unsigned long>(timerid));

    its.it_value.tv_sec = 1;
    its.it_value.tv_nsec = 0;
    its.it_interval.tv_sec = 0;
    its.it_interval.tv_nsec = 0;

    ret = timer_settime(timerid, 0, &its, nullptr);
    if (ret == -1) {
        t_error("%s timer_settime failed \n", __func__);
        return;
    }

    for (int i = 0; i < SLEEPTIME; i++) {
        printf("main running waiting for callback: %d \n", i);
        sleep(1);
    }

    ret = timer_delete(timerid);
    if (ret == -1) {
        t_error("%s timer_delete failed \n", __func__);
        return;
    }
}

static int TimerCreateTestImpl(int argc, char *argv[])
{
    TimerCreate0100();
    TimerCreate0200();
    TimerCreate0300();

    return T_STATUS;
}

int TimerCreateTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return TimerCreateTestImpl(1, libcArgv);
}
