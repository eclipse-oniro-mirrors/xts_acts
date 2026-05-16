/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include <clocale>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <pthread.h>
#include <unistd.h>
#include "functionalext.h"

namespace {
constexpr uintptr_t K_SECOND_THREAD_ARG = 2U;
constexpr uintptr_t K_FIRST_THREAD_ARG = 1U;
} // namespace

void* LocaleconvThreadFunc(void* arg)
{
    struct lconv* p = localeconv();
    if (p == nullptr) {
        t_error("localeconv_multithread: thread %ld localeconv failed\n",
                static_cast<long>(reinterpret_cast<intptr_t>(arg)));
        return nullptr;
    }
    EXPECT_STREQ("localeconv_multithread", ".", p->decimal_point);
    EXPECT_STREQ("localeconv_multithread", "", p->thousands_sep);
    EXPECT_STREQ("localeconv_multithread", "", p->grouping);
    return nullptr;
}

static int LocaleconvMultithreadTestImpl()
{
    struct lconv* pconv = nullptr;
    pthread_t tid1;
    pthread_t tid2;
    (void)setlocale(LC_ALL, "C");
    (void)setlocale(LC_MONETARY, "C");
    if (pthread_create(&tid1, nullptr, LocaleconvThreadFunc, reinterpret_cast<void*>(K_FIRST_THREAD_ARG)) != 0) {
        t_error("localeconv_multithread: pthread_create tid1 failed\n");
        return -1;
    }

    void* secondThreadArg = reinterpret_cast<void*>(K_SECOND_THREAD_ARG);
    if (pthread_create(&tid2, nullptr, LocaleconvThreadFunc, secondThreadArg) != 0) {
        t_error("localeconv_multithread: pthread_create tid2 failed\n");
        return -1;
    }

    pthread_join(tid1, nullptr);
    pthread_join(tid2, nullptr);

    return T_STATUS;
}

int LocaleconvMultithreadTest(void)
{
    return LocaleconvMultithreadTestImpl();
}
