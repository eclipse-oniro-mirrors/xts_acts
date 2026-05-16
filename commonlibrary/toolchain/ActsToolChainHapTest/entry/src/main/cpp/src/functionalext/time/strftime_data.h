/**
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

#ifndef __STRFTIME_DATA_H__
#define __STRFTIME_DATA_H__

#include "time_test_data.h"

/* Keep a small dataset to avoid missing-header build failures. */
inline constexpr struct time_test_string_struct TEST_STRFTIME_DATA[] = {
    { "Europe/Madrid", "Sat Jul 30 12:40:14 2022 CEST+0200" },
    { "Europe/Astrakhan", "Sat Jul 30 14:40:14 2022 +04+0400" },
    { "Europe/Kaliningrad", "Sat Jul 30 12:40:14 2022 EET+0200" },
    { "Europe/Moscow", "Sat Jul 30 13:40:14 2022 MSK+0300" },
    { "Europe/Samara", "Sat Jul 30 14:40:14 2022 +04+0400" },
    { "Europe/Ulyanovsk", "Sat Jul 30 14:40:14 2022 +04+0400" },
    { "Europe/Berlin", "Sat Jul 30 12:40:14 2022 CEST+0200" },
    { "Europe/Bucharest", "Sat Jul 30 13:40:14 2022 EEST+0300" },
    { "Europe/Paris", "Sat Jul 30 12:40:14 2022 CEST+0200" },
    { "Europe/Sofia", "Sat Jul 30 13:40:14 2022 EEST+0300" },
    { "Europe/Warsaw", "Sat Jul 30 12:40:14 2022 CEST+0200" },
    { "Europe/London", "Sat Jul 30 11:40:14 2022 BST+0100" },
    { "Europe/Belgrade", "Sat Jul 30 12:40:14 2022 CEST+0200" },
    { "Europe/Volgograd", "Sat Jul 30 13:40:14 2022 MSK+0300" },
    { "Europe/Rome", "Sat Jul 30 12:40:14 2022 CEST+0200" },
};


#define test_strftime_data TEST_STRFTIME_DATA
#endif
