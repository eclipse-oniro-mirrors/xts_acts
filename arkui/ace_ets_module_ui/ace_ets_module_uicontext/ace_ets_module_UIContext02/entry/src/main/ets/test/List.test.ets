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
import IsFollowingSystemFontScaleTrueTest from './ContextTest/IsFollowingSystemFontScaleTrueTest.test';
import GetUIContextTest from './getUIContext/GetUIContextTest.test';
import uiContextUnitConversionNullUndefinedTest from './uiContext/UIContextUnitConversionNullUndefined.test';
import uiContextFrameNodeQueryNullTest from './uiContext/UIContextFrameNodeQueryNull.test';
import uiContextMiscNullUndefinedTest from './uiContext/UIContextMiscNullUndefined.test';
import UIContextGetRectangleByIdNullUndefined from './uiContext/UIContextGetRectangleByIdNullUndefined.test';
import setResourceManagerCacheNullUndefinedTest from './uiContext/SetResourceManagerCacheNullUndefined.test';
import columnAllowForceDarkTest from './column/ColumnAllowForceDark.test';
import GetContextNullUndefinedTest from './getUIContext/GetContextNullUndefined.test';
import PostDelayedFrameCallbackParamTest from './getUIContext/PostDelayedFrameCallbackParamTest.test';
import GetPageRootNodeErrorCodeTest from './getUIContext/GetPageRootNodeErrorCodeTest.test';
import GetPageRootNodeNullTest from './getUIContext/GetPageRootNodeNullTest.test';

export default function testsuite() {
  IsFollowingSystemFontScaleTrueTest();
  GetUIContextTest();
  uiContextUnitConversionNullUndefinedTest();
  uiContextFrameNodeQueryNullTest();
  uiContextMiscNullUndefinedTest();
  UIContextGetRectangleByIdNullUndefined();
  setResourceManagerCacheNullUndefinedTest();
  columnAllowForceDarkTest();
  GetContextNullUndefinedTest();
  PostDelayedFrameCallbackParamTest();
  GetPageRootNodeErrorCodeTest();
  GetPageRootNodeNullTest();
}