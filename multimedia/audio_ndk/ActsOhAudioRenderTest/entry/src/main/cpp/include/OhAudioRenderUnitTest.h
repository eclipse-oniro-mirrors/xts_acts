/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ACTSOHAUDIORENDERTEST_OH_AUDIO_RENDER_UNIT_TEST_H
#define ACTSOHAUDIORENDERTEST_OH_AUDIO_RENDER_UNIT_TEST_H

#include <ohaudio/native_audiostreambuilder.h>

namespace Acts {
namespace AudioRender {

// Helper Functions
OH_AudioStreamBuilder* CreateRenderBuilder();
OH_AudioStreamBuilder* InitRenderBuilder();
void CleanupAudioResources(OH_AudioStreamBuilder* builder, OH_AudioRenderer* audioRenderer);
bool GetCurrentDeviceIsTV();

// Category 1: Renderer Creation Tests (2)
int OhAudioRenderGenerate001();
int OhAudioRenderGenerate002();

// Category 2: Lifecycle Control Tests (13)
int OhAudioRenderStart001();
int OhAudioRenderStart002();
int OhAudioRenderPause001();
int OhAudioRenderPause002();
int OhAudioRenderStop001();
int OhAudioRenderStop002();
int OhAudioRenderFlush001();
int OhAudioRenderFlush002();
int OhAudioRenderRelease001();
int OhAudioRendererGetCurrentState001();
int OhAudioRendererGetCurrentState002();
int OhAudioRendererGetCurrentState003();
int OhAudioRendererGetCurrentState004();

// Category 3: Parameter Getter Tests (10)
int OhAudioRenderGetParameter001();
int OhAudioRenderGetParameter002();
int OhAudioRenderGetSamplingRate001();
int OhAudioRenderGetSampleFormat();
int OhAudioRenderGetEncodingType001();
int OhAudioRenderGetRendererInfo001();
int OhAudioRendererGetRendererPrivacy001();
int OhAudioRendererGetRendererPrivacy002();
int OhAudioRendererGetChannelLayout001();
int OhAudioRendererGetEffectMode001();

// Category 4: Volume Control Tests (10)
int OhAudioRenderGetVolume001();
int OhAudioRenderGetVolume002();
int OhAudioRenderGetVolume003();
int OhAudioRenderGetVolume004();
int OhAudioRenderSetVolume001();
int OhAudioRenderSetVolume002();
int OhAudioRenderSetVolume003();
int OhAudioRenderSetVolume004();
int OhAudioRenderSetVolumeWithRamp001();
int OhAudioRenderSetVolumeWithRamp002();

// Category 5: Mark Position Tests (8)
int OhAudioRenderSetMarkPosition001();
int OhAudioRenderSetMarkPosition002();
int OhAudioRenderSetMarkPosition003();
int OhAudioRenderSetMarkPosition004();
int OhAudioRenderSetMarkPosition005();
int OhAudioRenderCancelMark001();
int OhAudioRenderCancelMark002();
int OhAudioRenderCancelMark003();

// Category 6: Underflow Detection Tests (4)
int OhAudioRendererGetUnderflowCount001();
int OhAudioRendererGetUnderflowCount003();
int OhAudioRendererGetUnderflowCount004();
int OhAudioRendererGetUnderflowCount005();

// Category 7: Write Data Callback Tests (6)
int OhAudioRenderWriteDataCallback001();
int OhAudioRenderWriteDataCallback002();
int OhAudioRenderWriteDataCallback003();
int OhAudioRenderWriteDataCallback004();
int OhAudioRenderWriteDataCallback005();
int OhAudioRenderWriteDataCallback006();

// Category 8: Loudness Gain Set Tests (22)
int OhAudioRenderSetLoudnessGain001();
int OhAudioRenderSetLoudnessGain002();
int OhAudioRenderSetLoudnessGain003();
int OhAudioRenderSetLoudnessGain004();
int OhAudioRenderSetLoudnessGain005();
int OhAudioRenderSetLoudnessGain006();
int OhAudioRenderSetLoudnessGain007();
int OhAudioRenderSetLoudnessGain008();
int OhAudioRenderSetLoudnessGain010();
int OhAudioRenderSetLoudnessGain011();
int OhAudioRenderSetLoudnessGain012();
int OhAudioRenderSetLoudnessGain013();
int OhAudioRenderSetLoudnessGain014();
int OhAudioRenderSetLoudnessGain015();
int OhAudioRenderSetLoudnessGain017();
int OhAudioRenderSetLoudnessGain018();
int OhAudioRenderSetLoudnessGain019();
int OhAudioRenderSetLoudnessGain021();

// Category 9: Loudness Gain Get Tests (2)
int OhAudioRenderGetLoudnessGain001();
int OhAudioRenderGetLoudnessGain002();

// Category 10: Stream Manager Tests (2)
int OhAudioStreamManagerIsAcousticEchoCancelerSupported001();
int OhAudioStreamManagerIsAcousticEchoCancelerSupported002();

} // namespace AudioRender
} // namespace Acts

#endif // ACTSOHAUDIORENDERTEST_OH_AUDIO_RENDER_UNIT_TEST_H
