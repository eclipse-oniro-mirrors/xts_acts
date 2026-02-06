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
import InvalidateAttributesTest from './InvalidateTest/InvalidateAttributesTest.test';
import CacheMaxCountForHSPTest from './CacheMaxCountTest/CacheMaxCountForHSPTest.test';
import ImageLoaderTest from './ImageLoaderTest/ImageLoader.test';
import GetNodeByIdNullTest from './ContextTest/GetNodeByIdNullTest.test';
import GetFrameNodeNullTest from './FrameNodeTest/GetFrameNodeNullTest.test';
import UIContextUndefinedTest from './ContextTest/UIContextUndefinedTest.test';
import GetFrameNodeMethodNullTest from './FrameNodeTest/GetFrameNodeMethodNullTest.test';

export default function testsuite() {
  InvalidateAttributesTest();
  CacheMaxCountForHSPTest();
  ImageLoaderTest();
  GetNodeByIdNullTest();
  GetFrameNodeNullTest();
  UIContextUndefinedTest();
  GetFrameNodeMethodNullTest();
}