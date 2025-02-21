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
import tabsApi1 from './tabs/tabsApi1.test';
import AttributeModifierDemoAPI01 from './AttributeModifier/AttributeModifierDemoAPI01Jsunit.test';
import AttributeModifierDemoAPI02 from './AttributeModifier/AttributeModifierDemoAPI02Jsunit.test';
import AttributeModifierDemoAPI03 from './AttributeModifier/AttributeModifierDemoAPI03Jsunit.test';
import FolderStack3ApiJsunit from './AttributeModifier/FolderStack3ApiJsunit.test';
import onChildTouchTest from './commonApi/onChildTouchTest.test.ets';
import promptTest from './commonApi/promptTest.test.ets';
import setCursorTest from './commonApi/setCursorTest.test.ets';
import onGestureTest from './commonApi/onGestureTest.test.ets';
import alphabetTest from './commonApi/alphabetTest.test.ets';
import NavigationApi from './AttrApi/NavigationApi.test.ets';
import NavigationApi2 from './AttrApi/NavigationApi2.test.ets';
import NavigationApi3 from './AttrApi/NavigationApi3.test.ets';
import RichEditorApi from './AttrApi/RichEditorApi.test.ets';

import TabsApi from './AttrApi/TabsApi.test.ets';
import Image_QRCode_Api from './AttrApi/Image_QRCode_Api.test';
import QueryNavDestinationInfoNavDestinationJsunit from './AttributeModifier/QueryNavDestinationInfoNavDestinationJsunit.test';
import aboutToAppearTest from './ComAttr/ComAttr_aboutToAppear.test.ets';
import parentX_parentY_strategy_Test from './ComAttr/ComAttr_parentX_parentY_strategy.test.ets';
import TextStyle from './TextApi/TextStyle.test.ets';
import tabsDemo from './TextApi/tabsDemo.test.ets';
import TextSelectionMenu from './TextApi/TextSelectionMenu.test.ets';

import ImageAttr from './MethodStyle/ImageAttr.test'
import menu from './MethodStyle/menu.test'
import NavigationAttr from './MethodStyle/NavigationAttr.test'
import textDataDataDetectorConfig from './MethodStyle/textDataDataDetectorConfig.test'
import dragPreviewOptionsJsSuit from './dragPreviewOptionsJsSuit.test';
import backgroundEffectJsSuit from './backgroundEffectJsSuit.test';
import DragActionJsunit from './DragActionJsSuit.test';
import dragPreviewJsSuit from './dragPreviewJsSuit.test';
import GestureTagJsSuit from './GestureTagJsSuit.test';
import InvertOptionsJsSuit from './InvertOptionsJsSuit.test';
import selectoptionwithJsSuit from './selectoptionwithJsSuit.test';
import ForegroundColorJsSuit from './ForegroundColorJsSuit.test';
import freezeInactive from './freezeInactive.test.ets';
import allowOverride from './allowOverride.test.ets';
import ToastShowMode from './ToastShowMode.test.ets';
import ModalBlurStyle from './ModalBlurStyle.test.ets';
import TouchTestStrategy from './TouchTestStrategy.test.ets';
import touchPoint from './DragController/touchPoint_Auto.test.ets';
import previewOptions from './DragController/touchPoint_Disable.test.ets';
import createDragAction from './DragController/createDragAction.test.ets';
import setForegroundColor from './DragController/setForegroundColor.test.ets';
import backgroundEffectJsunit from './backgroundEffect/backgroundEffect.test.ets'
import blendMode1Jsunit from './backgroundEffect/blendMode1.test.ets'
import sheetSize1Jsunit from './backgroundEffect/sheetSize1.test.ets'
import monopolizeTest from './commonApi/monopolizeTest.test.ets';
import blendModeTest from './commonApi/blendModeTest.test.ets';
import outlineTest from './commonApi/outlineTest.test.ets';
import arkuiNodeTest from "./arkuinode/arkuinode.test.ets"
import atomicServiceBarTest from "./autoservice/atomicServiceBar.test.ets"
import buttonControlTest from "./buttonControlSize/buttonControl.test.ets"
import dymaticTest from "./dymaticattribute/dymatic.test.ets"
import listSContentTest from "./list/list.test.ets"
import  relativeCTest from "./relative/relative.test.ets"
import  gridIndexTest from "./grid/grid.test.ets"
import enumFolderTest from "./folder/enumflodstack.test.ets"
import richEditorApi1 from './richEditorApi/richEditorApi1.test.ets'
import richEditorApi2 from './richEditorApi/richEditorApi2.test.ets'
import richEditorApi3 from './richEditorApi/richEditorApi3.test.ets'
import navigationApi1 from './navigationApi/navigationApi1.test.ets'
import textInputApi1 from './textInputApi/textInputApi1.test.ets'
import ScrollTest from './Scroll/Scroll.test.ets'
import RichEditorTest from './RichEditor/RichEditor.test';
import UIfont from './UIfont/UIfont.test';
import getClipToFrameJsunit from './RenderNodeTest_001/getClipToFrameJsunit.test.ets'
import getOpacityJsunit from './RenderNodeTest_001/getOpacityJsunit.test.ets'
import getSizeJsunit from './RenderNodeTest_001/getSizeJsunit.test.ets'
import SetClipToFrameJsunit from './RenderNodeTest_001/SetClipToFrameJsunit.test.ets'
import SetOpacityJsunit from './RenderNodeTest_001/SetOpacityJsunit.test.ets'
import SetPositionJsunit from './RenderNodeTest_001/SetPositionJsunit.test.ets'
import SetSizeJsunit from './RenderNodeTest_001/SetSizeJsunit.test.ets'
import getChildTest from './RenderNodeTest_001/getChildTest.test';
import getColorTest from './RenderNodeTest_001/getColorTest.test';
import frame from './RenderNodeTest_001/frame.test';
import getPosition from './RenderNodeTest_001/getPosition.test';
import pivot from './RenderNodeTest_001/pivot.test';
import scale from './RenderNodeTest_001/scale.test';
import SXrenderingStrategyJsunit from './AttributeModifier/SXrenderingStrategyJsunit.test';
import SXsymbolSpanStyleJsunit from './AttributeModifier/SXsymbolSpanStyleJsunit.test';
import SXsymbolStyleJsunit from './AttributeModifier/SXsymbolStyleJsunit.test';
import APIgetUIFontConfigJsunit from './AttributeModifier/APIgetUIFontConfigJsunit.test';
import APIScrollflingSpeedLimitJsunit from './AttributeModifier/APIScrollflingSpeedLimitJsunit.test'
import APITextBackgroundStyleJsunit from './AttributeModifier/APITextBackgroundStyleJsunit.test'
import SXvalueResourceJsunit from './AttributeModifier/SXvalueResourceJsunit.test'
import SXSymbolGlyphSINGLE01Jsunit from './AttributeModifier/SXSymbolGlyphSINGLE01Jsunit.test'
import spanApi1 from './spanApi/spanApi1.test';
import symbolGlyphApi1 from './symbolGlyphApi/symbolGlyphApi1.test'
import symbolGlyphApi2 from './symbolGlyphApi/symbolGlyphApi2.test'
import symbolGlyphApi3 from './symbolGlyphApi/symbolGlyphApi3.test'
import symbolGlyphApi4 from './symbolGlyphApi/symbolGlyphApi4.test'
import symbolGlyphApi5 from './symbolGlyphApi/symbolGlyphApi5.test'
import symbolSpanApi1 from './symbolSpanApi/symbolSpanApi1.test'
import RichEditorApi2 from './AttrApi/RichEditorApi2.test'
import SelectAttr from './AttrApi/SelectAttr.test'
import getUIObserver from './UIContext/getUIObserver.test';
import getDragController from './UIContext/getDragController.test';
import customPopup from './bindPopup/customPopup.test';
import popup from './bindPopup/popup.test';
import appendChildTest from './renderNode/appendChild.test.ets';
import drawContextGetSizeTest from './renderNode/drawContextGetSize.test.ets';
import keyframeTest from './renderNode/keyframe.test.ets';

import textInputApiTest from './textInputApi/textinputkeyNewLine.test.ets'
import arkuiNodeEventTest from './arkuinode/arkuinodeEnvent.test.ets'
import arkuiNodeRenderTest from './arkuinode/arkuinodeRender.test.ets'
import symbolSpanApi2Test from './symbolSpanApi/symbolSpanApi2.test'
import NavDestinationInfoStateJsunit  from './AttributeModifier/NavDestinationInfoStateJsunit.test'
import XComponentNodeChageJsSuit from './XComponentNodeChageJsSuit.test';
import RenderNodeShadowElevationJsSuit from './RenderNodeShadowElevation.test';
import RenderNodeShadowRadiusJsSuit from './RenderNodeShadowRadius.test';
import shadowAlphaJsunit from './shadowAlphaJsunit.test';
import shadowColorJsunit from './shadowColorJsunit.test';
import shadowOffsetJsunit from './shadowOffsetJsunit.test';
import popupArrowJsunit from './popupArrowJsunit.test';
import geometryTransition from './geometryTransition.test';
import RenderNodeInvalidateJsSuit from './RenderNodeInvalidateJsSuit.test';
import RenderNodeDrawJsSuit from './RenderNodeDrawJsSuit.test';
import accessVNTest from './commonApi/accessVNTest.test.ets';
import TimePickerTest from './TimePicker/TimePicker.test.ets';
import menuBlurStyleJsunit from './menuBlurStyleJsunit.test';
import APITabsBarBackgroundBlurStyleJsunit from './AttributeModifier/APITabsBarBackgroundBlurStyleJsunit.test';

import NavPathStackApi1 from './AttrApi/NavPathStackApi1.test.ets';
import NavPathStackApi2 from './AttrApi/NavPathStackApi2.test.ets';
import NavPathStackApi3 from './AttrApi/NavPathStackApi3.test.ets';
import ObserverApi from './AttrApi/ObserverApi.test.ets';
import Navigation1 from './relativeApi11/Navigation1.test'
import Navigation2 from './relativeApi11/Navigation2.test'
import Navigation3 from './relativeApi11/Navigation3.test'
import Navigation4 from './relativeApi11/Navigation4.test'
import pixelRoundTest from './renderNode/pixelRoundTest.test.ets'

export default function testsuite() {
  getClipToFrameJsunit()
  getOpacityJsunit()
  getSizeJsunit()
  SetClipToFrameJsunit()
  SetOpacityJsunit()
  SetPositionJsunit()
  getColorTest()
  getChildTest()
  frame()
  getPosition()
  pivot()
  scale()
  SetSizeJsunit()
  richEditorApi1()
  richEditorApi2()
  richEditorApi3()
  navigationApi1()
  textInputApi1()
  ScrollTest()
  RichEditorTest()
  UIfont()
  TimePickerTest()
  tabsApi1()
  AttributeModifierDemoAPI01()
  AttributeModifierDemoAPI02()
  AttributeModifierDemoAPI03()
  FolderStack3ApiJsunit()
  onGestureTest()
  setCursorTest()
  onChildTouchTest()
  promptTest()
  alphabetTest()
  NavigationApi()
  NavigationApi2()
  NavigationApi3()
  RichEditorApi()
  TabsApi()
  Image_QRCode_Api()
  relativeCTest()
  listSContentTest()
  gridIndexTest()
  buttonControlTest()
  dymaticTest()
  enumFolderTest();
  arkuiNodeTest()
  atomicServiceBarTest()
  QueryNavDestinationInfoNavDestinationJsunit()
  aboutToAppearTest()
  parentX_parentY_strategy_Test()
  TextStyle()

  ImageAttr()
  menu()
  NavigationAttr()
  tabsDemo()
  TextSelectionMenu()
  textDataDataDetectorConfig()
  dragPreviewOptionsJsSuit()
  backgroundEffectJsSuit()
  DragActionJsunit()
  dragPreviewJsSuit()
  GestureTagJsSuit()
  InvertOptionsJsSuit()
  selectoptionwithJsSuit()
  ForegroundColorJsSuit()
  freezeInactive()
  allowOverride()
  ToastShowMode()
  ModalBlurStyle()
  TouchTestStrategy()
  createDragAction()
  setForegroundColor()
  touchPoint()
  previewOptions()
  backgroundEffectJsunit()
  sheetSize1Jsunit()
  monopolizeTest()
  outlineTest()
  SXrenderingStrategyJsunit()
  SXsymbolSpanStyleJsunit()
  SXsymbolStyleJsunit()
  APIgetUIFontConfigJsunit()
  APIScrollflingSpeedLimitJsunit()
  APITextBackgroundStyleJsunit()
  SXvalueResourceJsunit()
  SXSymbolGlyphSINGLE01Jsunit()
  RichEditorApi2()
  SelectAttr()
  spanApi1()
  symbolGlyphApi1()
  symbolGlyphApi2()
  symbolGlyphApi3()
  symbolGlyphApi4()
  symbolGlyphApi5()
  symbolSpanApi1()
  getUIObserver()
  getDragController()
  customPopup()
  popup()
  appendChildTest()
  drawContextGetSizeTest()
  keyframeTest()
  textInputApiTest()
  arkuiNodeEventTest()
  arkuiNodeRenderTest()
  symbolSpanApi2Test()
  NavDestinationInfoStateJsunit()
  XComponentNodeChageJsSuit()
  RenderNodeShadowElevationJsSuit()
  RenderNodeShadowRadiusJsSuit()
  shadowAlphaJsunit()
  shadowColorJsunit()
  shadowOffsetJsunit()
  popupArrowJsunit()
  geometryTransition()
  RenderNodeInvalidateJsSuit()
  RenderNodeDrawJsSuit()
  accessVNTest()
  blendModeTest()
  menuBlurStyleJsunit()
  APITabsBarBackgroundBlurStyleJsunit()
  NavPathStackApi1()
  NavPathStackApi2()
  NavPathStackApi3()
  ObserverApi()
  Navigation1()
  Navigation2()
  Navigation3()
  Navigation4()
  pixelRoundTest()
}