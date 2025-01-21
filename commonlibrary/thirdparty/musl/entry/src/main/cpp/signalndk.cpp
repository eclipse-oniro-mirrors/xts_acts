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

#include <csignal>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <node_api.h>
#include <pthread.h>
#include <sys/signalfd.h>
#include <unistd.h>
#include <ctime>
#include <atomic>
#include <sys/time.h>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_100 100
#define PARAM_6000 6000
#define PARAM_99999 99999
#define FAIL (-1)
#define NO_ERR 0
#define STRLENGTH 64
#define SUCCESS 1
#define ONE 1
#define SFD_CLOEXEC O_CLOEXEC
#define ONEVAL 1
#define MINUSONE (-1)
#define MINUSTWO (-2)
#define THRVAL 3
#define ERRON_0 0
#define SLEEP_10_MS 10

typedef void *(Func)(void *);
struct Sig {
    int flag;
    int param;
};
struct SigString {
    int flag;
    char param[STRLENGTH];
};
static int intInput(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int expect;
    napi_get_value_int32(env, args[0], &expect);
    return expect;
}

static void structInput(napi_env env, napi_callback_info info, struct Sig *siginfo)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &(siginfo->flag));
    napi_get_value_int32(env, args[1], &(siginfo->param));
}

static void structStringInput(napi_env env, napi_callback_info info, struct SigString *siginfo)
{
    size_t argc = PARAM_2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_int32(env, args[0], &(siginfo->flag));
    size_t size = STRLENGTH;
    size_t actualVal = PARAM_0;
    napi_get_value_string_utf8(env, args[1], siginfo->param, size, &actualVal);
}

static int SigMain(struct Sig siginfo, Func testfunction)
{
    pthread_t pid;

    pthread_create(&pid, nullptr, testfunction, &siginfo);
    pthread_detach(pid);

    return NO_ERR;
}
static int SigMainInt(int siginfo, Func testfunction)
{
    pthread_t pid;

    pthread_create(&pid, nullptr, testfunction, &siginfo);
    pthread_detach(pid);

    return NO_ERR;
}
static int SigMainNull(Func testfunction)
{
    pthread_t pid;

    pthread_create(&pid, nullptr, testfunction, nullptr);
    pthread_detach(pid);

    return NO_ERR;
}
static int SigMainString(struct SigString siginfo, Func testfunction)
{
    pthread_t pid;

    pthread_create(&pid, nullptr, testfunction, &siginfo);
    pthread_detach(pid);

    return NO_ERR;
}
void *Sighold(void *pro)
{
    Sig *sigInfo = (Sig *)pro;
    if ((sigInfo->flag) == PARAM_0) {
        int sig = SIGALRM;
        sighold(sig);
    } else {
        sighold(sigInfo->param);
    }
    return nullptr;
}

static napi_value SigMainHold(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct Sig siginput;
    structInput(env, info, &siginput);
    int resSig = SigMain(siginput, Sighold);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigrelse(void *pro)
{
    Sig *sigInfo = (Sig *)pro;
    if ((sigInfo->flag) == PARAM_0) {
        int sig = SIGALRM;
        sigrelse(sig);
    } else {
        sigrelse(sigInfo->param);
    }
    return nullptr;
}

static napi_value SigMainRelse(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct Sig siginput;
    structInput(env, info, &siginput);
    int resSig = SigMain(siginput, Sigrelse);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigdelset(void *pro)
{
    sigset_t set = {PARAM_0};
    Sig *sigInfo = (Sig *)pro;
    sigemptyset(&set);
    if ((sigInfo->flag) == PARAM_0) {
        int sig = SIGALRM;
        sigdelset(&set, sig);
    } else {
        sigdelset(&set, sigInfo->param);
    }
    return nullptr;
}

static napi_value SigMainDelset(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct Sig siginput;
    structInput(env, info, &siginput);
    int resSig = SigMain(siginput, Sigdelset);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigaddset(void *pro)
{
    sigset_t set = {PARAM_0};
    Sig *sigInfo = (Sig *)pro;
    sigemptyset(&set);
    if ((sigInfo->flag) == PARAM_0) {
        int sig = SIGALRM;
        sigaddset(&set, sig);
    } else {
        sigaddset(&set, sigInfo->param);
    }
    return nullptr;
}

static napi_value SigMainAddset(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct Sig siginput;
    structInput(env, info, &siginput);
    int resSig = SigMain(siginput, Sigaddset);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigemptyset(void *pro)
{
    sigset_t set = {PARAM_0};
    sigemptyset(&set);
    return nullptr;
}

static napi_value SigMainEmptyset(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(Sigemptyset);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigfillset(void *pro)
{
    sigset_t set = {PARAM_0};
    sigfillset(&set);
    return nullptr;
}

static napi_value SigMainFillset(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(Sigfillset);
    napi_create_int32(env, resSig, &result);
    return result;
}

void SignalHandler(int signum) {}
void *Sigaction(void *pro)
{
    Sig *sigInfo = (Sig *)pro;
    struct sigaction sigabrt = {.sa_handler = SignalHandler};
    if ((sigInfo->flag) == PARAM_0) {
        sigaction(SIGABRT, &sigabrt, nullptr);
    } else {
        sigaction(sigInfo->param, &sigabrt, nullptr);
    }
    return nullptr;
}

static napi_value SigMainAction(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct Sig siginput;
    structInput(env, info, &siginput);
    int resSig = SigMain(siginput, Sigaction);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigaltstack(void *pro)
{
    Sig *sigInfo = (Sig *)pro;
    stack_t ss = {PARAM_0};
    ss.ss_size = SIGSTKSZ;
    if ((sigInfo->flag) == PARAM_0) {
        ss.ss_flags = PARAM_0;
        sigaltstack(&ss, nullptr);
    } else {
        ss.ss_flags = MINUSONE;
        sigaltstack(&ss, nullptr);
    }
    return nullptr;
}

static napi_value SigMainAltstack(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainInt(intInput(env, info), Sigaltstack);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigignore(void *pro)
{
    Sig *sigInfo = (Sig *)pro;
    if ((sigInfo->flag) == PARAM_0) {
        sigignore(SIGALRM);
    } else {
        sigignore(sigInfo->param);
    }
    return nullptr;
}

static napi_value SigMainIgnore(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct Sig siginput;
    structInput(env, info, &siginput);
    int resSig = SigMain(siginput, Sigignore);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigpause(void *pro)
{
    sigpause(SIGALRM);
    return nullptr;
}

static napi_value SigMainPause(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(Sigpause);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigpending(void *pro)
{
    sigset_t pending = {PARAM_0};
    sigpending(&pending);
    return nullptr;
}

static napi_value SigMainPending(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(Sigpending);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigprocmask(void *pro)
{
    Sig *sigInfo = (Sig *)pro;
    sigset_t set = {PARAM_0}, set2 = {PARAM_0};
    if ((sigInfo->flag) == PARAM_0) {
        sigprocmask(SIG_UNBLOCK, &set, &set2);
    } else {
        sigprocmask(sigInfo->param, &set, &set2);
    }
    return nullptr;
}

static napi_value SigMainProcmask(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct Sig siginput;
    structInput(env, info, &siginput);
    int resSig = SigMain(siginput, Sigprocmask);
    napi_create_int32(env, resSig, &result);
    return result;
}

static napi_value Kill(napi_env env, napi_callback_info info)
{
    napi_value result = {PARAM_0};
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

static napi_value Killpg(napi_env env, napi_callback_info info)
{
    napi_value result = {PARAM_0};
    napi_create_int32(env, PARAM_0, &result);
    return result;
}
void *Psignal(void *pro)
{
    SigString *sigInfo = (SigString *)pro;
    psignal(sigInfo->flag, sigInfo->param);
    return nullptr;
}

static napi_value SigMainPsignal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct SigString siginput;
    structStringInput(env, info, &siginput);
    int resSig = SigMainString(siginput, Psignal);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *PSigInfo(void *pro)
{
    char paramSecond[STRLENGTH];
    siginfo_t siginfo = {PARAM_0};
    psiginfo(&siginfo, paramSecond);
    return nullptr;
}

static napi_value SigMainPSigInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(PSigInfo);
    napi_create_int32(env, resSig, &result);
    return result;
}

static napi_value Raise(napi_env env, napi_callback_info info)
{
    napi_value result = PARAM_0;
    napi_create_int32(env, PARAM_0, &result);
    return result;
}

std::atomic<bool> isSigSendReady (false);
pthread_mutex_t g_mutex = PTHREAD_MUTEX_INITIALIZER;

void *SigSend(void *pro)
{
    int sig = SIGALRM;
    union sigval sigval = {.sival_int = ONE};
    int count = 0;
    while (!isSigSendReady) {
        usleep(SLEEP_10_MS);
        count++;
        if (count > PARAM_100) {
            break;
        }
    }
    sigqueue(getpid(), sig, sigval);

    return nullptr;
}

static napi_value SigMainWait(napi_env env, napi_callback_info info)
{
    pthread_mutex_lock(&g_mutex);
    napi_value result = nullptr;
    isSigSendReady = false;
    pthread_t pid;
    sigset_t set = {0};
    int res = sigemptyset(&set);
    int sig = SIGALRM;
    res = sigaddset(&set, sig);
    res = sigprocmask(SIG_BLOCK, &set, nullptr);
    pthread_create(&pid, nullptr, SigSend, nullptr);
    sig = PARAM_0;
    isSigSendReady = true;
    res = sigwait(&set, &sig);

    napi_create_int32(env, res, &result);
    pthread_mutex_unlock(&g_mutex);
    return result;
}

static napi_value SigMainWaitinfo(napi_env env, napi_callback_info info)
{
    pthread_mutex_lock(&g_mutex);
    napi_value result = nullptr;
    isSigSendReady = false;
    pthread_t pid;
    sigset_t set = {0};
    int res = sigemptyset(&set);
    int sig = SIGALRM;
    res = sigaddset(&set, sig);
    res = sigprocmask(SIG_BLOCK, &set, nullptr);
    pthread_create(&pid, nullptr, SigSend, nullptr);
    siginfo_t siginfo;
    isSigSendReady = true;
    res = sigwaitinfo(&set, &siginfo);
    if (res == SIGALRM) {
        res = PARAM_0;
    }
    if (siginfo.si_signo != sig) {
        res = PARAM_1;
    }
    if (siginfo.si_value.sival_int != ONE) {
        res = PARAM_2;
    }

    napi_create_int32(env, res, &result);
    pthread_mutex_unlock(&g_mutex);
    return result;
}

void *Sigismember(void *pro)
{
    Sig *sigInfo = (Sig *)pro;
    sigset_t set = {PARAM_0};
    if ((sigInfo->flag) == PARAM_0) {
        int sig = SIGALRM;
        sigismember(&set, sig);
    } else if ((sigInfo->flag) == MINUSONE) {
        sigismember(&set, sigInfo->param);
    } else {
        sigemptyset(&set);
        sigaddset(&set, SIGINT);
        sigismember(&set, SIGINT);
    }
    return nullptr;
}

static napi_value SigMainIsmember(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct Sig siginput;
    structInput(env, info, &siginput);
    int resSig = SigMain(siginput, Sigismember);
    napi_create_int32(env, resSig, &result);
    return result;
}

static int g_count = PARAM_0;
static void signalHandler(int signo) { g_count++; }
void *Signal(void *pro)
{
    signal(SIGHUP, signalHandler);
    return nullptr;
}

static napi_value SigMainSignal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(Signal);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Signalfd(void *pro)
{
    const int sig = SIGALRM;
    sigset_t mask = {};
    sigaddset(&mask, sig);
    sigprocmask(SIG_SETMASK, &mask, nullptr);
    signalfd(MINUSONE, &mask, SFD_CLOEXEC);
    return nullptr;
}

static napi_value SigMainNalfd(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(Signalfd);
    napi_create_int32(env, resSig, &result);
    return result;
}

static inline void unsupported_api(const char *Func) { fprintf(stderr, "[ERR]Unsupported API %s\n", Func); }
void *Siginterrupt(void *pro)
{
    int sig = SIGABRT;
    int flag = PARAM_0;
    struct sigaction sa;
    unsupported_api(__FUNCTION__);
    struct sigaction sigabrt = {.sa_handler = SignalHandler};
    sigaction(sig, &sigabrt, nullptr);
    if (flag) {
        sa.sa_flags &= ~SA_RESTART;
    } else {
        sa.sa_flags |= SA_RESTART;
    }
    siginterrupt(sig, ONEVAL);
    return nullptr;
}

static napi_value SigMainInterrupt(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(Siginterrupt);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigset(void *pro)
{
    if (*(static_cast<int *>(pro)) == PARAM_0) {
        sigset(SIGALRM, SIG_DFL);
    } else {
        sigset(PARAM_99999, SIG_DFL);
    }
    return nullptr;
}

static napi_value SigMainSet(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainInt(intInput(env, info), Sigset);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigtimedwait(void *pro)
{
    sigset_t set2 = {PARAM_0};
    siginfo_t siginfo = {PARAM_0};
    struct timespec timeout = {THRVAL, PARAM_0};
    sigemptyset(&set2);
    sigaddset(&set2, SIGCHLD);
    sigtimedwait(&set2, &siginfo, &timeout);
    return nullptr;
}

static napi_value SigMainTimedwait(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(Sigtimedwait);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigqueue(void *pro)
{
    Sig *sigInfo = (Sig *)pro;
    union sigval sigval = {.sival_int = ONEVAL};
    if (sigInfo->flag == PARAM_0) {
        int sig = SIGALRM;
        sigqueue(getpid(), sig, sigval);
    } else {
        sigqueue(getpid(), sigInfo->param, sigval);
    }
    return nullptr;
}

static napi_value SigMainQueue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    struct Sig siginput;
    structInput(env, info, &siginput);
    int resSig = SigMain(siginput, Sigqueue);
    napi_create_int32(env, resSig, &result);
    return result;
}

static int g_countNum = ERRON_0;
static void signaler(int signo) { g_countNum++; }
void *BsdSignal(void *pro)
{
    bsd_signal(SIGHUP, signaler);
    return nullptr;
}

static napi_value SigMainBsdSignal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(BsdSignal);
    napi_create_int32(env, resSig, &result);
    return result;
}

void *Sigsuspend(void *pro)
{
    int sig = SIGALRM;
    sigset_t set_without_sig;
    sigfillset(&set_without_sig);
    sigdelset(&set_without_sig, sig);
    sigsuspend(&set_without_sig);
    return nullptr;
}

static napi_value SigMainSuspend(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resSig = SigMainNull(Sigsuspend);
    napi_create_int32(env, resSig, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"sighold", nullptr, SigMainHold, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigrelse", nullptr, SigMainRelse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigdelset", nullptr, SigMainDelset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigaddset", nullptr, SigMainAddset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigemptyset", nullptr, SigMainEmptyset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigfillset", nullptr, SigMainFillset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigaction", nullptr, SigMainAction, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigaltstack", nullptr, SigMainAltstack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigignore", nullptr, SigMainIgnore, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigpause", nullptr, SigMainPause, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigpending", nullptr, SigMainPending, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigprocmask", nullptr, SigMainProcmask, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigismember", nullptr, SigMainIsmember, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"signal", nullptr, SigMainSignal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"signalfd", nullptr, SigMainNalfd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"siginterrupt", nullptr, SigMainInterrupt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigset", nullptr, SigMainSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigtimedwait", nullptr, SigMainTimedwait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigqueue", nullptr, SigMainQueue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigwait", nullptr, SigMainWait, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigwaitinfo", nullptr, SigMainWaitinfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"kill", nullptr, Kill, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"killpg", nullptr, Killpg, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"raise", nullptr, Raise, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"psignal", nullptr, SigMainPsignal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pSigInfo", nullptr, SigMainPSigInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"bsdSignal", nullptr, SigMainBsdSignal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sigsuspend", nullptr, SigMainSuspend, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "signal",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
