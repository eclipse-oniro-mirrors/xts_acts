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
import textAreaInputTest from './TextAreaTest/textAreaInputTest.test';
import ActsgetcomponentaddTest from './buttonTest/getcomponentadd.test';
import textinputSec from './TextInputTest/textinputSec'
import SelectJsunit from './selectTest/SelectJsunit.test.ets';
import segmentbuttonTest from './SegmentButtonTest/segmentbutton'
import TextStateJsunit from './textTest/TextStateJsunit.test';
import text_drag from './textTest/text_drag.test';
import search_center from './SearchTest/search_center.test.ets'
import textArea_center from './TextAreaTest/textArea_center.test.ets'
import positionSettingJsunit from './textTest/PositionSettingJsunit.test';
import textAreaBC1Jsunit from './TextAreaTest/textAreaBC1Jsunit.test';
import search_gesture from './SearchTest/search_gesture.test';
import RichEditor01 from './RichEditorTest/RichEditor01.test.ets';
import textAreaUIJsunit from './TextAreaTest/textAreaUIJsunit.test';
import TextInputPageJsunit from './TextInputTest/TextInputPageJsunit.test';
import SearchJsunit from './SearchTest/SearchJsunit.test';
import richEditorApi1 from './RichEditorTest/richEditorApi/richEditorApi1.test'
import RichEditorApi222 from './RichEditorTest/RichEditorApi222.test';
import RichTextJsunit from './RichEditorTest/RichTextJsunit.test.ets';
import richTextJsunitFOUR from './RichEditorTest/RichTextJsunitFOUR.test';
import OnTextSelectionChangeTest from './textTest/onTextSelectionChange.test';
import SelectJsunit01 from './selectTest/SelectJsunit01.test.ets';

export default function testsuite() {
  textAreaInputTest()
  ActsgetcomponentaddTest()
  textinputSec()
  SelectJsunit()
  segmentbuttonTest();
  TextStateJsunit();
  text_drag();
  search_center();
  textArea_center();
  positionSettingJsunit();
  textAreaBC1Jsunit();
  search_gesture();
  RichEditor01();
  textAreaUIJsunit();
  TextInputPageJsunit();
  SearchJsunit();
  richEditorApi1()
  RichEditorApi222();
  RichTextJsunit();
  richTextJsunitFOUR()
  OnTextSelectionChangeTest();
  SelectJsunit01()
}