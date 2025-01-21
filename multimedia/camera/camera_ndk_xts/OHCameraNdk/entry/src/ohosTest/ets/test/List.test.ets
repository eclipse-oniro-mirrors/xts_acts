/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import CameraManagerTest from './CameraManager.test';
import CameraInputTest from './CameraInput.test';
import SessionTest from './Session.test';
import SessionTest2 from './Session22.test';
import VideoTest from './Video.test';
import PhotoTest from './PhotoTest.test';
import Demo from './Demo1.test';
import call from  '@ohos.telephony.call';
let voice = call.hasVoiceCapability();

export default function testsuite() {
  if (!voice){
    CameraManagerTest();
    SessionTest2();
    VideoTest();
    Demo();
  } else {
    CameraInputTest();
    SessionTest();
    PhotoTest();
  }
}