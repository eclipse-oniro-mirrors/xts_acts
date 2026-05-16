'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import ButtonTest from './ButtonTest/Button.test';
import ArcButtonEnumTest from './ButtonTest/ArcButtonEnum.test';
import ArcButtonTest from './ArcButtonTest/ArcButton.test';
import ButtonLabelStyleTest from './ButtonLabelStyleTest/ButtonLabelStyle.test';
import DialogButtonOptionsTextAlignTest from './DialogButtonOptionsTextAlignTest/DialogButtonOptionsTextAlign.test';
import DialogV2ButtonTextAlignTest from './DialogV2ButtonTextAlignTest/DialogV2ButtonTextAlign.test';
import SegmentButtonEnableStateAnimationTest from './SegmentButtonEnableStateAnimationTest/SegmentButtonEnableStateAnimation.test';
import SegmentButtonV2EnableStateAnimationTest from './SegmentButtonV2EnableStateAnimationTest/SegmentButtonV2EnableStateAnimation.test';

export default function testsuite() {
  ButtonTest();
  ArcButtonEnumTest();
  ArcButtonTest();
  ButtonLabelStyleTest();
  DialogButtonOptionsTextAlignTest();
  DialogV2ButtonTextAlignTest();
  SegmentButtonEnableStateAnimationTest();
  SegmentButtonV2EnableStateAnimationTest();
}