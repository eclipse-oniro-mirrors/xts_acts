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

import composeListItemIconType from './api12/composeListItemIconType.test';
import composeListItemOperateItemArrow from './api12/composeListItemOperateItemArrow.test';
import composeListItemOperateItemButton from './api12/composeListItemOperateItemButton.test';
import composeListItemOperateItemCheckbox from './api12/composeListItemOperateItemCheckbox.test';
import composeListItemOperateItemImage from './api12/composeListItemOperateItemImage.test';
import composeListItemOperateItemRadio from './api12/composeListItemOperateItemRadio.test';
import composeListItemOperateItemSubIcon from './api12/composeListItemOperateItemSubIcon.test';
import composeListItemOperateItemSwitch from './api12/composeListItemOperateItemSwitch.test';
import composeListItemPageTest from './api12/composeListItemPageTest.test';

export default function testsuite() {
  composeListItemIconType();
  composeListItemOperateItemArrow();
  composeListItemOperateItemButton();
  composeListItemOperateItemCheckbox();
  composeListItemOperateItemImage();
  composeListItemOperateItemRadio();
  composeListItemOperateItemSubIcon();
  composeListItemOperateItemSwitch();
  composeListItemPageTest();
}