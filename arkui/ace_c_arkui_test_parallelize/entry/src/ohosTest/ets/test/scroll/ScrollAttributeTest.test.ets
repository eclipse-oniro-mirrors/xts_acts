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

export default function ScrollAttributeTest() {

  describe('ScrollAttributeTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scroll/ScrollAttributeTest`, done);
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });


    /**
     * @tc.number  SUB_ARKUI_SCROLL_PARALLELIZE_TEST_0100
     * @tc.name    ScrollAttributeTest_0100
     * @tc.desc    testing ScrollAttributeTest_0100 CAPI creat & dispose
     * @tc.size    AttributeTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('ScrollAttributeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ScrollAttributeTest_0100] START');
      await Utils.sleep(1000);
      let nodeID = getInspectorByKey('buttonScrollID1');
      let obj1: ESObject = JSON.parse(nodeID);
      console.info('ScrollAttributeTest_0100 label: ' + JSON.stringify(JSON.parse(nodeID).$attrs.label));
      expect(obj1.$attrs.label).assertEqual('Scroll capi is successful');

      let nodeID2 = getInspectorByKey('buttonScrollID2');
      let obj2: ESObject = JSON.parse(nodeID2);
      console.info('ScrollAttributeTest_0100 label2: ' + JSON.stringify(JSON.parse(nodeID2).$attrs.label));
      expect(obj2.$attrs.label).assertEqual('Scroll2 capi is successful');

      let nodeID3 = getInspectorByKey('buttonScrollID3');
      let obj3: ESObject = JSON.parse(nodeID3);
      console.info('ScrollAttributeTest_0100 label3: ' + JSON.stringify(JSON.parse(nodeID3).$attrs.label));
      expect(obj3.$attrs.label).assertEqual('Scroll3 capi is successful');
      done()
    })
  })
}
