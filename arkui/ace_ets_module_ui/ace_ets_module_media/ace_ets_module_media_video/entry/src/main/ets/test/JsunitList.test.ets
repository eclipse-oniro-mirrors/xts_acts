/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import videoEnableShortcutKeyTest from './Video/videoEnableShortcutKeyTest.test';
import videoCallbackJsunit from './Video/videoCallbackJsunit.test';

import videoJsunit from './Video/VideoJsunit.test';
import videoJsunit2 from './Video/VideoJsunit2.test';
import videoOnFullscreenChangeJsunit from './Video/video.test';

import VideoTest1 from './Video/VideoTest1.test';
import VideoReset1 from './Video/VideoReset1.test';
import VideoReset2 from './Video/VideoReset2.test';
import VideoReset3 from './Video/VideoReset3.test';
import VideoReset4 from './Video/VideoReset4.test';
import VideoReset5 from './Video/VideoReset5.test';
import VideoReset6 from './Video/VideoReset6.test';
import VideoReset7 from './Video/VideoReset7.test';
import VideoReset8 from './Video/VideoReset8.test';
import VideoReset9 from './Video/VideoReset9.test';
import VideoReset10 from './Video/VideoReset10.test';
import VideoReset11 from './Video/VideoReset11.test';
import VideoReset12 from './Video/VideoReset12.test';
import VideoReset13 from './Video/VideoReset13.test';
import VideoReset14 from './Video/VideoReset14.test';
import VideoTest2 from './Video/VideoTest2.test';

import VideoOnErrorTest from './Video/VideoOnErrorTest.test'
import VideoContentTransitionEffectTest from './Video/VideoContentTransitionEffectTest.test'
import VideoSupportMoreSpeedTest from './Video/VideoSupportMoreSpeedTest'
import VideoOneBoundaryTest from './Video/VideoOneBoundaryTest'

export default function testsuite() {
  videoEnableShortcutKeyTest();
  videoCallbackJsunit();

  videoJsunit()
  videoJsunit2()

  VideoTest1();
  VideoReset1();
  VideoReset2();
  VideoReset3();
  VideoReset4();
  VideoReset5();
  VideoReset6();
  VideoReset7();
  VideoReset8();
  VideoReset9();
  VideoReset10();
  VideoReset11();
  VideoReset12();
  VideoReset13();
  VideoReset14();
  VideoTest2();

  VideoOnErrorTest()
  VideoContentTransitionEffectTest()
  VideoSupportMoreSpeedTest()
  VideoOneBoundaryTest()
  videoOnFullscreenChangeJsunit()
}