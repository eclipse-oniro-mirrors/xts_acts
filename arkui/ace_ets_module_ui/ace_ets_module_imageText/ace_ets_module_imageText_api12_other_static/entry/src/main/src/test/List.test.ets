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
import ImageLoadResultTest from './ImageSpanTest/ImageLoadResult.test';
import SearchTypeTest from './SearchTest/SearchType.test';
import BounceSymbolEffectTest from './SymbolGlyphTest/BounceSymbolEffect.test';
import ContentTypeTest from './TextInputTest/ContentType.test';
import fontFeatureTest from './TextInputTest/fontFeature.test';
import textAreaInputTest from './TextTest/textAreaInputTest.test';
import TextDecorationStyleTest from './TextTest/TextDecorationStyleTest.test';
import textShadowTest from './RichEditorTest/textShadowTest.test'
import RichEditorEKeyboardTest from './RichEditorTest/RichEditorEKeyboardTest.test'
import RichEditorSymbolSpanStyleTest from './RichEditorTest/RichEditorSymbolSpanStyleTest.test'
import ImageSpanModifierTest from './ModifierTest/ImageSpanModifier.test'
import MarqueeModifierTest from './ModifierTest/MarqueeModifier.test'
import RichEditorModifierTest from './ModifierTest/RichEditorModifier.test'
import RichTextModifierTest from './ModifierTest/RichTextModifier.test'
import SymbolSpanModifierTest from './ModifierTest/SymbolSpanModifier.test'
import TextInputModifierTest from './ModifierTest/TextInputModifier.test'

import ImageAttachment from './StyledString/ImageAttachment.test'
import ParagraphStyle1 from './StyledString/ParagraphStyle1.test'
import ParagraphStyle2 from './StyledString/ParagraphStyle2.test'
import ParagraphStyle3 from './StyledString/ParagraphStyle3.test'


export default function testsuite() {
  ImageLoadResultTest();
  SearchTypeTest();
  BounceSymbolEffectTest();
  ContentTypeTest();
  fontFeatureTest();
  textAreaInputTest();
  TextDecorationStyleTest();
  textShadowTest();
  RichEditorEKeyboardTest();
  RichEditorSymbolSpanStyleTest();
  ImageSpanModifierTest();
  MarqueeModifierTest();
  RichEditorModifierTest();
  // RichTextModifierTest();
  SymbolSpanModifierTest();
  TextInputModifierTest();
  ImageAttachment();
  ParagraphStyle1();
  ParagraphStyle2();
  ParagraphStyle3();
}
