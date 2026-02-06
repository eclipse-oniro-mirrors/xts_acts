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

#ifndef LOG_H
#define LOG_H

#include <hilog/log.h>

#ifdef LOG_DOMAIN
#undef LOG_DOMAIN
#endif

#ifdef LOG_TAG
#undef LOG_TAG
#endif

#define LOG_DOMAIN 0x0001
#define LOG_TAG "NNRtTest"

// Undefine system macros to redefine them
#ifdef OH_LOG_DEBUG
#undef OH_LOG_DEBUG
#endif
#ifdef OH_LOG_INFO
#undef OH_LOG_INFO
#endif
#ifdef OH_LOG_WARN
#undef OH_LOG_WARN
#endif
#ifdef OH_LOG_ERROR
#undef OH_LOG_ERROR
#endif
#ifdef OH_LOG_FATAL
#undef OH_LOG_FATAL
#endif

// Redefine macros to use LOG_TAG instead of accepting tag parameter
#define OH_LOG_DEBUG(type, ...) ((void)OH_LOG_Print((type), LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define OH_LOG_INFO(type, ...) ((void)OH_LOG_Print((type), LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define OH_LOG_WARN(type, ...) ((void)OH_LOG_Print((type), LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define OH_LOG_ERROR(type, ...) ((void)OH_LOG_Print((type), LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define OH_LOG_FATAL(type, ...) ((void)OH_LOG_Print((type), LOG_FATAL, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

#endif // LOG_H
