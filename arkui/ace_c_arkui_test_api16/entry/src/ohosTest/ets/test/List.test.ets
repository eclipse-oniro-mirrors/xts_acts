/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import swiperTest from "./swiper/SwiperTest.test"
import textImmutablfFontWeight from "./text/textImmutablfFontWeight.test"
import TextAreaLetterSpacing from "./textArea/TextAreaLetterSpacing.test"
import TextInputLetterSpacing from "./textInput/TextInputLetterSpacing.test"
import textPickerTest from "./textpicker/TextPickerColumnWidthsTest.test"
import DragTest from "./drag/DragCaseTest.test"
import calendarPickerDateTest from "./calendarPicker/CalendarPickerDate.test"
import textInputWordBreakTest from "./textInput/TextInputWordBreakTest.test"
import NodeUtilMoveTest from "./move/NodeUtilMoveTest.test"

export default function testsuite() {
  postFrameCallbackTest();
  swiperTest();
  textImmutablfFontWeight();
  TextAreaLetterSpacing();
  TextInputLetterSpacing();
  textPickerTest();
  DragTest();
  calendarPickerDateTest();
  textInputWordBreakTest();
  NodeUtilMoveTest();
}
