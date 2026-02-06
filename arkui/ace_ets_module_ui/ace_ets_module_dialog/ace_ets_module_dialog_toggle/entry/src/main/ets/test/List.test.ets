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

import toggleJsunit from './Toggle/ToggleJsunit.test';
import toggle3Jsunit from './Toggle/Toggle3Jsunit.test';
import ToggleJsunit from './Toggle/Toggle4Jsunit.test';

import ToggleContentModifier from './Toggle/ToggleContentModifier.test';
import ToggleSwitchStyle from './Toggle/ToggleSwitchStyle.test';
import ToggleContentIsOn from './Toggle/ToggleIsOn.test';
import ToggleContentEnabled from './Toggle/ToggleEnabled.test';

import toggleNode from './Toggle/toggleNode.test';
import toggleOnChangeModifierTest from './Toggle/toggleOnChangeModifier.test';


export default function testsuite() {
  toggleJsunit();
  toggle3Jsunit();
  ToggleJsunit();

  ToggleContentModifier();
  ToggleSwitchStyle();
  ToggleContentIsOn();
  ToggleContentEnabled();

  toggleNode();
  toggleOnChangeModifierTest();
}