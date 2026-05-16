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

#ifndef MUSL_HILOG_ADAPTER_H
#define MUSL_HILOG_ADAPTER_H

#include <features.h>
#include <log_base.h>
#include <stdarg.h>
#include <stdbool.h>

#ifndef HIDDEN
#define HIDDEN __attribute__((visibility("HIDDEN")))
#endif

HIDDEN bool CheckHilogValid();
// Dangerous operation, please do not use in normal business
HIDDEN void RefreshHiLogSocketFd();

HIDDEN void InitHilogSocketFd();

HIDDEN int HiLogAdapterPrint(LogType type, LogLevel level, unsigned int domain, const char* tag, const char* fmt, ...)
    __attribute__((__format__(os_log, 5, 6)));

typedef struct HiLogAdapterPrintArgsParams {
    LogType type;
    LogLevel level;
    unsigned int domain;
    const char* tag;
    const char* fmt;
} HiLogAdapterPrintArgsParams;

typedef struct HiLogAdapterVaListParams {
    LogType type;
    LogLevel level;
    unsigned int domain;
    const char* tag;
    const char* fmt;
} HiLogAdapterVaListParams;

HIDDEN int HiLogAdapterPrintArgs(const HiLogAdapterPrintArgsParams* params, va_list ap);
HIDDEN int HiLogAdapterVaList(const HiLogAdapterVaListParams* params, va_list ap);

HIDDEN bool HiLogAdapterIsLoggable(unsigned int domain, const char* tag, LogLevel level);

#ifdef OHOS_ENABLE_PARAMETER
#include "sys_param.h"
HIDDEN bool get_bool_sysparam(CachedHandle cachedhandle);
#endif

HIDDEN bool IsMuslLogEnable();
HIDDEN void MuslLogReset();

#endif // MUSL_HILOG_ADAPTER_H
