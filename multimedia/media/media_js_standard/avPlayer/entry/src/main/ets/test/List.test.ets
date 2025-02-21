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
import AVPlayerAudioEffectModeTest from './AVPlayerAudioEffectModeTest.test.js'
import AVPlayerHlsFuncTest from './AVPlayerHlsFuncTest.test.js'
import AVPlayerHttpCompatibilityTest from './AVPlayerHttpCompatibilityTest.test.ets'
import AVPlayerHttpSeekTest from './AVPlayerHttpSeekTest.test.ets'
import AVPlayerLocalTest from './AVPlayerLocalTest.test.js'
import AVPlayerStabilityTest from './AVPlayerStabilityTest.test.js'
import AvPlayerEnumTest from './AvPlayerEnumTest.test.js'
import AVPlayerMultiTrackTest from './AVPlayerMultiTrackTest.test.js'
import AVMetadata from './AVPlayerAVMetadata.test.ets'
import AVTransCoderTest from './Transcoder.test.js'
import AVPlayerAmr from './AVPlayerAmrTest.test.js'
import AVPlayerMediaSource from './AVPlayerMediaSource.test.js'
import AVPlayerSelectTrackTest from './AVPlayerSelectTrackTest.test.js'

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
  AVTransCoderTest();
  AVPlayerAmr();
  AVPlayerMediaSource();
  AVPlayerSelectTrackTest();
}