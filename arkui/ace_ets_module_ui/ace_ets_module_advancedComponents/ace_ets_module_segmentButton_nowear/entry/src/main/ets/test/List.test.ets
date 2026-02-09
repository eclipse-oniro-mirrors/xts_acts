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

import SegmentButtonBorderTest from './segmentButton/SegmentButtonBorderTest.test';
import segmentButtonDirectionTest from './segmentButton/segmentbuttonDirection.test';
import localizedButtonPaddingTest from './segmentButton/localizedButtonPaddingTest';
import localizedTextPadding from './segmentButton/localizedTextPadding';
import SegmentButtonItemOptionsArray1 from './segmentButton/SegmentButtonItemOptionsArray1.test';
import SegmentButtonIconTextItem1 from './segmentButton/SegmentButtonIconTextItem1.test';
import SegmentButtonTextItem001 from './segmentButton/SegmentButtonTextItemTest.test';
import SegmentButtonOptionsReturnValue from './segmentButton/SegmentButtonOptionsReturnValue.test';
import SegmentButtonTest003 from './segmentButton/SegmentButtonTest003.test';
import SegmentButtonTest004 from './segmentButton/SegmentButtonTest004.test';
import SegmentButtonTest005 from './segmentButton/SegmentButtonTest005.test';
import SegBtnItemTest0010 from './segmentButton/SegBtnItemTest0010.test';
import SegmentBtnItemTest0010 from './segmentButton/SegmentBtnItemTest0010.test';
import maxFontScaleTest from './segmentButton/maxFontScaleTest.test';
import segmentbuttonTest from './segmentButton/segmentbutton'
import SegmentButtonV2Test from './segmentButtonV2/SegmentButtonV2.test';
import MultiSegmentButtonV2PageTest from './segmentButtonV2/MultiSegmentButtonV2PageTest.test';
import SegmentButtonV2Test0010 from './segmentButtonV2/SegmentButtonV2Test0010.test';
import TabSegmentButtonV2Test from './segmentButtonV2/TabSegmentButtonV2Test.test';
import SegBtnSelectBackgrountColorTest from './defaultValue/SegBtnSelectBackgrountColorTest.test';
import SegmentBtnMaterialTest0070 from './segmentButton/SegmentBtnMaterialTest0070.test';

export default function testsuite() {
  SegmentButtonBorderTest();
  segmentButtonDirectionTest();
  localizedButtonPaddingTest();
  localizedTextPadding();
  SegmentButtonItemOptionsArray1();
  SegmentButtonIconTextItem1();
  SegmentButtonTextItem001();
  SegmentButtonOptionsReturnValue();
  SegmentButtonTest003();
  SegmentButtonTest004();
  SegmentButtonTest005();
  SegBtnItemTest0010();
  SegmentBtnItemTest0010();
  maxFontScaleTest();
  segmentbuttonTest();
  SegmentButtonV2Test();
  MultiSegmentButtonV2PageTest();
  SegmentButtonV2Test0010();
  TabSegmentButtonV2Test();
  SegBtnSelectBackgrountColorTest();
  SegmentBtnMaterialTest0070();

}