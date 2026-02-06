/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import IsAvailableTest from './ContextTest/IsAvailableTest.test';
import InheritFreezeOptionsTest from './BuilderNodeTest/InheritFreezeOptionsTest.test';
import ComponentInheritFreezeOptionsTest from './ComponentContentTest/ComponentInheritFreezeOptionsTest.test';
import DrawModifierOneTest from './DrawTest/DrawModifierOneTest.test';
import DrawModifierTwoTest from './DrawTest/DrawModifierTwoTest.test';
import IsDisposedTest from './ContextTest/IsDisposedTest.test';
import DrawForegroundTest from './DrawTest/DrawForegroundTest.test';
import BuilderNodeOneTest from './LocalStorageTest/BuilderNodeOneTest.test';
import BuilderNodeTwoTest from './LocalStorageTest/BuilderNodeTwoTest.test';
import BuilderNodeThreeTest from './LocalStorageTest/BuilderNodeThreeTest.test';
import bindControllerGrid from './FrameNodeTest/bindControllerGrid.test';
import bindControllerList from './FrameNodeTest/bindControllerList.test';
import bindControllerSwiper from './FrameNodeTest/bindControllerSwiper.test';
import bindControllerWaterFlow from './FrameNodeTest/bindControllerWaterFlow.test';
import GetGlobalPositionOnDisplayTest from './FrameNodeTest/GetGlobalPositionOnDisplayTest.test';
import DarkModeTest from './UIAppearance/DarkModeTest.test';
import EnableProvideConsumeCrossingTest from './BuilderNodeTest/EnableProvideConsumeCrossingTest.test';
import DarkColorsTest from './ThemeTest/DarkColorsTest.test';
import NodeAdapterDispose from './FrameNodeTest/NodeAdapterDispose.test';
import BuilderNodeIsDisposedTest from './ContextTest/BuilderNodeIsDisposedTest.test';
import ComponentContentIsDisposedTest from './ContextTest/ComponentContentIsDisposedTest.test';
import FrameNodeIsDisposedTest from './ContextTest/FrameNodeIsDisposedTest.test';
import RenderNodeIsDisposedTest from './ContextTest/RenderNodeIsDisposedTest.test';
import NodeAdapterIsDisposedTest from './ContextTest/NodeAdapterIsDisposedTest.test';
import frameNodeGetAttributeTest from './FrameNodeTest/frameNodeGetAttributeTest.test';
import MakeNodeNullTest from './FrameNodeTest/MakeNodeNullTest.test';
import IsModifiableBooleanTest from './FrameNodeTest/IsModifiableBooleanTest.test';
import GetAllAvailableItemsTest from './FrameNodeTest/GetAllAvailableItemsTest.test';
import RenderNodeMethodNullTest from './FrameNodeTest/RenderNodeMethodNullTest.test';
import AttachNodeAdapterBooleanTest from './FrameNodeTest/AttachNodeAdapterBooleanTest.test';
import IsFollowingSystemFontScaleFalseTest from './ContextTest/IsFollowingSystemFontScaleFalseTest.test';
import isTransferredTest from './FrameNodeTest/isTransferredTest.test';

export default function testsuite() {
  IsAvailableTest();
  InheritFreezeOptionsTest();
  ComponentInheritFreezeOptionsTest();
  DrawModifierOneTest();
  DrawModifierTwoTest();
  IsDisposedTest();
  DrawForegroundTest();
  BuilderNodeOneTest();
  BuilderNodeTwoTest();
  BuilderNodeThreeTest();
  bindControllerGrid();
  bindControllerList();
  bindControllerSwiper();
  bindControllerWaterFlow();
  GetGlobalPositionOnDisplayTest();
  DarkModeTest();
  EnableProvideConsumeCrossingTest();
  DarkColorsTest();
  NodeAdapterDispose();
  BuilderNodeIsDisposedTest();
  ComponentContentIsDisposedTest();
  FrameNodeIsDisposedTest();
  RenderNodeIsDisposedTest();
  NodeAdapterIsDisposedTest();
  frameNodeGetAttributeTest();
  MakeNodeNullTest();
  IsModifiableBooleanTest();
  GetAllAvailableItemsTest();
  RenderNodeMethodNullTest();
  AttachNodeAdapterBooleanTest();
  IsFollowingSystemFontScaleFalseTest();
  isTransferredTest()
}