/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { beforeAll, expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function WaterFlowAttributeTest() {

  describe('WaterFlowAttributeTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`waterFlow/WaterFlowAttributeTest`, done);
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });


    /**
     * @tc.number  SUB_ARKUI_WATERFLOW_PARALLELIZE_TEST_0100
     * @tc.name    WaterFlowAttributeTest_0100
     * @tc.desc    testing WaterFlowAttributeTest_0100 CAPI creat & dispose
     * @tc.size    AttributeTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('WaterFlowAttributeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[WaterFlowAttributeTest_0100] START');
      await Utils.sleep(1000);
      let nodeID = getInspectorByKey('buttonWaterFlowID1');
      let obj1: ESObject = JSON.parse(nodeID);
      console.info('WaterFlowAttributeTest_0100 label: ' + JSON.stringify(JSON.parse(nodeID).$attrs.label));
      expect(obj1.$attrs.label).assertEqual('WaterFlow capi is successful');

      let nodeID2 = getInspectorByKey('buttonWaterFlowID2');
      let obj2: ESObject = JSON.parse(nodeID2);
      console.info('WaterFlowAttributeTest_0100 label2: ' + JSON.stringify(JSON.parse(nodeID2).$attrs.label));
      expect(obj2.$attrs.label).assertEqual('WaterFlow2 capi is successful');
      done()
    })
  })
}
