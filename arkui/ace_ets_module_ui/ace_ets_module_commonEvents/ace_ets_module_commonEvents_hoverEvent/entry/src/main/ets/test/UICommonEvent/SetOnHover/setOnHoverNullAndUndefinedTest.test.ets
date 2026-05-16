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
import CommonFunc from '../../../MainAbility/common/Common'

export default function setOnHoverNullAndUndefined() {
  describe('setOnHoverNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("setOnHoverNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UICommonEvent/SetOnHover/SetOnHoverNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setOnHoverNullAndUndefined state success " + JSON.stringify(pages));
        if (!("SetOnHoverNullAndUndefined" == pages.name)) {
          console.info("get setOnHoverNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push setOnHoverNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setOnHoverNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setOnHoverNullAndUndefined after each called");
    });

    /**
     * @tc.name   setOnHoverNullV12001
     * @tc.number SUB_ARKUI_UICOMMONEVENT_SETONHOVER_PARAM_001
     * @tc.desc   Test setOnHover with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setOnHoverNullV12001', Level.LEVEL0, async () => {
      console.info('[setOnHoverNullV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let checkBtn = await driver.findComponent(ON.id('checkNullBtn'));
      await checkBtn.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('setOnHoverNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setOnHoverNullV12001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Init');
      console.info('[setOnHoverNullV12001] END');
    });

    /**
     * @tc.name   setOnHoverUndefinedV12002
     * @tc.number SUB_ARKUI_UICOMMONEVENT_SETONHOVER_PARAM_002
     * @tc.desc   Test setOnHover with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setOnHoverUndefinedV12002', Level.LEVEL0, async () => {
      console.info('[setOnHoverUndefinedV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let checkBtn = await driver.findComponent(ON.id('checkUndefinedBtn'));
      await checkBtn.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('setOnHoverUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setOnHoverUndefinedV12002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Init');
      console.info('[setOnHoverUndefinedV12002] END');
    });
  })
}
