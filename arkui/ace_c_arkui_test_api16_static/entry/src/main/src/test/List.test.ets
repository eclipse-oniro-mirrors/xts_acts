'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import postFrameCallbackTest from "./postFrame/PostFrameCallbackTest.test"
import swiperOnSelectTest from "./swiper/SwiperOnSelectTest.test"
import swiperTest from "./swiper/SwiperTest.test"
import textImmutablfFontWeight from "./text/textImmutablfFontWeight.test"
import TextAreaLetterSpacing from "./textArea/TextAreaLetterSpacing.test"
import TextInputLetterSpacing from "./textInput/TextInputLetterSpacing.test"
import textInputWordBreakTest from "./textInput/TextInputWordBreakTest.test"
import textPickerTest from "./textpicker/TextPickerColumnWidthsTest.test"
import NodeUtilMoveTest from "./move/NodeUtilMoveTest.test"
import TimePickerTest from "./timePicker/EnableCascadeTest.test"
import buttonTypeTest from './button/ButtonTypeTest.test'
import DragTest from "./drag/DragCaseTest.test"

export default function testsuite() {
  postFrameCallbackTest();
  swiperOnSelectTest();
  swiperTest();
  textImmutablfFontWeight()
  TextAreaLetterSpacing()
  TextInputLetterSpacing()
  textInputWordBreakTest()
  buttonTypeTest();
  NodeUtilMoveTest();
  TimePickerTest();
  DragTest();
  textPickerTest();
}