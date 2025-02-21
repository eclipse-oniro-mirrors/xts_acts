/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include "common/napi_helper.cpp"
#include "common/native_common.h"
#include "napi/native_api.h"
#include <csignal>
#include <cstring>
#include <ctime>
#include <cerrno>
#include <malloc.h>
#include <net/if.h>
#include <sched.h>
#include <cstdlib>
#include <sys/time.h>
#include <sys/timex.h>
#include <unistd.h>
#include <utime.h>
#include <utmp.h>
#include <uv.h>

#define NANOSECONDS (1000000000)
#define TEST_FILE "/data/storage/el2/base/files/test.txt"
#define TEST_FILE_PATH "/data/storage/el2/base/files/"
#define TEST_FILE_NAME "test.txt"
#define PARAM_0 0
#define PARAM_1 1
#define MPARAM_1 (-1)
#define PARAM_3 3
#define PARAM_111 111
#define PARAM_777 777
#define PARAM_0666 0666
#define MPARAM_123 (-123)

extern "C" int __timer_gettime64(timer_t, struct itimerspec *);
extern "C" int __timer_settime64(timer_t, int, const struct itimerspec *__restrict, struct itimerspec *__restrict);
void TimerThread(union sigval v) {}

static napi_value Timer_getTime64_One(napi_env env, napi_callback_info info)
{
    timer_t timerid;
    struct sigevent evp;
    memset(&evp, PARAM_0, sizeof(struct sigevent));

    evp.sigev_value.sival_int = PARAM_111;
    evp.sigev_notify = SIGEV_THREAD;
    evp.sigev_notify_function = TimerThread;

    int ret = timer_create(CLOCK_REALTIME, &evp, &timerid);

    struct itimerspec it;
    it.it_interval.tv_sec = PARAM_1;
    it.it_interval.tv_nsec = PARAM_0;
    it.it_value.tv_sec = PARAM_3;
    it.it_value.tv_nsec = PARAM_0;
    ret = __timer_settime64(timerid, PARAM_0, &it, nullptr);

    struct itimerspec tmp;
    ret = __timer_gettime64(timerid, &tmp);
    NAPI_ASSERT(env, tmp.it_value.tv_sec < PARAM_1 || tmp.it_value.tv_nsec < NANOSECONDS,
                "Timer_getTime64_One--__timer_gettime64 failed");

    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);

    timer_delete(timerid);
    return result;
}

static napi_value Timer_getTime64_Two(napi_env env, napi_callback_info info)
{
    struct itimerspec tmp;
    int ret = __timer_gettime64(nullptr, &tmp);

    napi_value result = nullptr;
    napi_create_int32(env, ret != PARAM_1 && errno == EINVAL, &result);
    return result;
}

static napi_value Timer_setTime64_One(napi_env env, napi_callback_info info)
{
    timer_t timerid;
    struct sigevent evp;
    memset(&evp, PARAM_0, sizeof(struct sigevent));
    evp.sigev_value.sival_int = PARAM_111;
    evp.sigev_notify = SIGEV_THREAD;
    evp.sigev_notify_function = TimerThread;

    int ret = timer_create(CLOCK_REALTIME, &evp, &timerid);
    struct itimerspec it;
    it.it_interval.tv_sec = PARAM_1;
    it.it_interval.tv_nsec = PARAM_0;
    it.it_value.tv_sec = PARAM_3;
    it.it_value.tv_nsec = PARAM_0;
    ret = __timer_settime64(timerid, PARAM_0, &it, nullptr);

    struct itimerspec tmp;
    ret = __timer_gettime64(timerid, &tmp);
    NAPI_ASSERT(env, tmp.it_value.tv_sec < PARAM_1 || tmp.it_value.tv_nsec < NANOSECONDS,
                "Timer_setTime64_One--__timer_gettime64 failed");

    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);

    timer_delete(timerid);
    return result;
}

static napi_value Timer_setTime64_Two(napi_env env, napi_callback_info info)
{
    struct itimerspec it;
    it.it_interval.tv_sec = PARAM_1;
    it.it_interval.tv_nsec = PARAM_0;
    it.it_value.tv_sec = PARAM_3;
    it.it_value.tv_nsec = PARAM_0;
    int ret = __timer_settime64(nullptr, PARAM_0, &it, nullptr);

    napi_value result = nullptr;
    napi_create_int32(env, ret != PARAM_1 && errno == EINVAL, &result);
    return result;
}

static napi_value Futimes_One(napi_env env, napi_callback_info info)
{
    struct stat s;
    static struct timeval tv[2];
    tv[0].tv_sec = s.st_atime;
    tv[0].tv_usec = PARAM_0;
    tv[1].tv_sec = s.st_mtime;
    tv[1].tv_usec = PARAM_0;
    int ret = MPARAM_1;
    int fd = open(TEST_FILE, O_RDWR | O_CREAT, PARAM_777);
    if (fd != MPARAM_1) {
        ret = futimes(fd, tv);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    remove(TEST_FILE);
    return result;
}

static napi_value Futimes_Two(napi_env env, napi_callback_info info)
{
    static struct timeval tv[2];

    int fd = open(TEST_FILE, O_CREAT);
    int ret = futimes(fd, tv);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0 && errno == EINVAL, &result);
    remove(TEST_FILE);
    return result;
}

static napi_value Futimesat_One(napi_env env, napi_callback_info info)
{
    int dir_fd = open(TEST_FILE_PATH, O_RDONLY | O_DIRECTORY);
    int fd = openat(dir_fd, TEST_FILE_NAME, O_CREAT | O_RDWR | O_EXCL, PARAM_0666);
    const char *msg = "helloworld";
    write(fd, "msg", sizeof(msg));

    struct timeval tv[2];
    struct stat st;
    fstat(fd, &st);
    close(fd);

    tv[0].tv_sec = st.st_atime + PARAM_1;
    tv[0].tv_usec = PARAM_0;
    tv[1].tv_sec = st.st_mtime + PARAM_1;
    tv[1].tv_usec = PARAM_0;
    int ret = futimesat(dir_fd, TEST_FILE_NAME, tv);
    unlinkat(dir_fd, TEST_FILE_NAME, PARAM_0);
    close(dir_fd);
    remove(TEST_FILE);
    napi_value result;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Futimesat_Two(napi_env env, napi_callback_info info)
{
    int ret = futimesat(MPARAM_1, TEST_FILE_NAME, nullptr);
    napi_value result;
    napi_create_int32(env, ret == MPARAM_1 && errno == EBADF, &result);
    return result;
}

static napi_value TzName_One(napi_env env, napi_callback_info info)
{
    const char *handlerChar = "Asia/Shanghai";
    setenv("TZ", handlerChar, PARAM_1);
    tzset();
    const char *tzName = "CST";
    napi_value result = nullptr;
    napi_create_int32(env, strncmp(tzName, tzname[0], strlen(tzName)) == PARAM_0, &result);
    return result;
}

static napi_value TzName_Two(napi_env env, napi_callback_info info)
{
    setenv("TZ", "UTC+08:00:00", PARAM_1);
    tzset();
    const char *tzName = "UTC";
    napi_value result = nullptr;
    napi_create_int32(env, strncmp(tzName, tzname[0], strlen(tzName)) == PARAM_0, &result);
    return result;
}

static napi_value Utimes_One(napi_env env, napi_callback_info info)
{
    int fd = open(TEST_FILE, O_RDWR | O_RSYNC | O_CREAT);
    close(fd);
    struct stat st;
    struct timeval tv[2] = {{1, 0}, {1, 0}};
    int ret = utimes(TEST_FILE, tv);
    NAPI_ASSERT(env, ret == PARAM_0, "Utimes_One--utimes failed");
    fstat(fd, &st);
    NAPI_ASSERT(env, st.st_atime != tv[0].tv_sec && st.st_mtime != tv[1].tv_sec, "Utimes_One--utimes failed");
    remove(TEST_FILE);
    napi_value result = nullptr;
    napi_create_int32(env, ret == PARAM_0, &result);
    return result;
}

static napi_value Utimes_Two(napi_env env, napi_callback_info info)
{
    int fd = open(TEST_FILE, O_RDWR | O_RSYNC | O_CREAT);
    close(fd);

    struct timeval tv[2];
    tv[0].tv_usec = MPARAM_123;

    int ret = utimes(TEST_FILE, tv);

    napi_value result = nullptr;
    napi_create_int32(env, ret == MPARAM_1 && errno == EINVAL, &result);

    remove(TEST_FILE);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"Timer_getTime64_One", nullptr, Timer_getTime64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Timer_getTime64_Two", nullptr, Timer_getTime64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Timer_setTime64_One", nullptr, Timer_setTime64_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Timer_setTime64_Two", nullptr, Timer_setTime64_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Futimes_One", nullptr, Futimes_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Futimes_Two", nullptr, Futimes_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Futimesat_One", nullptr, Futimesat_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Futimesat_Two", nullptr, Futimesat_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TzName_One", nullptr, TzName_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TzName_Two", nullptr, TzName_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Utimes_One", nullptr, Utimes_One, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Utimes_Two", nullptr, Utimes_Two, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libtimendk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
