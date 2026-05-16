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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function restoreIdNullAndUndefinedTest() {
  describe('restoreIdNullAndUndefinedTest', () => {
    beforeEach(async () => {
      console.info("restoreIdNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonMethod/restoreIdNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get restoreIdNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("restoreIdNullAndUndefined" == pages.name)) {
          console.info("get restoreIdNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push restoreIdNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push restoreIdNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.name   restoreIdNullV12001
     * @tc.number SUB_ARKUI_COMMONMETHOD_RESTOREID_PARAM_001
     * @tc.desc   Test restoreId with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('restoreIdNullV12001', Level.LEVEL0, async () => {
      console.info('[restoreIdNullV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnRestoreIdNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('restoreIdText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[restoreIdNullV12001] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('null');
      console.info('[restoreIdNullV12001] END');
    });

    /**
     * @tc.name   restoreIdUndefinedV12002
     * @tc.number SUB_ARKUI_COMMONMETHOD_RESTOREID_PARAM_002
     * @tc.desc   Test restoreId with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('restoreIdUndefinedV12002', Level.LEVEL0, async () => {
      console.info('[restoreIdUndefinedV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btnRestoreIdUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('restoreIdText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[restoreIdUndefinedV12002] result: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('undefined');
      console.info('[restoreIdUndefinedV12002] END');
    });
  })
}
