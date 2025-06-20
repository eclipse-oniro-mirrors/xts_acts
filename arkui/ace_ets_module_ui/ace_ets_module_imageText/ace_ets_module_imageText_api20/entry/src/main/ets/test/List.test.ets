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

import textAreaInputTest from './TextTest/textAreaInputTest.test';
import SearchTypeTest from './SearchTest/SearchType.test';
import TextAreaTypeTest from './TextAreaTest/TextAreaType.test';
import TextInputTypeTest from './TextInputTest/TextInputType.test';
import ResourceNormalTest from './TextTest/ResourceNormal.test';
import ResourceModifierTest from './TextTest/ResourceModifier.test';
import TextStrokeTest from './TextTest/TextStrokeTest.test';
import StyledStringStrokeTest from './TextTest/StyledStringStrokeTest.test';
import TextInputEnableAutoFillAnimationTest from './TextInputTest/TextInputEnableAutoFillAnimation.test';
import TextShaderStyleTest from './TextTest/TextShaderStyle.test';
import TextStyleSuperscriptTest from './StyledStringTest/TextStyleSuperscript.test';
import TextEnableAutoSpacingTest from './TextTest/TextEnableAutoSpacing.test';
import SearchEnableAutoSpacingTest from './SearchTest/SearchEnableAutoSpacing.test';
import TextAreaEnableAutoSpacingTest from './TextAreaTest/TextAreaEnableAutoSpacing.test';
import TextInputEnableAutoSpacingTest from './TextInputTest/TextInputEnableAutoSpacing.test';
import ImageOnErrorTest from './ImageErrorTest/ImageOnError.test';
import TextAreaMinLinesTest from './TextAreaTest/TextAreaMinLines.test';
import RichEditorUndoStyleTest from './RichEditorTest/RichEditorUndoStyle.test';
import TextLineSpacingTest from './TextTest/TextLineSpacing.test';
import TextAreaLineSpacingTest from './TextAreaTest/TextAreaLineSpacing.test';
import SearchAutoCapitalizationModeTest from './SearchTest/SearchAutoCapitalizationMode.test';
import SearchAutoCapitalizationModeModifierTest from './SearchTest/SearchAutoCapitalizationModeModifier.test';
import TextAreaAutoCapitalizationModeTest from './TextAreaTest/TextAreaAutoCapitalizationMode.test';
import TextAreaAutoCapitalizationModeModifierTest from './TextAreaTest/TextAreaAutoCapitalizationModeModifier.test';
import TextInputAutoCapitalizationModeTest from './TextInputTest/TextInputAutoCapitalizationMode.test';
import TextInputAutoCapitalizationModeModifierTest from './TextInputTest/TextInputAutoCapitalizationModeModifier.test';


export default function testsuite() {
  textAreaInputTest();
  SearchTypeTest();
  TextAreaTypeTest();
  TextInputTypeTest();
  ResourceNormalTest();
  ResourceModifierTest();
  TextStrokeTest();
  StyledStringStrokeTest();
  TextInputEnableAutoFillAnimationTest();
  TextShaderStyleTest();
  TextStyleSuperscriptTest();
  TextEnableAutoSpacingTest();
  SearchEnableAutoSpacingTest();
  TextAreaEnableAutoSpacingTest();
  TextInputEnableAutoSpacingTest();
  ImageOnErrorTest();
  TextAreaMinLinesTest();
  RichEditorUndoStyleTest();
  TextLineSpacingTest();
  TextAreaLineSpacingTest();
  SearchAutoCapitalizationModeTest();
  SearchAutoCapitalizationModeModifierTest();
  TextAreaAutoCapitalizationModeTest();
  TextAreaAutoCapitalizationModeModifierTest();
  TextInputAutoCapitalizationModeTest();
  TextInputAutoCapitalizationModeModifierTest();
}