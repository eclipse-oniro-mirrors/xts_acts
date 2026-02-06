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

#include "include/AudioSuiteBaseTest.h"

OH_AudioSuite_Result CreateAudioSuiteEngine()
{
    OH_AudioSuiteEngine* audioSuiteEngine = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    if (result != AUDIOSUITE_SUCCESS) {
        LOG("OH_AudioSuiteEngine_Create failed, result is: %{public}d", result);
    }
    LOG("OH_AudioSuiteEngine_Create, result is: %{public}d", result);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return result;
}