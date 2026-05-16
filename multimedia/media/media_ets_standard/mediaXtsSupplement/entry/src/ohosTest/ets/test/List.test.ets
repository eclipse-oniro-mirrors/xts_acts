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

import AVImageFetchFrameByTime from './media/AVImageFetchFrameByTimeTest.test';
import AVMetaFetchFrameByTime from './media/AVMetadataFetchFrameByTimeTest.test';
import AVPlayerLocalDeprecatedTest from './media/AVPlayerLocalDeprecatedTest.test';
import AVPlayerLocalSuppTest from './media/AVPlayerLocalTest.test';
import SetUrISourceTest from './media/MediaSetUrlSourceTest.test';
import AVPlayerSetMediaSourceSuppTest from './media/AVPlayerMediaSourceSupp.test';
import AVPlayerSetMediaMutedSuppTest from './media/AVPlayerSetMediaMutedSupp.test';
import AVPlayerSetPlaybackRangeSuppTest from './media/AVPlayerSetPlaybackRangeSupp.test';
import StateChangeTest from './media/StateChangeTest.test';
import OnTrackChangeTest from './media/AVPlayerOnTrackChangeTest.test';
import AVPlayerOn_BufferingUpdateTest from './media/AVPlayerOn_BufferingUpdateTest.test';
import AVPlayerOnMessageReceivedTest from './media/AVPlayerOn_seiMessageReceivedTest.test';
import MediaAVPlayerOff_trackChangeTest from './media/MediaAVPlayerOff_trackChange.Test.test';
import MediaSourceSetMediaResourceLoaderDelegateTest from './media/MediaSourceSetMediaResourceLoaderDelegate.Test.test';
import MediaVideoPlayerOn_audioInterruptTest from './media/MediaVideoPlayerOn_audioInterrupt.Test.test';
import MediaVideoPlayerSeekTest from './media/MediaVideoPlayerSeek.Test.test';
import CreateMediaSourceTest from './media/CreateMediaSourceTest.test';
import AVPlayerSetSpeedTest from './media/AVPlayerSetSpeed.test';
import RespondDataTest from './media/RespondDataTest.test';
import AVPlayerSetPlayBackStrategySuppTest from './media/AVPlayerSetPlaybackStrategy.test';
import AVPlayervideoSizeChangeSuppTest from './media/AVPlayervideoSizeChangeOnOFF.test';
import AVPlayerSetDecryptionConfigSuppTest from './media/AVPlayerSetDecryptionConfig.test';
import AVPlayerAddSubtitleFromUrlSuppTest from './media/AVPlayerAddSubtitleFromUrl.test';
import MediaAPIEnumSupplementTest from "./media/MediaAPIEnumSupplement.test";

export default function testsuite() {
  AVPlayerLocalDeprecatedTest();
  AVPlayerLocalSuppTest();
  AVImageFetchFrameByTime();
  AVMetaFetchFrameByTime();
  SetUrISourceTest();
  AVPlayerSetPlaybackRangeSuppTest();
  AVPlayerSetMediaMutedSuppTest();
  AVPlayerSetMediaSourceSuppTest();
  StateChangeTest();
  OnTrackChangeTest();
  AVPlayerOn_BufferingUpdateTest();
  AVPlayerOnMessageReceivedTest();
  MediaAVPlayerOff_trackChangeTest();
  MediaSourceSetMediaResourceLoaderDelegateTest();
  MediaVideoPlayerOn_audioInterruptTest();
  MediaVideoPlayerSeekTest();
  CreateMediaSourceTest();
  AVPlayerSetSpeedTest();
  RespondDataTest();
  AVPlayerSetPlayBackStrategySuppTest();
  AVPlayervideoSizeChangeSuppTest();
  AVPlayerSetDecryptionConfigSuppTest();
  AVPlayerAddSubtitleFromUrlSuppTest();
  MediaAPIEnumSupplementTest();
}

