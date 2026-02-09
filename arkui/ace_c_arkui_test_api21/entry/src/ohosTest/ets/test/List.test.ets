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
import NodeUtilsMethodTest from './nodeUtil/NodeUtilsMethodTest.test'
import NodeUtilsReturnTest from './nodeUtil/NodeUtilsReturnTest.test'
import TestInvalidateAttributes from './invalidate/TestInvalidateAttributes.test'
import TestRegisterCommonEvent from './commonEvent/TestRegisterCommonEvent.test'
import EdgesPositionTest from './position/EdgesPositionTest.test'
import textContentAlignTest from './textContentAlign/TextContentAlignTest.test'
import PixelRoundTest from './PixelRound/PixelRoundTest.test'
import TestAllowForceDark from './allowForceDark/TestAllowForceDark.test'
import ColumnMatchParentTest from './Column/ColumnMatchParentTest'
import ColumnWrapContentTest from './Column/ColumnWrapContentTest'
import ColumnFixAtiDealSizeTest from './Column/ColumnFixAtiDealSizeTest'
import ImageContentTransitionEffectTest from './Image/ImageContentTransitionEffect.test'
import ScrollEventTypeTest from './scroll/ScrollEventTypeTest.test'
import ListEventTypeTest from './list/ListEventTypeTest.test'
import RefreshEventTypeTest from './refresh/RefreshEventTypeTest.test'
import WaterFlowEventTypeTest from './waterFlow/WaterFlowEventTypeTest.test'
import GridEventTypeTest from './grid/GridEventTypeTest.test'
import ListDraggingEventTest from './list/ListDraggingEventTest.test'
import ListFlingEventTest from './list/ListFlingEventTest.test'
import ImageSupportSvg2Test from './imageSupportSvg2/ImageSupportSvg2Test.test'
import SourceTypeTest from './sourceType/SourceTypeTest.test'
import SourceFlingEdgeTest from './list/SourceFlingEdgeTest.test'
import SourceScrollBarTest from './list/SourceScrollBarTest.test'
import SourceBtnScrollerTest from './list/SourceBtnScrollerTest.test'
import CustomNodeEventTest from './custom/CustomNodeEventTest.test'

export default function testsuite() {
  NodeUtilsMethodTest(); // 此条特殊用例请放在首行，勿动
  NodeUtilsReturnTest();
  TestInvalidateAttributes();
  TestRegisterCommonEvent();
  EdgesPositionTest();
  textContentAlignTest();
  PixelRoundTest();
  TestAllowForceDark();
  ColumnMatchParentTest();
  ColumnWrapContentTest();
  ColumnFixAtiDealSizeTest();
  ImageContentTransitionEffectTest();
  ScrollEventTypeTest();
  ListEventTypeTest();
  RefreshEventTypeTest();
  WaterFlowEventTypeTest();
  GridEventTypeTest();
  ListDraggingEventTest();
  ListFlingEventTest();
  ImageSupportSvg2Test();
  SourceTypeTest();
  SourceFlingEdgeTest();
  SourceScrollBarTest();
  SourceBtnScrollerTest();
  CustomNodeEventTest();
}