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

export default function setOnTouchNullAndUndefined() {
  describe('setOnTouchNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("setOnTouchNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UICommonEvent/SetOnTouch/SetOnTouchNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setOnTouchNullAndUndefined state success " + JSON.stringify(pages));
        if (!("SetOnTouchNullAndUndefined" == pages.name)) {
          console.info("get setOnTouchNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push setOnTouchNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setOnTouchNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setOnTouchNullAndUndefined after each called");
    });

    /**
     * @tc.name   setOnTouchNullV12001
     * @tc.number SUB_ARKUI_UICOMMONEVENT_SETONTOUCH_PARAM_001
     * @tc.desc   Test setOnTouch with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setOnTouchNullV12001', Level.LEVEL0, async () => {
      console.info('[setOnTouchNullV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('setOnTouchNullBtn'));
      await button.click();
      await CommonFunc.sleep(500);
      let checkBtn = await driver.findComponent(ON.id('checkNullBtn'));
      await checkBtn.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('setOnTouchNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setOnTouchNullV12001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Init');
      console.info('[setOnTouchNullV12001] END');
    });

    /**
     * @tc.name   setOnTouchUndefinedV12002
     * @tc.number SUB_ARKUI_UICOMMONEVENT_SETONTOUCH_PARAM_002
     * @tc.desc   Test setOnTouch with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setOnTouchUndefinedV12002', Level.LEVEL0, async () => {
      console.info('[setOnTouchUndefinedV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('setOnTouchUndefinedBtn'));
      await button.click();
      await CommonFunc.sleep(500);
      let checkBtn = await driver.findComponent(ON.id('checkUndefinedBtn'));
      await checkBtn.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('setOnTouchUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setOnTouchUndefinedV12002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Init');
      console.info('[setOnTouchUndefinedV12002] END');
    });
  })
}
