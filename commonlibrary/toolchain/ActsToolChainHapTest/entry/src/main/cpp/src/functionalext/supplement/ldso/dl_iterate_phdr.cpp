/**
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

#include <cstdlib>
#include <dlfcn.h>
#include <link.h>
#include <pthread.h>
#include <sys/wait.h>
#include "functionalext.h"
#include "test.h"

#define SAME_NAME_COUT_1 1
#define SAME_NAME_COUT_2 2
#define OOM_FILL 50000

void* g_handleGloble = nullptr;
static pthread_mutex_t g_lock1;
static pthread_mutex_t g_lock2;

static int HeaderHandler(struct dl_phdr_info* info, size_t size, void* data)
{
    void* addrhead = reinterpret_cast<void*>(info->dlpi_addr + info->dlpi_phdr[0].p_vaddr);
    if ((strcmp(info->dlpi_name, "/data/libtest.so") == 0) && (addrhead != nullptr)) {
        return 1;
    }
    return 0;
}

static int g_sameNameCount = 0;

static int SameNameCountHandler(struct dl_phdr_info* info, size_t size, void* data)
{
    void* addrhead = reinterpret_cast<void*>(info->dlpi_addr + info->dlpi_phdr[0].p_vaddr);
    if ((strcmp(info->dlpi_name, "/data/libtest.so") == 0) && (addrhead != nullptr)) {
        g_sameNameCount++;
    }
    return 0;
}

static int LockRecursiveHandler(struct dl_phdr_info* info, size_t size, void* data)
{
    if (dl_iterate_phdr(HeaderHandler, nullptr)) {
        return 0;
    }
    return 1;
}

static int SyncHandler(struct dl_phdr_info* info, size_t size, void* data)
{
    // Step 1:call dl_iterate_phdr and lock dlclose_lock, then call fork
    pthread_mutex_unlock(&g_lock1);
    pthread_mutex_lock(&g_lock2);
    // Step 3:after call fork, unlock dlclose_lock and wait child process return
    return 1;
}

static int NothingHandler(struct dl_phdr_info* info, size_t size, void* data)
{
    return 1;
}

void* CallDlIteratePhdr(void* ptr)
{
    dl_iterate_phdr(SyncHandler, nullptr);
    return nullptr;
}

void ChildFunc(void)
{
    dlclose(g_handleGloble);
}

/**
 * @tc.name      : DlIteratePhdr0100
 * @tc.desc      : The parameter is valid, get the starting address of the dynamic library loaded in the memory.
 * @tc.level     : Level 0
 */
void DlIteratePhdr0100(void)
{
    void* handle = dlopen("/data/libtest.so", RTLD_NOW);
    int ret = 0;
    ret = dl_iterate_phdr(HeaderHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0100", static_cast<int>(ret), 1);

    dlclose(handle);
    ret = dl_iterate_phdr(HeaderHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0100", static_cast<int>(ret), 0);
}

/**
 * @tc.name      : DlIteratePhdr0200
 * @tc.desc      : Call dlopen twice, dlclose twice, the target so cannot find when second dlclose call.
 * @tc.level     : Level 0
 */
void DlIteratePhdr0200(void)
{
    void* handle = dlopen("/data/libtest.so", RTLD_NOW);
    int ret = 0;
    ret = dl_iterate_phdr(HeaderHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0200", static_cast<int>(ret), 1);

    handle = dlopen("/data/libtest.so", RTLD_NOW);
    ret = dl_iterate_phdr(HeaderHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0200", static_cast<int>(ret), 1);

    dlclose(handle);
    ret = dl_iterate_phdr(HeaderHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0200", static_cast<int>(ret), 1);

    dlclose(handle);
    ret = dl_iterate_phdr(HeaderHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0200", static_cast<int>(ret), 0);
}

/**
 * @tc.name      : DlIteratePhdr0300
 * @tc.desc      : Call dlopen twice, dlclose twice, so file use the same name but it is two different files.
 * @tc.level     : Level 0
 */
void DlIteratePhdr0300(void)
{
    void* handle1 = dlopen("/data/libtest.so", RTLD_NOW);
    int ret = 0;
    g_sameNameCount = 0;
    ret = dl_iterate_phdr(SameNameCountHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0300", g_sameNameCount, SAME_NAME_COUT_1);

    system("rm -rf /data/libtest.so");
    system("cp /data/local/tmp/lib_for_dlopen.so /data/libtest.so");
    system("cp /data/tests/libc-test/src/lib_for_dlopen.so /data/libtest.so");

    void* handle2 = dlopen("/data/libtest.so", RTLD_NOW);
    g_sameNameCount = 0;
    ret = dl_iterate_phdr(SameNameCountHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0300", g_sameNameCount, SAME_NAME_COUT_2);

    dlclose(handle1);
    g_sameNameCount = 0;
    ret = dl_iterate_phdr(SameNameCountHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0300", g_sameNameCount, SAME_NAME_COUT_1);

    dlclose(handle2);
    g_sameNameCount = 0;
    ret = dl_iterate_phdr(SameNameCountHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0300", g_sameNameCount, 0);
}

/**
 * @tc.name      : DlIteratePhdr0400
 * @tc.desc      : Test lock is RECURSIVE when call dl_iterate_phdr
 * @tc.level     : Level 0
 */
void DlIteratePhdr0400(void)
{
    void* handle = dlopen("/data/libtest.so", RTLD_NOW);
    int ret = 0;
    ret = dl_iterate_phdr(LockRecursiveHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0400", static_cast<int>(ret), 0);

    dlclose(handle);
}

/**
 * @tc.name      : DlIteratePhdr0500
 * @tc.desc      : Call dl_iterate_phdr when OOM happen.
 * @tc.level     : Level 0
 */
void DlIteratePhdr0500(void)
{
    void* handle = dlopen("/data/libtest.so", RTLD_NOW);
    int ret = 0;
    ret = dl_iterate_phdr(HeaderHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0500", static_cast<int>(ret), 1);
    // create oom start
    if (T_MEMFILL() < 0) {
        EXPECT_TRUE("DlIteratePhdr0500", false);
    }
    errno = 0;
    if (malloc(OOM_FILL)) {
        EXPECT_TRUE("DlIteratePhdr0500", false);
    }
    if (errno != ENOMEM) {
        EXPECT_TRUE("DlIteratePhdr0500", false);
    }
    // create oom end
    ret = dl_iterate_phdr(HeaderHandler, nullptr);
    EXPECT_EQ("DlIteratePhdr0500", static_cast<int>(ret), 1);
    dlclose(handle);
}

/**
 * @tc.name      : DlIteratePhdr0600
 * @tc.desc      : Call dl_iterate_phdr when fork happen.
 * @tc.level     : Level 0
 */
void DlIteratePhdr0600(void)
{
    pthread_t thread1;
    pid_t pid;
    int status;
    int ret;
    // This test case must be executed in sequence:Step1 -> Step2 -> Step3(Parent process)
    g_handleGloble = dlopen("/data/libtest.so", RTLD_NOW);
    pthread_mutex_lock(&g_lock1);
    pthread_mutex_lock(&g_lock2);
    ret = pthread_create(&thread1, nullptr, CallDlIteratePhdr, nullptr);
    if (ret != 0) {
        EXPECT_TRUE("DlIteratePhdr0600", false);
        return;
    }
    pthread_atfork(nullptr, nullptr, ChildFunc);
    pthread_mutex_lock(&g_lock1);
    // Step 2:after call dl_iterate_phdr, call fork, then dl_iterate_phdr can return
    pid = fork();
    pthread_mutex_unlock(&g_lock2);
    if (pid < 0) {
        return; // If fork failed, skip test DlIteratePhdr0600
    } else if (pid == 0) {
        // Child process, if can run here, dlclose_lock reset success
        exit(EXIT_SUCCESS);
        return;
    } else {
        // Parent process
        dl_iterate_phdr(NothingHandler, nullptr); // Test call dl_iterate_phdr success
        pthread_join(thread1, nullptr);
        if (waitpid(pid, &status, 0) != pid) {
            EXPECT_TRUE("DlIteratePhdr0600", false);
            return;
        }
        if (!WIFEXITED(status)) {
            EXPECT_TRUE("DlIteratePhdr0600", false);
            return;
        }
        if (WEXITSTATUS(status) != 0) {
            EXPECT_TRUE("DlIteratePhdr0600", false);
            return;
        }
        EXPECT_TRUE("DlIteratePhdr0600", true);
        dlclose(g_handleGloble);
        return;
    }
}

static int DlIteratePhdrTestWithArgs(int argc, char* argv[])
{
    system("cp /data/local/tmp/lib_for_dlopen.so /data/libtest.so");
    system("cp /data/tests/libc-test/src/lib_for_dlopen.so /data/libtest.so");
    DlIteratePhdr0100();
    DlIteratePhdr0200();
    DlIteratePhdr0300();
    DlIteratePhdr0600();
    system("rm -rf /data/libtest.so");
    exit(EXIT_SUCCESS);
    return T_STATUS;
}

int DlIteratePhdrTest(void)
{
    static char libcProg[] = "libc_test";
    char* libcArgv[] = { libcProg, nullptr };
    return DlIteratePhdrTestWithArgs(1, libcArgv);
}

int DlIteratePhdrTestCompat(void)
{
    return DlIteratePhdrTest();
}
