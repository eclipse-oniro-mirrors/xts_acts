/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <dlfcn.h>
#include <pthread.h>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cerrno>
#include <link.h>
#include <sys/wait.h>

#include "test.h"

#define MAX_BUF 256
#define TEST_NUM 1000
#define TEST_SIZE 4096
#define CALLBACK_TEST_VAL 2

// const char* LIB_PATH = "/data/local/tmp/libc-test-lib/libdlopen_dso.so";
// const char* INIT_LIB_PATH = "/data/local/tmp/libc-test-lib/libdlopen_init.so";
const char* LIB_PATH = "/data/storage/el1/bundle/libs/arm/libdlopen_dso.so";
const char* INIT_LIB_PATH = "/data/storage/el1/bundle/libs/arm/libdlopen_init.so";
void* g_initHandler = nullptr;
static int g_testValue = 0;

int CheckLoaded(char* so)
{
    int pid = getpid();
    char path[MAX_BUF] = { 0 };
    if (sprintf(path, "/proc/%d/maps", pid) < 0) {
        t_error("Failed in sprintf: %s\n", strerror(errno));
    }
    FILE* fp = fopen(path, "r");
    if (fp == nullptr) {
        return 0;
    }

    char buffer[MAX_BUF] = { 0 };
    while (fgets(buffer, MAX_BUF, fp) != nullptr) {
        if (strstr(buffer, so) != nullptr) {
            fclose(fp);
            return 1;
        }
    }
    (void)fclose(fp);
    return 0;
}

static int Callback001(struct dl_phdr_info* info, size_t size, void* data)
{
    if (strcmp(info->dlpi_name, LIB_PATH) != 0 || strcmp(info->dlpi_name, INIT_LIB_PATH) != 0) {
        return 0;
    }
    g_testValue++;
    if (g_testValue != 1) {
        t_error("g_testValue should be 1, but: %d\n", g_testValue);
    }
    g_testValue--;

    if (g_testValue != 0) {
        t_error("g_testValue should be 0, but: %d\n", g_testValue);
    }
    return 0;
}

static int Callback002(struct dl_phdr_info* info, size_t size, void* data)
{
    if (strcmp(info->dlpi_name, LIB_PATH) != 0 || strcmp(info->dlpi_name, INIT_LIB_PATH) != 0) {
        return 0;
    }
    g_testValue = g_testValue + CALLBACK_TEST_VAL;
    if (g_testValue != CALLBACK_TEST_VAL) {
        t_error("g_testValue should be 2, but: %d\n", g_testValue);
    }

    g_testValue = g_testValue - CALLBACK_TEST_VAL;
    if (g_testValue != 0) {
        t_error("g_testValue should be 0, but: %d\n", g_testValue);
    }
    return 0;
}

static void* Callback003(void* arg)
{
    pid_t pid = fork();
    if (pid > 0) {
        int status = 0;
        int options = 0;
        pid_t waitpidForPind = waitpid(pid, &status, options);
        if (waitpidForPind != pid) {
            t_error("%s waitpid get pid is %d are not want %d\n", __func__, waitpidForPind, pid);
        }
        if (status != 0) {
            t_error("%s waitpid get status is %d are not 0\n", __func__, status);
        }
    } else if (pid == 0) {
        sleep(1);
        exit(0);
    } else {
        t_error("%s waitpid fork error\n");
    }
    return arg;
}

static int Callback004(struct dl_phdr_info* info, size_t size, void* data)
{
    char *memory = static_cast<char *>(malloc(TEST_SIZE));
    free(memory);
    return 0;
}

static void* DlopenDlcloseTest001(void* arg)
{
    void* handle = dlopen(LIB_PATH, RTLD_NOW);
    if (!handle) {
        t_error("dlopen(name=%s, mode=%d) failed: %s\n", LIB_PATH, RTLD_NOW, dlerror());
    }
    dlclose(handle);
    return arg;
}

static void* DlopenDlcloseTest002(void* arg)
{
    void* handle = dlopen(INIT_LIB_PATH, RTLD_NOW);
    if (!handle) {
        t_error("dlopen(name=%s, mode=%d) failed: %s\n", INIT_LIB_PATH, RTLD_NOW, dlerror());
    }
    g_initHandler = handle;
    return arg;
}

static void* DlopenDlcloseTest003(void* arg)
{
    dlclose(g_initHandler);
    return arg;
}

static void* DlopenDlcloseTest0041(void* arg)
{
    dl_iterate_phdr(Callback001, nullptr);
    return arg;
}

static void* DlopenDlcloseTest0042(void* arg)
{
    dl_iterate_phdr(Callback002, nullptr);
    return arg;
}

static void* DlopenDlcloseTest005(void* arg)
{
    int (*getVal)(void) = reinterpret_cast<int (*)(void)>(dlsym(g_initHandler, "getVal"));
    if (getVal == nullptr) {
        t_error("dlsym failed, don't find the symbol getVal\n");
    }
    if (getVal != nullptr && getVal() != 1) {
        t_error("This val after init should be 1, but %d\n", getVal());
    }
    return arg;
}

static void* DlopenDlcloseTest006(void* arg)
{
    dl_iterate_phdr(Callback004, nullptr);
    return arg;
}

static void DoTestConcurrently(void *(*test) (void *arg), size_t numThreads)
{
    if (numThreads == 0 || numThreads > SIZE_MAX / sizeof(pthread_t)) {
        t_error("Invalid number of threads: %zu\n", numThreads);
        return;
    }
    
    pthread_t *threads = static_cast<pthread_t *>(malloc(sizeof(pthread_t) * numThreads));
    if (threads == nullptr) {
        t_error("Failed to allocate memory: %s\n", strerror(errno));
        return;
    }

    size_t last = 0;
    while (last < numThreads) {
        if (pthread_create(&(threads[last]), nullptr, test, nullptr)) {
            t_error("Failed to create thread: %s\n", strerror(errno));
            break;
        }
        last++;
    }

    for (size_t i = 0; i < last; i++) {
        if (pthread_join(threads[i], nullptr)) {
            t_error("Failed to join thread: %s\n", strerror(errno));
        }
    }

    free(threads);
    return;
}

static void DoTestDoubleConcurrently(void *(*test1) (void *arg), void *(*test2) (void *arg),
    size_t numThreads1, size_t numThreads2)
{
    pthread_t *threads = static_cast<pthread_t *>(malloc(sizeof(pthread_t) * (numThreads1 + numThreads2)));
    if (threads == nullptr) {
        t_error("Failed to allocate memory: %s\n", strerror(errno));
        return;
    }

    size_t last = 0;
    while (last < numThreads1) {
        if (pthread_create(&(threads[last]), nullptr, test1, nullptr)) {
            t_error("Failed to create thread: %s\n", strerror(errno));
            break;
        }
        last++;
    }

    while (last < numThreads1 + numThreads2) {
        if (pthread_create(&(threads[last]), nullptr, test2, nullptr)) {
            t_error("Failed to create thread: %s\n", strerror(errno));
            break;
        }
        last++;
    }

    for (size_t i = 0; i < last; i++) {
        if (pthread_join(threads[i], nullptr)) {
            t_error("Failed to join thread: %s\n", strerror(errno));
        }
    }

    free(threads);
    return;
}

/**
 * @tc.name      : dl_multithread_lock_0100
 * @tc.desc      : multithreaded dlopen/dlclose, at the end the expected so file should not be in memory.
 * @tc.level     : Level 0
 */
void DlMultithreadLock0100(void)
{
    size_t numThreads = 1000;
    DoTestConcurrently(DlopenDlcloseTest001, numThreads);
    if (CheckLoaded(const_cast<char *>(LIB_PATH))) {
        t_error("This so file should not exist, %s\n", const_cast<char *>(LIB_PATH));
    }
}

/**
 * @tc.name      : dl_multithread_lock_0200
 * @tc.desc      : multithreaded dlopen, the init constructor should be called only once.
 * @tc.level     : Level 0
 */
void DlMultithreadLock0200(void)
{
    size_t numThreads = 20;
    DoTestConcurrently(DlopenDlcloseTest002, numThreads);
    if (!CheckLoaded(const_cast<char *>(INIT_LIB_PATH))) {
        t_error("This so file should exist, %s\n", const_cast<char *>(INIT_LIB_PATH));
    }
    int (*getVal)(void) = reinterpret_cast<int (*)(void)>(dlsym(g_initHandler, "getVal"));
    if (getVal == nullptr) {
        t_error("dlsym failed, don't find the symbol getVal\n");
    }
    if (getVal != nullptr && getVal() != 1) {
        t_error("This val after init should be 1, but %d\n", getVal());
    }
}

/**
 * @tc.name      : dl_multithread_lock_0300
 * @tc.desc      : multithreaded dlopen, the deconstructor should be called only at the last dlclose.
 * @tc.level     : Level 0
 */
void DlMultithreadLock0300(void)
{
    size_t numThreads = 19;
    DoTestConcurrently(DlopenDlcloseTest003, numThreads);
    if (!CheckLoaded(const_cast<char *>(INIT_LIB_PATH))) {
        t_error("This so file should exist, %s\n", const_cast<char *>(INIT_LIB_PATH));
    }
    int (*getVal)(void) = reinterpret_cast<int (*)(void)>(dlsym(g_initHandler, "getVal"));
    if (getVal == nullptr) {
        t_error("dlsym failed, don't find the symbol getVal\n");
    }
    if (getVal != nullptr && getVal() != 1) {
        t_error("This val after init should be 1, but %d\n", getVal());
    }
    dlclose(g_initHandler);
    if (CheckLoaded(const_cast<char *>(INIT_LIB_PATH))) {
        t_error("This so file should not exist, %s\n", const_cast<char *>(INIT_LIB_PATH));
    }
}

/**
 * @tc.name      : dl_multithread_lock_0400
 * @tc.desc      : multithreaded iterate Callback in dl_iterate_phdr, the static g_testValue should be thread safe.
 * @tc.level     : Level 0
 */
void DlMultithreadLock0400(void)
{
    void* handle1 = dlopen(LIB_PATH, RTLD_NOW);
    if (!handle1) {
        t_error("dlopen(name=%s, mode=%d) failed: %s\n", LIB_PATH, RTLD_NOW, dlerror());
    }

    void* handle2 = dlopen(INIT_LIB_PATH, RTLD_NOW);
    if (!handle2) {
        t_error("dlopen(name=%s, mode=%d) failed: %s\n", INIT_LIB_PATH, RTLD_NOW, dlerror());
    }

    size_t numThreads = 5;
    DoTestDoubleConcurrently(DlopenDlcloseTest0041, DlopenDlcloseTest0042, numThreads, numThreads);

    dlclose(handle1);
    dlclose(handle2);
    if (CheckLoaded(const_cast<char *>(INIT_LIB_PATH)) || CheckLoaded(const_cast<char *>(LIB_PATH))) {
        t_error("These so files should not exist\n");
    }
}

/**
 * @tc.name      : dl_multithread_lock_0500
 * @tc.desc      : multithreaded dlsym, dlsym should not be blocked by dlsym in other threads.
 * @tc.level     : Level 0
 */
void DlMultithreadLock0500(void)
{
    void* handle = dlopen(INIT_LIB_PATH, RTLD_NOW);
    if (!handle) {
        t_error("dlopen(name=%s, mode=%d) failed: %s\n", INIT_LIB_PATH, RTLD_NOW, dlerror());
    }

    g_initHandler = handle;
    size_t numThreads = 500;
    DoTestConcurrently(DlopenDlcloseTest005, numThreads);
    g_initHandler = nullptr;
    dlclose(handle);
}

/**
 * @tc.name      : dl_multithread_lock_0600
 * @tc.desc      : malloc and fork in different threads to check that there is no ABBA deadlock
 *                (ld lock and jemalloc lock).
 * @tc.level     : Level 0
 */
void DlMultithreadLock0600(void)
{
    size_t numThreads = 50;
    DoTestDoubleConcurrently(DlopenDlcloseTest006, Callback003, numThreads, numThreads);
}

static int DlMultithreadLockTestWithArgs(int argc, char* argv[])
{
    DlMultithreadLock0100();
    DlMultithreadLock0200();
    DlMultithreadLock0300();
    DlMultithreadLock0400();
    DlMultithreadLock0500();
    DlMultithreadLock0600();
    return g_tStatus;
}

int DlMultithreadLockTest(void)
{
    static char libcProg[] = "libc_test";
    char *libcArgv[] = { libcProg, nullptr };
    return DlMultithreadLockTestWithArgs(1, libcArgv);
}
