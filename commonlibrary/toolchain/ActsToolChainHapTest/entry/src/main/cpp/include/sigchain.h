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

#ifndef SIGCHAIN_H
#define SIGCHAIN_H

#include <signal.h>
#include <stdbool.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

static const int SIGCHAIN_ALLOW_NORETURN = 0x1UL;

/* The Action of the sigchain. */
struct SignalChainAction {
    bool (*sca_sigaction)(int, siginfo_t*, void*);
    sigset_t scaMask;
    int scaFlags;
};
#define SIGNAL_CHAIN_ACTION SignalChainAction

/* Mark the signal to the sigchain, add the special handler to the sigchain. */
static inline void AddSpecialSignalHandler(int signo, struct SignalChainAction* sa)
{
    (void)signo;
    (void)sa;
}
/* Add the special handler at the last of sigchain chains */
static inline void AddSpecialHandlerAtLast(int signo, struct SignalChainAction* sa)
{
    (void)signo;
    (void)sa;
}
/* Remove the special the handler from the sigchain. */
static inline void RemoveSpecialSignalHandler(int signo, bool (*fn)(int, siginfo_t*, void*))
{
    (void)signo;
    (void)fn;
}
/* Remove all special the handler from the sigchain */
static inline void RemoveAllSpecialHandler(int signo)
{
    (void)signo;
}
/* Set the pre_validation_ignore flag to control whether to validate SIG_IGN before calling user handler */
static inline void SetSigchainPreValidationIgnore(int value)
{
    (void)value;
}

#ifdef __cplusplus
}
#endif

#endif