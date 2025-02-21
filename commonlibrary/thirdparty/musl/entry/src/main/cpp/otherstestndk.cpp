/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain firstParam copy of the License at
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
#include <arpa/inet.h>
#include <cerrno>
#include <clocale>
#include <cmath>
#include <csignal>
#include <cstdio>
#include <cstring>
#include <dlfcn.h>
#include <fcntl.h>
#include <info/application_target_sdk_version.h>
#include <info/fatal_message.h>
#include <js_native_api_types.h>
#include <libgen.h>
#include <linux/quota.h>
#include <mntent.h>
#include <netdb.h>
#include <netinet/ether.h>
#include <pthread.h>
#include <regex.h>
#include <resolv.h>
#include <sched.h>
#include <sys/epoll.h>
#include <sys/eventfd.h>
#include <sys/file.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/xattr.h>
#include <syslog.h>
#include <threads.h>
#include <unistd.h>
#include <utmp.h>

#define NAMELEN 16
#define NSEC_PER_SEC 1000000000
#define NSEC_PER_100MS 100000000
#define NSEC_PER_MSEC 1000000
#define US_PER_S 1000000
#define MS_PER_S 1000
#define SLEEP_100_MS 100
#define DELAY_TIME_100_MS 100
#define SLEEP_50_MS 50
#define SLEEP_20_MS 20
#define MAXDNAME_A 1025
#define INIT (-1)
#define SUCCESS 0
#define NO_ERROR 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_5 5
#define PARAM_2 2
#define PARAM_32 32
#define PARAM_64 64
#define PARAM_10 10
#define PARAM_100 100
#define PARAM_256 256
#define PARAM_64 64
#define PARAM_1024 1024
#define PARAM_8192 8192
#define SPNUM 1
#define MINUSONE (-1)
#define MINUSTWO (-2)
#define FAILD (-1)
#define PARAM_UNNORMAL (-1)
#define SIZE_10 10
#define TEST_MODE 0666
#define BUF_SIZE (100)
#define PORT 2288
#ifndef tls_mod_off_t
#define tls_mod_off_t size_t
#endif

extern "C" mode_t __umask_chk(mode_t);
extern "C" int __fstatat_time64(int, const char *__restrict, struct stat *__restrict, int);
extern "C" ssize_t __sendto_chk(int, const void *, size_t, size_t, int, const struct sockaddr *, socklen_t);
extern "C" ssize_t __send_chk(int, const void *, size_t, size_t, int);
extern "C" ssize_t __recv_chk(int, void *, size_t, size_t, int);
extern "C" ssize_t __recvfrom_chk(int, void *, size_t, size_t, int, struct sockaddr *, socklen_t *);
extern "C" int __aeabi_atexit(void *obj, void (*func)(void *), void *d);
extern "C" locale_t __duplocale(locale_t old);
extern "C" int *__errno_location(void);
extern "C" int __flt_rounds(void);
extern "C" int __overflow(FILE *file, int _c);
extern "C" int __uflow(FILE *file);
extern "C" void *__tls_get_addr(tls_mod_off_t *a);
extern "C" void _pthread_cleanup_pop(struct __ptcb *, int a);
extern "C" void _pthread_cleanup_push(struct __ptcb *, void (*)(void *), void *);
extern "C" int delete_module(const char *a, unsigned b);
extern "C" int pivot_root(const char *a, const char *old);
extern "C" pid_t pthread_gettid_np(pthread_t t);
extern "C" uintptr_t __gnu_Unwind_Find_exidx(uintptr_t pc, int *pcount);

static napi_value DlaDdr(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    Dl_info *dlInfo = nullptr;
    errno = SUCCESS;
    const char *path = "/system/lib/extensionability/libstatic_subscriber_extension_module.z.so";
    void *ptr = dlopen(path, RTLD_LAZY);
    backParam = dladdr(ptr, dlInfo);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DlOpen(napi_env env, napi_callback_info info)
{
    errno = SUCCESS;
    const char path[] = "/system/lib/extensionability/libstatic_subscriber_extension_module.z.so";
    int backParam = PARAM_0;
    void *ptr = dlopen(path, RTLD_LAZY);
    backParam = dlclose(ptr);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DlClose(napi_env env, napi_callback_info info)
{
    const char path[] = "/system/lib/extensionability/libstatic_subscriber_extension_module.z.so";
    int backParam = PARAM_0;
    void *ptr = dlopen(path, RTLD_LAZY);
    backParam = dlclose(ptr);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DlError(napi_env env, napi_callback_info info)
{
    char *errorInfo = nullptr;
    int backParam = INIT;
    const char path[] = "/system/lib/extensionability/libstatic_subscriber_extension_modu_le.z.so";
    dlopen(path, RTLD_NOW);
    errorInfo = dlerror();
    if (errorInfo != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value CloseLog(napi_env env, napi_callback_info info)
{
    int backResult = SUCCESS;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    openlog(path, LOG_PID, LOG_USER);
    syslog(LOG_DEBUG, path);
    closelog();
    napi_value result = nullptr;
    napi_create_int32(env, backResult, &result);
    return result;
}

static napi_value DirName(napi_env env, napi_callback_info info)
{
    char *backParam = nullptr;
    const char pathname[] = "/data/storage/el2/base/files/Fzl.txt";
    int flags = O_CREAT;
    mode_t mode = S_IRWXU;
    open(pathname, flags, mode);
    char path[] = "/data/storage/el2/base/files/Fzl.txt";
    backParam = dirname(path);
    napi_value result = nullptr;
    napi_create_string_utf8(env, backParam, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value Flock(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    int firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT), secondParam = LOCK_UN;
    backParam = flock(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Dn_comp(napi_env env, napi_callback_info info)
{
    int backParam = FAILD;
    const char domain[] = "www.baidu.com";
    unsigned char buff[MAXDNAME_A] = {0};
    unsigned char **firstChar = nullptr, **secondChar = nullptr;
    backParam = dn_comp(domain, buff, MAXDNAME_A, firstChar, secondChar);
    if (backParam > PARAM_0) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Dn_skipname(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    const unsigned char str[] = {0, 2, 3, 4};
    backParam = dn_skipname(&str[0], &str[1]);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value DRem(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double backParam, firstParam, secondParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_get_value_double(env, args[1], &secondParam);
    backParam = drem(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_double(env, backParam, &result);
    return result;
}

static napi_value DRemF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    double backParam, firstParam, secondParam;
    napi_get_value_double(env, args[0], &firstParam);
    napi_get_value_double(env, args[1], &secondParam);
    backParam = dremf(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_double(env, backParam, &result);
    return result;
}

static napi_value Finite(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam = PARAM_0;
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    backParam = finite(firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FiniteF(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int backParam = PARAM_0;
    double firstParam;
    napi_get_value_double(env, args[0], &firstParam);
    backParam = finitef(firstParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EndMntEnt(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    const char *path = "/data/storage/el2/base/files/Fzl.txt";
    const char *mode = "r";
    FILE *stream = fopen(path, mode);
    backParam = endmntent(stream);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}
const int STACK_SIZE = PARAM_1024 * PARAM_8192;
void *test(void *p) { return nullptr; }
static napi_value Clone(napi_env env, napi_callback_info info)
{
    void *stack = malloc(STACK_SIZE);
    int backParam =
        clone((int (*)(void *))test, static_cast<char *>(stack )+ STACK_SIZE, CLONE_VM | CLONE_FS | CLONE_FILES, nullptr);
    if (backParam > PARAM_0) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EndUTent(napi_env env, napi_callback_info info)
{
    errno = INIT;
    endutent();
    napi_value result = nullptr;
    errno = SUCCESS;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Epoll_create(napi_env env, napi_callback_info info)
{
    int fileDescribe = open("/data/storage/el2/base/files/FZL.txt", O_CREAT);
    int backParam = PARAM_0;
    backParam = epoll_create(fileDescribe);
    if (backParam > PARAM_0) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Epoll_create1(napi_env env, napi_callback_info info)
{
    int fileDescribe = open("/data/storage/el2/base/files/FZL.txt", O_CREAT);
    int backParam = PARAM_0;
    backParam = epoll_create1(fileDescribe);
    if (backParam > PARAM_0) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Epoll_ctl(napi_env env, napi_callback_info info)
{
    int fileDescribe = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    int backParam = PARAM_0, secondParam = SPNUM, size = SPNUM;
    struct epoll_event *event = nullptr;
    backParam = epoll_ctl(fileDescribe, secondParam, size, event);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Epoll_PWait(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, size = SPNUM, mode = SPNUM,
        fileDescribe = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    struct epoll_event *secondParam = nullptr;
    const sigset_t *sigset = nullptr;
    backParam = epoll_pwait(fileDescribe, secondParam, size, mode, sigset);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Epoll_Wait(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, size = SPNUM, mode = SPNUM,
        fileDescribe = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    struct epoll_event *secondParam = nullptr;
    backParam = epoll_wait(fileDescribe, secondParam, size, mode);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Ether_aTon(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    struct ether_addr *checkParam = nullptr;
    const char firstParam[1][18] = {"5F:4E:2C:3D:1B:0A"};
    checkParam = ether_aton(firstParam[0]);
    if (checkParam != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Ether_nToa_r(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    struct ether_addr addr[sizeof(ether_addr)];
    char firstParam[1][18] = {"5F:4E:2C:3D:1B:0A"};
    ether_aton_r(firstParam[0], addr);
    char *back = ether_ntoa_r(addr, firstParam[0]);
    if (back != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Ether_nToa(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    const struct ether_addr *firstParam = nullptr;
    const char testParam[1][18] = {"5F:4E:2C:3D:1B:0A"};
    firstParam = ether_aton(testParam[0]);
    char *back = ether_ntoa(firstParam);
    if (back != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value Ether_aTon_r(napi_env env, napi_callback_info info)
{
    int backParam = INIT;
    struct ether_addr *addr = (ether_addr *)malloc(sizeof(ether_addr));
    struct ether_addr *checkParam = nullptr;
    const char firstParam[1][18] = {"5F:4E:2C:3D:1B:0A"};
    checkParam = ether_aton_r(firstParam[0], addr);
    if (checkParam != nullptr) {
        backParam = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EventFd(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, secondParam = FD_CLOEXEC;
    unsigned int firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    backParam = eventfd(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EventFd_read(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    eventfd_t *secondParam = nullptr;
    backParam = eventfd_read(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value EventFd_write(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0, firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    eventfd_t secondParam = EFD_CLOEXEC;
    backParam = eventfd_write(firstParam, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value FGetXAttr(napi_env env, napi_callback_info info)
{
    ssize_t size_t = PARAM_0;
    ssize_t len = PARAM_64;
    int firstParam = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT);
    const char *secondParam = "/data/storage/el2/base/files";
    void *value = nullptr;
    size_t = fgetxattr(firstParam, secondParam, value, len);
    napi_value result = nullptr;
    napi_create_int32(env, size_t, &result);
    return result;
}

static napi_value UMask_chk(napi_env env, napi_callback_info info)
{
    errno = INIT;
    mode_t checkParam ;
    mode_t mode = S_IRUSR;
    checkParam = __umask_chk(mode);
    if (checkParam != MINUSONE) {
        errno = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value FStatAt_time64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_256;
    size_t strResult = PARAM_0;
    char ptr[length];
    napi_get_value_string_utf8(env, args[0], ptr, length, &strResult);
    int backParam = PARAM_UNNORMAL;
    struct stat st;
    int fd = open(ptr, O_RDWR | O_CREAT, TEST_MODE);
    lseek(fd, PARAM_0, SEEK_SET);
    backParam = __fstatat_time64(AT_FDCWD, ptr, &st, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value SendTo_chk(napi_env env, napi_callback_info info)
{
    int sendRet = SUCCESS;
    int pid = fork();
    if (pid == PARAM_0) {
        char sendBuf[] = "it is a test";
        sendRet = __sendto_chk(PARAM_0, sendBuf, sizeof(sendBuf), sizeof(sendBuf), PARAM_0, nullptr, PARAM_0);
        exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, sendRet, &result);
    return result;
}

static napi_value Send_chk(napi_env env, napi_callback_info info)
{
    int sendRet = SUCCESS;
    int pid = fork();
    if (pid == PARAM_0) {
        char sendBuf[] = "x";
        __send_chk(PARAM_0, sendBuf, sizeof(sendBuf), sizeof(sendBuf), PARAM_0);
        exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, sendRet, &result);
    return result;
}
static napi_value RecV_chk(napi_env env, napi_callback_info info)
{
    int sendRet = SUCCESS;
    int pid = fork();
    if (pid == PARAM_0) {
        size_t data_len = atoi("11");
        char buf[SIZE_10];
        sendRet = __recv_chk(PARAM_0, buf, data_len, data_len, PARAM_0);
        exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, sendRet, &result);
    return result;
}

static napi_value RecVFrom_chk(napi_env env, napi_callback_info info)
{
    int sendRet = SUCCESS;
    int pid = fork();
    if (pid == PARAM_0) {
        size_t data_len = atoi("11");
        char buf[SIZE_10];
        sendRet = __recvfrom_chk(PARAM_0, buf, data_len, data_len, PARAM_0, nullptr, nullptr);
        exit(PARAM_0);
    }
    napi_value result = nullptr;
    napi_create_int32(env, sendRet, &result);
    return result;
}

int do_plain_tests(int (*fn1)(void *arg), void *arg1, int (*fn2)(void *arg), void *arg2)
{
    int ret = PARAM_0;
    int pid = PARAM_0;
    pid = fork();
    if (pid == FAILD) {
        return FAILD;
    }
    if (pid == PARAM_0) {
        _exit(fn1(arg1));
    }
    if (fn2) {
        ret = fn2(arg2);
    }
    return ret;
}
int cndwaittest(void *testarg)
{
    mtx_t mutex;
    cnd_t cond;
    cnd_init(&cond);
    mtx_lock(&mutex);
    int backParam = cnd_wait(&cond, &mutex);
    mtx_unlock(&mutex);
    cnd_destroy(&cond);
    mtx_destroy(&mutex);
    return backParam;
}

static napi_value CndWait(napi_env env, napi_callback_info info)
{
    void *test = nullptr;
    do_plain_tests(cndwaittest, test, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value Duplocale(napi_env env, napi_callback_info info)
{
    locale_t newLocale = __duplocale(LC_GLOBAL_LOCALE);
    int backResult = PARAM_UNNORMAL;
    if (newLocale != nullptr) {
        backResult = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backResult, &result);
    return result;
}

static napi_value Errnolocation(napi_env env, napi_callback_info info)
{
    int errno_lo = *__errno_location();
    int backResult = FAILD;
    if (errno_lo >= PARAM_0) {
        backResult = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backResult, &result);
    return result;
}
static napi_value Fltrounds(napi_env env, napi_callback_info info)
{
    int backResult = __flt_rounds();
    napi_value result = nullptr;
    napi_create_int32(env, backResult, &result);
    return result;
}

static napi_value Herrnolocation(napi_env env, napi_callback_info info)
{
    int backInfo = FAILD;
    int *backResult = __h_errno_location();
    backInfo = *backResult;
    if (backInfo >= PARAM_0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Libccurrentsigrtmax(napi_env env, napi_callback_info info)
{
    int sigrtmax = __libc_current_sigrtmax();
    int backInfo = FAILD;
    if (sigrtmax > PARAM_0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Libccurrentsigrtmin(napi_env env, napi_callback_info info)
{
    int sigrtmin = __libc_current_sigrtmin();
    int backInfo = FAILD;
    if (sigrtmin > PARAM_0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Overflow(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_256;
    size_t strResult = PARAM_0;
    char ptr[length];
    napi_get_value_string_utf8(env, args[0], ptr, length, &strResult);
    FILE *files = fopen(ptr, "w");
    int backInfo = __overflow(files, PARAM_0);
    fclose(files);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Uflow(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_256;
    size_t strResult = PARAM_0;
    char ptr[length];
    napi_get_value_string_utf8(env, args[0], ptr, length, &strResult);
    FILE *files = fopen(ptr, "w");
    __overflow(files, PARAM_0);
    int backInfo = __uflow(files);
    fclose(files);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Tlsgetaddr(napi_env env, napi_callback_info infoS)
{
    errno = NO_ERROR;
    pid_t pid = fork();
    if (pid == PARAM_0) {
        __tls_get_addr((tls_mod_off_t[]){});
    }
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Pthreadcleanuppop(napi_env env, napi_callback_info info)
{
    errno = NO_ERROR;
    struct __ptcb cb;
    _pthread_cleanup_push(&cb, nullptr, nullptr);
    _pthread_cleanup_pop(&cb, PARAM_0);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Pthreadcleanuppush(napi_env env, napi_callback_info info)
{
    struct __ptcb cb;
    errno = NO_ERROR;
    _pthread_cleanup_push(&cb, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

void *ThreadTaskClient(void *arg)
{
    const char *gLocalHost = "127.0.0.1";
    int *ret = static_cast<int*>(malloc(sizeof(int)));
    int rets = FAILD;
    int sListen = socket(AF_INET, SOCK_STREAM, PARAM_0);
    if (sListen == PARAM_UNNORMAL) {
        *ret = FAILD;
    }
    int flag = PARAM_1;
    rets = setsockopt(sListen, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int));
    if (rets != PARAM_0) {
        printf("[server] setsockopt fail, rets: %d!\n", rets);
    }
    struct sockaddr_in srvAddr = {0};
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(gLocalHost);
    srvAddr.sin_port = htons(PORT);
    rets = bind(sListen, (struct sockaddr *)&srvAddr, sizeof(srvAddr));
    if (rets != PARAM_0) {
        close(sListen);
        *ret = FAILD;
        return ret;
    }
    rets = listen(sListen, PARAM_2);
    if (rets != PARAM_0) {
        close(sListen);
        *ret = FAILD;
        return ret;
    }
    int sClient = MINUSONE;
    sClient = accept(sListen, nullptr, nullptr);
    ret = &sClient;
    close(sClient);
    close(sListen);
    return ret;
}

static napi_value Accept(napi_env env, napi_callback_info info)
{
    pthread_t srv;
    int ret = pthread_create(&srv, nullptr, ThreadTaskClient, nullptr);
    pthread_join(srv, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

void *ServerTaskOne(void *arg)
{
    const char *gLocalHost = "127.0.0.1";
    int *ret = static_cast<int*>(malloc(sizeof(int)));
    int rets = MINUSONE;
    int sListen = socket(AF_INET, SOCK_STREAM, PARAM_0);
    if (sListen == MINUSONE) {
        *ret = MINUSONE;
        return ret;
    }
    int flag = PARAM_1;
    rets = setsockopt(sListen, SOL_SOCKET, SO_REUSEADDR, &flag, sizeof(int));
    if (rets != PARAM_0) {
        printf("[server] setsockopt fail, rets: %d!\n", rets);
    }
    struct sockaddr_in srvAddr = {0};
    srvAddr.sin_family = AF_INET;
    srvAddr.sin_addr.s_addr = inet_addr(gLocalHost);
    srvAddr.sin_port = htons(PORT);
    rets = bind(sListen, (struct sockaddr *)&srvAddr, sizeof(srvAddr));
    if (rets != PARAM_0) {
        close(sListen);
        *ret = MINUSONE;
        return ret;
    }
    rets = listen(sListen, PARAM_2);
    if (rets != PARAM_0) {
        close(sListen);
        *ret = MINUSONE;
        return ret;
    }
    struct sockaddr_in clnAddr = {0};
    socklen_t clnAddrLen = sizeof(clnAddr);
    int sClient = -PARAM_1;
    sClient = accept4(sListen, (struct sockaddr *)&clnAddr, &clnAddrLen, PARAM_0);
    ret = &sClient;
    close(sClient);
    close(sListen);
    return ret;
}

static napi_value Accept4(napi_env env, napi_callback_info info)
{
    pthread_t srv;
    int ret = pthread_create(&srv, nullptr, ServerTaskOne, nullptr);
    pthread_join(srv, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Deletemodule(napi_env env, napi_callback_info info)
{
    int backInfo = SUCCESS;
    errno = NO_ERROR;
    pid_t pid = fork();
    if (pid == NO_ERROR) {
        const char *put_old = "0";
        delete_module(put_old, PARAM_5);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}
static napi_value Pivotroot(napi_env env, napi_callback_info info)
{
    int backInfo = SUCCESS;
    errno = NO_ERROR;
    pid_t pid = fork();
    if (pid == NO_ERROR) {
        const char *put_old = nullptr;
        const char *newRoot = nullptr;
        backInfo = pivot_root(newRoot, put_old);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Quickexit(napi_env env, napi_callback_info info)
{
    errno = NO_ERROR;
    pid_t pid = fork();
    if (pid == NO_ERROR) {
        sleep(PARAM_1);
        quick_exit(EXIT_SUCCESS);
    } else if (pid > NO_ERROR) {
    } else {
        exit(EXIT_FAILURE);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Optresets(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, optreset, &result);
    return result;
}
void *pthread_test(void *arg)
{
    *((pid_t *)arg) = gettid();
    return nullptr;
}
static napi_value Pthreadgettidnp(napi_env env, napi_callback_info info)
{
    pid_t tid;
    pthread_t t;
    int backInfo = FAILD;
    pthread_create(&t, nullptr, pthread_test, &tid);
    pid_t recv_result = pthread_gettid_np(t);
    if (recv_result > NO_ERROR) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Getfatalmessage(napi_env env, napi_callback_info info)
{
    int backInfo = SUCCESS;
    const char msg[1024] = {"abcdefghijklmnopqrstuvwxyz1234567890"};
    const char msg1[1024] = {"abcdefghijklmnopqr"};
    fatal_msg_t *fatal_message = nullptr;

    int pidChild = PARAM_0;

    pid_t fpid = fork();
    if (fpid == pidChild) {
        pidChild = getpid();
        set_fatal_message(msg);
        fatal_message = get_fatal_message();
        if (fatal_message == nullptr) {
            backInfo = FAILD;
        }
        set_fatal_message(msg1);
        fatal_message = get_fatal_message();
        if (fatal_message == nullptr) {
            backInfo = FAILD;
        }
        exit(pidChild);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Pthreadcondclockwait(napi_env env, napi_callback_info info)
{
    pthread_condattr_t a;
    (pthread_condattr_init(&a), PARAM_0);
    pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    struct timespec ts = {0};
    clockid_t clock_id = CLOCK_REALTIME;
    int clockwait = pthread_cond_clockwait(&cond, &mutex, clock_id, &ts);
    int backInfo = FAILD;
    if (clockwait > NO_ERROR) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Pthreadcondtimedwaitmonotonicnp(napi_env env, napi_callback_info info)
{
    pthread_cond_t *cond = (pthread_cond_t *)nullptr;
    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    struct timespec ts = {0};
    int pthread = pthread_cond_timedwait_monotonic_np(cond, &mutex, &ts);
    int backInfo = FAILD;
    if (pthread > NO_ERROR) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Pthreadcondtimeoutnp(napi_env env, napi_callback_info info)
{
    unsigned int ms = PARAM_100;
    pthread_condattr_t a;
    pthread_condattr_init(&a);
    pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    pthread_cond_init(&cond, &a);
    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    int pthread = pthread_cond_timeout_np(&cond, &mutex, ms);
    pthread_mutex_unlock(&mutex);
    pthread_cond_destroy(&cond);
    pthread_mutex_destroy(&mutex);
    int backInfo = FAILD;
    if (pthread > PARAM_0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Pthreadgetnamenp(napi_env env, napi_callback_info info)
{
    char thread_name[NAMELEN];
    int pthread = pthread_getname_np(pthread_self(), thread_name, NAMELEN - PARAM_1);
    int backInfo = FAILD;
    if (pthread > PARAM_0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static inline void Msleep(int msec) { usleep(msec * MS_PER_S); }
static inline void GetDelayedTimeByClockid(struct timespec *ts, unsigned int ms, clockid_t clockid)
{
    const unsigned int nsecPerSec = NSEC_PER_SEC;
    unsigned int setTimeNs = ms * US_PER_S;
    struct timespec tsNow = {0};
    clock_gettime(clockid, &tsNow);
    ts->tv_sec = tsNow.tv_sec + (tsNow.tv_nsec + setTimeNs) / nsecPerSec;
    ts->tv_nsec = (tsNow.tv_nsec + setTimeNs) % nsecPerSec;
}
static void *PthreadLockTimeoutNPNoOut(void *arg)
{
    pthread_mutex_t *mtx = (pthread_mutex_t *)arg;
    unsigned ms = DELAY_TIME_100_MS;
    struct timespec ts = {0};

    Msleep(SLEEP_20_MS);
    GetDelayedTimeByClockid(&ts, ms, CLOCK_MONOTONIC);
    pthread_mutex_lock_timeout_np(mtx, ms);
    return arg;
}
static napi_value Pthreadmutexlocktimeoutnp(napi_env env, napi_callback_info info)
{
    errno = NO_ERROR;
    pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
    pthread_t tid;
    pthread_create(&tid, nullptr, PthreadLockTimeoutNPNoOut, (void *)&mtx);

    pthread_mutex_lock(&mtx);
    Msleep(SLEEP_50_MS);
    pthread_mutex_unlock(&mtx);

    pthread_join(tid, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}
static inline int GetTimeDiff(struct timespec ts1, struct timespec ts2)
{
    const unsigned int nsecPerSec = NSEC_PER_SEC;
    int ms = (ts1.tv_sec - ts2.tv_sec) * nsecPerSec + (ts1.tv_nsec - ts2.tv_nsec);
    ms = ms / NSEC_PER_MSEC;
    return ms;
}
static void *PthreadTimedlockMonotonicNPOut(void *arg)
{
    pthread_mutex_t *mtx = (pthread_mutex_t *)arg;
    struct timespec ts = {0};
    struct timespec tsNow = {0};

    Msleep(SLEEP_20_MS);
    GetDelayedTimeByClockid(&ts, DELAY_TIME_100_MS, CLOCK_MONOTONIC);
    pthread_mutex_timedlock_monotonic_np(mtx, &ts);

    clock_gettime(CLOCK_MONOTONIC, &tsNow);
    GetTimeDiff(tsNow, ts); // calculate time different

    return arg;
}
static napi_value Pthreadmutextimedlockmonotonicnp(napi_env env, napi_callback_info info)
{
    errno = NO_ERROR;
    pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
    pthread_t tid;
    pthread_create(&tid, nullptr, PthreadTimedlockMonotonicNPOut, (void *)&mtx);

    pthread_mutex_lock(&mtx);
    Msleep(SLEEP_50_MS);
    Msleep(SLEEP_100_MS);
    pthread_mutex_unlock(&mtx);

    pthread_join(tid, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}
static void *PthreadClocklockNoOutRealTime(void *arg)
{
    pthread_mutex_t *mtx = (pthread_mutex_t *)arg;
    struct timespec ts = {0};

    Msleep(SLEEP_20_MS);
    GetDelayedTimeByClockid(&ts, DELAY_TIME_100_MS, CLOCK_REALTIME);
    pthread_mutex_clocklock(mtx, CLOCK_REALTIME, &ts);
    return arg;
}
static napi_value Pthreadmutexclocklock(napi_env env, napi_callback_info info)
{
    errno = NO_ERROR;
    pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
    pthread_t tid;
    pthread_create(&tid, nullptr, PthreadClocklockNoOutRealTime, (void *)&mtx);

    pthread_mutex_lock(&mtx);
    Msleep(SLEEP_50_MS);
    pthread_mutex_unlock(&mtx);

    pthread_join(tid, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}
pthread_rwlock_t g_rwlock1;

static void *PthreadClockRdlockNoOutRealTimeW1(void *arg)
{
    pthread_rwlock_wrlock(&g_rwlock1);
    Msleep(SLEEP_50_MS);
    pthread_rwlock_unlock(&g_rwlock1);
    return arg;
}

static void *PthreadClockRdlockNoOutRealTimeR2(void *arg)
{
    struct timespec ts = {0};
    Msleep(SLEEP_20_MS);
    GetDelayedTimeByClockid(&ts, DELAY_TIME_100_MS, CLOCK_REALTIME);
    pthread_rwlock_clockrdlock(&g_rwlock1, CLOCK_REALTIME, &ts);
    pthread_rwlock_unlock(&g_rwlock1);
    return arg;
}
static napi_value Pthreadrwlockclockrdlock(napi_env env, napi_callback_info info)
{
    errno = NO_ERROR;
    pthread_t tid[2];
    pthread_rwlock_init(&g_rwlock1, nullptr);

    pthread_create(&tid[0], nullptr, PthreadClockRdlockNoOutRealTimeW1, nullptr);
    pthread_create(&tid[1], nullptr, PthreadClockRdlockNoOutRealTimeR2, nullptr);

    pthread_join(tid[0], nullptr);
    pthread_join(tid[1], nullptr);
    pthread_rwlock_destroy(&g_rwlock1);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Pthreadrwlockclockwrlock(napi_env env, napi_callback_info info)
{
    pthread_rwlock_t w;
    struct timespec ts = {0};
    clockid_t clock_id = CLOCK_REALTIME;
    clock_gettime(CLOCK_REALTIME, &ts);
    pthread_rwlock_init(&w, nullptr);
    pthread_rwlock_wrlock(&w);
    GetDelayedTimeByClockid(&ts, SLEEP_100_MS, clock_id);
    int pthread = pthread_rwlock_clockwrlock(&w, clock_id, &ts);
    pthread_rwlock_unlock(&w);
    pthread_rwlock_destroy(&w);
    int backInfo = FAILD;
    if (pthread > PARAM_0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}
pthread_rwlock_t g_rwlock5;
static void *PthreadTimedRdlockMonoNPNoOutW1(void *arg)
{
    pthread_rwlock_wrlock(&g_rwlock5);
    Msleep(SLEEP_50_MS);
    pthread_rwlock_unlock(&g_rwlock5);
    return arg;
}

static void *PthreadTimedRdlockMonoNPNoOutR2(void *arg)
{
    struct timespec ts = {0};
    Msleep(SLEEP_20_MS);
    GetDelayedTimeByClockid(&ts, DELAY_TIME_100_MS, CLOCK_MONOTONIC);
    pthread_rwlock_timedrdlock_monotonic_np(&g_rwlock5, &ts);
    pthread_rwlock_unlock(&g_rwlock5);
    return arg;
}
static napi_value Pthreadrwlocktimedrdlockmonotonicnp(napi_env env, napi_callback_info info)
{
    errno = NO_ERROR;
    pthread_t tid[2];
    pthread_rwlock_init(&g_rwlock5, nullptr);

    pthread_create(&tid[0], nullptr, PthreadTimedRdlockMonoNPNoOutW1, nullptr);
    pthread_create(&tid[1], nullptr, PthreadTimedRdlockMonoNPNoOutR2, nullptr);

    pthread_join(tid[0], nullptr);
    pthread_join(tid[1], nullptr);
    pthread_rwlock_destroy(&g_rwlock5);
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Pthreadrwlocktimedwrlockmonotonicnp(napi_env env, napi_callback_info info)
{
    struct timespec ts = {0};
    int pthread = pthread_rwlock_timedwrlock_monotonic_np((pthread_rwlock_t *)nullptr, &ts);
    int backInfo = FAILD;
    if (pthread > PARAM_0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Setapplicationtargetsdkversion(napi_env env, napi_callback_info info)
{
    set_application_target_sdk_version(PARAM_0);
    int pthread = get_application_target_sdk_version();
    int backInfo = FAILD;
    if (pthread > SUCCESS) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}
static napi_value Setfatalmessage(napi_env env, napi_callback_info info)
{
    errno = NO_ERROR;
    const char msg[1024] = {"abcdefghijklmnopqrstuvwxyz1234567890"};
    const char msg1[1024] = {"abcdefghijklmnopqr"};
    fatal_msg_t *fatal_message = nullptr;
    int pidChild = PARAM_0;
    pid_t fpid = fork();
    if (fpid < NO_ERROR) {
    } else if (fpid == NO_ERROR) {
        pidChild = getpid();
        set_fatal_message(msg);
        fatal_message = get_fatal_message();
        strcmp(fatal_message->msg, msg);

        set_fatal_message(msg1);
        fatal_message = get_fatal_message();
        strcmp(fatal_message->msg, msg);

        exit(pidChild);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}

void exitFunc(void *arg){};
static napi_value Aeabiatexit(napi_env env, napi_callback_info info)
{
    int32_t var = PARAM_0;
    int backInfo = __aeabi_atexit(&var, exitFunc, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Gnuunwindfindexidx(napi_env env, napi_callback_info info)
{
    uintptr_t pc = PARAM_10;
    int32_t pcount = PARAM_32;
    int32_t backInfo = __gnu_Unwind_Find_exidx(pc, &pcount);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}
static napi_value Ctypegetmbcurmax(napi_env env, napi_callback_info info)
{
    int rev = __ctype_get_mb_cur_max();
    if (rev >= PARAM_0) {
        rev = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, rev, &result);
    return result;
}

void PSyslog(char *format, ...)
{
    va_list ap;
    va_start(ap, format);
    vsyslog(LOG_INFO, format, ap);
    va_end(ap);
}

static napi_value Vsyslog(napi_env env, napi_callback_info info)
{
    errno = PARAM_0;
    openlog("main", LOG_PID, PARAM_0);
    int a = PARAM_10;
    char msg[1024] = {"test is %d\n"};
    PSyslog(msg, a);
    closelog();
    napi_value result = nullptr;
    napi_create_int32(env, errno, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"dn_comp", nullptr, Dn_comp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dn_skipname", nullptr, Dn_skipname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"drem", nullptr, DRem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dremf", nullptr, DRemF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finite", nullptr, Finite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finitef", nullptr, FiniteF, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endmntent", nullptr, EndMntEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clone", nullptr, Clone, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endutent", nullptr, EndUTent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_create", nullptr, Epoll_create, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_create1", nullptr, Epoll_create1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_ctl", nullptr, Epoll_ctl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_pwait", nullptr, Epoll_PWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"epoll_wait", nullptr, Epoll_Wait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ether_aton", nullptr, Ether_aTon, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ether_aton_r", nullptr, Ether_aTon_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ether_ntoa", nullptr, Ether_nToa, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ether_ntoa_r", nullptr, Ether_nToa_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventfd", nullptr, EventFd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventfd_read", nullptr, EventFd_read, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eventfd_write", nullptr, EventFd_write, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fgetxattr", nullptr, FGetXAttr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dirname", nullptr, DirName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"closelog", nullptr, CloseLog, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dlopen", nullptr, DlOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dlclose", nullptr, DlClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dlerror", nullptr, DlError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dladdr", nullptr, DlaDdr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"flock", nullptr, Flock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__fstatat_time64", nullptr, FStatAt_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__umask_chk", nullptr, UMask_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__recv_chk", nullptr, RecV_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__recvfrom_chk", nullptr, RecVFrom_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__send_chk", nullptr, Send_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"__sendto_chk", nullptr, SendTo_chk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cndWait", nullptr, CndWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ctypegetmbcurmax", nullptr, Ctypegetmbcurmax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"duplocale", nullptr, Duplocale, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"errnolocation", nullptr, Errnolocation, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"fltrounds", nullptr, Fltrounds, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"herrnolocation", nullptr, Herrnolocation, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"libccurrentsigrtmax", nullptr, Libccurrentsigrtmax, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"libccurrentsigrtmin", nullptr, Libccurrentsigrtmin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"overflow", nullptr, Overflow, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tlsgetaddr", nullptr, Tlsgetaddr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"uflow", nullptr, Uflow, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadcleanuppop", nullptr, Pthreadcleanuppop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadcleanuppush", nullptr, Pthreadcleanuppush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"accept", nullptr, Accept, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"accept4", nullptr, Accept4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"delete_module", nullptr, Deletemodule, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pivotroot", nullptr, Pivotroot, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadgettidnp", nullptr, Pthreadgettidnp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"quickexit", nullptr, Quickexit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"optreset", nullptr, Optresets, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getfatalmessage", nullptr, Getfatalmessage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadcondclockwait", nullptr, Pthreadcondclockwait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadcondtimedwaitmonotonicnp", nullptr, Pthreadcondtimedwaitmonotonicnp, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadcondtimeoutnp", nullptr, Pthreadcondtimeoutnp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadgetnamenp", nullptr, Pthreadgetnamenp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadmutexlocktimeoutnp", nullptr, Pthreadmutexlocktimeoutnp, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pthreadmutextimedlockmonotonicnp", nullptr, Pthreadmutextimedlockmonotonicnp, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadmutexclocklock", nullptr, Pthreadmutexclocklock, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pthreadrwlockclockrdlock", nullptr, Pthreadrwlockclockrdlock, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pthreadrwlockclockwrlock", nullptr, Pthreadrwlockclockwrlock, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"pthreadrwlocktimedrdlockmonotonicnp", nullptr, Pthreadrwlocktimedrdlockmonotonicnp, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"pthreadrwlocktimedwrlockmonotonicnp", nullptr, Pthreadrwlocktimedwrlockmonotonicnp, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"setapplicationtargetsdkversion", nullptr, Setapplicationtargetsdkversion, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"setfatalmessage", nullptr, Setfatalmessage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiatexit", nullptr, Aeabiatexit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gnuunwindfindexidx", nullptr, Gnuunwindfindexidx, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"vsyslog", nullptr, Vsyslog, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "libotherstestndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
