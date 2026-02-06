/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#ifndef AUDIO_OH_AUDIO_STREAM_BUILDER_UNIT_TEST_H
#define AUDIO_OH_AUDIO_STREAM_BUILDER_UNIT_TEST_H

#include <ohaudio/native_audiostreambuilder.h>

namespace OHOS {
namespace AudioStandard {

class OHAudioStreamBuilderUnitTest  {
public:
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp(void);
    void TearDown(void);
};

// Test function declarations
int OhAudioStreamBuilderCreate001();
int OhAudioStreamBuilderCreate002();
int OhAudioStreamBuilderDestroy001();
int OhAudioStreamBuilderSetParameter001();
int OhAudioStreamBuilderSetParameter002();
int OhAudioStreamBuilderSetParameter003();
int OhAudioStreamBuilderSetParameter004();
int OhAudioStreamBuilderSetParameter005();
int OhAudioStreamBuilderSetParameter006();
int OhAudioStreamBuilderSetParameter007();
int OhAudioStreamBuilderSetParameter008();
int OhAudioStreamBuilderSetParameter009();
int OhAudioStreamBuilderSetParameter010();
int OhAudioStreamBuilderSetParameter011();
int OhAudioStreamBuilderSetParameter012();
int OhAudioStreamBuilderSetParameter013();
int OhAudioStreamBuilderSetParameter014();
int OhAudioStreamBuilderSetParameter015();
int OhAudioStreamBuilderSetParameter016();
int OhAudioStreamBuilderSetParameter017();
int OhAudioStreamBuilderSetParameter018();
int OhAudioStreamBuilderSetParameter019();
int OhAudioStreamBuilderSetParameter020();
int OhAudioStreamBuilderSetRendererPrivacy001();
int OhAudioStreamBuilderSetRendererPrivacy002();
int OhAudioStreamBuilderSetRendererPrivacy003();
int OhAudioStreamBuilderSetSampleFormat001();
int OhAudioStreamBuilderSetSampleFormat002();
int OhAudioStreamBuilderSetSampleFormat003();
int OhAudioStreamBuilderSetSampleFormat004();
int OhAudioStreamBuilderSetSampleFormat005();
int OhAudioStreamBuilderSetLatencyMode001();
int OhAudioStreamBuilderSetCapturerInfo001();
int OhAudioStreamBuilderSetCapturerInfo002();
int OhAudioStreamBuilderSetRendererInfo001();
int OhAudioStreamBuilderSetRendererInfo002();
int OhAudioStreamBuilderSetRendererInfo003();
int OhAudioStreamBuilderSetChannelLayout001();
int OhAudioStreamBuilderSetWriteDataWithMetadataCallback001();
int OhAudioStreamBuilderSetInterruptMode001();
int OhAudioStreamBuilderSetInterruptMode002();
int OhAudioStreamBuilderSetInterruptMode003();
int OhAudioStreamBuilderSetInterruptMode006();
int OhAudioStreamBuilderSetRendererInterruptMode004();
int OhAudioStreamBuilderSetRendererInterruptMode005();
int OhAudioStreamBuilderSetRendererWriteDataCallback001();
int OhAudioStreamBuilderSetRendererWriteDataCallback002();
int OhAudioStreamBuilderSetRendererWriteDataCallback003();
int OhAudioStreamBuilderSetRendererWriteDataCallback004();

} // namespace AudioStandard
} // namespace OHOS

#endif // AUDIO_OH_AUDIO_STREAM_BUILDER_UNIT_TEST_H
