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
import TextInputKeyboardAppearanceTest from './TextInputTest/TextInputKeyboardAppearance.test';
import TextAreaKeyboardAppearanceTest from './TextAreaTest/TextAreaKeyboardAppearance.test';
import SearchKeyboardAppearanceTest from './Search/SearchKeyboardAppearance.test';
import RichEditorKeyboardAppearanceTest from './RichEditorTest/RichEditorKeyboardAppearance.test';
import TextInputStopBackPressTest from './TextInputTest/TextInputStopBackPress.test';
import TextAreaStopBackPressTest from './TextAreaTest/TextAreaStopBackPress.test';
import SearchStopBackPressTest from './Search/SearchStopBackPress.test';
import SelectionMenuOptions from './RichEditorTest/SelectionMenuOptions.test';
import PixelMapColorFilterTest from './ImageAttachmentTest/PixelMapColorFilter.test';
import ResourceDefaultTest from './ImageAttachmentTest/ResourceDefault.test';
import VerticalAlignTest from './ImageAttachmentTest/VerticalAlign.test';
import ObjectFitTest from './ImageAttachmentTest/ObjectFit.test';
import editMenuOptions from './TextTest/editMenuOptions.test';
import addOrDelText from './TextAreaTest/addOrDelText.test';
import TextOnChangeOptionsTest from './TextChangeTest/TextOnChangeOptionsTest.test';
import TextOnWillChangeOptionsTest from './TextChangeTest/TextOnWillChangeOptionsTest.test';
import bindSelectionMenuTest from './SelectionMenuTest/bindSelectionMenuTest.test';
import ImageSvgFillColorTest from './ImageSvgFillColorTest/ImageSvgFillColor.test';
import imageMatrix from './imageMatrix/imageMatrix.test';

export default function testsuite() {
  textAreaInputTest();
  TextInputKeyboardAppearanceTest();
  TextAreaKeyboardAppearanceTest();
  SearchKeyboardAppearanceTest();
  RichEditorKeyboardAppearanceTest();
  TextInputStopBackPressTest();
  TextAreaStopBackPressTest();
  SearchStopBackPressTest();
  SelectionMenuOptions();
  PixelMapColorFilterTest();
  ResourceDefaultTest();
  VerticalAlignTest();
  ObjectFitTest();
  editMenuOptions();
  addOrDelText();
  TextOnChangeOptionsTest();
  TextOnWillChangeOptionsTest();
  bindSelectionMenuTest();
  ImageSvgFillColorTest();
  imageMatrix();
}