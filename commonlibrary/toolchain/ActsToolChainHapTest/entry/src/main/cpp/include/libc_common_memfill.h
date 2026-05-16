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

#pragma once

// Minimal declarations copied from musl libc-test common helpers.
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif
int TVmfill(void** p, size_t* n, int len);
int TSetrlim(int r, long lim);
int TMemfill();
#ifdef __cplusplus
}
#endif
#ifndef T_MEMFILL
#define T_MEMFILL TMemfill
#endif
