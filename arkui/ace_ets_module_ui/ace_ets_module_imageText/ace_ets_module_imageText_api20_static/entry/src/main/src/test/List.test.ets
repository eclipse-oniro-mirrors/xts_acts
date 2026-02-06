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

import ResourceModifierTest from './TextTest/ResourceModifier.test';
import TextLineSpacingTest from './TextTest/TextLineSpacing.test';
import TextShaderStyleTest from './TextTest/TextShaderStyle.test';
import TextStrokeTest from './TextTest/TextStrokeTest.test';
import SearchTypeTest from './SearchTest/SearchType.test';
import SearchAutoCapitalizationModeTest from './SearchTest/SearchAutoCapitalizationMode.test';
import SearchAutoCapitalizationModeModifierTest from './SearchTest/SearchAutoCapitalizationModeModifier.test';
import TextAreaTypeTest from './TextAreaTest/TextAreaType.test';
import TextAreaAutoCapitalizationModeTest from './TextAreaTest/TextAreaAutoCapitalizationMode.test';
import TextAreaAutoCapitalizationModeModifierTest from './TextAreaTest/TextAreaAutoCapitalizationModeModifier.test';
import TextInputAutoCapitalizationModeTest from './TextInputTest/TextInputAutoCapitalizationMode.test';
import TextInputAutoCapitalizationModeModifierTest from './TextInputTest/TextInputAutoCapitalizationModeModifier.test';
import TextStyleSuperscriptTest from './StyledStringTest/TextStyleSuperscript.test';
import ImageOnErrorTest from './ImageErrorTest/ImageOnError.test';

export default function testsuite() {
  ResourceModifierTest();
  TextLineSpacingTest();
  TextShaderStyleTest();
  TextStrokeTest();
  SearchTypeTest();
  SearchAutoCapitalizationModeTest();
  SearchAutoCapitalizationModeModifierTest();
  TextAreaTypeTest();
  TextAreaAutoCapitalizationModeTest();
  TextAreaAutoCapitalizationModeModifierTest();
  TextInputAutoCapitalizationModeTest();
  TextInputAutoCapitalizationModeModifierTest();
  TextStyleSuperscriptTest();
  ImageOnErrorTest();
}