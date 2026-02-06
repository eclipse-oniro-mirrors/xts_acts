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

import comSizeAbilityTest_14 from './comSizeAbility/comSizeAbilityTest_14.test';
import comSizeAbilityTest_18 from './comSizeAbility/comSizeAbilityTest_18.test';
import comSizeAbilityTest_27 from './comSizeAbility/comSizeAbilityTest_27.test';
import comSizeAbilityTest_29 from './comSizeAbility/comSizeAbilityTest_29.test';
import getWaterFlowItemRect1 from './getItemRect/waterFlow/getWaterFlowItemRect1.test';
import getWaterFlowItemRect2 from './getItemRect/waterFlow/getWaterFlowItemRect2.test';
import getWaterFlowItemRect3 from './getItemRect/waterFlow/getWaterFlowItemRect3.test';
import getWaterFlowItemRect4 from './getItemRect/waterFlow/getWaterFlowItemRect4.test';
import getWaterFlowItemRect5 from './getItemRect/waterFlow/getWaterFlowItemRect5.test';
import ChipAction from './Chip/ChipAction.test';
import ChipOnClose from './Chip/ChipOnClose.test';
import ChipAction2 from './Chip/ChipAction2.test';
import ChipOnClose2 from './Chip/ChipOnClose2.test';

export default function testsuite() {
  comSizeAbilityTest_14();
  comSizeAbilityTest_18();
  comSizeAbilityTest_27();
  comSizeAbilityTest_29();
  getWaterFlowItemRect1();
  getWaterFlowItemRect2();
  getWaterFlowItemRect3();
  getWaterFlowItemRect4();
  getWaterFlowItemRect5();
  ChipAction();
  ChipOnClose();
  ChipAction2();
  ChipOnClose2();
}