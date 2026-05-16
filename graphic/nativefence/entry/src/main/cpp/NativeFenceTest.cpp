/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <native_fence/native_fence.h>

#include <chrono>
#include <cstring>
#include <cerrno>
#include <fcntl.h>
#include <iostream>
#include <csignal>
#include <sys/ioctl.h>
#include <sys/signalfd.h>
#include <thread>
#include <unistd.h>
#include "common/log_common.h"

#define SUCCESS 0
#define FAIL (-1)

constexpr int INVALID_FD = -1;
constexpr uint32_t TIMEOUT_ZE = 0;
constexpr uint32_t TIMEOUT_FH = 500;
constexpr uint32_t TIMEOUT_FT = 5000;

static napi_value NativeFenceWaitIs0(napi_env env, napi_callback_info info)
{
    napi_value res = nullptr;
    bool result = OH_NativeFence_Wait(INVALID_FD, TIMEOUT_FT);
    if (result) {
        napi_create_int32(env, FAIL, &res); // 1 Mark the incorrect location
        return res;
    }
    bool isValid = OH_NativeFence_IsValid(INVALID_FD);
    if (isValid) {
        napi_create_int32(env, FAIL, &res); // 2 Mark the incorrect location
        return res;
    }
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT); // Monitor SIGINT signal (Ctrl C)
    sigaddset(&mask, SIGURG); // Monitor SIGURG signal (Emergency event)
    sigprocmask(SIG_BLOCK, &mask, nullptr);
    int sfd = signalfd(-1, &mask, 0);
    if (sfd == -1) {
        perror("signalfd failed");
        exit(1);
    }
    isValid = OH_NativeFence_IsValid(sfd);
    if (!isValid) {
        napi_create_int32(env, FAIL, &res); // 3 Mark the incorrect location
        return res;
    }
    bool result2 = false;
    result2 = OH_NativeFence_Wait(sfd, TIMEOUT_ZE);
    if (result2) {
        napi_create_int32(env, FAIL, &res); // 4 Mark the incorrect location
        return res;
    }
    OH_NativeFence_Close(sfd);
    napi_create_int32(env, true, &res);
    return res;
}

static napi_value NativeFenceWaitIs500(napi_env env, napi_callback_info info)
{
    napi_value res = nullptr;
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT); // Monitor SIGINT signal (Ctrl C)
    sigaddset(&mask, SIGURG); // Monitor SIGURG signal (Emergency event)
    sigprocmask(SIG_BLOCK, &mask, nullptr);
    int sfd = signalfd(-1, &mask, 0);
    if (sfd == -1) {
        perror("signalfd failed");
        exit(1);
    }
    bool isValid = OH_NativeFence_IsValid(sfd);
    if (!isValid) {
        napi_create_int32(env, FAIL, &res); // 1 Mark the incorrect location
        return res;
    }
    bool result2 = false;
    result2 = OH_NativeFence_Wait(sfd, TIMEOUT_FH);
    if (result2) {
        napi_create_int32(env, FAIL, &res); // 2 Mark the incorrect location
        return res;
    }
    OH_NativeFence_Close(sfd);
    napi_create_int32(env, true, &res);
    return res;
}

static napi_value NativeFenceWaitIs5000(napi_env env, napi_callback_info info)
{
    napi_value res = nullptr;
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT); // Monitor SIGINT signal (Ctrl C)
    sigaddset(&mask, SIGURG); // Monitor SIGURG signal (Emergency event)
    sigprocmask(SIG_BLOCK, &mask, nullptr);
    int sfd = signalfd(-1, &mask, 0);
    if (sfd == -1) {
        perror("signalfd failed");
        exit(1);
    }
    bool isValid = OH_NativeFence_IsValid(sfd);
    if (!isValid) {
        napi_create_int32(env, FAIL, &res); // 1 Mark the incorrect location
        return res;
    }
    bool result2 = false;
    result2 = OH_NativeFence_Wait(sfd, TIMEOUT_FT);
    if (result2) {
        napi_create_int32(env, FAIL, &res); // 2 Mark the incorrect location
        return res;
    }
    OH_NativeFence_Close(sfd);
    napi_create_int32(env, true, &res);
    return res;
}

static napi_value NativeFenceWaitKill(napi_env env, napi_callback_info info)
{
    napi_value res = nullptr;
    std::atomic<bool> signaled(false);
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT); // Monitor SIGINT signal (Ctrl C)
    sigaddset(&mask, SIGURG); // Monitor SIGURG signal (Emergency event)
    sigprocmask(SIG_BLOCK, &mask, nullptr);
    int sfd = signalfd(-1, &mask, 0);
    if (sfd == -1) {
        perror("signalfd failed");
        exit(1);
    }
    bool result = false;
    std::thread waitThread([&result, sfd, &signaled]() {
        result = OH_NativeFence_Wait(sfd, TIMEOUT_FT);
        signaled.store(true);
    });
    std::this_thread::sleep_for(std::chrono::seconds(3)); // 3 means main thread sleep 3 seconds.
    pthread_kill(waitThread.native_handle(), SIGURG);
    // Waiting for waitThread to complete
    waitThread.join();
    bool isValid = OH_NativeFence_IsValid(sfd);
    if (!isValid) {
        napi_create_int32(env, FAIL, &res); // 1 Mark the incorrect location
        return res;
    }
    if (!result) {
        napi_create_int32(env, FAIL, &res); // 2 Mark the incorrect location
        return res;
    }
    // checks the signaled variable to ensure that OH_NativeFence_Wait has returned
    if (!signaled.load()) {
        napi_create_int32(env, FAIL, &res);
        return res;
    }
    OH_NativeFence_Close(sfd);
    napi_create_int32(env, true, &res);
    return res;
}

static napi_value NativeFenceWaitForeverKill(napi_env env, napi_callback_info info)
{
    napi_value res = nullptr;
    bool result = OH_NativeFence_WaitForever(INVALID_FD);
    if (result) {
        napi_create_int32(env, FAIL, &res); // 1 Mark the incorrect location
        return res;
    }
    std::atomic<bool> signaled(false);
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT); // Monitor SIGINT signal (Ctrl C)
    sigaddset(&mask, SIGTTIN); // Monitor SIGURG signal (The background job reads data from the user terminal)
    sigprocmask(SIG_BLOCK, &mask, nullptr);
    int sfd = signalfd(-1, &mask, 0);
    if (sfd == -1) {
        perror("signalfd failed");
        exit(1);
    }
    bool result2 = false;
    std::thread waitThread([&result2, sfd, &signaled]() {
        result2 = OH_NativeFence_WaitForever(sfd);
        signaled.store(true);
    });
    std::this_thread::sleep_for(std::chrono::seconds(3)); // 3 means main thread sleep 3 seconds.
    pthread_kill(waitThread.native_handle(), SIGTTIN);
    // Waiting for waitThread to complete
    waitThread.join();
    if (!result2) {
        napi_create_int32(env, FAIL, &res); // 1 Mark the incorrect location
        return res;
        }
    bool isValid = OH_NativeFence_IsValid(sfd);
    if (!isValid) {
        napi_create_int32(env, FAIL, &res); // 2 Mark the incorrect location
        return res;
    }
    // checks the signaled variable to ensure that OH_NativeFence_Wait has returned
    if (!signaled.load()) {
        napi_create_int32(env, FAIL, &res);
        return res;
    }
    OH_NativeFence_Close(sfd);
    napi_create_int32(env, true, &res);
    return res;
}

// EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "nativeFenceWaitIs0", nullptr, NativeFenceWaitIs0, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nativeFenceWaitIs500", nullptr, NativeFenceWaitIs500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nativeFenceWaitIs5000", nullptr, NativeFenceWaitIs5000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nativeFenceWaitKill", nullptr, NativeFenceWaitKill, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nativeFenceWaitForeverKill", nullptr,
            NativeFenceWaitForeverKill, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
// EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativefence",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}