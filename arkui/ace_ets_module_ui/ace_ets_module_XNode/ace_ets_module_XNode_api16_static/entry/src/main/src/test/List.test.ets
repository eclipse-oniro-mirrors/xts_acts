'use static';
/*
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
import frameNodeIsVisibleTest from './FrameNodeTest/frameNodeIsVisible.test';
import frameNodeMoveOneTest from './FrameNodeTest/frameNodeMoveOne.test';
import frameNodeMoveTwoTest from './FrameNodeTest/frameNodeMoveTwo.test';
import frameNodeMoveToErrorCodeTest from './FrameNodeTest/frameNodeMoveToErrorCode.test';
import AddComponentContentErrorCodeTest from './FrameNodeTest/AddComponentContentErrorCode.test';
import BindControllerErrorCodeTest from './FrameNodeTest/BindControllerErrorCode.test';
import RenderNodeDisposeTest from './FrameNodeTest/RenderNodeDispose.test';
import componentContentDisposeTest from './FrameNodeTest/componentContentDispose.test';
import blendColorErrorCodeTest from './FrameNodeTest/blendColorErrorCode.test';
import resourceColorErrorCodeTest from './FrameNodeTest/resourceColorErrorCode.test';
import setCrossLanguageOptionsErrorCodeTest from './FrameNodeTest/setCrossLanguageOptionsErrorCode.test';
import postFrameCallbackTest from './PostFrameTest/postFrameCallback.test';

export default function testsuite() {
  frameNodeIsVisibleTest();
  frameNodeMoveOneTest();
  frameNodeMoveTwoTest();
  frameNodeMoveToErrorCodeTest();
  AddComponentContentErrorCodeTest();
  RenderNodeDisposeTest();
  componentContentDisposeTest();
  postFrameCallbackTest();
  setCrossLanguageOptionsErrorCodeTest();
  blendColorErrorCodeTest();
  resourceColorErrorCodeTest();
  BindControllerErrorCodeTest();
}