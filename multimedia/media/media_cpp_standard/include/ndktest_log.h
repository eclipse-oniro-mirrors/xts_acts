/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#ifndef NDKTEST_LOG_H
#define NDKTEST_LOG_H

#include <stdio.h>

#define RET_FAIL (-1)
#define RET_OK   0

#define NDK_CHECK_AND_RETURN_RET_LOG(cond, ret, fmt, ...)       \
    do {                                                        \
        if (!(cond)) {                                          \
            (void)printf("%s\n", fmt, ##__VA_ARGS__);           \
            return ret;                                         \
        }                                                       \
    } while (0)

#define NDK_CHECK_AND_RETURN_LOG(cond, fmt, ...)                \
    do {                                                        \
        if (!(cond)) {                                          \
            (void)printf("%s\n", fmt, ##__VA_ARGS__);           \
            return;                                             \
        }                                                       \
    } while (0)

#define NDK_CHECK_AND_BREAK_LOG(cond, fmt, ...)                 \
        if (!(cond)) {                                          \
            (void)printf("%s\n", fmt, ##__VA_ARGS__);           \
            break;                                              \
        }

#define NDK_CHECK_AND_CONTINUE_LOG(cond, fmt, ...)              \
        if (!(cond)) {                                          \
            (void)printf("%s\n", fmt, ##__VA_ARGS__);           \
            continue;                                           \
        }

#define NDK_CHECK_AND_LOG(cond, fmt, ...)                       \
        if (!(cond)) {                                          \
            (void)printf("%s\n", fmt, ##__VA_ARGS__);           \
        }
#endif // NDKTEST_LOG_H