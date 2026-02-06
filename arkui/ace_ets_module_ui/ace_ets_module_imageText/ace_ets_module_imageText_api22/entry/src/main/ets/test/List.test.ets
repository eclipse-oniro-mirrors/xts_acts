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
import InputPresetTest from './PresetTest/InputPresetTest.test';
import searchTest from './TextChangeObserverTest/search.test';
import textAreaTest from './TextChangeObserverTest/textArea.test';
import textInputTest from './TextChangeObserverTest/textInput.test';
import richEditorTest from './TextChangeObserverTest/richEditor.test';
import imageAltTest from './Image/imageAltTest.test';
import minLines from './TextTest/minLines.test';
import richEditorSupportSvg2Test from './richEditorSupportSvg2Test/richEditorSupportSvg2.test';
import scrollbarTest from './scrollbarTest/scrollbarTest.test';
import TextAreaTest from './ShowCounterTest/TextAreaTest.test';
import TextInputTest from './ShowCounterTest/TextInputTest.test';

export default function testsuite() {
  InputPresetTest();
  searchTest();
  textAreaTest();
  textInputTest();
  richEditorTest();
  imageAltTest();
  minLines();
  richEditorSupportSvg2Test();
  scrollbarTest();
  TextAreaTest();
  TextInputTest();
}