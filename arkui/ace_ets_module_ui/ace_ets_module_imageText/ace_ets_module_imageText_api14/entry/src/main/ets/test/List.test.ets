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

import textAreaInputTest from './TextTest/textAreaInputTest.test';
import KeyboardAvoidModeTest from './UIContext/KeyboardAvoidMode.test';
import StyledString from './styledString/StyledString.test';
import RichEditorOnHoverTest from './RichEditorTest/onHover.test';
import imageSpanJsunit from './imageSpanTest/imageSpan.test';
import onSubmitTest from './onSubmitTest/onSubmitTest.test';
import StyledStringURL from './styledString/StyledStringURL.test';
import textCaretColor from './TextTest/textCaretColor.test';
import getRectsForRangeTest from './RichEditorTest/getRectsForRange.test'
import SetFrameRateRangeTest from './Marquee/marqueeFrame.test';
import marqueeNode from './Marquee/marqueeNode.test';
import textAreaNode from "./TextAreaTest/textAreaNode.test";
import SymbolGlyphNodeTest from "./SymbolGlyphTest/SymbolGlyphNode.test";
import ImageOrientationTest from './ImageOrientation/ImageOrientation.test';


export default function testsuite() {
  textAreaInputTest();
  KeyboardAvoidModeTest();
  StyledString();
  RichEditorOnHoverTest();
  imageSpanJsunit();
  onSubmitTest();
  StyledStringURL();
  textCaretColor();
  getRectsForRangeTest();
  SetFrameRateRangeTest();
  marqueeNode();
  textAreaNode();
  SymbolGlyphNodeTest();
  ImageOrientationTest();
}