'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ResponseRegionTest from './ResponseRegionTest/ResponseRegion.test';
import ContentCoverOptionsTest from './ContentCoverOptionsTest/ContentCoverOptions.test';
import SweepGradientOptionsTest from './SweepGradientOptionsTest/SweepGradientOptions.test';
import RotateAngleOptionsTest from './RotateAngleOptionsTest/RotateAngleOptions.test';
import DrawModifierTest from './DrawModifierTest/DrawModifier.test';
import TransitionEffectTest from './TransitionEffectTest/TransitionEffect.test';
import SourceTypeTest from './SourceTypeTest/SourceType.test';
import AxisEventTest from './AxisEventTest/AxisEvent.test';
import DragEventTest from './DragEventTest/DragEvent.test';
import DismissReasonTest from './DismissReasonTest/DismissReason.test';
import CommonTest from './CommonTest/Common.test';
import CommonMethodTest from './CommonMethodTest/CommonMethod.test';
import TextContentControllerBaseTest from './TextContentControllerBaseTest/TextContentControllerBase.test';
import ScrollableCommonMethodTest from './ScrollableCommonMethodTest/ScrollableCommonMethod.test';
import ScrollResultTest from './ScrollResultTest/ScrollResult.test';
import ChildrenMainSizeTest from './ChildrenMainSizeTest/ChildrenMainSize.test';
import LayoutPolicyTest from './LayoutPolicyTest/LayoutPolicy.test';

export default function testsuite() {
  ResponseRegionTest();
  RotateAngleOptionsTest();
  ContentCoverOptionsTest();
  SweepGradientOptionsTest();
  DrawModifierTest();
  TransitionEffectTest();
  SourceTypeTest();
  AxisEventTest();
  DragEventTest();
  DismissReasonTest();
  TextContentControllerBaseTest();
  CommonTest();
  CommonMethodTest();
  ScrollableCommonMethodTest();
  ScrollResultTest();
  ChildrenMainSizeTest();
  LayoutPolicyTest();
}