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
import borderRadiuses from './GraphicsTest/borderRadiuses.test';
import borderStyles from './GraphicsTest/borderStyles.test';
import edgeColors from './GraphicsTest/edgeColors.test';
import edgeWidths from './GraphicsTest/edgeWidths.test';
import graphicGetInterfaceTest from './GraphicsTest/graphicGetInterface.test';
import renderNodeGetInterfaceTest from './renderNode/renderNodeTestInterface.test';
import disposeTest from './FrameNodeTest/dispose.test';
import getAttrsTest from './FrameNodeTest/getAttrs.test';
import getPosition from './FrameNodeTest/getPosition.test';
import setLayout from './FrameNodeTest/setLayout.test';


import RenderNodeAttributeTest from './renderNode/RenderNodeAttributeTest.test';
import setRectShape from './GraphicsTest/setRectShape.test';
import LengthUnitTest from './GraphicsTest/LengthUnit.test'
import getBlendColor from './GraphicsTest/getBlendColor.test';
import resourceColor from './GraphicsTest/resourceColor.test';
import getNumeric from './GraphicsTest/getNumeric.test';
import getAlpha from './GraphicsTest/getAlpha.test';
import getBlue from './GraphicsTest/getBlue.test';
import getGreen from './GraphicsTest/getGreen.test';
import getRed from './GraphicsTest/getRed.test';
import onAppear from './FrameNodeTest/onAppear.test';
import setMeasureSizeTest from './FrameNodeTest/setMeasureSize.test';
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
import setCircleShapeTest from './GraphicsTest/setCircleShape.test';
import commonEventTest1 from './FrameNodeTest/commonEventTest1.test';
import expectedUpdateInterval from './FrameNodeTest/expectedUpdateInterval.test';
import CornerTest from './GraphicsTest/GraphicsApiTest/CornerTest.test';
import LengthMetricsUnitTest from './GraphicsTest/GraphicsApiTest/LengthMetricsUnitTest.test';
import PercentReferenceTest from './GraphicsTest/GraphicsApiTest/PercentReferenceTest.test';
import typeNodeBlankTest from './typeNodeTest/Blank.test';
import typeNodeDividerTest from './typeNodeTest/Divider.test';
import typeNodeGridColTest from './typeNodeTest/GridCol.test';
import typeNodeListTest from './typeNodeTest/List.test';
import typeNodeLoadingProgressTest from './typeNodeTest/LoadingProgress.test';
import typeNodeProgressTest from './typeNodeTest/Progress.test';
import typeNodeRelativeContainerTest from './typeNodeTest/RelativeContainer.test';
import typeNodeSwiperTest from './typeNodeTest/Swiper.test';
import RELOAD from './FrameNodeTest/RELOAD.test';

import BuilderNodeApiRecycleTest from './FrameNodeTest/BuilderNodeApiRecycleTest.test';
import BuilderNodeApiReuseTest from './FrameNodeTest/BuilderNodeApiReuseTest.test';
import ComponentContentAPIRecycleTest from './FrameNodeTest/ComponentContentAPIRecycleTest.test';
import ComponentContentAPIReuseTest from './FrameNodeTest/ComponentContentAPIReuseTest.test';
import APImarkNodeGroupTest from './FrameNodeTest/APImarkNodeGroupTest.test';
import APINodeContentTest from './FrameNodeTest/APINodeContentTest.test';
import APIPanGestureisisBeginTest from './FrameNodeTest/APIPanGestureisisBeginTest.test';

import RenderNodeDemo01Test from './renderNode/RenderNodeDemo/RenderNodeDemo01Test.test';
import RenderNodeDemo02Test from './renderNode/RenderNodeDemo/RenderNodeDemo02Test.test';
import RenderNodeDemo03Test from './renderNode/RenderNodeDemo/RenderNodeDemo03Test.test';
import RenderNodeDemo04Test from './renderNode/RenderNodeDemo/RenderNodeDemo04Test.test';
import RenderNodeDemo05Test from './renderNode/RenderNodeDemo/RenderNodeDemo05Test.test';
import RenderNodeDemo06Test from './renderNode/RenderNodeDemo/RenderNodeDemo06Test.test';

import APIdisposeTreeTest from './FrameNodeTest/APIdisposeTreeTest.test';
import typeNodeTextInputTest from './typeNodeTest/TextInput.test';
import typeNodeListItemTest from './typeNodeTest/ListItem.test';
import typeNodechildrenMainSizeTest from './typeNodeTest/ChildrenMainSize.test';
import setLabelTest from './renderNode/setLabel.test';
import setMarkNodeGroupTest from './renderNode/setMarkNodeGroup.test';
import setShapeClipTest from './renderNode/setShapeClip.test';
import attachNodeAdapterTest from './FrameNodeTest/attachNodeAdapter.test';
import updateConfigurationTest1 from './BuilderNodeTest/updateConfigurationTest1';
import updateConfigurationTest2 from './ComponentContentTest/updateConfigurationTest2';
import getAttachedFrameNodeById from './FrameNodeTest/getAttachedFrameNodeById.test';

export default function testsuite() {
  APIdisposeTreeTest();
  RenderNodeDemo01Test();
  RenderNodeDemo02Test();
  RenderNodeDemo03Test();
  RenderNodeDemo04Test();
  RenderNodeDemo05Test();
  RenderNodeDemo06Test();
  BuilderNodeApiRecycleTest();
  BuilderNodeApiReuseTest();
  ComponentContentAPIRecycleTest();
  ComponentContentAPIReuseTest();
  APImarkNodeGroupTest();
  APINodeContentTest();
  APIPanGestureisisBeginTest();
  borderRadiuses();
  borderStyles();
  edgeColors();
  edgeWidths();
  renderNodeGetInterfaceTest();
  disposeTest();
  getAttrsTest();
  getPosition();
  setLayout();
  RenderNodeAttributeTest();
  setRectShape();
  LengthUnitTest();
  getBlendColor();
  resourceColor();
  getNumeric();
  getAlpha();
  getBlue();
  getGreen();
  getRed();
  onAppear();
  setMeasureSizeTest();
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
  commonEventTest1();
  CornerTest();
  LengthMetricsUnitTest();
  PercentReferenceTest();
  setCircleShapeTest();
  graphicGetInterfaceTest();
  typeNodeTextInputTest();
  typeNodeListItemTest();
  typeNodechildrenMainSizeTest();
  setLabelTest();
  setMarkNodeGroupTest();
  setShapeClipTest();
  attachNodeAdapterTest();
  updateConfigurationTest1();
  updateConfigurationTest2();
  getAttachedFrameNodeById();

}