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

import AVPlayerStabilityTest from './media/AVPlayerStabilityTest.test';
import AVRecorderTest from './media/AVRecorderTest.test';
import AVPlayerTest from './media/AVPlayeTest.test';
import SoundPoolTest from './media/SoundPool.test';
import AVTranscoderTest from './media/AVTranscoderTest.test';
import AVImageGeneratorTest from './media/AVImageGeneratorTest.test';
import AVMetadataExtractorTest from './media/AVMetadataExtractorTest.test';
import MediaSourceTest from './media/MediaSourceTest.test';
import AVScreenCaptureRecorderTest from './media/AVScreenCaptureRecorderTest.test';
import MediaSourceLoadingRequestTest from './media/MediaSourceLoadingRequestTest.test';
import AVPlayerDrmTest from './media/AVPlayerDrmTest.test';

export default function testsuite() {
  AVPlayerStabilityTest();
  AVImageGeneratorTest();
  AVPlayerTest();
  AVPlayerDrmTest();
  AVRecorderTest();
  AVTranscoderTest();
  AVMetadataExtractorTest();
  AVScreenCaptureRecorderTest();
  MediaSourceTest();
  MediaSourceLoadingRequestTest();
  SoundPoolTest();
}