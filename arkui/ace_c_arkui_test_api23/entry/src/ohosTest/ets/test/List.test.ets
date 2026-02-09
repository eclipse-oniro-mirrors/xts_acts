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
import ContainerPickerCanLoop from './containerPicker/ContainerPickerCanLoopTest.test'
import ContainerPickerEnableHapticFeedback from './containerPicker/ContainerPickerEnableHapticFeedbackTest.test'
import ContainerPickerOnChangeTest from './containerPicker/ContainerPickerOnChangeTest.test'
import ContainerPickerOnScrollStopTest from './containerPicker/ContainerPickerOnScrollStopTest.test'
import ContainerPickerSelectedIndex from './containerPicker/ContainerPickerSelectedIndexTest.test'
import ContainerPickerSelectionIndicator from './containerPicker/ContainerPickerSelectionIndicatorTest.test'
import ContainerPickerSubComponent from './containerPicker/ContainerPickerSubComponentTest.test'
import chainWeightTest from './chainWeight/ChainWeightTest.test'
import borderTest from './border/BorderTest.test'
import borderRadiusTest from './border/BorderRadiusTest.test'
import ignoreLayoutSafeAreaTest from './layout/IgnoreLayoutSafeAreaTest.test'
import layoutGravityTest from './layout/LayoutGravityTest.test'
import flexSpaceTest from './flex/FlexSpaceTest.test'
import columnSpaceTest from './column/ColumnSpaceTest.test'
import rowSpaceTest from './row/RowSpaceTest.test'
import columnReverseTest from './column/ColumnReverseTest.test'
import rowReverseTest from './row/RowReverseTest.test'
import TextCompressLeadingPunctuationTest from "./text/TextCompressLeadingPunctuationTest.test";
import TextAreaCompressLeadingPunctuationTest from "./textArea/TextAreaCompressLeadingPunctuationTest.test";
import TextInputCompressLeadingPunctuationTest from "./textInput/TextInputCompressLeadingPunctuationTest.test";
import TextEnumTest from "./text/TextEnum.test";
import TextMarqueeOptionsTest from './TextMarqueeOptions/TextMarqueeOptions.test';
import ScrollToVisibleTest from './ScrollToVisible/ScrollToVisible.test';
import distanceTest from './distance/DistanceTest.test'
import hoverEffectTest from './hoverEffect/HoverEffectTest.test'
import monopolizeTest from './monopolize/MonopolizeTest.test'
import MotionPathOptionsTest from './MotionPath/MotionPathOptionsTest.test'
import AtomicServiceMenuBarSetVisibleTest from './publicCapacity/AtomicServiceMenuBarSetVisibleTest.test'
import TextDirectionTest from './text/TextDirection.test'
import TextSelectionTest from './textSelection/textSelectionTest.test'
import IsInRenderStateReturnValueTest from "./node/IsInRenderStateReturnValueTest.test";
import ConvertPositionToWindowTest from "./node/ConvertPositionToWindowTest.test";
import IsInRenderStateTest from "./node/IsInRenderStateTest.test";
import ConvertPositionFromWindowTest from "./node/ConvertPositionFromWindowTest.test";
import refreshAttrsTest from './refresh/RefreshAttrsTest.test'
import ImageAntialiasedTest from './imageTest/ImageAntialiasedTest.test'
import ListEmptyTest from "./list/ListEmptyTest.test";
import GridEmptyTest from "./grid/GridEmptyTest.test";
import TextInputDeletBackward from "./deleteBackward/DeleteBackwardTest.test";
import TextAreaDeletBackward from "./deleteBackward/TextAreaDeleteBackwardTest.test";
import TextTest from "./TextTest/TextTest.test";
import TextInputTest from "./TextTest/TextInputTest.test";
import TextAreaTest from "./TextTest/TextAreaTest.test";
import SelectedDragPreviewStyleTextTest from './SelectedDragPreviewStyleTest/SelectedDragPreviewStyleTextTest.test'
import SelectedDragPreviewStyleTextInputTest from './SelectedDragPreviewStyleTest/SelectedDragPreviewStyleTextInputTest.test'
import SelectedDragPreviewStyleTextAreaTest from './SelectedDragPreviewStyleTest/SelectedDragPreviewStyleTextAreaTest.test'

export default function testsuite() {
  IsInRenderStateReturnValueTest(); //此条方在最前面，勿动
  TextAreaDeletBackward();
  TextTest();
  TextInputTest();
  TextAreaTest();
  TextInputDeletBackward();
  ConvertPositionToWindowTest();
  IsInRenderStateTest();
  ConvertPositionFromWindowTest();
  ContainerPickerCanLoop();
  ContainerPickerEnableHapticFeedback();
  ContainerPickerOnChangeTest();
  ContainerPickerOnScrollStopTest();
  ContainerPickerSelectedIndex();
  ContainerPickerSelectionIndicator();
  ContainerPickerSubComponent();
  chainWeightTest();
  borderTest();
  borderRadiusTest();
  ignoreLayoutSafeAreaTest();
  layoutGravityTest();
  flexSpaceTest();
  columnSpaceTest();
  rowSpaceTest();
  columnReverseTest();
  rowReverseTest();
  TextCompressLeadingPunctuationTest();
  TextAreaCompressLeadingPunctuationTest();
  TextInputCompressLeadingPunctuationTest();
  TextEnumTest();
  hoverEffectTest();
  distanceTest();
  monopolizeTest();
  MotionPathOptionsTest();
  AtomicServiceMenuBarSetVisibleTest();
  TextDirectionTest();
  TextSelectionTest();
  refreshAttrsTest();
  ImageAntialiasedTest();
  ListEmptyTest();
  GridEmptyTest();
  SelectedDragPreviewStyleTextTest()
  SelectedDragPreviewStyleTextAreaTest()
  SelectedDragPreviewStyleTextInputTest()
  TextMarqueeOptionsTest();
  ScrollToVisibleTest();
}