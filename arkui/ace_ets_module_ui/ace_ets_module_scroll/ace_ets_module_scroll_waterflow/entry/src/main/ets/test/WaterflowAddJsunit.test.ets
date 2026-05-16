/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import ohosrouter from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common'
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';

export default function WaterflowAddJsunit() {
  describe('WaterflowAddJsunit', () => {
    beforeAll(async () => {
      console.info("Waterflow_addJsunit beforeEach start");
      try {
        ohosrouter.clear();
        let pages = ohosrouter.getState();
        console.info("Waterflow_addJsunit " + JSON.stringify(pages));
        if (!("Waterflow_add" == pages.name)) {
          console.info("Waterflow_addJsunit state success " + JSON.stringify(pages.name));
          ohosrouter.pushUrl({
            url: 'MainAbility/pages/Waterflow_add',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
            // success
          })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
          await CommonFunc.sleep(2000);
          console.info("push Waterflow_add page success ");
        }
      } catch (err) {
        console.error("push Waterflow_add page error: " + err);
      }
    });

    /**
     * @tc.name   WaterflowAddJsunit_0900
     * @tc.number apiCommponentAdd02Jsunit_0900
     * @tc.desc   Test Waterflow enableScrollInteraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WaterflowAddJsunit_0900', Level.LEVEL1, async (done: Function) => {
      console.info('WaterflowAddJsunit_0900 START');
      let strJson = getInspectorByKey('waterflowAdd');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[WaterflowAddJsunit_0900'] component obj is: " + obj.$attrs.enableScrollInteraction);
      expect(obj.$attrs.enableScrollInteraction).assertTrue();
      done();
    });
  })
}