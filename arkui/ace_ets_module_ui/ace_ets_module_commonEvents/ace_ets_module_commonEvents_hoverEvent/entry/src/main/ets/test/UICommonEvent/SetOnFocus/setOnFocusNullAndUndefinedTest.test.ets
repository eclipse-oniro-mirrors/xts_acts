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

export default function setOnFocusNullAndUndefined() {
  describe('setOnFocusNullAndUndefined', () => {
    beforeAll(async () => {
      console.info("setOnFocusNullAndUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UICommonEvent/SetOnFocus/SetOnFocusNullAndUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setOnFocusNullAndUndefined state success " + JSON.stringify(pages));
        if (!("SetOnFocusNullAndUndefined" == pages.name)) {
          console.info("get setOnFocusNullAndUndefined state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push setOnFocusNullAndUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setOnFocusNullAndUndefined page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setOnFocusNullAndUndefined after each called");
    });

    /**
     * @tc.name   setOnFocusNullV12001
     * @tc.number SUB_ARKUI_UICOMMONEVENT_SETONFOCUS_PARAM_001
     * @tc.desc   Test setOnFocus with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setOnFocusNullV12001', Level.LEVEL0, async () => {
      console.info('[setOnFocusNullV12001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let checkBtn = await driver.findComponent(ON.id('checkNullBtn'));
      await checkBtn.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('setOnFocusNullResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setOnFocusNullV12001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Init');
      console.info('[setOnFocusNullV12001] END');
    });

    /**
     * @tc.name   setOnFocusUndefinedV12002
     * @tc.number SUB_ARKUI_UICOMMONEVENT_SETONFOCUS_PARAM_002
     * @tc.desc   Test setOnFocus with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setOnFocusUndefinedV12002', Level.LEVEL0, async () => {
      console.info('[setOnFocusUndefinedV12002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let checkBtn = await driver.findComponent(ON.id('checkUndefinedBtn'));
      await checkBtn.click();
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('setOnFocusUndefinedResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[setOnFocusUndefinedV12002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('Init');
      console.info('[setOnFocusUndefinedV12002] END');
    });
  })
}
