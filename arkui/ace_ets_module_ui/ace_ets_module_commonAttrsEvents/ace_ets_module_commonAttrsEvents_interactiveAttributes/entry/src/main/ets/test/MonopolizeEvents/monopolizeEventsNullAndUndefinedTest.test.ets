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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function commonMethodMonopolizeEventsNullAndUndefinedTest() {
  describe('commonMethodMonopolizeEventsNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("commonMethodMonopolizeEventsNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/monopolizeEventsNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get commonMethodMonopolizeEventsNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("monopolizeEventsNullAndUndefined" == pages.name)) {
          console.info("get commonMethodMonopolizeEventsNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push commonMethodMonopolizeEventsNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonMethodMonopolizeEventsNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonMethodMonopolizeEventsNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   commonMethodMonopolizeEventsNullV1001
     * @tc.number SUB_ARKUI_COMMONMETHOD_MONOPOLIZEEVENTS_PARAM_001
     * @tc.desc   Test CommonMethod monopolizeEvents with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodMonopolizeEventsNullV1001', Level.LEVEL0, async (done: Function) => {
      console.info('commonMethodMonopolizeEventsNullV1001 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('monopolize_column1');
      console.info("[commonMethodMonopolizeEventsNullV1001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[commonMethodMonopolizeEventsNullV1001] component obj.$attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[commonMethodMonopolizeEventsNullV1001] text: " + JSON.stringify(JSON.parse(strJson).$attrs.monopolizeEvents));
      expect(JSON.parse(strJson).$attrs.monopolizeEvents).assertEqual(false);
      console.info('[commonMethodMonopolizeEventsNullV1001] END');
      done();
    });

    /**
     * @tc.name   commonMethodMonopolizeEventsUndefinedV1002
     * @tc.number SUB_ARKUI_COMMONMETHOD_MONOPOLIZEEVENTS_PARAM_002
     * @tc.desc   Test CommonMethod monopolizeEvents with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commonMethodMonopolizeEventsUndefinedV1002', Level.LEVEL0, async (done: Function) => {
      console.info('commonMethodMonopolizeEventsUndefinedV1002 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('monopolize_column2');
      console.info("[commonMethodMonopolizeEventsUndefinedV1002] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[commonMethodMonopolizeEventsUndefinedV1002] component obj.$attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[commonMethodMonopolizeEventsUndefinedV1002] text: " + JSON.stringify(JSON.parse(strJson).$attrs.monopolizeEvents));
      expect(JSON.parse(strJson).$attrs.monopolizeEvents).assertEqual(false);
      console.info('[commonMethodMonopolizeEventsUndefinedV1002] END');
      done();
    });
  })
}
