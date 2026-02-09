/*
* Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
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

#include <bits/alltypes.h>
#include <thread>
#include <unistd.h>
#include <string>
#include <sys/wait.h>
#include <csignal>
#include <securec.h>
#include <pthread.h>
#include <cstdlib>
#include <cstdio>
#include <semaphore.h>
#include <dlfcn.h>
#include <cstddef>
#include <sched.h>
#include <cstdarg>
#include <dirent.h>
#include <sanitizer/tsan_interface.h>
#include "napi/native_api.h"

#ifdef __APPLE__
#include <mach/mach_time.h>
#endif

#if TSAN_VECTORIZE
#include <emmintrin.h>
#include <smmintrin.h>
#endif

// TSan-invisible barrier.
// Tests use it to establish necessary execution order in a way that does not
// interfere with tsan (does not establish synchronization between threads).
typedef unsigned invisible_barrier_t;

#ifdef __cplusplus
extern "C" {
#endif
void __tsan_testonly_barrier_init(invisible_barrier_t *barrier,
    unsigned count);
void __tsan_testonly_barrier_wait(invisible_barrier_t *barrier);
unsigned long __tsan_testonly_shadow_stack_current_size();
#ifdef __cplusplus
}
#endif

static inline void BarrierInit(invisible_barrier_t *barrier, unsigned count)
{
    __tsan_testonly_barrier_init(barrier, count);
}

static inline void BarrierWait(invisible_barrier_t *barrier)
{
    __tsan_testonly_barrier_wait(barrier);
}

// Default instance of the barrier, but a test can declare more manually.
invisible_barrier_t g_barrier;

const unsigned COUNTNUM = 2;
constexpr int MAX_BUFFER_SIZE = 128;

static int FindDirAndCheck(DIR *dir, char *fileResult, int pid)
{
    struct dirent *ptr;
    char file[MAX_BUFFER_SIZE];
    int filenameres = snprintf_s(file, sizeof(file), sizeof(file) - 1, "%s.%s.%d", "tsanXtsLog", "appspawn", pid);
    if (filenameres < 0) {
        return -1;
    }
    while((ptr = readdir(dir)) != NULL) {
        if (strstr(ptr->d_name, file) != NULL) {
            int findRes = snprintf_s(fileResult, MAX_BUFFER_SIZE, MAX_BUFFER_SIZE - 1, "%s/%s",
                "/data/storage/el2/log/", ptr->d_name);
            if (findRes < 0) {
                return -1;
            }
            return 1;
        }
    }
    return -1;
}

static std::string GetBuffer(int pid)
{
    std::string buffer;
    char file[MAX_BUFFER_SIZE];
    DIR *logdir = opendir("/data/storage/el2/log/");
    int findRes = FindDirAndCheck(logdir, file, pid);
    if (findRes < 0) {
        return buffer;
    }
    FILE *fp = fopen(file, "r+");
    if (!fp) {
        return buffer;
    }
    if (fseek(fp, 0, SEEK_END) == -1) {
        return buffer;
    }
    int size = ftell(fp);
    if (size <= 0) {
        ftruncate(fileno(fp), 0);
        rewind(fp);
        fclose(fp);
        return buffer;
    }
    buffer.resize(size);
    if (fseek(fp, 0, SEEK_SET) == -1) {
        ftruncate(fileno(fp), 0);
        rewind(fp);
        fclose(fp);
        return buffer;
    }
    int rsize = fread(&buffer[0], 1, size, fp);
    if (rsize == 0) {
        ftruncate(fileno(fp), 0);
        rewind(fp);
        fclose(fp);
        return buffer;
    }
    ftruncate(fileno(fp), 0);
    rewind(fp);
    fclose(fp);
    return buffer;
}

static bool CheckTsanLog(const std::string& errType, const std::string& buffer)
{
    if (buffer.empty()) {
        return false;
    }
    bool checkEventTypeFail = buffer.find(errType.c_str()) == std::string::npos;
    if (checkEventTypeFail) {
        return false;
    }
    return true;
}

namespace DataRace {
const int NUMFORTYFOUR = 44;
const int NUMFORTYTWO = 42;
const int NUMNINETYNINE = 99;
const int NUMSIXTEEN = 16;
void *Thread1(void *p)
{
    *(int*)p = NUMFORTYTWO;
    return nullptr;
}

void *Thread2(void *p)
{
    *(int*)p = NUMFORTYFOUR;
    return nullptr;
}

__attribute__((noinline)) void *Alloc()
{
    return malloc(NUMNINETYNINE);
}

void *AllocThread(void* arg)
{
    return Alloc();
}

__attribute__((optnone)) static napi_value DataRace(napi_env env, napi_callback_info info)
{
    void *p = nullptr;
    pthread_t t[2];
    pthread_create(&t[0], nullptr, AllocThread, nullptr);
    pthread_join(t[0], &p);
    pthread_create(&t[0], nullptr, Thread1, (char*)p + NUMSIXTEEN);
    pthread_create(&t[1], nullptr, Thread2, (char*)p + NUMSIXTEEN);
    pthread_join(t[0], nullptr);
    pthread_join(t[1], nullptr);
    std::string bufferLog = GetBuffer(getpid());
    bool findTsanLog = CheckTsanLog("ThreadSanitizer: data race", bufferLog) &&
        CheckTsanLog("Write of size 4", bufferLog) &&
        CheckTsanLog("created by main thread", bufferLog);
    int checkRes = findTsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}
}

namespace DataRaceOnVptr {
struct A {
    A()
    {
        sem_init(&sem, 0, 0);
    }
    virtual void F() {}
    void Done()
    {
        sem_post(&sem);
    }
    virtual ~A()
    {
        sem_wait(&sem);
        sem_destroy(&sem);
    }
    sem_t sem;
};

struct B : A {
    void F() override {}
};

static A *g_obj = new B;

void *Thread1(void *x)
{
    g_obj->F();
    BarrierWait(&g_barrier);
    g_obj->Done();
    return nullptr;
}

void *Thread2(void *x)
{
    BarrierWait(&g_barrier);
    delete g_obj;
    g_obj = nullptr;
    return nullptr;
}

__attribute__((optnone)) static napi_value DataRaceOnVptr(napi_env env, napi_callback_info info)
{
    BarrierInit(&g_barrier, COUNTNUM);
    pthread_t t[2];
    pthread_create(&t[0], nullptr, Thread1, nullptr);
    pthread_create(&t[1], nullptr, Thread2, nullptr);
    pthread_join(t[0], nullptr);
    pthread_join(t[1], nullptr);
    std::string bufferLog = GetBuffer(getpid());
    bool findTsanLog = CheckTsanLog("ThreadSanitizer: data race on vptr (ctor/dtor vs virtual call)", bufferLog) &&
        CheckTsanLog("Write of size 8", bufferLog) &&
        CheckTsanLog("allocated by main thread", bufferLog);
    int checkRes = findTsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}
}

namespace HeapUseAfterFree {
const int NUMFORTYTWO = 42;
const int NUMHUNDRED = 100;
int *g_mem;
pthread_mutex_t g_mtx;

void *Thread1(void *x)
{
    pthread_mutex_lock(&g_mtx);
    free(g_mem);
    pthread_mutex_unlock(&g_mtx);
    BarrierWait(&g_barrier);
    return nullptr;
}

__attribute__((noinline)) void *Thread2(void *x)
{
    BarrierWait(&g_barrier);
    pthread_mutex_lock(&g_mtx);
    g_mem[0] = NUMFORTYTWO;
    pthread_mutex_unlock(&g_mtx);
    return nullptr;
}

__attribute__((optnone)) static napi_value HeapUseAfterFree(napi_env env, napi_callback_info info)
{
    BarrierInit(&g_barrier, COUNTNUM);
    g_mem = (int*)malloc(NUMHUNDRED);
    pthread_mutex_init(&g_mtx, nullptr);
    pthread_t t;
    pthread_create(&t, nullptr, Thread1, nullptr);
    Thread2(nullptr);
    pthread_join(t, nullptr);
    pthread_mutex_destroy(&g_mtx);
    std::string bufferLog = GetBuffer(getpid());
    bool findTsanLog = CheckTsanLog("ThreadSanitizer: heap-use-after-free", bufferLog) &&
        CheckTsanLog("Write of size 4", bufferLog) &&
        CheckTsanLog("created by main thread", bufferLog);
    int checkRes = findTsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}
}

namespace VirtualCallVSFree {
struct A {
    virtual void F() {}
    virtual ~A() {}
};

struct B : A {
    void F() override {}
};

void *Thread(void *x)
{
    BarrierWait(&g_barrier);
    ((A*)x)->F();
    return nullptr;
}

__attribute__((optnone)) static napi_value VirtualCallVSFree(napi_env env, napi_callback_info info)
{
    BarrierInit(&g_barrier, COUNTNUM);
    A *obj = new B;
    pthread_t t;
    pthread_create(&t, nullptr, Thread, obj);
    delete obj;
    BarrierWait(&g_barrier);
    pthread_join(t, nullptr);
    std::string bufferLog = GetBuffer(getpid());
    bool findTsanLog = CheckTsanLog("ThreadSanitizer: heap-use-after-free (virtual call vs free)", bufferLog) &&
        CheckTsanLog("Read of size 8", bufferLog) &&
        CheckTsanLog("created by main thread", bufferLog);
    int checkRes = findTsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}
}

namespace SignalHandlerError {
pthread_t g_mainth;
volatile int g_done;

static void MyHandler(int, siginfo_t *s, void *c)
{
    errno = 1;
    g_done = 1;
}

static void* Sendsignal(void *p)
{
    BarrierWait(&g_barrier);
    pthread_kill(g_mainth, SIGPROF);
    return nullptr;
}

static __attribute__((noinline)) void Loop()
{
    BarrierWait(&g_barrier);
    while (g_done == 0) {
        volatile char *p = (char*)malloc(1);
        if (p != nullptr) {
            p[0] = 0;
        }
        free(static_cast<void *>(const_cast<char *>(p)));
        sched_yield();
    }
}

__attribute__((optnone)) static napi_value SignalHandlerError(napi_env env, napi_callback_info info)
{
    BarrierInit(&g_barrier, COUNTNUM);
    g_mainth = pthread_self();
    struct sigaction act = {};
    act.sa_sigaction = &MyHandler;
    sigaction(SIGPROF, &act, nullptr);
    pthread_t th;
    pthread_create(&th, nullptr, Sendsignal, nullptr);
    Loop();
    pthread_join(th, nullptr);
    std::string bufferLog = GetBuffer(getpid());
    bool findTsanLog = CheckTsanLog("ThreadSanitizer: signal handler spoils errno", bufferLog) &&
        CheckTsanLog("Signal 27 handler invoked", bufferLog);
    int checkRes = findTsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}
}

namespace SignalHandlerUnsafe {
static void Handler(int, siginfo_t*, void*)
{
    volatile char *p = (char*)malloc(1);
    if (p != nullptr) {
        p[0] = 0;
    }
    free(static_cast<void *>(const_cast<char *>(p)));
}

__attribute__((optnone)) static napi_value SignalHandlerUnsafe(napi_env env, napi_callback_info info)
{
    struct sigaction act = {};
    act.sa_sigaction = &Handler;
    sigaction(SIGPROF, &act, nullptr);
    kill(getpid(), SIGPROF);
    sleep(1);  // let the signal handler run
    std::string bufferLog = GetBuffer(getpid());
    bool findTsanLog = CheckTsanLog("ThreadSanitizer: signal-unsafe call inside of a signal", bufferLog);
    int checkRes = findTsanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "dataRace", nullptr, DataRace::DataRace, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "dataRaceOnVptr", nullptr, DataRaceOnVptr::DataRaceOnVptr, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "heapUseAfterFree", nullptr, HeapUseAfterFree::HeapUseAfterFree, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "virtualCallVSFree", nullptr, VirtualCallVSFree::VirtualCallVSFree, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "signalHandlerUnsafe", nullptr, SignalHandlerUnsafe::SignalHandlerUnsafe, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "signalHandlerError", nullptr, SignalHandlerError::SignalHandlerError, nullptr, nullptr, nullptr,
            napi_default, nullptr }
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
