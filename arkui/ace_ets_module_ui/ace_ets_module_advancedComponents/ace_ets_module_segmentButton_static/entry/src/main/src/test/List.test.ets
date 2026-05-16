'use static';
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

import SegmentButtonOptionsTest from './segmentButton/SegmentButtonOptionsTest.test';
import SegBtnItemTest0010 from './segmentButton/SegBtnItemTest0010.test';
import BorderRadiusModeTest from './segmentButton/BorderRadiusMode.test';
import SegmentButtonItemOptionsArrayPushTest from './segmentButton/SegmentButtonItemOptionsArray1.test';
import CommonSegmentButtonOptionsTest from './segmentButton/CommonSegmentButtonOptions.test';
import SegmentButtonItemOptionsTest from './segmentButton/SegmentButtonItemOptions.test';
import TabSegmentButtonOptionsTest from './segmentButton/TabSegmentButtonOptions.test';
import MultiSegmentButtonV2PageTest from './segmentButtonV2/MultiSegmentButtonV2PageTest.test';
import MultiSegmentButtonV2UndefinedPageTest from './segmentButtonV2/MultiSegmentButtonV2UndefinedPageTest.test';
import SegmentButtonV2Test from './capsuleSegmentButtonV2/SegmentButtonV2.test';
import SegmentButtonV2Test0010 from './segmentButtonV2/SegmentButtonV2Test0010.test';
import CapsuleSegmentButtonAttributeTest from './SegmentButtonAttribute/CapsuleSegmentButtonAttributeTest.test';
import TabSegmentButtonAttributeTest from './SegmentButtonAttribute/TabSegmentButtonAttributeTest.test';
import TabSegmentButtonV2Test from './tabSegmentButtonV2/TabSegmentButtonV2Test.test';
import SegmentButtonV2Test0020Test from './segmentButtonV2/SegmentButtonV2Test0020.test';
import localizedTextPadding from './segmentButton/localizedTextPadding.test';
import SegmentButtonBorderTest from './segmentButton/SegmentButtonBorderTest.test';
import segmentButtonDirectionTest from './segmentButton/segmentbuttonDirection.test';
import SegmentBtnItemTest0010 from './segmentButton/SegmentBtnItemTest0010.test';
import SegmentButtonItemOptionsArrayTest from './segmentButton/SegmentButtonItemOptionsArray.test';
import segmentButtonEnableStateAnimation from './segmentButton/segmentButtonEnableStateAnimation.test';

export default function testsuite() {
  SegmentButtonOptionsTest();
  SegBtnItemTest0010();
  BorderRadiusModeTest();  
  SegmentButtonItemOptionsArrayPushTest();
  CommonSegmentButtonOptionsTest();
  SegmentButtonItemOptionsTest();
  TabSegmentButtonOptionsTest();
  MultiSegmentButtonV2PageTest();
  MultiSegmentButtonV2UndefinedPageTest();
  SegmentButtonV2Test();
  SegmentButtonV2Test0010();
  CapsuleSegmentButtonAttributeTest();
  TabSegmentButtonAttributeTest();
  TabSegmentButtonV2Test();
  SegmentButtonV2Test0020Test();
  localizedTextPadding();
  SegmentButtonBorderTest();
  segmentButtonDirectionTest();
  SegmentBtnItemTest0010();
  SegmentButtonItemOptionsArrayTest();
  segmentButtonEnableStateAnimation();
}