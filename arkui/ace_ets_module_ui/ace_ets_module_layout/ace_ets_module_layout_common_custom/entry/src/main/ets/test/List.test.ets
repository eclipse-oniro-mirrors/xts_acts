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

import Calc01 from './CommonCustom/Calc01Jsunit.test';
import Calc02 from './CommonCustom/Calc02Jsunit.test';
import ChainWeight from './CommonCustom/ChainWeight.test'
import CustomLayoutUniqueidTest from './CommonCustom/CustomLayoutUniqueidTest.test'
import ButtonAlignTest from './CommonCustom/ButtonAlignTest.ets'
import mediaQueryOffJsunit from './CommonCustom/mediaQuery.test.ets';
import backgroundAndSizeSettingJsunit from './CommonAttrs/BackgroundAndSizeSettingJsunit.test';
import borderJsunit from './CommonAttrs/BorderJsunit.test';
import BorderRadiusRenderStrategyTest from './CommonAttrs/BorderRadiusRenderStrategyTest.ets';
import FlexFourBoundaryTest from './CommonAttrs/FlexFourBoundaryTest.ets';
import LayoutFourReturnTest from './CommonCustom/LayoutFourReturnTest.ets';
import ConstraintSizeNullUndefinedTest from './CommonAttrs/ConstraintSizeNullUndefined.test';
import LayoutWeightNullUndefinedTest from './CommonAttrs/LayoutWeightNullUndefined.test';
import SafeAreaPaddingNullUndefinedTest from './CommonAttrs/SafeAreaPaddingNullUndefined.test';
import ChainWeightNullUndefinedTest from './CommonAttrs/ChainWeightNullUndefined.test';
import GridContainerNullUndefinedTest from './CommonAttrs/GridContainerNullUndefined.test';
import FlexLayoutNullUndefinedTest from './CommonAttrs/FlexLayoutNullUndefined.test';
import SizeNullUndefinedTest from './CommonAttrs/SizeNullUndefined.test';
import AspectRatioNullUndefinedTest from './CommonAttrs/AspectRatioNullUndefined.test';
import DisplayPriorityNullUndefinedTest from './CommonAttrs/DisplayPriorityNullUndefined.test';
import AlignNullUndefinedTest from './CommonAttrs/AlignNullUndefined.test';
import DirectionNullUndefinedTest from './CommonAttrs/DirectionNullUndefined.test';
import OffsetNullUndefinedTest from './CommonAttrs/OffsetNullUndefined.test';
import ChainModeNullUndefinedTest from './CommonAttrs/ChainModeNullUndefined.test';
import UseSizeTypeNullUndefinedTest from './CommonAttrs/UseSizeTypeNullUndefined.test';
import MarkAnchorNullUndefinedTest from './CommonAttrs/MarkAnchorNullUndefined.test';
import LayoutChildLayoutNullTest from './CommonCustom/LayoutChildLayoutNull.test';
import LayoutChildLayoutUndefinedTest from './CommonCustom/LayoutChildLayoutUndefined.test';
import LayoutChildMeasureNullTest from './CommonCustom/LayoutChildMeasureNull.test';
import LayoutChildMeasureUndefinedTest from './CommonCustom/LayoutChildMeasureUndefined.test';
import LayoutlableLayoutNullTest from './CommonCustom/LayoutlableLayoutNull.test';
import LayoutlableLayoutUndefinedTest from './CommonCustom/LayoutlableLayoutUndefined.test';
import LayoutlableMeasureNullTest from './CommonCustom/LayoutlableMeasureNull.test';
import LayoutlableMeasureUndefinedTest from './CommonCustom/LayoutlableMeasureUndefined.test';
import LayoutGravityNullUndefinedTest from './CommonAttrs/LayoutGravityNullUndefined.test';
import IgnoreLayoutSafeAreaNullUndefinedTest from './CommonAttrs/IgnoreLayoutSafeAreaNullUndefined.test';
import ExpandSafeAreaNullUndefinedTest from './CommonAttrs/ExpandSafeAreaNullUndefined.test';

import MediaQueryMatchMediaNullUndefinedTest from './CommonCustom/MediaQueryMatchMediaNullUndefinedTest.test';
import MediaQueryMatchMediaSyncNullUndefinedTest from './CommonCustom/MediaQueryMatchMediaSyncNullUndefinedTest.test';
import pixelRoundNullUndefinedTest from './CommonCustom/pixelRoundNullUndefinedTest.test';
import getContext2DFromDrawingContextNullUndefinedTest from './CommonCustom/getContext2DFromDrawingContextNullUndefinedTest.test';
import CommonApiNullUndefinedTest from './CommonCustom/CommonApiNullUndefinedTest.test';

import DynamicLayoutColumnTest from './CommonCustom/DynamicLayoutColumnTest.test';
import DynamicLayoutRowTest from './CommonCustom/DynamicLayoutRowTest.test';
import DynamicLayoutStackTest from './CommonCustom/DynamicLayoutStackTest.test';
import DynamicLayoutGridTest from './CommonCustom/DynamicLayoutGridTest.test';
import DynamicLayoutCustomTest from './CommonCustom/DynamicLayoutCustomTest.test';

export default function testsuite() {
  Calc01();
  Calc02();
  ChainWeight();
  CustomLayoutUniqueidTest();
  ButtonAlignTest();
  mediaQueryOffJsunit();
  backgroundAndSizeSettingJsunit();
  borderJsunit();
  BorderRadiusRenderStrategyTest();
  FlexFourBoundaryTest();
  LayoutFourReturnTest();
  ConstraintSizeNullUndefinedTest();
  LayoutWeightNullUndefinedTest();
  SafeAreaPaddingNullUndefinedTest();
  ChainWeightNullUndefinedTest();
  GridContainerNullUndefinedTest();
  FlexLayoutNullUndefinedTest();
  SizeNullUndefinedTest();
  AspectRatioNullUndefinedTest();
  DisplayPriorityNullUndefinedTest();
  AlignNullUndefinedTest();
  DirectionNullUndefinedTest();
  OffsetNullUndefinedTest();
  ChainModeNullUndefinedTest();
  UseSizeTypeNullUndefinedTest();
  MarkAnchorNullUndefinedTest();
  LayoutChildLayoutNullTest();
  LayoutChildLayoutUndefinedTest();
  LayoutChildMeasureNullTest();
  LayoutChildMeasureUndefinedTest();
  LayoutlableLayoutNullTest();
  LayoutlableLayoutUndefinedTest();
  LayoutlableMeasureNullTest();
  LayoutlableMeasureUndefinedTest();
  LayoutGravityNullUndefinedTest();
  IgnoreLayoutSafeAreaNullUndefinedTest();
  ExpandSafeAreaNullUndefinedTest();

  MediaQueryMatchMediaNullUndefinedTest();
  MediaQueryMatchMediaSyncNullUndefinedTest();
  pixelRoundNullUndefinedTest();
  getContext2DFromDrawingContextNullUndefinedTest();
  CommonApiNullUndefinedTest();

  DynamicLayoutColumnTest();
  DynamicLayoutRowTest();
  DynamicLayoutStackTest();
  DynamicLayoutGridTest();
  DynamicLayoutCustomTest();
}