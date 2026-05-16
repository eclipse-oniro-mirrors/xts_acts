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

export default function updatePopupNullAndUndefinedTest() {
  describe('updatePopupNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("updatePopupNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/UpdatePopupNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get updatePopupNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("UpdatePopupNullAndUndefined" == pages.name)) {
          console.info("get updatePopupNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push updatePopupNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push updatePopupNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      // Popup/ActionMenu will be closed in page aboutToDisappear
      await CommonFunc.sleep(1000);
      console.info("updatePopupNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   updatePopupPartialUpdateTrue001
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATEPOPUP_PARTIALUPDATE_001
     * @tc.desc   Test updatePopup with partialUpdate true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updatePopupPartialUpdateTrue001', Level.LEVEL0, async () => {
      console.info('[updatePopupPartialUpdateTrue001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOpenPopup'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let btn2 = await scroll.scrollSearch(ON.id('btnPartialUpdateTrue'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdatePopup');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updatePopupPartialUpdateTrue001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('open popup success');
      console.info('[updatePopupPartialUpdateTrue001] END');
    });

    /**
     * @tc.name   updatePopupPartialUpdateFalse002
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATEPOPUP_PARTIALUPDATE_002
     * @tc.desc   Test updatePopup with partialUpdate false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updatePopupPartialUpdateFalse002', Level.LEVEL0, async () => {
      console.info('[updatePopupPartialUpdateFalse002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOpenPopup'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let btn2 = await scroll.scrollSearch(ON.id('btnPartialUpdateFalse'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdatePopup');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updatePopupPartialUpdateFalse002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('open popup success');
      console.info('[updatePopupPartialUpdateFalse002] END');
    });

    /**
     * @tc.name   updatePopupContentNull003
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATEPOPUP_PARAM_003
     * @tc.desc   Test updatePopup with content null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updatePopupContentNull003', Level.LEVEL0, async () => {
      console.info('[updatePopupContentNull003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdatePopup');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updatePopupContentNull003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content null error');
      console.info('[updatePopupContentNull003] END');
    });

    /**
     * @tc.name   updatePopupContentUndefined004
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATEPOPUP_PARAM_004
     * @tc.desc   Test updatePopup with content undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updatePopupContentUndefined004', Level.LEVEL0, async () => {
      console.info('[updatePopupContentUndefined004] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnContentUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdatePopup');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updatePopupContentUndefined004] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content undefined error');
      console.info('[updatePopupContentUndefined004] END');
    });

    /**
     * @tc.name   updatePopupOptionsNull005
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATEPOPUP_PARAM_005
     * @tc.desc   Test updatePopup with options null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updatePopupOptionsNull005', Level.LEVEL0, async () => {
      console.info('[updatePopupOptionsNull005] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOpenPopup'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let btn2 = await scroll.scrollSearch(ON.id('btnOptionsNull'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdatePopup');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updatePopupOptionsNull005] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('open popup success');
      console.info('[updatePopupOptionsNull005] END');
    });

    /**
     * @tc.name   updatePopupOptionsUndefined006
     * @tc.number SUB_ARKUI_PROMPTACTION_UPDATEPOPUP_PARAM_006
     * @tc.desc   Test updatePopup with options undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('updatePopupOptionsUndefined006', Level.LEVEL0, async () => {
      console.info('[updatePopupOptionsUndefined006] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnOpenPopup'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let btn2 = await scroll.scrollSearch(ON.id('btnOptionsUndefined'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextUpdatePopup');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updatePopupOptionsUndefined006] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('open popup success');
      console.info('[updatePopupOptionsUndefined006] END');
    });
  })
}
