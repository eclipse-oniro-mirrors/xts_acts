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

import GridScrollBarWidthTest from './Grid/GridScrollBarWidth.test'
import ListScrollBarWidthTest from './List/ListScrollBarWidth.test'
import ListSpaceWidthTest from './List/ListSpaceWidth.test'
import RefreshMaxPullDownDistanceTest from './Refresh/RefreshMaxPullDownDistance.test'
import RefreshRefreshOffsetTest from './Refresh/RefreshRefreshOffset.test'
import ScrollScrollBarWidthTest from './Scroll/ScrollScrollBarWidth.test'
import WaterFlowScrollBarWidthTest from './WaterFlow/WaterFlowScrollBarWidth.test'

export default function testsuite() {
  GridScrollBarWidthTest();
  ListScrollBarWidthTest();
  ListSpaceWidthTest();
  RefreshMaxPullDownDistanceTest();
  RefreshRefreshOffsetTest();
  ScrollScrollBarWidthTest();
  WaterFlowScrollBarWidthTest();
}