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

import getXComponentSurfaceRectJsunit from './XComponentTest/getXComponentSurfaceRect.test';
import onSurfaceCreatedJsunit from './XComponentTest/onSurfaceCreated.test';
import stopImageAnalyzerJsunit from './XComponentTest/stopImageAnalyzer.test';
import counterApi from './Counter/counterApi.test';
import VideoTest1 from './VideoTest/VideoTest1.test';
import setXComponentSurfaceRotationJsunit from './XComponentTest/setXComponentSurfaceRotation.test';
import inputMethodListTest from './InputMethodList/inputMethodListTest.test';
import VideoReset1 from './VideoTest/VideoReset/VideoReset1.test';
import VideoReset2 from './VideoTest/VideoReset/VideoReset2.test';
import VideoReset3 from './VideoTest/VideoReset/VideoReset3.test';
import VideoReset4 from './VideoTest/VideoReset/VideoReset4.test';
import VideoReset5 from './VideoTest/VideoReset/VideoReset5.test';
import VideoReset6 from './VideoTest/VideoReset/VideoReset6.test';
import VideoReset7 from './VideoTest/VideoReset/VideoReset7.test';
import VideoReset8 from './VideoTest/VideoReset/VideoReset8.test';
import VideoReset9 from './VideoTest/VideoReset/VideoReset9.test';
import VideoReset10 from './VideoTest/VideoReset/VideoReset10.test';
import VideoReset11 from './VideoTest/VideoReset/VideoReset11.test';
import VideoReset12 from './VideoTest/VideoReset/VideoReset12.test';
import VideoReset13 from './VideoTest/VideoReset/VideoReset13.test';
import VideoReset14 from './VideoTest/VideoReset/VideoReset14.test';
import VideoTest2 from './VideoTest/VideoTest2.test';
import SurfaceRotationOptionsLockTest from './XComponentTest/SurfaceRotationOptionsLock.test';
export default function testsuite() {
  getXComponentSurfaceRectJsunit();
  onSurfaceCreatedJsunit();
  stopImageAnalyzerJsunit();
  counterApi();
  VideoTest1();
  setXComponentSurfaceRotationJsunit();
  inputMethodListTest();
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
  SurfaceRotationOptionsLockTest();
}