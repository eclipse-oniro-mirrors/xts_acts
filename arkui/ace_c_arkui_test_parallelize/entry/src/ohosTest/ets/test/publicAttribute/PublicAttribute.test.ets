/*
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
import { beforeAll, expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function PublicAttributeTest() {

  describe('PublicAttributeTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`publicAttribute/PublicAttributeTest`, done);
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });


    /**
     * @tc.number  Test_OH_ArkUI_TPublicAttributeTest01
     * @tc.name    PublicAttributeTest001
     * @tc.desc    testing PublicAttributeTest001 CAPI creat & dispose
     * @tc.size    AttributeTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('PublicAttributeTest001', Level.LEVEL1, async (done: Function) => {
      let nodeID = getInspectorByKey('buttonID1');
      let obj1: ESObject = JSON.parse(nodeID);
      expect(obj1.$attrs.label).assertEqual('Button1 is successful');
      let nodeID2 = getInspectorByKey('buttonID2');
      let obj2: ESObject = JSON.parse(nodeID2);
      expect(obj2.$attrs.label).assertEqual('Button2 is successful');
      let nodeID4 = getInspectorByKey('buttonID4');
      let obj4: ESObject = JSON.parse(nodeID4);
      expect(obj4.$attrs.label).assertEqual('Button4 is successful');
      done()
    })
  })
}
