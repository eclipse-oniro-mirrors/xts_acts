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

import AVPlayerLocalTest from './AVPlayerLocalTest.test'
import AvPlayerEnumTest from './AvPlayerEnumTest.test'
import AVMetadata from './AVPlayerAVMetadata.test'
import AVPlayerMediaSource from './AVPlayerMediaSource.test'
import AVPlayerPostProcessorTest from './AVPlayerPostProcessorTest.test'
import AVPlayerAudioEffectModeTest from './AVPlayerAudioEffectModeTest.test'
import AVPlayerSelectTrackTest from './AVPlayerSelectTrackTest.test'
import PreDownLoadTest from './PreDownLoadTest.test'
import AVTransCoderTest from './Transcoder.test'
import AVPlayerFlvFuncTest from './AVPlayerFlvFuncTest.test'
import AVPlayerSetPlaybackRateTest from './AVPlayerSetPlaybackRateTest.test'

export default function testsuite() {
  AvPlayerEnumTest();
  AVPlayerLocalTest();
  AVMetadata();
  AVPlayerMediaSource();
  AVPlayerPostProcessorTest();
  AVPlayerAudioEffectModeTest();
  AVPlayerSelectTrackTest();
  PreDownLoadTest();
  AVTransCoderTest();
  AVPlayerSetPlaybackRateTest();
  AVPlayerFlvFuncTest();
}
