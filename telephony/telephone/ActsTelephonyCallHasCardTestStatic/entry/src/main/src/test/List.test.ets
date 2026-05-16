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

import HasCard2PublicTest from "./TelephonyCallHasCard2Public.test";
import HasCard3PublicTest from "./TelephonyCallHasCard3Public.test";
import sim from '@ohos.telephony.sim';
import EmptyTest from './Empty.test'

let simState: sim.SimState = sim.getSimStateSync(0);

export default function testsuite() {
  if (sim.getMaxSimCount() != 0 && simState != sim.SimState.SIM_STATE_UNKNOWN) {
    if (sim.hasSimCardSync(0)) {
      HasCard2PublicTest();
      HasCard3PublicTest();
    } else {
      EmptyTest();
    }
  } else {
    EmptyTest();
  }
}