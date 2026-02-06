/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#ifndef AUDIO_SUITE_BASE_TEST_H
#define AUDIO_SUITE_BASE_TEST_H
#include "ohaudiosuite/native_audio_suite_base.h"
#include "ohaudiosuite/native_audio_suite_engine.h"
#include "hilog/log.h"
#include "AudioSuiteEngineCommon.h"

#define AUIDIO_SUITE_LOG_TAG "SUDIO_SUITE_TAGLOG"
#define AUDIO_SUITE_LOG_DOMAIN 0x4310

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, AUDIO_SUITE_LOG_DOMAIN, AUIDIO_SUITE_LOG_TAG, \
fmt, ##__VA_ARGS__)

OH_AudioSuite_Result CreateAudioSuiteEngine();
#endif // AUDIO_SUITE_BASE_TEST_H