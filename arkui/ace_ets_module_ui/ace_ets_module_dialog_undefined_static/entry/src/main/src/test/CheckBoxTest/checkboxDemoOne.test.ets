/**
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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, ON, } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function checkboxDemoOneXTS() {
  describe('checkboxDemoOneXTS', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("checkboxDemoOneXTS beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CheckBox/checkboxDemoOne",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get checkboxDemoOneXTS state pages:" + JSON.stringify(pages));
        if (!("checkboxDemoOne" == pages.name)) {
          console.info("get checkboxDemoOneXTS pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push checkboxDemoOneXTS page error:" + err);
      }
      console.info("checkboxDemoOneXTS beforeEach end");
    });

    /**
     * @tc.number    onChange_static_0100
     * @tc.name      onChange_static_0100
     * @tc.desc      test func onChange
     * @tc.level     Level.LEVEL0
     */
    it('onChange_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onChange_static_0100] START.');
      await CommonFunc.sleep(500);

      let txtCheckboxFlag = inspector.getInspectorByKey('txtCheckboxFlag');
      let contentValue = JSON.parseJsonElement(txtCheckboxFlag).getElement('$attrs').getElement('content');
      expect(contentValue.asString()).assertEqual('Checkbox flag:true');

      let driver = Driver.create();
      let checkbox = await driver.findComponent(ON.id('checkbox01')) as Component;
      await checkbox.click();
      await CommonFunc.sleep(500);

      expect(contentValue.asString()).assertEqual('Checkbox flag:true');

      let bntChangeFlag = await driver.findComponent(ON.id('bntChangeFlag')) as Component;
      await bntChangeFlag.click();
      await CommonFunc.sleep(500);

      await checkbox.click();
      await CommonFunc.sleep(500);

      txtCheckboxFlag = inspector.getInspectorByKey('txtCheckboxFlag');
      contentValue = JSON.parseJsonElement(txtCheckboxFlag).getElement('$attrs').getElement('content');
      expect(contentValue.asString()).assertEqual('Checkbox flag:false');

      console.info('[onChange_static_0100] END');
      done();
    });

    /**
     * @tc.number    select_static_0200
     * @tc.name      select_static_0200
     * @tc.desc      test func select
     * @tc.level     Level.LEVEL0
     */
    it('select_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[select_static_0200] START.');
      await CommonFunc.sleep(500);

      let checkbox02 = inspector.getInspectorByKey('checkbox02');
      let obj = JSON.parseJsonElement(checkbox02);

      console.info("select_static_0200 select is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('select')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('select'))).assertContain('false');

      let driver = Driver.create();
      let bnt1 = await driver.findComponent(ON.id('bntChangeFlag02')) as Component;
      await bnt1.click();
      await CommonFunc.sleep(500);

      checkbox02 = inspector.getInspectorByKey('checkbox02');
      obj = JSON.parseJsonElement(checkbox02);

      console.info("select_static_0200 select is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('select')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('select'))).assertContain('true');

      console.info('[select_static_0200] END');
      done();
    });

  })
}