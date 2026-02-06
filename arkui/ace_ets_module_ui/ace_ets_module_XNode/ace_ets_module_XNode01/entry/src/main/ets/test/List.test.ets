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
import arkuiNodeTest from "./NodeContainerTest/arkuinode/arkuinode.test";
import arkuiNodeEventTest from './NodeContainerTest/arkuinode/arkuinodeEnvent.test';
import arkuiNodeRenderTest from './NodeContainerTest/arkuinode/arkuinodeRender.test';
import appendChildTest from './RenderNodeTest/renderNode/appendChild.test';
import drawContextGetSizeTest from './RenderNodeTest/renderNode/drawContextGetSize.test';
import keyframeTest from './RenderNodeTest/renderNode/keyframe.test';
import pixelRoundTest from './RenderNodeTest/renderNode/pixelRoundTest.test';
import frame from './RenderNodeTest/RenderNodeTest_001/frame.test';
import getChildTest from './RenderNodeTest/RenderNodeTest_001/getChildTest.test';
import getClipToFrameJsunit from './RenderNodeTest/RenderNodeTest_001/getClipToFrameJsunit.test';
import getColorTest from './RenderNodeTest/RenderNodeTest_001/getColorTest.test';
import getOpacityJsunit from './RenderNodeTest/RenderNodeTest_001/getOpacityJsunit.test';
import getPosition from './RenderNodeTest/RenderNodeTest_001/getPosition.test';
import getSizeJsunit from './RenderNodeTest/RenderNodeTest_001/getSizeJsunit.test';
import pivot from './RenderNodeTest/RenderNodeTest_001/pivot.test';
import scale from './RenderNodeTest/RenderNodeTest_001/scale.test';
import SetClipToFrameJsunit from './RenderNodeTest/RenderNodeTest_001/SetClipToFrameJsunit.test';
import SetOpacityJsunit from './RenderNodeTest/RenderNodeTest_001/SetOpacityJsunit.test';
import SetPositionJsunit from './RenderNodeTest/RenderNodeTest_001/SetPositionJsunit.test';
import SetSizeJsunit from './RenderNodeTest/RenderNodeTest_001/SetSizeJsunit.test.ets';
import RenderFitJsunit from './RenderNodeTest/RenderFitJsunit.test.ets';
import RenderNodeDrawJsSuit from './RenderNodeTest/RenderNodeDrawJsSuit.test';
import RenderNodeInvalidateJsSuit from './RenderNodeTest/RenderNodeInvalidateJsSuit.test';
import RenderNodeShadowElevationJsSuit from './RenderNodeTest/RenderNodeShadowElevation.test';
import RenderNodeShadowRadiusJsSuit from './RenderNodeTest/RenderNodeShadowRadius.test';
import rotationTest from './RenderNodeTest/rotation.test'
import shadowAlphaJsunit from './RenderNodeTest/shadowAlphaJsunit.test';
import shadowColorJsunit from './RenderNodeTest/shadowColorJsunit.test';
import shadowOffsetJsunit from './RenderNodeTest/shadowOffsetJsunit.test';
import transformTest from './RenderNodeTest/transform.test';
import translationTest from './RenderNodeTest/translation.test';

import ComponentInheritFreezeOptionsTest from './ComponentContentTest/ComponentInheritFreezeOptionsTest.test';
import InvalidateAttributesTest from './InvalidateTest/InvalidateAttributesTest.test';
import BuilderNodeOneTest from './LocalStorageTest/BuilderNodeOneTest.test';
import BuilderNodeTwoTest from './LocalStorageTest/BuilderNodeTwoTest.test';
import BuilderNodeThreeTest from './LocalStorageTest/BuilderNodeThreeTest.test';
import DarkModeTest from './UIAppearance/DarkModeTest.test';

import renderNodeGetInterfaceTest from './renderNode1/renderNodeTestInterface.test';
import RenderNodeAttributeTest from './renderNode1/RenderNodeAttributeTest.test';
import RenderNodeDemo01Test from './renderNode1/RenderNodeDemo/RenderNodeDemo01Test.test';
import RenderNodeDemo02Test from './renderNode1/RenderNodeDemo/RenderNodeDemo02Test.test';
import RenderNodeDemo03Test from './renderNode1/RenderNodeDemo/RenderNodeDemo03Test.test';
import RenderNodeDemo04Test from './renderNode1/RenderNodeDemo/RenderNodeDemo04Test.test';
import RenderNodeDemo05Test from './renderNode1/RenderNodeDemo/RenderNodeDemo05Test.test';
import RenderNodeDemo06Test from './renderNode1/RenderNodeDemo/RenderNodeDemo06Test.test';
import setLabelTest from './renderNode1/setLabel.test';
import setMarkNodeGroupTest from './renderNode1/setMarkNodeGroup.test';
import setShapeClipTest from './renderNode1/setShapeClip.test';

import typeNodeBlankTest from './typeNodeTest/Blank.test';
import typeNodeDividerTest from './typeNodeTest/Divider.test';
import typeNodeGridColTest from './typeNodeTest/GridCol.test';
import typeNodeListTest from './typeNodeTest/List.test';
import typeNodeLoadingProgressTest from './typeNodeTest/LoadingProgress.test';
import typeNodeProgressTest from './typeNodeTest/Progress.test';
import typeNodeRelativeContainerTest from './typeNodeTest/RelativeContainer.test';
import typeNodeSwiperTest from './typeNodeTest/Swiper.test';
import typeNodeTextInputTest from './typeNodeTest/TextInput.test';
import typeNodeListItemTest from './typeNodeTest/ListItem.test';
import typeNodechildrenMainSizeTest from './typeNodeTest/ChildrenMainSize.test';

import borderRadiuses from './GraphicsTest/borderRadiuses.test';
import borderStyles from './GraphicsTest/borderStyles.test';
import edgeColors from './GraphicsTest/edgeColors.test';
import edgeWidths from './GraphicsTest/edgeWidths.test';
import graphicGetInterfaceTest from './GraphicsTest/graphicGetInterface.test';
import setRectShape from './GraphicsTest/setRectShape.test';
import LengthUnitTest from './GraphicsTest/LengthUnit.test'
import getBlendColor from './GraphicsTest/getBlendColor.test';
import getNumeric from './GraphicsTest/getNumeric.test';
import getAlpha from './GraphicsTest/getAlpha.test';
import getBlue from './GraphicsTest/getBlue.test';
import getGreen from './GraphicsTest/getGreen.test';
import getRed from './GraphicsTest/getRed.test';
import CornerTest from './GraphicsTest/GraphicsApiTest/CornerTest.test';
import LengthMetricsUnitTest from './GraphicsTest/GraphicsApiTest/LengthMetricsUnitTest.test';
import PercentReferenceTest from './GraphicsTest/GraphicsApiTest/PercentReferenceTest.test';

import updateConfigurationTest1 from './BuilderNodeTest/updateConfigurationTest1';
import updateConfigurationTest2 from './ComponentContentTest/updateConfigurationTest2';
import ApplyNormalAttributeTest from './AttributeUpdaterTest/ApplyNormalAttribute.test';
import postFrameCallbackTest from './PostFrameTest/postFrameCallback.test';
import InheritFreezeOptionsTest from './BuilderNodeTest/InheritFreezeOptionsTest.test';
import EnableProvideConsumeCrossingTest from './BuilderNodeTest/EnableProvideConsumeCrossingTest.test';
import IsDisposedTest from './NodeReturnTest/IsDisposedTest.test';
import BuilderNodeIsDisposedTest from './NodeReturnTest/BuilderNodeIsDisposedTest.test';
import ComponentContentIsDisposedTest from './NodeReturnTest/ComponentContentIsDisposedTest.test';
import FrameNodeIsDisposedTest from './NodeReturnTest/FrameNodeIsDisposedTest.test';
import RenderNodeIsDisposedTest from './NodeReturnTest/RenderNodeIsDisposedTest.test';
import NodeAdapterIsDisposedTest from './NodeReturnTest/NodeAdapterIsDisposedTest.test';

export default function testsuite() {
  arkuiNodeTest();
  arkuiNodeEventTest();
  arkuiNodeRenderTest();
  appendChildTest();
  drawContextGetSizeTest();
  keyframeTest();
  pixelRoundTest();
  frame();
  getChildTest();
  getClipToFrameJsunit();
  getColorTest();
  getOpacityJsunit();
  getPosition();
  getSizeJsunit();
  pivot();
  scale();
  SetClipToFrameJsunit();
  SetOpacityJsunit();
  SetPositionJsunit();
  SetSizeJsunit();
  RenderFitJsunit();
  RenderNodeDrawJsSuit();
  RenderNodeInvalidateJsSuit();
  RenderNodeShadowElevationJsSuit();
  RenderNodeShadowRadiusJsSuit();
  rotationTest();
  shadowAlphaJsunit();
  shadowColorJsunit();
  shadowOffsetJsunit();
  transformTest();
  translationTest();
  ComponentInheritFreezeOptionsTest();
  InvalidateAttributesTest();
  BuilderNodeOneTest();
  BuilderNodeTwoTest();
  BuilderNodeThreeTest();
  DarkModeTest();

  renderNodeGetInterfaceTest();
  RenderNodeAttributeTest();
  RenderNodeDemo01Test();
  RenderNodeDemo02Test();
  RenderNodeDemo03Test();
  RenderNodeDemo04Test();
  RenderNodeDemo05Test();
  RenderNodeDemo06Test();
  setLabelTest();
  setMarkNodeGroupTest();
  setShapeClipTest();

  typeNodeBlankTest();
  typeNodeDividerTest();
  typeNodeGridColTest();
  typeNodeListTest();
  typeNodeLoadingProgressTest();
  typeNodeProgressTest();
  typeNodeRelativeContainerTest();
  typeNodeSwiperTest();
  typeNodeTextInputTest();
  typeNodeListItemTest();
  typeNodechildrenMainSizeTest();

  setRectShape();
  LengthUnitTest();
  getBlendColor();
  getNumeric();
  getAlpha();
  getBlue();
  getGreen();
  getRed();
  borderRadiuses();
  borderStyles();
  edgeColors();
  edgeWidths();
  graphicGetInterfaceTest();
  CornerTest();
  LengthMetricsUnitTest();
  PercentReferenceTest();

  updateConfigurationTest1();
  updateConfigurationTest2();
  ApplyNormalAttributeTest();
  postFrameCallbackTest();
  InheritFreezeOptionsTest();
  EnableProvideConsumeCrossingTest();
  IsDisposedTest();
  BuilderNodeIsDisposedTest();
  ComponentContentIsDisposedTest();
  FrameNodeIsDisposedTest();
  RenderNodeIsDisposedTest();
  NodeAdapterIsDisposedTest();
}