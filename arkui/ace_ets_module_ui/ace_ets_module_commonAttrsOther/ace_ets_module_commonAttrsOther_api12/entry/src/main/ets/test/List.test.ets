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

import postDelayedFrameCallbackTest from './UIContextTest/postDelayedFrameCallbackTest';
import postFrameCallbackTest from './UIContextTest/postFrameCallbackTest';
import getOverlayManager from './UIContextTest/getOverlayManager.test';
import OverlayManagerTest_002 from './UIContextTest/OverlayManagerTest_002.test';
import OverlayManagerTest_005 from './UIContextTest/OverlayManagerTest_005.test';
import OverlayManagerTest_001 from './UIContextTest/OverlayManagerTest_001.test'

import OverlayManagerTest_003 from './UIContextTest/OverlayManagerTest_003.test'
import OverlayManagerTest_004 from './UIContextTest/OverlayManagerTest_004.test'

import OverlayManagerTest_006 from './UIContextTest/OverlayManagerTest_006.test'

import getContextMenuController from './UIContextTest/getContextMenuController.test'
import customPropertyTest from './customPropertyTest/customProperty.test'
import callbackTest from './callbackTest/callbackTest.test'
import Role_APITest from './ButtonTest/Button_APITest/Role_APITest';
import InactiveColor_APITest from './CommonTest/BackgroundBlurStyleTest/BackgroundBlurStyle_APITest/InactiveColor_APITest'
import Policy_APITest from './CommonTest/BackgroundBlurStyleTest/BackgroundBlurStyle_APITest/Policy_APITest'
import BlurStyleActivePolicy_ALWAYS_ACTIVE_APITest from './CommonTest/BackgroundEffectTest/BackgroundEffect_APITest/BlurStyleActivePolicy_ALWAYS_ACTIVE_APITest'
import BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest from './CommonTest/BackgroundEffectTest/BackgroundEffect_APITest/BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest'
import BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest from './CommonTest/BackgroundEffectTest/BackgroundEffect_APITest/BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest'
import Bgde_Policy_APITest from './CommonTest/BackgroundEffectTest/BackgroundEffect_APITest/Policy_APITest'
import Bgde_InactiveColor_APITest from './CommonTest/BackgroundEffectTest/BackgroundEffect_APITest/InactiveColor_APITest'
import getPageInfoByUniqueIdTest from './UIContextTest/getPageInfoByUniqueId.test'
import setFrameRateRangeTest from './UIContextTest/setFrameRateRange.test'
import AttributeUpdaterTest from './AttributeUpdaterTest/AttributeUpdater.test'
import componentSnapshotTest from './componentSnapshotTest/componentSnapshot.test'

export default function testsuite() {
  postDelayedFrameCallbackTest();
  postFrameCallbackTest();
  getOverlayManager();
  OverlayManagerTest_001()
  OverlayManagerTest_002()
  OverlayManagerTest_005()
  OverlayManagerTest_003()
  OverlayManagerTest_004()
  OverlayManagerTest_006()
  
  getContextMenuController()
  customPropertyTest()
  callbackTest()
  Role_APITest();
  InactiveColor_APITest();
  Policy_APITest();
  BlurStyleActivePolicy_ALWAYS_ACTIVE_APITest();
  BlurStyleActivePolicy_ALWAYS_INACTIVE_APITest();
  BlurStyleActivePolicy_FOLLOWS_WINDOW_ACTIVE_STATE_APITest();
  Bgde_Policy_APITest();
  Bgde_InactiveColor_APITest();
  getPageInfoByUniqueIdTest();
  setFrameRateRangeTest();
  AttributeUpdaterTest();
  componentSnapshotTest();
  
}