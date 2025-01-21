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
import getMax_MinStreamVolume from './GetMaxAndMinStreamVolume.test.ets'
import getUnderflowCount from './GetUnderflowCount.test.ets'
import getCurrentOutputDevices from './GetCurrentOutputDevices.test.ets'
import on_off_outputDeviceChange from './OnOffOutputDeviceChange.test.ets'
import setChannelBlendMode from './SetChannelBlendMode.test.ets'
import setVolumeWithRamp from './SetVolumeWithRamp.test.ets'

export default function testsuite() {
  getMax_MinStreamVolume();
  getUnderflowCount();
  getCurrentOutputDevices();
  on_off_outputDeviceChange();
  setChannelBlendMode();
  setVolumeWithRamp();
}
