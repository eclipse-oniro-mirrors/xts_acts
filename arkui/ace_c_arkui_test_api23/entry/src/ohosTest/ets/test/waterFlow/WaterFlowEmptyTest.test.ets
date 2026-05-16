/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function WaterFlowEmptyTest() {
  describe('WaterFlowEmptyTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   WaterFlowEmptyTest_001
     * @tc.number SUB_ARKUI_WATERFLOW_EMPTY_TEST_0100
     * @tc.desc   WaterFlowEmptyTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WaterFlowEmptyTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.WaterFlowEmptyTest_001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   WaterFlowEmptyTest_002
     * @tc.number SUB_ARKUI_WATERFLOW_EMPTY_TEST_0200
     * @tc.desc   Test the NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING with normal values(false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WaterFlowEmptyTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.WaterFlowEmptyTest_002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   WaterFlowEmptyTest_003
     * @tc.number SUB_ARKUI_WATERFLOW_EMPTY_TEST_0300
     * @tc.desc   Test the NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING with normal values(true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WaterFlowEmptyTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.WaterFlowEmptyTest_003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   WaterFlowEmptyTest_004
     * @tc.number SUB_ARKUI_WATERFLOW_EMPTY_TEST_0400
     * @tc.desc   Test the NODE_WATER_FLOW_SUPPORT_EMPTY_BRANCH_IN_LAZY_LOADING with values(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WaterFlowEmptyTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.WaterFlowEmptyTest_004()).assertEqual(0);
      done();
    });
  })
}