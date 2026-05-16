/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef TEST_H_H
#define TEST_H_H

//
// Created on 2026/3/20.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <unistd.h>

#ifdef __cplusplus
extern "C" {
#endif

extern volatile int g_tStatus;
#define T_STATUS g_tStatus
#ifndef FILE_ABSOLUTE_PATH
#define FILE_ABSOLUTE_PATH(src, dst)                     \
    do {                                                 \
        (void)snprintf((dst), sizeof(dst), "%s", (src)); \
    } while (0)
#endif
#ifndef T_MEMFILL
#define T_MEMFILL TMemfill
#endif

#define T_LOC2(l) __FILE__ ":" #l
#define T_LOC1(l) T_LOC2(l)
#define t_error(...) TPrintf(T_LOC1(__LINE__) ": " __VA_ARGS__)
#define t_printf(...) TPrintf(__VA_ARGS__)

int TPrintf(const char* s, ...);
int TMemfill(void);
char *t_pathrel(char *buf, size_t n, char *argv0, char *p);

void TFdfill(void);

#define CLOCK_GETTIME64 clock_gettime

#ifdef __cplusplus
}
#endif

#endif // TEST_H_H
