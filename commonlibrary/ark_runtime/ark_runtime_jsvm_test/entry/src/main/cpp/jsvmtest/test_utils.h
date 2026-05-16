/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifndef TEST_UTIL_H
#define TEST_UTIL_H
#include <csignal>
#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <string>

#if defined(OHOS_JSVM_HAP)

#include <hilog/log.h>

#ifndef LOG_DOMAIN
#define LOG_DEMAIN 0x0202
#endif

#ifndef LOG_TAG
#define LOG_TAG "JSVMTEST_TAG"
#endif

#endif  // OHOS_JSVM_HAP

void Print(const char *str);
void FatalError();
void PrintErrorMessage(const std::string &cond, const std::string &file, unsigned int line, const char *fmt, ...);

#define CHECK_FATAL(cond, fmt, ...)                                                \
    do {                                                                           \
        if (!(cond)) {                                                             \
            PrintErrorMessage(#cond, __FILE__, __LINE__, fmt "\n", ##__VA_ARGS__); \
            FatalError();                                                          \
        }                                                                          \
    } while (0)

#define CHECK(cond) CHECK_FATAL(cond, "must be")
#endif
