/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <csignal>
#include <cstdlib>
#include <pthread.h>
#include <sigchain.h>
#include <sys/wait.h>
#include <unistd.h>
#include "functionalext.h"
#include "sigchain_util.h"
#include "test.h"

static int g_specialHandlerCount = 0;
static pthread_t g_mainThreadId;
constexpr int THREAD_SIGNAL_COUNT = 50;
constexpr int PROCESS_SIGNAL_COUNT = 100;
constexpr useconds_t SLEEP_US = 1000;

/**
 * @brief the special handler for SIGPIPE
 */
static bool SpecialHandlerSigpipe(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_specialHandlerCount++;
    EXPECT_EQ("sigchain_set_pre_validation_ignore_thread", signo, SIGPIPE);
    return false;
}

/**
 * @brief Thread function to send SIGPIPE to main thread
 */
static void* ThreadFunc(void* arg)
{
    for (int i = 0; i < THREAD_SIGNAL_COUNT; i++) {
        pthread_kill(g_mainThreadId, SIGPIPE);
        usleep(SLEEP_US);
    }
    return nullptr;
}

/**
 * @tc.name      : sigchain_set_pre_validation_ignore_thread_001
 * @tc.desc      : Test multi-threaded SIGPIPE handling with pre_validation_ignore enabled (1)
 *                 Child process raises SIGPIPE 100 times, new thread sends 50 SIGPIPE to main thread.
 *                 Expected: child process exits normally.
 * @tc.level     : Level 0
 */
static void SigchainSetPreValidationIgnoreThread001()
{
    pid_t pid = fork();
    if (pid < 0) {
        EXPECT_EQ("sigchain_set_pre_validation_ignore_thread_001 fork", pid, 0);
        return;
    }

    if (pid == 0) {
        g_specialHandlerCount = 0;
        g_mainThreadId = pthread_self();

        SetSigchainPreValidationIgnore(1);

        struct SIGNAL_CHAIN_ACTION sigpipe = {
            .sca_sigaction = SpecialHandlerSigpipe,
            .scaMask = {},
            .scaFlags = 0,
        };
        AddSpecialSignalHandler(SIGPIPE, &sigpipe);

        struct sigaction sigac = {
            .sa_handler = SIG_IGN,
            .sa_flags = SA_SIGINFO,
        };
        sigemptyset(&sigac.sa_mask);
        sigaction(SIGPIPE, &sigac, nullptr);

        pthread_t thread;
        if (pthread_create(&thread, nullptr, ThreadFunc, nullptr) != 0) {
            exit(1);
        }

        for (int i = 0; i < PROCESS_SIGNAL_COUNT; i++) {
            raise(SIGPIPE);
            usleep(SLEEP_US);
        }

        pthread_join(thread, nullptr);

        if (g_specialHandlerCount >= PROCESS_SIGNAL_COUNT) {
            exit(0);
        } else {
            exit(1);
        }
    }

    int status;
    waitpid(pid, &status, 0);

    int exitCode = 0;
    if (WIFEXITED(status)) {
        exitCode = WEXITSTATUS(status);
    }

    EXPECT_EQ("sigchain_set_pre_validation_ignore_thread_001", exitCode, 0);
    EXPECT_TRUE("sigchain_set_pre_validation_ignore_thread_001", WIFEXITED(status));

    SetSigchainPreValidationIgnore(0);
}

static int SigchainSetPreValidationIgnoreThreadTestTestImpl(void)
{
    SigchainSetPreValidationIgnoreThread001();
    return T_STATUS;
}

int SigchainSetPreValidationIgnoreThreadTestTest(void)
{
    return SigchainSetPreValidationIgnoreThreadTestTestImpl();
}
