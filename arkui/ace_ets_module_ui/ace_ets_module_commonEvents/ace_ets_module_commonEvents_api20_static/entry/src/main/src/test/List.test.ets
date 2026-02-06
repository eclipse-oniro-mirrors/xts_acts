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
import getDisplayId from './DragTest/getDisplayId.test';
import tapLocation from './TapGestureTest/tapLocation.test';
import colorMetricsTest from './ColorTest/colorMetrics.test';
export default function testsuite() {
  getDisplayId();//通用属性 onDragStart 失败用例1
  tapLocation();//交互框架 TapGesture 失败用例2
  colorMetricsTest();//通用属性 sweepGradient 失败用例2
}
