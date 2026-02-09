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
import APIgetFrameNodeByUniqueId from './ContextTest/APIgetFrameNodeByUniqueId.test';
import UIContextOnIdle from './OnIdle/UIContextOnIdle.test';
import GetWindowWidthAndHeight from './window/GetWindowWidthAndHeight.test';
import PixelUnitsConversion from './xts/PixelUnitsConversion.test';
import atomicServiceBarTest from "./UIContext/autoservice/atomicServiceBar.test";
import UIContextApi1 from './UIContext/UIContextApi1.test';
import UIContextTestCase from './UIContext/UIContextTestCase.test';
import GetUIContextMethodTest from './getUIContext/GetUIContextMethodTest.test';
import CacheMaxCountForHSPParamTest from './CacheMaxCountTest/CacheMaxCountForHSPParamTest.test';
import WidthBreakpointEnumsTest from './getUIContext/WidthBreakpointEnumsTest.test';
import GetWindowIdTest from './getUIContext/GetWindowIdTest.test';
import UIContextOnFrameTest from './getUIContext/UIContextOnFrameTest.test';
import UIContextOnIdleTest from './getUIContext/UIContextOnIdleTest.test';

import CacheMaxCountForHSPTest from './CacheMaxCountTest/CacheMaxCountForHSPTest.test';
import GetNodeByIdNullTest from './ContextTest/GetNodeByIdNullTest.test';
import UIContextUndefinedTest from './ContextTest/UIContextUndefinedTest.test';
import UIContextWithoutWindowTest from './ContextTest/UIContextWithoutWindow.test';
import UIContextGetOpacityTest from './ContextTest/UIContextGetOpacity.test';
import IsAvailableTest from './ContextTest/IsAvailableTest.test';
import IsFollowingSystemFontScaleFalseTest from './ContextTest/IsFollowingSystemFontScaleFalseTest.test';
import IdTest from './UIContext/IdTest.test';

export default function testsuite() {
  UIContextApi1();
  UIContextTestCase();
  CacheMaxCountForHSPTest();
  GetNodeByIdNullTest();
  UIContextUndefinedTest();
  UIContextWithoutWindowTest();
  UIContextGetOpacityTest();
  IsAvailableTest();
  IsFollowingSystemFontScaleFalseTest();
  GetUIContextMethodTest();
  CacheMaxCountForHSPParamTest();
  WidthBreakpointEnumsTest();
  GetWindowIdTest();
  UIContextOnFrameTest();
  UIContextOnIdleTest();
  
  APIgetFrameNodeByUniqueId();
  UIContextOnIdle();
  GetWindowWidthAndHeight();
  PixelUnitsConversion();
  atomicServiceBarTest();
  IdTest();
}