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
import APIdisposeTreeTest from './FrameNodeTest/APIdisposeTreeTest.test';
import APImarkNodeGroupTest from './FrameNodeTest/APImarkNodeGroupTest.test';
import APIPanGestureisisBeginTest from './FrameNodeTest/APIPanGestureisisBeginTest.test';
import attachNodeAdapterTest from './FrameNodeTest/attachNodeAdapter.test';
import BuilderNodeApiRecycleTest from './FrameNodeTest/BuilderNodeApiRecycleTest.test';
import BuilderNodeApiReuseTest from './FrameNodeTest/BuilderNodeApiReuseTest.test';
import commonEventTest1 from './FrameNodeTest/commonEventTest1.test';
import ComponentContentAPIRecycleTest from './FrameNodeTest/ComponentContentAPIRecycleTest.test';
import ComponentContentAPIReuseTest from './FrameNodeTest/ComponentContentAPIReuseTest.test';
import expectedUpdateInterval from './FrameNodeTest/expectedUpdateInterval.test';
import createNodeBlank from './FrameNodeTest/createNodeBlank.test';
import createNodeColumn from './FrameNodeTest/createNodeColumn.test';
import createNodeDivider from './FrameNodeTest/createNodeDivider.test';
import createNodeFlex from './FrameNodeTest/createNodeFlex.test';
import createNodeGrid from './FrameNodeTest/createNodeGrid.test';
import createNodeImage from './FrameNodeTest/createNodeImage.test';
import createNodeList from './FrameNodeTest/createNodeList.test';
import createNodeLoad from './FrameNodeTest/createNodeLoad.test';
import createNodeScroll from './FrameNodeTest/createNodeScroll.test';
import createNodeSearch from './FrameNodeTest/createNodeSearch.test';
import createNodeStack from './FrameNodeTest/createNodeStack.test';
import createNodeText from './FrameNodeTest/createNodeText.test';
import disposeTest from './FrameNodeTest/dispose.test';
import getAfterRemove from './FrameNodeTest/getAfterRemove.test';
import getAttachedFrameNodeById from './FrameNodeTest/getAttachedFrameNodeById.test';
import getAttrsTest from './FrameNodeTest/getAttrs.test';
import getPosition from './FrameNodeTest/getPosition.test';
import onAppear from './FrameNodeTest/onAppear.test';
import setLayout from './FrameNodeTest/setLayout.test';
import setMeasureSizeTest from './FrameNodeTest/setMeasureSize.test';

import gestureEventTest from './FrameNodeTest/gestureEventTest.test';
import upDownTreeEventTest from './FrameNodeTest/upDownTreeEvent.test';
import frameNodeIsVisibleTest from './FrameNodeTest/frameNodeIsVisible.test';
import lazyForEachTest from './FrameNodeTest/lazyForEachTest.test';

import frameNodeMoveOneTest from './FrameNodeNewTest/frameNodeMoveOne.test';
import frameNodeMoveTwoTest from './FrameNodeNewTest/frameNodeMoveTwo.test';
import frameNodeMoveToErrorCodeTest from './FrameNodeNewTest/frameNodeMoveToErrorCode.test';
import addComponentContentErrorCodeTest from './FrameNodeNewTest/AddComponentContentErrorCode.test';
import bindControllerErrorCodeTest from './FrameNodeNewTest/BindControllerErrorCode.test';
import renderNodeDisposeTest from './FrameNodeNewTest/RenderNodeDispose.test';
import componentContentDisposeTest from './FrameNodeNewTest/componentContentDispose.test';
import blendColorErrorCodeTest from './FrameNodeNewTest/blendColorErrorCode.test';
import resourceColorErrorCodeTest from './FrameNodeNewTest/resourceColorErrorCode.test';
import setCrossLanguageOptionsErrorCodeTest from './FrameNodeNewTest/setCrossLanguageOptionsErrorCode.test';
import FrameNodeMethodErrorCodeTest from './FrameNodeNewTest/FrameNodeMethodErrorCode.test';

import bindControllerGrid from './FrameNodeNewTest/bindControllerGrid.test';
import bindControllerList from './FrameNodeNewTest/bindControllerList.test';
import bindControllerSwiper from './FrameNodeNewTest/bindControllerSwiper.test';
import bindControllerWaterFlow from './FrameNodeNewTest/bindControllerWaterFlow.test';
import GetGlobalPositionOnDisplayTest from './FrameNodeNewTest/GetGlobalPositionOnDisplayTest.test';
import NodeAdapterDispose from './FrameNodeNewTest/NodeAdapterDispose.test';
import frameNodeGetAttributeTest from './FrameNodeNewTest/frameNodeGetAttributeTest.test';
import MakeNodeNullTest from './FrameNodeNewTest/MakeNodeNullTest.test';
import IsModifiableBooleanTest from './FrameNodeNewTest/IsModifiableBooleanTest.test';
import GetAllAvailableItemsTest from './FrameNodeNewTest/GetAllAvailableItemsTest.test';
import RenderNodeMethodNullTest from './FrameNodeNewTest/RenderNodeMethodNullTest.test';
import AttachNodeAdapterBooleanTest from './FrameNodeNewTest/AttachNodeAdapterBooleanTest.test';
import isTransferredTest from './FrameNodeNewTest/isTransferredTest.test';

import GetFrameNodeNullTest from './FrameNodeNewTest/GetFrameNodeNullTest.test';
import GetFrameNodeMethodNullTest from './FrameNodeNewTest/GetFrameNodeMethodNullTest.test';
import AdoptChildOneTest from './FrameNodeMethod/AdoptChildOneTest.test';
import AdoptChildTwoTest from './FrameNodeMethod/AdoptChildTwoTest.test';
import AdoptChildThreeTest from './FrameNodeMethod/AdoptChildThreeTest.test';
import AdoptChildTest from './FrameNodeMethod/AdoptChildTest.test';

import frameNodeApi from './FrameNodeTest/frameNodeApi.test';

import GraphicsFourBoundaryTest from './FrameNodeNewTest/GraphicsFourBoundaryTest';
import FrameNodeConvertPositionTest from './FrameNodeMethod/FrameNodeConvertPositionTest';
import FrameNodeConvertPositionErrorCodeTest from './FrameNodeMethod/FrameNodeConvertPositionErrorCodeTest';

export default function testsuite() {
  APIdisposeTreeTest();
  APImarkNodeGroupTest();
  APIPanGestureisisBeginTest();
  attachNodeAdapterTest();
  BuilderNodeApiRecycleTest();
  BuilderNodeApiReuseTest();
  commonEventTest1();
  ComponentContentAPIRecycleTest();
  ComponentContentAPIReuseTest();
  expectedUpdateInterval();
  createNodeBlank();
  createNodeColumn();
  createNodeDivider();
  createNodeFlex();
  createNodeGrid();
  createNodeImage();
  createNodeList();
  createNodeLoad();
  createNodeScroll();
  createNodeSearch();
  createNodeStack();
  createNodeText();
  disposeTest();
  getAfterRemove();
  getAttachedFrameNodeById();
  getAttrsTest();
  getPosition();
  onAppear();
  setLayout();
  setMeasureSizeTest();
  frameNodeIsVisibleTest();
  upDownTreeEventTest();
  gestureEventTest();
  lazyForEachTest();

  frameNodeMoveOneTest();
  frameNodeMoveTwoTest();
  frameNodeMoveToErrorCodeTest();
  addComponentContentErrorCodeTest();
  bindControllerErrorCodeTest();
  renderNodeDisposeTest();
  componentContentDisposeTest();
  blendColorErrorCodeTest();
  resourceColorErrorCodeTest();
  setCrossLanguageOptionsErrorCodeTest();
  FrameNodeMethodErrorCodeTest();

  bindControllerGrid();
  bindControllerList();
  bindControllerSwiper();
  bindControllerWaterFlow();
  GetGlobalPositionOnDisplayTest();
  NodeAdapterDispose();
  frameNodeGetAttributeTest();
  MakeNodeNullTest();
  IsModifiableBooleanTest();
  GetAllAvailableItemsTest();
  RenderNodeMethodNullTest();
  AttachNodeAdapterBooleanTest();
  isTransferredTest();

  GetFrameNodeNullTest();
  GetFrameNodeMethodNullTest();
  AdoptChildOneTest();
  AdoptChildTwoTest();
  AdoptChildThreeTest();
  AdoptChildTest();
  
  frameNodeApi();

  GraphicsFourBoundaryTest();
  FrameNodeConvertPositionTest();
  FrameNodeConvertPositionErrorCodeTest();
}