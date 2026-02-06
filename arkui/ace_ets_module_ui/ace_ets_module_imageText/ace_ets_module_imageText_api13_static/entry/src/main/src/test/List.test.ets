'use static';
/**
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

import RichEditorMenuType from './RichEditorTest/RichEditorMenuType.test';
import RichEditorStyledStringTest from './RichEditorTest/RichEditorStyledStringTest.test';
import BarStateTest from './RichEditorTest/barState.test';
import EnableHapticFeedbackTest from './TextTest/enableHapticFeedback.test';
import StyledStringUrl from './TextTest/StyledStringTest.test';
import textAreaInputTest from './TextTest/textAreaInputTest.test';
import TextMenuType from './TextTest/TextMenuType.test';
import CustomSpan from './StyledStringTest/CustomSpan.test';
import UnmarshallingErrorCodeTest from './StyledStringTest/unmarshalling.test'

export default function testsuite() {
  textAreaInputTest();//11.17SDK  pass:1
  RichEditorMenuType();//11.17SDK  pass:2
  RichEditorStyledStringTest();//11.17SDK  pass:1
  BarStateTest();//11.17SDK  pass:5
  EnableHapticFeedbackTest();//11.17SDK  pass:20
  StyledStringUrl();//11.17SDK  pass:1
  TextMenuType();//11.17SDK  pass:2
  CustomSpan();//11.17SDK  pass:1
}