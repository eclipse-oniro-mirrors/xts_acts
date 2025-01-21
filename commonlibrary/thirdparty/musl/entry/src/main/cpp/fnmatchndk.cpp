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

#include "napi/native_api.h"
#include <cstdlib>
#include <ctime>
#include <dlfcn.h>
#include <fnmatch.h>
#include <js_native_api_types.h>
#include <poll.h>
#include <pthread.h>
#include <semaphore.h>
#include <sys/resource.h>
#include <sys/sem.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/timerfd.h>
#include <sys/timex.h>
#include <sys/wait.h>
#include <threads.h>
#include <unistd.h>
#include <utime.h>

#define PARAM_5 5
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_UNNORMAL (-1)
#define PARAM_1999 1999
#define PARAM_12 12
#define PARAM_17 17
#define PARAM_06 06
#define PARAM_30 30
#define PARAM_23 23
#define PARAM_1900 1900
#define PARAM_02 02
#define PARAM_07 07
#define PARAM_16 16
#define PARAM_15 15
#define PARAM_20 20

static napi_value FnMatch(napi_env env, napi_callback_info info)
{
    char firstStr[] = ".txt";
    char secondStr[] = "test.txt";
    int num = FNM_NOESCAPE;
    int backParam = fnmatch(firstStr, secondStr, num);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __clock_gettime64(clockid_t, struct timespec *);
static napi_value clock_getTime64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1;
    struct timespec timeSpec {};
    returnParam = __clock_gettime64(CLOCK_REALTIME, &timeSpec);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" int __pthread_cond_timedwait_time64(pthread_cond_t *__restrict, pthread_mutex_t *__restrict,
                                               const struct timespec *__restrict);
static napi_value PThread_cond_timedWait_time64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1;
    pthread_cond_t pCond = PTHREAD_COND_INITIALIZER;
    pthread_mutex_t pMutex = PTHREAD_MUTEX_INITIALIZER;
    const struct timespec timeSpec {};
    returnParam = __pthread_cond_timedwait_time64(&pCond, &pMutex, &timeSpec);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" int __nanosleep_time64(const struct timespec *, struct timespec *);
static napi_value NanoSleep_time64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1;
    struct timespec timeSpec {
        PARAM_0, PARAM_0
    };
    timeSpec.tv_sec = PARAM_5;
    timeSpec.tv_nsec = PARAM_0;
    returnParam = __nanosleep_time64(&timeSpec, &timeSpec);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" int __fstat_time64(int, struct stat *);
static napi_value FStat_time64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1;
    int fileDescribe = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    struct stat stat {};
    returnParam = __fstat_time64(fileDescribe, &stat);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    close(fileDescribe);
    return result;
}

extern "C" int __lstat_time64(const char *__restrict, struct stat *__restrict);
static napi_value LStat_time64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1;
    const char *test = "/data/storage/el2/base/files/Fzl.txt";
    struct stat stat {};
    returnParam = __lstat_time64(test, &stat);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" int __stat_time64(const char *__restrict, struct stat *__restrict);
static napi_value Stat_time64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1;
    const char *firstParam = "/data/storage/el2/base/files/Fzl.txt";
    struct stat stat {};
    returnParam = __stat_time64(firstParam, &stat);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" int __utimensat_time64(int, const char *, const struct timespec[2], int);
static napi_value UTimeNsAt_time64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1, firstParam = PARAM_1, fourthParam = PARAM_1;
    const char *secondParam = nullptr;
    const struct timespec timeSpec[2]{};
    returnParam = __utimensat_time64(firstParam, secondParam, timeSpec, fourthParam);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" int __clock_getres_time64(clockid_t, struct timespec *);
static napi_value Clock_getRes_time64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1;
    clockid_t firstParam = PARAM_1;
    struct timespec secondParam {};
    returnParam = __clock_getres_time64(firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" int __clock_nanosleep_time64(clockid_t, int, const struct timespec *, struct timespec *);
static napi_value Clock_nanoSleep_time64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1, secondParam = PARAM_1;
    clockid_t firstParam = PARAM_1;
    const struct timespec thirdParam {};
    struct timespec fourthParam {};
    returnParam = __clock_nanosleep_time64(firstParam, secondParam, &thirdParam, &fourthParam);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" int __clock_settime64(clockid_t, const struct timespec *);
static napi_value Clock_setTime64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1;
    struct timespec firstParam {};
    clock_gettime(CLOCK_REALTIME, &firstParam);
    returnParam = __clock_settime64(CLOCK_REALTIME, &firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" int __cnd_timedwait_time64(cnd_t *__restrict, mtx_t *__restrict, const struct timespec *__restrict);
static napi_value Cnd_timedWait_time64(napi_env env, napi_callback_info info)
{
    int returnParam = PARAM_1;
    cnd_t firstParam;
    mtx_t secondParam;
    cnd_init(&firstParam);
    mtx_lock(&secondParam);
    struct timespec thirdParam {};
    returnParam = __cnd_timedwait_time64(&firstParam, &secondParam, &thirdParam);
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" char *__ctime64(const time_t *);
static napi_value CTime64(napi_env env, napi_callback_info info)
{
    char *checkParam = nullptr;
    int returnParam = PARAM_1;
    const time_t time = PARAM_0;
    checkParam = __ctime64(&time);
    if (checkParam != nullptr) {
        returnParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" char *__ctime64_r(const time_t *, char *);
static napi_value CTime64_r(napi_env env, napi_callback_info info)
{
    char *checkParam = nullptr;
    int returnParam = PARAM_1;
    const time_t time = PARAM_0;
    char secondParam[32];
    checkParam = __ctime64_r(&time, secondParam);
    if (checkParam != nullptr) {
        returnParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnParam, &result);
    return result;
}

extern "C" double __difftime64(time_t, time_t);
static napi_value DiffTime64(napi_env env, napi_callback_info info)
{
    double checkParam;
    int returnParam = PARAM_1;
    time_t now;
    struct tm newyear;
    time(&now);
    newyear = *localtime(&now);
    newyear.tm_hour = PARAM_0;
    newyear.tm_min = PARAM_0;
    newyear.tm_sec = PARAM_0;
    newyear.tm_mon = PARAM_0;
    newyear.tm_mday = PARAM_1;
    time_t firstTime = PARAM_1999 - PARAM_12 - PARAM_17 - PARAM_06 - PARAM_30 - PARAM_23;
    time_t secondTime = PARAM_1900 - PARAM_02 - PARAM_07 - PARAM_16 - PARAM_15 - PARAM_20;
    checkParam = __difftime64(firstTime, secondTime);
    if (checkParam) {
        returnParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_double(env, returnParam, &result);
    return result;
}

extern "C" void *__dlsym_time64(void *__restrict, const char *__restrict);
static napi_value DlSym_time64(napi_env env, napi_callback_info info)
{
    void *backInfo = nullptr;
    int backParam = PARAM_UNNORMAL;
    const char *path = "/system/lib/extensionability/libstatic_subscriber_extension_module.z.so";
    void *ptr = dlopen(path, RTLD_LAZY);
    backInfo = __dlsym_time64(ptr, "OHOS_EXTENSION_GetExtensionModule");
    if (backInfo != nullptr) {
        backParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    dlclose(ptr);
    return result;
}

extern "C" int __futimens_time64(int, const struct timespec[2]);
static napi_value FuTimeNs_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL, firstParam = PARAM_1;
    const struct timespec secondParam[2]{};
    backParam = __futimens_time64(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __futimes_time64(int, const struct timeval[2]);
static napi_value FuTimes_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL, firstParam = PARAM_1;
    const struct timeval secondParam[2]{};
    backParam = __futimes_time64(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __futimesat_time64(int, const char *, const struct timeval[2]);
static napi_value FuTimesAt_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL, firstParam = PARAM_1;
    const char *secondParam = nullptr;
    const struct timeval thirdParam[2]{};
    backParam = __futimesat_time64(firstParam, secondParam, thirdParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" struct tm *__gmtime64(const time_t *);
static napi_value GmTime64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    struct tm *checkParam{};
    const time_t firstParam = PARAM_0;
    checkParam = __gmtime64(&firstParam);
    if (checkParam != nullptr) {
        backParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" struct tm *__gmtime64_r(const time_t *__restrict, struct tm *__restrict);
static napi_value GmTime64_r(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    struct tm *checkParam{};
    const time_t firstParam = PARAM_0;
    struct tm secondParam {};
    checkParam = __gmtime64_r(&firstParam, &secondParam);
    if (checkParam != nullptr) {
        backParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" struct tm *__localtime64(const time_t *);
static napi_value Localtime64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    struct tm *checkParam{};
    const time_t firstParam = PARAM_0;
    checkParam = __localtime64(&firstParam);
    if (checkParam != nullptr) {
        backParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" struct tm *__localtime64_r(const time_t *__restrict, struct tm *__restrict);
static napi_value Localtime64_r(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    struct tm *checkParam{};
    const time_t firstParam = PARAM_0;
    struct tm secondParam {};
    checkParam = __localtime64_r(&firstParam, &secondParam);
    if (checkParam != nullptr) {
        backParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __lutimes_time64(const char *, const struct timeval[2]);
static napi_value LuTimes_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    const char *firstParam = nullptr;
    const struct timeval secondParam[2]{};
    backParam = __lutimes_time64(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" time_t __mktime64(struct tm *);
static napi_value MkTime64(napi_env env, napi_callback_info info)
{
    time_t checkParam = PARAM_UNNORMAL;
    int backParam = PARAM_1;
    struct tm firstParam {};
    checkParam = __mktime64(&firstParam);
    if (checkParam != PARAM_UNNORMAL) {
        backParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __mtx_timedlock_time64(mtx_t *__restrict, const struct timespec *__restrict);
static napi_value Mtx_timedLock_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    mtx_t firstParam;
    mtx_lock(&firstParam);
    struct timespec secondParam {};
    backParam = __mtx_timedlock_time64(&firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __ppoll_time64(struct pollfd *, nfds_t, const struct timespec *, const sigset_t *);
static napi_value PPoll_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    struct pollfd *firstParam{};
    nfds_t secondParam = PARAM_0;
    struct timespec thirdParam {};
    const sigset_t *fourthParam = nullptr;
    backParam = __ppoll_time64(firstParam, secondParam, &thirdParam, fourthParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __pthread_mutex_timedlock_time64(pthread_mutex_t *__restrict, const struct timespec *__restrict);
static napi_value PThread_mutex_timedLock_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    pthread_mutex_t firstParam = PTHREAD_MUTEX_INITIALIZER;
    struct timespec secondParam {};
    backParam = pthread_mutex_timedlock(&firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __pthread_rwlock_timedrdlock_time64(pthread_rwlock_t *__restrict, const struct timespec *__restrict);
static napi_value PThread_rwLock_timedrdLock_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    pthread_rwlock_t firstParam = PTHREAD_RWLOCK_INITIALIZER;
    struct timespec secondParam {};
    backParam = __pthread_rwlock_timedrdlock_time64(&firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __pthread_rwlock_timedwrlock_time64(pthread_rwlock_t *__restrict, const struct timespec *__restrict);
static napi_value PThread_rwLock_timedWrLock_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    pthread_rwlock_t firstParam = PTHREAD_RWLOCK_INITIALIZER;
    const struct timespec *secondParam{};
    backParam = __pthread_rwlock_timedwrlock_time64(&firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __recvmmsg_time64(int, struct mmsghdr *, unsigned int, unsigned int, struct timespec *);
static napi_value ReCvmMsg_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL, firstParam = PARAM_1;
    struct mmsghdr secondParam {};
    unsigned int thirdParam = PARAM_1, fourthParam = PARAM_1;
    struct timespec fifthParam {};
    backParam = __recvmmsg_time64(firstParam, &secondParam, thirdParam, fourthParam, &fifthParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __sched_rr_get_interval_time64(pid_t, struct timespec *);
static napi_value SchEd_rr_get_interval_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    pid_t firstParam = getpid();
    struct timespec secondParam {};
    backParam = __sched_rr_get_interval_time64(firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __select_time64(int, fd_set *__restrict, fd_set *__restrict, fd_set *__restrict,
                               struct timeval *__restrict);
static napi_value Select_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL, firstParam = PARAM_1;
    fd_set secondParam;
    fd_set thirdParam;
    fd_set fourthParam;
    struct timeval fifthParam {};
    backParam = __select_time64(firstParam, &secondParam, &thirdParam, &fourthParam, &fifthParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __sem_timedwait_time64(sem_t *__restrict, const struct timespec *__restrict);
static napi_value Sem_timedWait_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    sem_t firstParam;
    struct timespec secondParam {};
    backParam = __sem_timedwait_time64(&firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __semtimedop_time64(int, struct sembuf *, size_t, const struct timespec *);
static napi_value SemTimeDop_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL, firstParam = PARAM_UNNORMAL;
    struct sembuf secondParam {};
    size_t thirdParam = 256;
    struct timespec fourthParam {};
    backParam = __semtimedop_time64(firstParam, &secondParam, thirdParam, &fourthParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __settimeofday_time64(const struct timeval *, const struct timezone *);
static napi_value SetTimeOfDay_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    struct timeval firstParam {};
    struct timezone secondParam {};
    backParam = __settimeofday_time64(&firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __sigtimedwait_time64(const sigset_t *__restrict, siginfo_t *__restrict,
                                     const struct timespec *__restrict);
static napi_value SigTimedWait_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    const sigset_t firstParam{};
    siginfo_t secondParam;
    struct timespec thirdParam {};
    backParam = __sigtimedwait_time64(&firstParam, &secondParam, &thirdParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __thrd_sleep_time64(const struct timespec *, struct timespec *);
static napi_value THrd_sleep_time64(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_UNNORMAL;
    struct timespec firstParam {};
    struct timespec secondParam {};
    backParam = __thrd_sleep_time64(&firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" time_t __time64(time_t *);
static napi_value Time64(napi_env env, napi_callback_info info)
{
    time_t checkParam;
    int backParam = PARAM_1;
    time_t firstParam;
    checkParam = __time64(&firstParam);
    if (checkParam != PARAM_UNNORMAL) {
        backParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" time_t __timegm_time64(struct tm *);
static napi_value TimeGm_time64(napi_env env, napi_callback_info info)
{
    time_t checkParam = PARAM_0;
    int backParam = PARAM_1;
    struct tm firstParam {};
    backParam = __timegm_time64(&firstParam);
    if (checkParam != PARAM_UNNORMAL) {
        backParam = PARAM_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __timerfd_gettime64(int, struct itimerspec *);
static napi_value TimerFd_getTime64(napi_env env, napi_callback_info info)
{
    int backParam, firstParam = PARAM_1;
    struct itimerspec secondParam {};
    backParam = __timerfd_gettime64(firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __timerfd_settime64(int, int, const struct itimerspec *, struct itimerspec *);
static napi_value TimerFd_setTime64(napi_env env, napi_callback_info info)
{
    int backParam, firstParam = PARAM_1, secondParam = PARAM_1;
    struct itimerspec thirdParam {};
    struct itimerspec fourthParam {};
    backParam = __timerfd_settime64(firstParam, secondParam, &thirdParam, &fourthParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __timespec_get_time64(struct timespec *, int);
static napi_value TimerSpec_get_time64(napi_env env, napi_callback_info info)
{
    int backParam;
    struct timespec firstParam {};
    backParam = __timespec_get_time64(&firstParam, TIME_UTC);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __utime64(const char *, const struct utimbuf *);
static napi_value UTime64(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *firstParam = nullptr;
    struct utimbuf secondParam {};
    backParam = __utime64(firstParam, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __utimes_time64(const char *, const struct timeval[2]);
static napi_value UTimes_time64(napi_env env, napi_callback_info info)
{
    int backParam;
    const char *firstParam = nullptr;
    const struct timeval secondParam[2] = {};
    backParam = __utimes_time64(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" pid_t __wait4_time64(pid_t, int *, int, struct rusage *);
static napi_value Wait4_time64(napi_env env, napi_callback_info info)
{
    pid_t backParam, firstParam;
    int secondParam = PARAM_1;
    int thirdParam = PARAM_1;
    struct rusage fourthParam {};
    firstParam = getpid();
    backParam = __wait4_time64(firstParam, &secondParam, thirdParam, &fourthParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"fnmatch", nullptr, FnMatch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__clock_gettime64", nullptr, clock_getTime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__pthread_cond_timedwait_time64", nullptr, PThread_cond_timedWait_time64, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"__nanosleep_time64", nullptr, NanoSleep_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__fstat_time64", nullptr, FStat_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__lstat_time64", nullptr, LStat_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__stat_time64", nullptr, Stat_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__utimensat_time64", nullptr, UTimeNsAt_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__clock_getres_time64", nullptr, Clock_getRes_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__clock_nanosleep_time64", nullptr, Clock_nanoSleep_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__clock_settime64", nullptr, Clock_setTime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__cnd_timedwait_time64", nullptr, Cnd_timedWait_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__ctime64", nullptr, CTime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__ctime64_r", nullptr, CTime64_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__difftime64", nullptr, DiffTime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__dlsym_time64", nullptr, DlSym_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__futimens_time64", nullptr, FuTimeNs_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__futimes_time64", nullptr, FuTimes_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__futimesat_time64", nullptr, FuTimesAt_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__gmtime64", nullptr, GmTime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__gmtime64_r", nullptr, GmTime64_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__localtime64", nullptr, Localtime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__localtime64_r", nullptr, Localtime64_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__lutimes_time64", nullptr, LuTimes_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__mktime64", nullptr, MkTime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__mtx_timedlock_time64", nullptr, Mtx_timedLock_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__ppoll_time64", nullptr, PPoll_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__pthread_mutex_timedlock_time64", nullptr, PThread_mutex_timedLock_time64, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"__pthread_rwlock_timedrdlock_time64", nullptr, PThread_rwLock_timedrdLock_time64, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"__pthread_rwlock_timedwrlock_time64", nullptr, PThread_rwLock_timedWrLock_time64, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"__recvmmsg_time64", nullptr, ReCvmMsg_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__sched_rr_get_interval_time64", nullptr, SchEd_rr_get_interval_time64, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"__select_time64", nullptr, Select_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__sem_timedwait_time64", nullptr, Sem_timedWait_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__semtimedop_time64", nullptr, SemTimeDop_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__settimeofday_time64", nullptr, SetTimeOfDay_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__sigtimedwait_time64", nullptr, SigTimedWait_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__thrd_sleep_time64", nullptr, THrd_sleep_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__time64", nullptr, Time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__timegm_time64", nullptr, TimeGm_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__timerfd_gettime64", nullptr, TimerFd_getTime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__timerfd_settime64", nullptr, TimerFd_setTime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__timespec_get_time64", nullptr, TimerSpec_get_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__utime64", nullptr, UTime64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__utimes_time64", nullptr, UTimes_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__wait4_time64", nullptr, Wait4_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libfnmatchndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
