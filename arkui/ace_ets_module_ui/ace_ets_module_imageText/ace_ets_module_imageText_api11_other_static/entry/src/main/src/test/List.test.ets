'use static';
/**
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
import arkuiNodeTest from "./NodeContainerTest/arkuinode/arkuinode.test";
import arkuiNodeEventTest from './NodeContainerTest/arkuinode/arkuinodeEnvent.test';
import arkuiNodeRenderTest from './NodeContainerTest/arkuinode/arkuinodeRender.test';
import buttonControlTest from "./buttonTest/buttonControl.test"
import RelativeGuideLine from './RelativeContainerTest/RelativeGuideLine.test'
import RelativeGuideLine2 from './RelativeContainerTest/RelativeGuideLine2.test'
import RelativeGuideLine3 from './RelativeContainerTest/RelativeGuideLine3.test'
import RelativeGuideLine4 from './RelativeContainerTest/RelativeGuideLine4.test'
import RelativeGuideLine5 from './RelativeContainerTest/RelativeGuideLine5.test'
import RelativeGuideLine6 from './RelativeContainerTest/RelativeGuideLine6.test'
import RelativeGuideLine7 from './RelativeContainerTest/RelativeGuideLine7.test'
import RelativeChain from './RelativeContainerTest/RelativeChain.test'
import RelativeChain2 from './RelativeContainerTest/RelativeChain2.test'
import RelativeChain3 from './RelativeContainerTest/RelativeChain3.test'
import RelativeChain4 from './RelativeContainerTest/RelativeChain4.test'
import RelativeChain5 from './RelativeContainerTest/RelativeChain5.test'
import RelativeChain6 from './RelativeContainerTest/RelativeChain6.test'
import RelativeChain7 from './RelativeContainerTest/RelativeChain7.test'
import RelativeChain8 from './RelativeContainerTest/RelativeChain8.test'
import RelativeChain9 from './RelativeContainerTest/RelativeChain9.test'
import RelativeChain10 from './RelativeContainerTest/RelativeChain10.test'
import RelativeChain11 from './RelativeContainerTest/RelativeChain11.test'
import RelativeChain12 from './RelativeContainerTest/RelativeChain12.test'
import RelativeBarrier from './RelativeContainerTest/RelativeBarrier.test'
import RelativeBarrier2 from './RelativeContainerTest/RelativeBarrier2.test'
import RelativeBarrier3 from './RelativeContainerTest/RelativeBarrier3.test'
import RelativeBarrier4 from './RelativeContainerTest/RelativeBarrier4.test'
import RelativeBarrier5 from './RelativeContainerTest/RelativeBarrier5.test'
import RelativeBarrier6 from './RelativeContainerTest/RelativeBarrier6.test'
import RelativeBarrier7 from './RelativeContainerTest/RelativeBarrier7.test'
import RelativeBarrier8 from './RelativeContainerTest/RelativeBarrier8.test'
import RelativeBorder from './RelativeContainerTest/RelativeBorder.test'
import RelativePadding from './RelativeContainerTest/RelativePadding.test'
import Navigation1 from './RelativeContainerTest/relativeApi11/Navigation1.test'
import Navigation2 from './RelativeContainerTest/relativeApi11/Navigation2.test'
import Navigation3 from './RelativeContainerTest/relativeApi11/Navigation3.test'
import Navigation4 from './RelativeContainerTest/relativeApi11/Navigation4.test'
import relativeCTest from "./RelativeContainerTest/relative/relative.test"
import getClipToFrameJsunit from './RenderNodeTest/RenderNodeTest_001/getClipToFrameJsunit.test'
import getOpacityJsunit from './RenderNodeTest/RenderNodeTest_001/getOpacityJsunit.test'
import getSizeJsunit from './RenderNodeTest/RenderNodeTest_001/getSizeJsunit.test'
import SetSizeJsunit from './RenderNodeTest/RenderNodeTest_001/SetSizeJsunit.test.ets'
import SetClipToFrameJsunit from './RenderNodeTest/RenderNodeTest_001/SetClipToFrameJsunit.test'
import SetOpacityJsunit from './RenderNodeTest/RenderNodeTest_001/SetOpacityJsunit.test'
import SetPositionJsunit from './RenderNodeTest/RenderNodeTest_001/SetPositionJsunit.test'
import getChildTest from './RenderNodeTest/RenderNodeTest_001/getChildTest.test';
import getColorTest from './RenderNodeTest/RenderNodeTest_001/getColorTest.test';
import frame from './RenderNodeTest/RenderNodeTest_001/frame.test';
import getPosition from './RenderNodeTest/RenderNodeTest_001/getPosition.test';
import pivot from './RenderNodeTest/RenderNodeTest_001/pivot.test';
import scale from './RenderNodeTest/RenderNodeTest_001/scale.test';
import RenderNodeInvalidateJsSuit from './RenderNodeTest/RenderNodeInvalidateJsSuit.test';
import RenderNodeDrawJsSuit from './RenderNodeTest/RenderNodeDrawJsSuit.test';
import RenderNodeShadowElevationJsSuit from './RenderNodeTest/RenderNodeShadowElevation.test';
import RenderNodeShadowRadiusJsSuit from './RenderNodeTest/RenderNodeShadowRadius.test';
import shadowAlphaJsunit from './RenderNodeTest/shadowAlphaJsunit.test';
import shadowColorJsunit from './RenderNodeTest/shadowColorJsunit.test';
import shadowOffsetJsunit from './RenderNodeTest/shadowOffsetJsunit.test';
import appendChildTest from './RenderNodeTest/renderNode/appendChild.test';
import drawContextGetSizeTest from './RenderNodeTest/renderNode/drawContextGetSize.test';
import keyframeTest from './RenderNodeTest/renderNode/keyframe.test';
import pixelRoundTest from './RenderNodeTest/renderNode/pixelRoundTest.test'
import ImageAttr from './imageTest/ImageAttr.test';
import fillModeJsunit from './ImageAnimator/FillModeJsunit.test';
import ohosMatrix4Jsunit from './imageTest/OhosMatrix4Jsunit.test';
import ShapeClippingJsunit from './imageTest/ShapeClippingJsunit.test';
import imageJsunit from './imageTest/ImageJsunit.test';
import rotationTest from './RenderNodeTest/rotation.test.ets'
import transformTest from './RenderNodeTest/transform.test.ets'
import translationTest from './RenderNodeTest/translation.test.ets'
import buttonTest from './buttonTest/button'
import imageOneJsunit from './imageTest/imageOneJsunit.test';
import imageTwoJsunit from './imageTest/imageTwoJsunit.test';
import imageThreeJsunit from './imageTest/imageThreeJsunit.test';
import imageAnimatorJsunit from './ImageAnimator/imageAnimatorJsunit.test';
import buttonJsunit from './buttonTest/ButtonJsunit.test';
import buttonEnabledJsunit from './buttonTest/buttonEnabledJsunit.test';
import checkBoxGroupUIJsunit from './CheckboxTest/checkBoxGroupUIJsunit.test';
import CheckBoxJsunit from './CheckboxTest/CheckBoxJsunit.test';
import TextClockJsunit from './TextClockTest/TextClockJsunit.test';
import TextClockLongJsunit from './TextClockTest/TextClockLongJsunit.test';
import loadingProgressJsunit from './ProgressTest/loadingProgressJsunit.test.ets';
import ProgressJsunit from './ProgressTest/ProgressJsunit.test.ets';
import TextTimerJsunit from './TextTimerTest/TextTimerJsunit.test.ets';
import ToggleJsunit from './ToggleTest/ToggleJsunit.test.ets';
import PatternLockJsunit from './PatternLockTest/PatternLockJsunit.test.ets';
import RenderFitJsunit from './RenderNodeTest/RenderFitJsunit.test.ets';
import aboutToRecycleiamge from './imageTest/aboutToRecycleiamgeJS.test'
import focusJsunit from './buttonTest/FocusJsunit.test';
import imageJsunit55 from './imageTest/ImageJsunit55.test';
import playModeJsunit from './buttonTest/PlayModeJsunit.test';
import ImageApi from './imageTest/ImageApi.test.ets';
import progress3Jsunit from './ProgressTest/Progress3Jsunit.test';
import button3Jsunit from './buttonTest/Button3Jsunit.test';
import imageAnimatorJsunitt from './ImageAnimator/ImageAnimatorJsunit2.test.ets'
import loadingProgressJsunit2 from './ProgressTest/LoadingProgressJsunit2.test.ets';
import ButtonHoverTest from './buttonTest/ButtonHover.test';
import ActsgetcomponentTest from './buttonTest/getcomponent.test';
import stageAnimatorTest from './buttonTest/stageAnimator.test';
import imageObscuredTest from './imageTest/imageObscuredTest.test';
import ImageAdvancedTest from './imageTest/ImageAdvancedTest.test.ets'
import ImageAnimatorAdvancedTest from './ImageAnimator/imageAnimatorAdvancedTest.test.ets'

export default function testsuite() {
  getColorTest()
  frame()
  pivot()
  scale()
  ImageAdvancedTest() //1个断言失败loading failed do not have  success IDE打包相对路径资源打不进去  1 网络加载图片
  ImageAnimatorAdvancedTest()
  ToggleJsunit();
  arkuiNodeTest();
  arkuiNodeEventTest();
  arkuiNodeRenderTest();
  buttonControlTest();
  RelativeGuideLine()
  RelativeGuideLine2()
  RelativeGuideLine3()
  RelativeGuideLine4()
  RelativeGuideLine5()
  RelativeGuideLine6()
  RelativeGuideLine7()
  RelativeChain()
  RelativeChain2()
  RelativeChain3()
  RelativeChain4()
  RelativeChain5()
  RelativeChain6()
  RelativeChain7()
  RelativeChain8()
  RelativeChain9()
  RelativeChain10()
  RelativeChain11()
  RelativeChain12()
  RelativeBarrier()
  RelativeBarrier2()
  RelativeBarrier3()
  RelativeBarrier4()
  RelativeBarrier5()
  RelativeBarrier6()
  RelativeBarrier7()
  RelativeBarrier8()
  RelativePadding()
  RelativeBorder()
  Navigation1()
  Navigation2()
  Navigation3()
  Navigation4()
  relativeCTest()
  ImageAttr()
  imageJsunit()
  ohosMatrix4Jsunit();
  fillModeJsunit();
  ShapeClippingJsunit();
  imageOneJsunit();
  imageTwoJsunit();
  imageThreeJsunit();
  buttonJsunit();
  buttonEnabledJsunit();
  checkBoxGroupUIJsunit();
  CheckBoxJsunit();
  TextClockJsunit();
  TextClockLongJsunit();
  loadingProgressJsunit();
  TextTimerJsunit();
  aboutToRecycleiamge();
  imageJsunit55()
  playModeJsunit()
  ImageApi()
  progress3Jsunit();
  button3Jsunit();
  imageAnimatorJsunitt();
  ButtonHoverTest();
  ActsgetcomponentTest();
  imageObscuredTest();
  loadingProgressJsunit2();
  appendChildTest()
  drawContextGetSizeTest()
  keyframeTest()
  pixelRoundTest()
  getChildTest()
  getClipToFrameJsunit()
  getOpacityJsunit()
  getPosition()
  getSizeJsunit()
  SetClipToFrameJsunit()
  SetOpacityJsunit()
  SetPositionJsunit()
  SetSizeJsunit()
  RenderFitJsunit();
  RenderNodeDrawJsSuit()
  RenderNodeInvalidateJsSuit()
  RenderNodeShadowElevationJsSuit();
  RenderNodeShadowRadiusJsSuit()
  rotationTest()
  shadowAlphaJsunit()
  shadowColorJsunit()
  shadowOffsetJsunit()
  transformTest()
  translationTest()
  buttonTest();
  PatternLockJsunit();
  focusJsunit();
  imageAnimatorJsunit();
  ProgressJsunit();
  stageAnimatorTest();
}