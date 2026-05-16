/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#ifndef DSO_SYMVER_H
#define DSO_SYMVER_H

#include <cstdio>
#include <cstring>

#include "test.h"

extern const char *DSO_SYMBOL_INVALID;
extern const char *DSO_VERSION_INVALID;

extern const char *DSO_NO_SYMVER_NAME;
extern const char *DSO_NO_SYMVER_SYMBOL;

extern const char *DSO_EASY_SYMVER_NAME;
extern const char *DSO_EASY_SYMVER_SYMBOL;
extern const char *DSO_EASY_SYMVER_SYMBOL_OLD;
extern const char *DSO_EASY_SYMVER_SYMBOL_STABLE;
extern const char *DSO_EASY_SYMVER_SYMBOL_DEV;
extern const char *DSO_EASY_SYMVER_VERSION_OLD;
extern const char *DSO_EASY_SYMVER_VERSION_STABLE;
extern const char *DSO_EASY_SYMVER_VERSION_DEV;

extern const char *DSO_HARD_SYMVER_NAME;
extern const char *DSO_HARD_SYMVER_IF_SYMBOL;
extern const char *DSO_HARD_SYMVER_IF_SYMBOL_OLD;
extern const char *DSO_HARD_SYMVER_IF_SYMBOL_STABLE;
extern const char *DSO_HARD_SYMVER_IF_SYMBOL_DEV;
extern const char *DSO_HARD_SYMVER_LD_SYMBOL;
extern const char *DSO_HARD_SYMVER_LD_SYMBOL_OLD;
extern const char *DSO_HARD_SYMVER_LD_SYMBOL_STABLE;
extern const char *DSO_HARD_SYMVER_LD_SYMBOL_DEV;
extern const char *DSO_HARD_SYMVER_VERSION_OLD;
extern const char *DSO_HARD_SYMVER_VERSION_STABLE;
extern const char *DSO_HARD_SYMVER_VERSION_DEV;

typedef char *(*functype)(void);

#define SYMVER_DEBUG
#ifdef SYMVER_DEBUG

#define __FILENAME__ (__builtin_strrchr(__FILE__, '/') ? __builtin_strrchr(__FILE__, '/') + 1 : __FILE__)
#define symver_log(fmt, ...)                                                                  \
    do {                                                                                      \
        printf("[%s:%4d][%s]" fmt "\n", __FILENAME__, __LINE__, __FUNCTION__, ##__VA_ARGS__); \
    } while (0)

#else  // SYMVER_DEBUG

#define symver_log(fmt, ...)

#endif  // SYMVER_DEBUG

#define symver_error(fmt, ...)                                        \
    do {                                                              \
        t_error("%s failed: " fmt "\n", __FUNCTION__, ##__VA_ARGS__); \
    } while (0)

#define symver_streq(s1, s2)                                                \
    do {                                                                    \
        if (strcmp(s1, s2)) {                                               \
            t_error("%s failed: s1 = %s, s2 = %s\n", __FUNCTION__, s1, s2); \
        }                                                                   \
    } while (0)

#endif
