/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import extendTrackTest from './Track/extendTrackTest.test.ets';
import localTrackTest from './Track/localTrackTest.test.ets';
import provideTrackTest from './Track/provideTrackTest.test.ets';
import StateTrackTest from './Track/StateTrackTest.test.ets';
import nestTrackTest from './Track/nestTrackTest.test.ets';
import storageTrackTest from './Track/storageTrackTest.test.ets';
import GestureClick from './GestureRelatedTest/GestureClick.test.ets'
import GestureContiune from './GestureRelatedTest/GestureContiune.test.ets'
import GestureDrag from './GestureRelatedTest/GestureDrag.test.ets'
import GestureIsSystemGesture from './GestureRelatedTest/GestureIsSystemGesture.test.ets'
import GestureLongPressGesture from './GestureRelatedTest/GestureLongPressGesture.test.ets'
import GesturePanGesture from './GestureRelatedTest/GesturePanGesture.test.ets'
import GesturePinchGesture from './GestureRelatedTest/GesturePinchGesture.test.ets'
import GestureReject from './GestureRelatedTest/GestureReject.test.ets'
import GestureRotationGesture from './GestureRelatedTest/GestureRotationGesture.test.ets'
import GestureSwipeGesture from './GestureRelatedTest/GestureSwipeGesture.test.ets'
import GestureTap from './GestureRelatedTest/GestureTap.test.ets'
import GestureTapGesture from './GestureRelatedTest/GestureTapGesture.test.ets'
import provideBrother1 from './ProvideTest/provideBrother1.test.ets'
import provideBrother2 from './ProvideTest/provideBrother2.test.ets'
import provideComponent1 from './ProvideTest/provideComponent1.test.ets'
import provideComponent2 from './ProvideTest/provideComponent2.test.ets'
import provideParent2 from './ProvideTest/provideParent2.test.ets'
import provideParent3 from './ProvideTest/provideParent3.test.ets'
import provideParent4 from './ProvideTest/provideParent4.test.ets'
import provideParent5 from './ProvideTest/provideParent5.test.ets'
import provideParent6 from './ProvideTest/provideParent6.test.ets'
import ResourceColor from './ResourceTest/ResourceColor.test.ets'
import ResourceFloat from './ResourceTest/ResourceFloat.test.ets'
import ResourceInteger from './ResourceTest/ResourceInteger.test.ets'
import ResourcePlural from './ResourceTest/ResourcePlural.test.ets'
import ResourceStrarray from './ResourceTest/ResourceStrarray.test.ets'
import ResourceString from './ResourceTest/ResourceString.test.ets'
import rotationTest from './RenderNodeTest/rotation.test.ets'
import transformTest from './RenderNodeTest/transform.test.ets'
import translationTest from './RenderNodeTest/translation.test.ets'
import openCustomDialog from './supplementTest/openCustomDialog.test.ets'
import outline from './supplementTest/outline.test.ets'
import useShadowBatching from './supplementTest/useShadowBatching.test.ets'
import drawCanvas from './drawCanvas.test.ets'
import LongPressGesture1 from './GestureTest/LongPressGesture1.test.ets'
import LongPressGesture2 from './GestureTest/LongPressGesture2.test.ets'
import LongPressGesture3 from './GestureTest/LongPressGesture3.test.ets'
import OnClick1 from './GestureTest/OnClick1.test.ets'
import OnClick2 from './GestureTest/OnClick2.test.ets'
import OnClick3 from './GestureTest/OnClick3.test.ets'
import OnTouch1 from './GestureTest/OnTouch1.test.ets'
import OnTouch2 from './GestureTest/OnTouch2.test.ets'
import OnTouch3 from './GestureTest/OnTouch3.test.ets'
import PanGesture1 from './GestureTest/PanGesture1.test.ets'
import PanGesture2 from './GestureTest/PanGesture2.test.ets'
import PanGesture3 from './GestureTest/PanGesture3.test.ets'
import SwipeGesture1 from './GestureTest/SwipeGesture1.test.ets'
import SwipeGesture2 from './GestureTest/SwipeGesture2.test.ets'
import SwipeGesture3 from './GestureTest/SwipeGesture3.test.ets'
import TapGesture1 from './GestureTest/TapGesture1.test.ets'
import TapGesture2 from './GestureTest/TapGesture2.test.ets'
import TapGesture3 from './GestureTest/TapGesture3.test.ets'
import menuBackgroundBlurStyle from './selectAttributeTest/menuBackgroundBlurStyle.test.ets'
import menuBackgroundColor from './selectAttributeTest/menuBackgroundColor.test.ets'
export default function testsuite() {
  extendTrackTest()
  localTrackTest()
  provideTrackTest()
  StateTrackTest()
  nestTrackTest()
  storageTrackTest()
  GestureClick();
  GestureContiune();
  GestureDrag();
  GestureIsSystemGesture();
  GestureLongPressGesture();
  GesturePanGesture();
  GesturePinchGesture();
  GestureReject();
  GestureRotationGesture();
  GestureSwipeGesture();
  GestureTap();
  GestureTapGesture();
  provideBrother1()
  provideBrother2()
  provideComponent1()
  provideComponent2()
  provideParent2()
  provideParent3()
  provideParent4()
  provideParent5()
  provideParent6()
  ResourceColor();
  ResourceFloat();
  ResourceInteger();
  ResourcePlural();
  ResourceStrarray();
  ResourceString();
  rotationTest()
  transformTest()
  translationTest()
  openCustomDialog();
  outline();
  useShadowBatching();
  drawCanvas();
  LongPressGesture1();
  LongPressGesture2();
  LongPressGesture3();
  OnClick1();
  OnClick2();
  OnClick3();
  OnTouch1();
  OnTouch2();
  OnTouch3();
  PanGesture1();
  PanGesture2();
  PanGesture3();
  SwipeGesture1();
  SwipeGesture2();
  SwipeGesture3();
  TapGesture1();
  TapGesture2();
  TapGesture3();
  menuBackgroundBlurStyle();
  menuBackgroundColor();
}