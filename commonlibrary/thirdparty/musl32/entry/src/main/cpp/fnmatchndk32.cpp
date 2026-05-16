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
#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <dlfcn.h>
#include <fcntl.h>
#include <fnmatch.h>
#include <js_native_api_types.h>
#include <netinet/in.h>
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
#include <securec.h>

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
#define SUCCESS 1
#define SIZE_64 64
#define SIZE_10 10
#define SEC_TIME 123840
#define FAIL (-1)
#define MPARAM_1 (-1)
#define TEST_SIZE 2
#define MICROSECONDS (1000000)
#define TEST_FILE "/data/storage/el2/base/files/test.txt"
#define PARAM_0777 0777
#define PATH "/data/storage/el2/base/files/utime64.txt"
#define TEST_FILE_NAME "test.txt"
#define TEST_FILE_PATH "/data/storage/el2/base/files/"
#define PARAM_0666 0666

static napi_value FnMatch(napi_env env, napi_callback_info info)
{
    char firstStr[] = "video_???_test.txt";
    char secondStr[] = "video_010_test.txt";
    int backParam = fnmatch(firstStr, secondStr, FNM_NOESCAPE);
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
    close(fileDescribe);
    napi_create_int32(env, returnParam, &result);
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
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int toCppResult = FAIL;
    size_t length = SIZE_64, stresult = PARAM_0;
    char path[SIZE_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[0], path, length, &stresult);
    int fileDescribe = open(path, O_CREAT);
    const long sec = SEC_TIME;
    struct timespec times[] = {{.tv_sec = PARAM_0}, {.tv_sec = sec}};
    int utimensatValue = __utimensat_time64(fileDescribe, path, times, PARAM_0);
    close(fileDescribe);
    struct stat statbuf = {PARAM_0};
    utimensatValue = stat(path, &statbuf);
    if (utimensatValue == PARAM_0 && statbuf.st_mtim.tv_sec == sec) {
        toCppResult = SUCCESS;
    }
    remove(path);
    napi_value result = nullptr;
    napi_create_int32(env, toCppResult, &result);
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
    const char *path = "/system/lib/extensionability/libstatic_subscriber_extension_module.z.so";
    void *ptr = dlopen(path, RTLD_LAZY);
    errno = PARAM_0;
    __dlsym_time64(ptr, "OHOS_EXTENSION_GetExtensionModule");
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

extern "C" int __futimens_time64(int, const struct timespec[2]);
static napi_value FuTimeNs_time64(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(PATH, O_CREAT);
    int ret = __futimens_time64(fileDescribe, ((struct timespec[2]){{.tv_nsec = UTIME_OMIT}, {.tv_nsec = UTIME_OMIT}}));
    napi_value result;
    napi_create_int32(env, ret, &result);
    close(fileDescribe);
    remove(PATH);
    return result;
}

extern "C" int __futimes_time64(int, const struct timeval[2]);
static napi_value FuTimes_time64(napi_env env, napi_callback_info info)
{
    struct stat s;
    static struct timeval tv[2];
    tv[0].tv_sec = s.st_atime;
    tv[0].tv_usec = PARAM_0;
    tv[1].tv_sec = s.st_mtime;
    tv[1].tv_usec = PARAM_0;
    int ret = MPARAM_1;
    int fileDescribe = open(TEST_FILE, O_RDWR | O_CREAT, PARAM_0777);
    if (fileDescribe != MPARAM_1) {
        ret = __futimes_time64(fileDescribe, tv);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    remove(TEST_FILE);
    return result;
}

extern "C" int __futimesat_time64(int, const char *, const struct timeval[2]);
static napi_value FuTimesAt_time64(napi_env env, napi_callback_info info)
{
    int dir_fd = open(TEST_FILE_PATH, O_RDONLY | O_DIRECTORY);
    int fileDescribe = openat(dir_fd, TEST_FILE_NAME, O_CREAT | O_RDWR | O_EXCL, PARAM_0666);
    const char *msg = "helloworld";
    write(fileDescribe, "msg", sizeof(msg));
    struct timeval tv[2];
    struct stat st;
    fstat(fileDescribe, &st);
    close(fileDescribe);
    tv[0].tv_sec = st.st_atime + PARAM_1;
    tv[0].tv_usec = PARAM_0;
    tv[1].tv_sec = st.st_mtime + PARAM_1;
    tv[1].tv_usec = PARAM_0;
    int ret = __futimesat_time64(dir_fd, TEST_FILE_NAME, tv);
    unlinkat(dir_fd, TEST_FILE_NAME, PARAM_0);
    close(dir_fd);
    remove(TEST_FILE);
    napi_value result;
    napi_create_int32(env, ret, &result);
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
    int ret;
    struct stat s;
    static struct timeval tv[TEST_SIZE] = {{0L, 0L}, {0L, 0L}};
    tv[0].tv_sec = s.st_atime;
    tv[0].tv_usec = PARAM_0;
    tv[1].tv_sec = s.st_mtime;
    tv[1].tv_usec = PARAM_0;
    int fd = open("/data/storage/el2/base/files/Fzl.txt", O_RDWR | O_CREAT, PARAM_0666);
    close(fd);
    ret = __lutimes_time64("/data/storage/el2/base/files/Fzl.txt", tv);
    napi_value result;
    if (ret == FAIL) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
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
    mtx_init(&firstParam, mtx_timed);
    struct timespec secondParam;
    secondParam.tv_sec = PARAM_02;
    secondParam.tv_nsec = PARAM_0;
    backParam = __mtx_timedlock_time64(&firstParam, &secondParam);
    mtx_unlock(&firstParam);
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
#define BUFSIZE 200
    int resultValue = FAIL;
    pid_t pid = fork();
    if (pid > PARAM_0) {
        struct mmsghdr msgs[SIZE_10];
        struct iovec iovecs[SIZE_10];
        char bufs[SIZE_10][BUFSIZE + PARAM_1];
        struct sockaddr_in addr;
        int sockfd = socket(AF_INET, SOCK_DGRAM, PARAM_0);
        addr.sin_family = AF_INET;
        addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
        addr.sin_port = htons(PARAM_1999);
        if (bind(sockfd, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&addr)), sizeof(addr)) ==
            FAIL) {
            resultValue = PARAM_30;
        } else {
            memset(msgs, PARAM_0, sizeof(msgs));
            for (int i = 0; i < SIZE_10; i++) {
                iovecs[i].iov_base = bufs[i];
                iovecs[i].iov_len = BUFSIZE;
                msgs[i].msg_hdr.msg_iov = &iovecs[i];
                msgs[i].msg_hdr.msg_iovlen = PARAM_1;
            }
            struct timespec timeout;
            timeout.tv_sec = PARAM_1;
            timeout.tv_nsec = PARAM_0;
            resultValue = __recvmmsg_time64(sockfd, msgs, SIZE_10, PARAM_0, &timeout);
        }
        close(sockfd);
    } else if (pid == PARAM_0) {
        sleep(PARAM_1);
        int sockfd;
        struct sockaddr_in addr;
        struct mmsghdr msg[PARAM_1];
        struct iovec msg1[PARAM_1];

        sockfd = socket(AF_INET, SOCK_DGRAM, PARAM_0);

        addr.sin_family = AF_INET;
        addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
        addr.sin_port = htons(PARAM_1999);
        connect(sockfd, reinterpret_cast<sockaddr *>(static_cast<struct sockaddr_in *>(&addr)), sizeof(addr));
        memset(msg1, PARAM_0, sizeof(msg1));
        memset(msg, PARAM_0, sizeof(msg));
        msg[PARAM_0].msg_hdr.msg_iov = msg1;
        msg[PARAM_0].msg_hdr.msg_iovlen = PARAM_1;

        sendmmsg(sockfd, msg, PARAM_1, PARAM_0);
        close(sockfd);
        _exit(PARAM_0);
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
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
    fd_set secondParam, thirdParam, fourthParam;
    FD_ZERO(&secondParam);
    FD_ZERO(&thirdParam);
    FD_ZERO(&fourthParam);
    struct timeval fifthParam;
    memset_s(&fifthParam, sizeof(fifthParam), 0, sizeof(fifthParam));
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
#define NANOSECOND (1000000000)
    int backParam = PARAM_1;
    int ret = PARAM_1;
    struct itimerspec its = {{PARAM_0, PARAM_0}, {PARAM_02, PARAM_0}};
    struct itimerspec val;
    int fd;
    fd = timerfd_create(CLOCK_REALTIME, PARAM_0);
    timerfd_settime(fd, PARAM_0, &its, nullptr);
    usleep(MICROSECONDS);
    ret = __timerfd_gettime64(fd, &val);
    if (ret == PARAM_0) {
        if (val.it_value.tv_nsec <= NANOSECOND) {
            backParam = PARAM_0;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

extern "C" int __timerfd_settime64(int, int, const struct itimerspec *, struct itimerspec *);
static napi_value TimerFd_setTime64(napi_env env, napi_callback_info info)
{
    struct itimerspec its = {{PARAM_0, PARAM_0}, {TEST_SIZE, PARAM_0}};
    struct itimerspec val;
    int fileDescribe, time_value;
    fileDescribe = timerfd_create(CLOCK_REALTIME, PARAM_0);
    time_value = __timerfd_settime64(fileDescribe, PARAM_0, &its, nullptr);
    time_value = usleep(MICROSECONDS);
    time_value = __timerfd_gettime64(fileDescribe, &val);
    napi_value result = nullptr;
    napi_create_int32(env, time_value, &result);
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
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    struct utimbuf ubuf;
    struct stat statinfo;
    int toCppResult = FAIL;
    size_t length = SIZE_64, stresult = PARAM_0;
    char strTemp[length];
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);
    int fileDescribe = open(strTemp, O_CREAT);
    close(fileDescribe);
    stat(strTemp, &statinfo);
    ubuf.modtime = PARAM_0;
    time(&ubuf.actime);
    if (__utime64(strTemp, &ubuf) == PARAM_0) {
        stat(strTemp, &statinfo);
        if (statinfo.st_mtim.tv_sec == PARAM_0) {
            toCppResult = PARAM_1;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, toCppResult, &result);
    return result;
}

extern "C" int __utimes_time64(const char *, const struct timeval[2]);
static napi_value UTimes_time64(napi_env env, napi_callback_info info)
{
    int fileDescribe = open(TEST_FILE, O_RDWR | O_RSYNC | O_CREAT);
    close(fileDescribe);
    struct timeval tv[2];
    memset_s(tv, sizeof(tv), 0, sizeof(tv));
    tv[0].tv_usec = PARAM_1;
    int ret = __utimes_time64(TEST_FILE, tv);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    remove(TEST_FILE);
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
