/*
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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function unitLengthMetricsTest() {

  describe('unitLengthMetricsTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_LENGTH_METRICS_0001
     * @tc.name: testUnitLengthMetrics001
     * @tc.desc: testing text for unitlengthMetrics with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitLengthMetrics001', 0, async (done: Function) => {
      expect(nativeFunc.testUnitLengthMetrics001()).assertEqual(0)
      done();
    });
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_LENGTH_METRICS_0002
     * @tc.name: testUnitLengthMetrics002
     * @tc.desc: testing text for unitlengthMetrics with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitLengthMetrics002', 0, async (done: Function) => {
      expect(nativeFunc.testUnitLengthMetrics002()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_LENGTH_METRICS_0003
     * @tc.name: testUnitLengthMetrics003
     * @tc.desc: testing text for unitlengthMetrics with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitLengthMetrics003', 0, async (done: Function) => {
      expect(nativeFunc.testUnitLengthMetrics003()).assertEqual(0)
      done();
    }); 
    /*
     * @tc.number: SUB_ARKUI_CAPI_UNIT_LENGTH_METRICS_0004
     * @tc.name: testUnitLengthMetrics004
     * @tc.desc: testing text for unitlengthMetrics with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUnitLengthMetrics004', 0, async (done: Function) => {
      expect(nativeFunc.testUnitLengthMetrics004()).assertEqual(0)
      done();
    }); 
  })
}
