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
import PresetTest from './Preset.test';
import TextStateJsunit from './TextTest/TextStateJsunit.test';
import text_drag from './TextTest/text_drag.test';
import positionSettingJsunit from './TextTest/PositionSettingJsunit.test';
import OnTextSelectionChangeTest from './TextTest/onTextSelectionChange.test';
import editMenuOptionsApi12Test from './TextTest/editMenuOptionsApi12.test'
import editMenuIdAIWriterTest from './TextTest/editMenuIdAIWriter.test';
import TextContentGetSelectionTest from './TextTest/TextContentGetSelectionTest.test';
import editMenuOptionsApi16Test from './TextTest/editMenuOptionsApi16.test'
import OnPrepareMenuTest from './TextTest/OnPrepareMenuTest.test';
import SetMenuOptionsTest from './TextTest/setMenuOptions.test';

import styledStringChange from './StyledStringTest/styledStringChange.test'
import MovingPhotoViewApi13Test from './MovingPhotoViewTest/MovingPhotoViewApi13.test';
import MovingPhotoViewApi18Test from './MovingPhotoViewTest/MovingPhotoViewApi18.test';
import SpanOnHoverTest from './SpanTest/SpanOnHoverTest.test';


export default function testsuite() {
  PresetTest()
  TextStateJsunit()
  text_drag()
  positionSettingJsunit()
  OnTextSelectionChangeTest()
  editMenuOptionsApi12Test()
  TextContentGetSelectionTest()
  editMenuOptionsApi16Test()
  OnPrepareMenuTest()
  SetMenuOptionsTest()

  styledStringChange()
  MovingPhotoViewApi13Test()
  MovingPhotoViewApi18Test()
  SpanOnHoverTest()
  editMenuIdAIWriterTest()
}