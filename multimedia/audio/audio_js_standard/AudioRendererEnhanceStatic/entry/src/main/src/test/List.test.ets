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
import AudioRoutingManagerTest from './AudioRoutingManager.test';
import getCurrentOutputDevices from './GetCurrentOutputDevices.test';
import getMax_MinStreamVolume from './GetMaxAndMinStreamVolume.test';
import getUnderflowCount from './GetUnderflowCount.test';
import on_off_outputDeviceChange from './OnOffOutputDeviceChange.test';
import setChannelBlendMode from './SetChannelBlendMode.test';
import setVolumeWithRamp from './SetVolumeWithRamp.test';


export default function testsuite() {
  getMax_MinStreamVolume();
  getUnderflowCount();
  getCurrentOutputDevices();
  on_off_outputDeviceChange();
  setChannelBlendMode();
  setVolumeWithRamp();
  AudioRoutingManagerTest();
}
