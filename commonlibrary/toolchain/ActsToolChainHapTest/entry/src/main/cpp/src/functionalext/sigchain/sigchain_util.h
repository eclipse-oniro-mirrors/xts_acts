#ifndef SIGCHAIN_UTIL_H
#define SIGCHAIN_UTIL_H

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

/*
 * SIG_BLOCK: Mask the signal according to the mask word provided by parameter set.
 * And save the original signal mask to oldset
 */
#define SIGCHAIN_TEST_SET_MASK(set, fun, signo, num)            \
    do {                                                        \
        int sigchainNum = (num);                                \
        sigset_t* sigchainSet = &(set);                         \
        int result = sigemptyset(sigchainSet);                  \
        if (result != 0) {                                      \
            EXPECT_FALSE(fun, true);                            \
        }                                                       \
        for (int i = 0; i < sigchainNum; i++) {                 \
            result = sigaddset(sigchainSet, (signo)[i]);        \
            if (result != 0) {                                  \
                EXPECT_FALSE(fun, true);                        \
            }                                                   \
        }                                                       \
        result = pthread_sigmask(SIG_BLOCK, sigchainSet, NULL); \
        if (result != 0) {                                      \
            EXPECT_FALSE(fun, true);                            \
        }                                                       \
    } while (0)

#define SIGCHIAN_TEST_SIGNAL_NUM_1 1
#define SIGCHIAN_TEST_SIGNAL_NUM_2 2
#define SIGCHIAN_TEST_SIGNAL_NUM_3 3
#define SIGCHIAN_TEST_SIGNAL_NUM_4 4

#define SIGCHAIN_SIGNAL_37 37
#define SIGCHAIN_SIGNAL_43 43
#define SIGCHAIN_SIGNAL_45 45
#define SIGCHAIN_SIGNAL_56 56
#define SIGCHAIN_SIGNAL_64 64

inline bool GetSigchainMaskEnable()
{
#ifdef OHOS_ENABLE_PARAMETER
    static CachedHandle sigchain_procmask_handle = NULL;
    if (sigchain_procmask_handle == NULL) {
        sigchain_procmask_handle = CachedParameterCreate(param_name, "false");
    }
    char* param_value = CachedParameterGet(sigchain_procmask_handle);
    if (param_value != NULL) {
        if (strcmp(param_value, "true") == 0) {
            return true;
        }
    }
#endif
    return false;
}

#define get_sigchain_mask_enable GetSigchainMaskEnable

#endif