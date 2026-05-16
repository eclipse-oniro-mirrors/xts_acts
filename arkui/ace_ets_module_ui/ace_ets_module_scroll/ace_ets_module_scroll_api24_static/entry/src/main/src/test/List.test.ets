'use static';
/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import ListScrollApiTest from './ListScrollApiTest/ListScrollApi.test';
import ListItemSwipeManagerTest from './ListItemSwipeManagerTest/ListItemSwipeManager.test';
import ScrollBarAttributeTest from './ScrollBarAttributeTest/ScrollBarAttribute.test';
import ScrollScrollableChainTest from './ScrollScrollableChainTest/ScrollScrollableChain.test';
import getFrameNodeScroller from './FrameNode/getFrameNodeScroller.test';
import onVisibleIndexesChangeTest from './LazyVGridLayout/onVisibleIndexesChangeTest.test';
import waterFlowEmptyLazy from './WaterFlow/waterFlowEmptyLazy.test';
import scrollPropertiesTest from './scrollTest/scrollPropertiesTest.test';

export default function testsuite() {
  ListScrollApiTest();
  ListItemSwipeManagerTest();
  ScrollBarAttributeTest();
  ScrollScrollableChainTest();
  getFrameNodeScroller()
  onVisibleIndexesChangeTest();
  waterFlowEmptyLazy();
  scrollPropertiesTest();
}