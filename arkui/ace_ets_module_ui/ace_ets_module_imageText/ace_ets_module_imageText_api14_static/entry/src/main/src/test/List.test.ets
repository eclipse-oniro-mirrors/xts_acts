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

import imageSpanJsunit from './imageSpanTest/imageSpan.test';
import MarqueeDynamicSyncSceneTest from './Marquee/MarqueeDynamicSyncSceneType.test';
import SetFrameRateRangeTest from './Marquee/marqueeFrame.test';
import marqueeNode from './Marquee/marqueeNode.test';
import SymbolGlyphNodeTest from "./SymbolGlyphTest/SymbolGlyphNode.test";
import textAreaInputTest from './TextTest/textAreaInputTest.test';
import textCaretColor from './TextTest/textCaretColor.test';
import textAreaNode from "./TextAreaTest/textAreaNode.test";
import RichEditorOnHoverTest from './RichEditorTest/onHover.test';
import getRectsForRangeTest from './RichEditorTest/getRectsForRange.test'
import RichEditorOnWillChangeTest from './RichEditorTest/onWillChange.test';
import RichEditorOnDoubleClickTest from './RichEditorTest/onDoubleClickOnHover.test';

import ImageOrientation from './ImageOrientation/ImageOrientation.test';
import onSubmitTest from './onSubmitTest/onSubmitTest.test';
import StyledString from './styledString/StyledString.test';
import StyledStringURL from './styledString/StyledStringURL.test';
import KeyboardAvoidMode from './UIContext/KeyboardAvoidMode.test'
export default function testsuite() {
  StyledStringURL();
  textAreaNode();
  RichEditorOnHoverTest();
  getRectsForRangeTest();

  imageSpanJsunit();
  MarqueeDynamicSyncSceneTest();//11.17SDK failed:1
  SetFrameRateRangeTest();
  marqueeNode();
  SymbolGlyphNodeTest();
  textAreaInputTest();
  textCaretColor();

  RichEditorOnWillChangeTest();
  RichEditorOnDoubleClickTest();

  ImageOrientation();
  onSubmitTest();
  StyledString();//11.17SDK pass:1 failed:1
  KeyboardAvoidMode();
}