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
import AVPlayerAudioEffectModeTest from './AVPlayerAudioEffectModeTest.test'
// import AVPlayerHlsFuncTest from './AVPlayerHlsFuncTest.test'
// import AVPlayerHttpCompatibilityTest from './AVPlayerHttpCompatibilityTest.test.ets'
// import AVPlayerHttpSeekTest from './AVPlayerHttpSeekTest.test.ets'
import AVPlayerLocalTest from './AVPlayerLocalTest.test'
// import AVPlayerStabilityTest from './AVPlayerStabilityTest.test.js'
import AvPlayerEnumTest from './AvPlayerEnumTest.test'
// import AVPlayerMultiTrackTest from './AVPlayerMultiTrackTest.test.js'
import AVMetadata from './AVPlayerAVMetadata.test'
import AVTransCoderTest from './Transcoder.test'
import AVPlayerAmr from './AVPlayerAmrTest.test'
import AVPlayerMediaSource from './AVPlayerMediaSource.test'
import PreDownLoadTest from './PreDownLoadTest.test'
import AVPlayerSelectTrackTest from './AVPlayerSelectTrackTest.test'
import AVPlayerFlvFuncTest from './AVPlayerFlvFuncTest.test'
import AVPlayerPostProcessorTest from './AVPlayerPostProcessorTest.test'

export default function testsuite() {
  // AVPlayerHlsFuncTest()
  // AVPlayerHttpCompatibilityTest();
  // AVPlayerHttpSeekTest();
  AvPlayerEnumTest();
  AVPlayerLocalTest();
  AVPlayerAudioEffectModeTest();
  // AVPlayerMultiTrackTest();
  // AVPlayerStabilityTest();
  AVMetadata();
  PreDownLoadTest();
  AVTransCoderTest()
  AVPlayerAmr();
  AVPlayerMediaSource();
  AVPlayerSelectTrackTest();
  AVPlayerFlvFuncTest();
  AVPlayerPostProcessorTest();
}