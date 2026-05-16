/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <cstdlib>
#include <cwchar>
#include <sigchain.h>
#include "functionalext.h"
#include "sigchain_util.h"
#include "test.h"

static int g_count = 0;
/**
 * @brief the special handler
 */
static bool sigchain_special_sigabrt_handler1(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmSpecialHandler001", true);
    return false;
}

/**
 * @brief the special handler
 */
static bool sigchain_special_sigabrt_handler2(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmSpecialHandler001", true);
    return true;
}

/**
 * @tc.name      : SigchainRmSpecialHandler001
 * @tc.desc      : The signal is not registered with the kernel, call RemoveSpecialSignalHandler to remove
 *                 two special handlers
 * @tc.level     : Level 0
 */
static void SigchainRmSpecialHandler001()
{
    struct SIGNAL_CHAIN_ACTION sigcont = {
        .sca_sigaction = sigchain_special_sigabrt_handler1,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGCONT, &sigcont);

    struct SIGNAL_CHAIN_ACTION sigcont1 = {
        .sca_sigaction = sigchain_special_sigabrt_handler2,
        .scaMask = {},
        .scaFlags = SIGCHAIN_ALLOW_NORETURN,
    };
    AddSpecialSignalHandler(SIGCONT, &sigcont1);

    if (get_sigchain_mask_enable()) {
        sigset_t set = { 0 };
        int signo[SIGCHIAN_TEST_SIGNAL_NUM_1] = { SIGCONT };
        SIGCHAIN_TEST_SET_MASK(set, "SigchainRmSpecialHandler001", signo, SIGCHIAN_TEST_SIGNAL_NUM_1);
    }
    RemoveSpecialSignalHandler(SIGCONT, sigchain_special_sigabrt_handler1);
    RemoveSpecialSignalHandler(SIGCONT, sigchain_special_sigabrt_handler2);

    raise(SIGCONT);
    EXPECT_EQ("SigchainRmSpecialHandler001", g_count, 0);
}

/**
 * @brief the special handler
 */
static bool sigchain_special_sighup_handler1(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmSpecialHandler002", true);
    return false;
}

/**
 * @brief the special handler
 */
static bool sigchain_special_sighup_handler2(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmSpecialHandler002", true);
    return false;
}

/**
 * @brief the signal handler
 */
static void SignalSighupHandler(int signo)
{
    g_count++;
    EXPECT_EQ("SigchainRmSpecialHandler002", signo, SIGHUP);
}

/**
 * @tc.name      : SigchainRmSpecialHandler002
 * @tc.desc      : The signal is registered with the kernel(Using signal), call
 *                 RemoveSpecialSignalHandler to remove two special handlers
 * @tc.level     : Level 0
 */
static void SigchainRmSpecialHandler002()
{
    g_count = 0;
    signal(SIGHUP, SignalSighupHandler);

    struct SIGNAL_CHAIN_ACTION sighup = {
        .sca_sigaction = sigchain_special_sighup_handler1,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGHUP, &sighup);

    struct SIGNAL_CHAIN_ACTION sighup1 = {
        .sca_sigaction = sigchain_special_sighup_handler2,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGHUP, &sighup1);

    if (get_sigchain_mask_enable()) {
        sigset_t set = { 0 };
        int signo[SIGCHIAN_TEST_SIGNAL_NUM_1] = { SIGHUP };
        SIGCHAIN_TEST_SET_MASK(set, "SigchainRmSpecialHandler002", signo, SIGCHIAN_TEST_SIGNAL_NUM_1);
    }
    RemoveSpecialSignalHandler(SIGHUP, sigchain_special_sighup_handler1);
    RemoveSpecialSignalHandler(SIGHUP, sigchain_special_sighup_handler2);

    raise(SIGHUP);
    EXPECT_EQ("SigchainRmSpecialHandler002", g_count, SIGCHIAN_TEST_SIGNAL_NUM_1);
}

/**
 * @brief the special handler
 */
static bool sigchain_special_sigusr2_handler1(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmSpecialHandler003", true);
    return false;
}

/**
 * @brief the special handler
 */
static bool sigchain_special_sigusr2_handler2(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmSpecialHandler003", true);
    return false;
}

/**
 * @brief the signal handler
 */
static void SignalSigusr2Sigaction(int signo)
{
    g_count++;
    EXPECT_EQ("SigchainRmSpecialHandler003", signo, SIGUSR2);
}

/**
 * @tc.name      : SigchainRmSpecialHandler003
 * @tc.desc      : The signal is registered with the kernel(Using sigaction), call
 *                 RemoveSpecialSignalHandler to remove two special handlers
 * @tc.level     : Level 0
 */
static void SigchainRmSpecialHandler003()
{
    g_count = 0;
    struct sigaction sigac = {
        .sa_handler = SignalSigusr2Sigaction,
    };
    sigaction(SIGUSR2, &sigac, NULL);

    struct SIGNAL_CHAIN_ACTION sigusr2 = {
        .sca_sigaction = sigchain_special_sigusr2_handler1,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGUSR2, &sigusr2);

    struct SIGNAL_CHAIN_ACTION sigusr21 = {
        .sca_sigaction = sigchain_special_sigusr2_handler2,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGUSR2, &sigusr21);

    if (get_sigchain_mask_enable()) {
        sigset_t set = { 0 };
        int signo[SIGCHIAN_TEST_SIGNAL_NUM_1] = { SIGUSR2 };
        SIGCHAIN_TEST_SET_MASK(set, "SigchainRmSpecialHandler003", signo, SIGCHIAN_TEST_SIGNAL_NUM_1);
    }

    RemoveSpecialSignalHandler(SIGUSR2, sigchain_special_sigusr2_handler1);
    RemoveSpecialSignalHandler(SIGUSR2, sigchain_special_sigusr2_handler2);
    raise(SIGUSR2);
    EXPECT_EQ("SigchainRmSpecialHandler003", g_count, SIGCHIAN_TEST_SIGNAL_NUM_1);
}

/**
 * @brief the special handler
 */
static bool sigchain_special_sigterm_handler(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmSpecialHandler004", true);
    return true;
}

/**
 * @tc.name      : SigchainRmSpecialHandler004
 * @tc.desc      : The signal is not registered with the kernel, call RemoveSpecialSignalHandler to remove
 *                 a special handler.
 * @tc.level     : Level 0
 */
static void SigchainRmSpecialHandler004()
{
    g_count = 0;
    struct SIGNAL_CHAIN_ACTION sigcont = {
        .sca_sigaction = sigchain_special_sigterm_handler,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGCONT, &sigcont);

    if (get_sigchain_mask_enable()) {
        sigset_t set = { 0 };
        int signo[SIGCHIAN_TEST_SIGNAL_NUM_1] = { SIGCONT };
        SIGCHAIN_TEST_SET_MASK(set, "SigchainRmSpecialHandler004", signo, SIGCHIAN_TEST_SIGNAL_NUM_1);
    }
    RemoveSpecialSignalHandler(SIGCONT, sigchain_special_sigterm_handler);

    raise(SIGCONT);
    EXPECT_EQ("SigchainRmSpecialHandler004", g_count, 0);
}

/**
 * @brief the special handler
 */
static bool sigchain_special_64_handler(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    EXPECT_FALSE("SigchainRmSpecialHandler005", true);
    g_count++;
    return false;
}

/**
 * @brief the signal handler
 */
static void Signal64Handler(int signo)
{
    g_count++;
    EXPECT_EQ("SigchainRmSpecialHandler005", signo, SIGCHAIN_SIGNAL_64);
}

/**
 * @tc.name      : SigchainRmSpecialHandler005
 * @tc.desc      : The signal is registered with the kernel(Using signal), call RemoveSpecialSignalHandler to remove
 *                 a special handler.
 * @tc.level     : Level 0
 */
static void SigchainRmSpecialHandler005()
{
    g_count = 0;
    signal(SIGCHAIN_SIGNAL_64, Signal64Handler);

    struct SIGNAL_CHAIN_ACTION sighup = {
        .sca_sigaction = sigchain_special_64_handler,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGCHAIN_SIGNAL_64, &sighup);

    if (get_sigchain_mask_enable()) {
        sigset_t set = { 0 };
        int signo[SIGCHIAN_TEST_SIGNAL_NUM_1] = { SIGCHAIN_SIGNAL_64 };
        SIGCHAIN_TEST_SET_MASK(set, "SigchainRmSpecialHandler005", signo, SIGCHIAN_TEST_SIGNAL_NUM_1);
    }
    RemoveSpecialSignalHandler(SIGCHAIN_SIGNAL_64, sigchain_special_64_handler);

    raise(SIGCHAIN_SIGNAL_64);
    EXPECT_EQ("SigchainRmSpecialHandler005", g_count, SIGCHIAN_TEST_SIGNAL_NUM_1);
}

/**
 * @brief the special handler
 */
static bool sigchain_special_37_handler(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmSpecialHandler006", true);
    return false;
}

/**
 * @brief the signal handler
 */
static void Signal37Sigaction(int signo)
{
    g_count++;
    EXPECT_EQ("SigchainRmSpecialHandler006", signo, SIGCHAIN_SIGNAL_37);
}

/**
 * @tc.name      : SigchainRmSpecialHandler006
 * @tc.desc      : The signal is registered with the kernel(Using sigaction), call RemoveSpecialSignalHandler
 *                 to remove a special handler.
 * @tc.level     : Level 0
 */
static void SigchainRmSpecialHandler006()
{
    g_count = 0;
    struct sigaction sigac = {
        .sa_handler = Signal37Sigaction,
    };
    sigaction(SIGCHAIN_SIGNAL_37, &sigac, NULL);

    struct SIGNAL_CHAIN_ACTION sig37 = {
        .sca_sigaction = sigchain_special_37_handler,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGCHAIN_SIGNAL_37, &sig37);

    if (get_sigchain_mask_enable()) {
        sigset_t set = { 0 };
        int signo[SIGCHIAN_TEST_SIGNAL_NUM_1] = { SIGCHAIN_SIGNAL_37 };
        SIGCHAIN_TEST_SET_MASK(set, "SigchainRmSpecialHandler006", signo, SIGCHIAN_TEST_SIGNAL_NUM_1);
    }
    RemoveSpecialSignalHandler(SIGCHAIN_SIGNAL_37, sigchain_special_37_handler);

    raise(SIGCHAIN_SIGNAL_37);
    EXPECT_EQ("SigchainRmSpecialHandler006", g_count, SIGCHIAN_TEST_SIGNAL_NUM_1);
}

/**
 * @brief the special handler
 */
static bool sigchain_special_quit_handler(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmAllSpecialHandler007", true);
    return false;
}

static bool sigchain_special_quit_handler1(int signo, siginfo_t* siginfo, void* ucontextRaw)
{
    g_count++;
    EXPECT_FALSE("SigchainRmAllSpecialHandler007", true);
    return false;
}

/**
 * @brief the signal handler
 */
static void SignalQuitSigaction(int signo)
{
    g_count++;
    EXPECT_EQ("SigchainRmAllSpecialHandler007", signo, SIGQUIT);
}

/**
 * @tc.name      : SigchainRmAllSpecialHandler007
 * @tc.desc      : The signal is registered with the kernel(Using sigaction), call RemoveSpecialSignalHandler
 *                 to remove a special handler.
 * @tc.level     : Level 0
 */
static void SigchainRmAllSpecialHandler007()
{
    g_count = 0;
    struct sigaction sigac = {
        .sa_handler = SignalQuitSigaction,
    };
    sigaction(SIGQUIT, &sigac, NULL);

    struct SIGNAL_CHAIN_ACTION sigquit = {
        .sca_sigaction = sigchain_special_quit_handler,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGQUIT, &sigquit);

    struct SIGNAL_CHAIN_ACTION sigquit1 = {
        .sca_sigaction = sigchain_special_quit_handler1,
        .scaMask = {},
        .scaFlags = 0,
    };
    AddSpecialSignalHandler(SIGQUIT, &sigquit1);

    if (get_sigchain_mask_enable()) {
        sigset_t set = { 0 };
        int signo[SIGCHIAN_TEST_SIGNAL_NUM_1] = { SIGQUIT };
        SIGCHAIN_TEST_SET_MASK(set, "SigchainRmAllSpecialHandler007", signo, SIGCHIAN_TEST_SIGNAL_NUM_1);
    }
    RemoveAllSpecialHandler(SIGQUIT);

    int raiseRet = raise(SIGQUIT);
    EXPECT_EQ("SigchainRmAllSpecialHandler007", raiseRet, 0);
    EXPECT_EQ("SigchainRmAllSpecialHandler007", g_count, SIGCHIAN_TEST_SIGNAL_NUM_1);
}

static int SigchainRmSpecialHandlerTestImpl(void)
{
    SigchainRmSpecialHandler001();
    SigchainRmSpecialHandler002();
    SigchainRmSpecialHandler003();
    SigchainRmSpecialHandler004();
    SigchainRmSpecialHandler005();
    SigchainRmSpecialHandler006();
    SigchainRmAllSpecialHandler007();
    return T_STATUS;
}

int SigchainRmSpecialHandlerTest(void)
{
    return SigchainRmSpecialHandlerTestImpl();
}
