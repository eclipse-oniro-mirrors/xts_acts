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
import GraphicTextInterface from './GraphicTextFontCollection.test';
import GraphicTextParagraphBuilder from './GraphicTextParagraphBuilder.test';
import TextParagraphTest from './TextParagraphTest.test';
import GraphicTextEnum from './GraphicTextEnum.test';
import GraphicTextATest from './GraphicTextA.test';
import GraphicTextBTest from './GraphicTextB.test';
import GraphicTextClass from './GraphicTextClass.test';
import GraphicTextProperty from './GraphicTextProperty.test';
import TextLineParagraphTest from './TextLineParagraphTest.test';
import TextGetFontDescTest from './TextGetFontDescTest.test';
import TextRunTest from './TextRunTest.test';
import TextTextLineTest from './TextTextLineTest.test';
import GraphicTextNewAPI from './GraphicTextNewAPI.test';
import GraphicTextAPI21 from './GraphicTextAPI21.test';
import GraphicTextAPI22 from './GraphicTextAPI22.test';
import GraphicTextAPI23 from './GraphicTextAPI23.test';
export default function testsuite() {
  GraphicTextInterface();
  GraphicTextParagraphBuilder();
  TextParagraphTest();
  GraphicTextEnum();
  GraphicTextATest();
  GraphicTextBTest();
  GraphicTextClass();
  GraphicTextProperty();
  TextLineParagraphTest();
  TextGetFontDescTest();
  TextRunTest();
  TextTextLineTest();
  GraphicTextNewAPI();
  GraphicTextAPI21();
  GraphicTextAPI22();
  GraphicTextAPI23();
}