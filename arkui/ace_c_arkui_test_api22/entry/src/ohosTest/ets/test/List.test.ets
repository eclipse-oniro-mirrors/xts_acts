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
import imageAltTest  from "./image/imageAltTest.test";
import textMinLinesTest from './textMinLines/TextMinLinesTest.test'
import HasAxisTest from './hasAxisTest/HasAxisTest.test'
import RegionListCapiTest from "./InteractiveFramework/RegionListTest.test";
import CoastingAxisTest from "./list/coastingAxisTest.test";
import snapSpeedTest from "./list/snapSpeedTest.test";
import lanesValueTest from "./list/lanesValueTest.test";
import WaterFlowFillPolicyTest from "./waterFlow/WaterFlowFillPolicyTest.test"
import imageDrawableDescriptorTest from "./image/imageDrawableDescriptorTest.test";
import imageErrorTest from "./image/imageErrorTest.test";
import textLineHeightTest from "./textLineHeight/TextLineHeightTest.test";
import textAreaBarStateTest from "./textArea/TextAreaBarStateTest.test";
import scrollBarTest from "./scrollbarTest/scrollbarTest.test";
import ShowCounterTest from "./showCounterTest/showCounterTest.test";
import NodeSwiperItemFillpolocyTest from "./swiper/NodeSwiperItemFillpolocy.test"
import finishAnimationTest from "./swiper/finishAnimationTest.test";
import imageSpanTest from "./imageSpanTest/ImageSpanTest.test";
import customKeyboardTest from "./customKeyboard/CustomKeyboardTest.test";
import animationControllerTest from "./image/animationControllerTest.test";
import ImageDrawableErrorTest from "./image/drawableDescriptorError.test";
import DragAndDropTest from "./drag/DragDragPreviewOption.test";
import native_gesture_booleanTest from "./InteractiveFramework/native_gesture_boolean.test";
import ui_input_event_booleanTest from "./InteractiveFramework/ui_input_event_boolean.test";
import native_node_extented_booleanTest from "./InteractiveFramework/native_node_extented_boolean.test";
import longPressGusture from "./InteractiveFramework/longPressGueture.test";
import GridFillPolicyTest from "./grid/GridFillPolicyTest.test"
import gridAttrsTest from "./grid/GridAttrsTest.test";
import gridEventTest from './grid/GridEventTest.test';
import clipShapeTest from "./clipShape/ClipShapeTest.test";
import CustomMarkDirtyTest from './CustomComponent/CustomMarkDirtyTest';
import enumTest from "./InteractiveFramework/enum.test";
import TextMenuItemIdTest from './TextTest/TextMenuItemId.test'
import SwiperParamTest from './swiper/SwiperParamTest.test';
import SwiperEnumTest from './swiper/SwiperEnumTest.test';
import ImageEnumTest from "./image/enum.test";
import TextEnumTest from "./TextTest/enum.test";
import BindSelectionMenuTest from './BindSelectionMenu/BindSelectionMenuTest.test'
import LayoutManagerTest from './LayoutManager/LayoutManagerTest.test'
import TextEditMenuOptionsTest from './TextEditMenuOptions/TextEditMenuOptionsTest.test'
import gridAbilityTest from "./grid/GridAbilityTest.test";
import gridDragTest from "./grid/GridDragTest.test";

export default function testsuite() {
  CoastingAxisTest();
  imageAltTest();
  snapSpeedTest();
  lanesValueTest();
  textMinLinesTest();
  HasAxisTest();
  RegionListCapiTest();
  WaterFlowFillPolicyTest();
  imageDrawableDescriptorTest();
  imageErrorTest();
  textLineHeightTest();
  textAreaBarStateTest();
  scrollBarTest();
  ShowCounterTest();
  NodeSwiperItemFillpolocyTest();
  finishAnimationTest();
  imageSpanTest();
  customKeyboardTest();
  animationControllerTest();
  ImageDrawableErrorTest();
  GridFillPolicyTest();
  DragAndDropTest();
  native_gesture_booleanTest();
  ui_input_event_booleanTest();
  native_node_extented_booleanTest();
  longPressGusture();
  gridAttrsTest();
  gridEventTest();
  clipShapeTest();
  CustomMarkDirtyTest();
  enumTest();
  TextMenuItemIdTest();
  SwiperParamTest();
  SwiperEnumTest();
  ImageEnumTest();
  TextEnumTest();
  BindSelectionMenuTest();
  LayoutManagerTest();
  TextEditMenuOptionsTest();
  gridAbilityTest();
  gridDragTest();
}