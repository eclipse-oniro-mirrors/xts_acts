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

/*
 * Wrapper header for musl internal atomic implementation.
 *
 * `src/internal/atomic.h` expects a sibling `atomic_arch.h` (with quotes).
 * Since we compile for different OHOS targets (x86_64/aarch64), we select
 * the correct arch-specific implementation via preprocessor macros.
 */

#ifndef ATOMIC_ARCH_H
#define ATOMIC_ARCH_H

#if defined(__aarch64__) || defined(__arm64__) || defined(_M_ARM64)
// aarch64 target
#include "atomic_arch_aarch64.h"
#elif defined(__x86_64__) || defined(_M_X64)
// x86_64 target
#include "atomic_arch_x86_64.h"
#else
#error "Unsupported target architecture for musl internal atomic."
#endif

#endif // ATOMIC_ARCH_H
