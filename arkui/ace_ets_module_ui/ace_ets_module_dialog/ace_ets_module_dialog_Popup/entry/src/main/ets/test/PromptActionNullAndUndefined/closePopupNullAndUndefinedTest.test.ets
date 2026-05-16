/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of this License at
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
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function closePopupNullAndUndefinedTest() {
  describe('closePopupNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("closePopupNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/ClosePopupNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get closePopupNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("ClosePopupNullAndUndefined" == pages.name)) {
          console.info("get closePopupNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push closePopupNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push closePopupNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      // Popup/ActionMenu will be closed in page aboutToDisappear
      await CommonFunc.sleep(1000);
      console.info("closePopupNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   closePopupSuccess001
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSEPOPUP_SUCCESS_001
     * @tc.desc   Test closePopup success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closePopupSuccess001', Level.LEVEL0, async () => {
      console.info('[closePopupSuccess001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOpenPopup'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let btn2 = await scroll.scrollSearch(ON.id('btnClosePopup'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextClosePopup');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[closePopupSuccess001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('open popup success');
      console.info('[closePopupSuccess001] END');
    });

    /**
     * @tc.name   closePopupContentNull002
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSEPOPUP_PARAM_002
     * @tc.desc   Test closePopup with content null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closePopupContentNull002', Level.LEVEL0, async () => {
      console.info('[closePopupContentNull002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextClosePopup');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[closePopupContentNull002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content null error');
      console.info('[closePopupContentNull002] END');
    });

    /**
     * @tc.name   closePopupContentUndefined003
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSEPOPUP_PARAM_003
     * @tc.desc   Test closePopup with content undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closePopupContentUndefined003', Level.LEVEL0, async () => {
      console.info('[closePopupContentUndefined003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextClosePopup');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[closePopupContentUndefined003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content undefined error');
      console.info('[closePopupContentUndefined003] END');
    });
  })
}
