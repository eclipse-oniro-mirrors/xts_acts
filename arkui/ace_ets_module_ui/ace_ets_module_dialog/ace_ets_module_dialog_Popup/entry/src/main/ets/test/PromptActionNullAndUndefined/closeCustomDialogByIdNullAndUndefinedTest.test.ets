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

export default function closeCustomDialogByIdNullAndUndefinedTest() {
  describe('closeCustomDialogByIdNullAndUndefinedTest', () => {
    beforeAll(async () => {
      console.info("closeCustomDialogByIdNullAndUndefinedTest beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PromptActionNullAndUndefined/CloseCustomDialogByIdNullAndUndefined'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get closeCustomDialogByIdNullAndUndefinedTest state success " + JSON.stringify(pages));
        if (!("CloseCustomDialogByIdNullAndUndefined" == pages.name)) {
          console.info("get closeCustomDialogByIdNullAndUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push closeCustomDialogByIdNullAndUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push closeCustomDialogByIdNullAndUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("closeCustomDialogByIdNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   closeCustomDialogByIdSuccess001
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSECUSTOMDIALOG_BYID_001
     * @tc.desc   Test closeCustomDialog with dialogId success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeCustomDialogByIdSuccess001', Level.LEVEL0, async () => {
      console.info('[closeCustomDialogByIdSuccess001] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      
      let openBtn = await scroll.scrollSearch(ON.id('btnOpenCustomDialogById'));
      await openBtn.click();
      await CommonFunc.sleep(1000);
      
      let closeBtn = await scroll.scrollSearch(ON.id('btnCloseCustomDialogByIdSuccess'));
      await closeBtn.click();
      await CommonFunc.sleep(2000);
      
      let strJson = getInspectorByKey('resultTextCloseById');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[closeCustomDialogByIdSuccess001] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('open dialog success');
      console.info('[closeCustomDialogByIdSuccess001] END');
    });

    /**
     * @tc.name   closeCustomDialogByIdNull002
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSECUSTOMDIALOG_BYID_002
     * @tc.desc   Test closeCustomDialog with dialogId null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeCustomDialogByIdNull002', Level.LEVEL0, async () => {
      console.info('[closeCustomDialogByIdNull002] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCloseCustomDialogByIdNull'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextCloseById');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[closeCustomDialogByIdNull002] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('dialog');
      console.info('[closeCustomDialogByIdNull002] END');
    });

    /**
     * @tc.name   closeCustomDialogByIdUndefined003
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSECUSTOMDIALOG_BYID_003
     * @tc.desc   Test closeCustomDialog with dialogId undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('closeCustomDialogByIdUndefined003', Level.LEVEL0, async () => {
      console.info('[closeCustomDialogByIdUndefined003] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scroll: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scroll.scrollSearch(ON.id('btnCloseCustomDialogByIdUndefined'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('resultTextCloseById');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[closeCustomDialogByIdUndefined003] result is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('dialogId undefined error');
      console.info('[closeCustomDialogByIdUndefined003] END');
    });
  })
}
