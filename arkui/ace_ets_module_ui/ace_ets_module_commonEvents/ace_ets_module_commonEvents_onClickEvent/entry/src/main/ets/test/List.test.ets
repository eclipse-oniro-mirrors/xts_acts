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

import OnClick1 from './OnClickTest/OnClick1.test'
import OnClick2 from './OnClickTest/OnClick2.test'
import OnClick3 from './OnClickTest/OnClick3.test'
import EventTarget_id from './EventTarget_id/EventTarget_id.test';
import InteractionEventBindingInfoTest from './InteractionEventBindingInfo/InteractionEventBindingInfo.test';
import BackgroundOptionsTest from './BackgroundTest/BackgroundOptions.test';
import colorMetricsTest from './ColorTest/colorMetrics.test';
import nodeRenderStateTest from './NodeRenderStateTest/nodeRenderState.test';

export default function testsuite() {
  OnClick1();
  OnClick2();
  OnClick3();
  EventTarget_id();
  InteractionEventBindingInfoTest();
  BackgroundOptionsTest();
  colorMetricsTest();
  nodeRenderStateTest();
}