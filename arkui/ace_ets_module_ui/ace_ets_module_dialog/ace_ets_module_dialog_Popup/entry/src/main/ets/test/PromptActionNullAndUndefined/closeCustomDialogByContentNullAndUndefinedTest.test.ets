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

export default function closeCustomDialogByContentNullAndUndefinedTest() {
  describe('closeCustomDialogByContentNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("closeCustomDialogByContentNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/CloseCustomDialogByContentNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get closeCustomDialogByContentNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("CloseCustomDialogByContentNullAndUndefined" == pages.name)) {
          console.info("get closeCustomDialogByContentNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push closeCustomDialogByContentNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push closeCustomDialogByContentNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      try {
        let driver: Driver = Driver.create();
        let closeButton = await driver.findComponent(ON.text('Close'));
        if (closeButton) {
          await closeButton.click();
          await CommonFunc.sleep(500);
        }
      } catch (err) {
        console.info('Close button not found or already closed');
      }
      await CommonFunc.sleep(1000);
      console.info("closeCustomDialogByContentNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   closeCustomDialogByContentSuccess001
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSECUSTOMDIALOG_BYCONTENT_001
     * @tc.desc   Test closeCustomDialog with ComponentContent success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeCustomDialogByContentSuccess001', Level.LEVEL0, async () => {
      console.info('[closeCustomDialogByContentSuccess001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCloseCustomDialogByContentSuccess'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextCloseByContent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[closeCustomDialogByContentSuccess001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('close by content');
      console.info('[closeCustomDialogByContentSuccess001] END');
    });

    /**
     * @tc.name   closeCustomDialogByContentNull002
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSECUSTOMDIALOG_BYCONTENT_002
     * @tc.desc   Test closeCustomDialog with ComponentContent null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeCustomDialogByContentNull002', Level.LEVEL0, async () => {
      console.info('[closeCustomDialogByContentNull002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCloseCustomDialogByContentNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextCloseByContent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[closeCustomDialogByContentNull002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content null error');
      console.info('[closeCustomDialogByContentNull002] END');
    });

    /**
     * @tc.name   closeCustomDialogByContentUndefined003
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSECUSTOMDIALOG_BYCONTENT_003
     * @tc.desc   Test closeCustomDialog with ComponentContent undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeCustomDialogByContentUndefined003', Level.LEVEL0, async () => {
      console.info('[closeCustomDialogByContentUndefined003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCloseCustomDialogByContentUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextCloseByContent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[closeCustomDialogByContentUndefined003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('content undefined error');
      console.info('[closeCustomDialogByContentUndefined003] END');
    });
  })
}
