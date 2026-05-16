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
import {
  Component,
  Driver,
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function focusableUndefinedTest() {
  describe('focusableUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("focusableUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonMethod/focusableUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get focusableUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("focusableUndefined" == pages.name)) {
          console.info("get focusableUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push focusableUndefinedTest page error:" + err);
      }
      console.info("focusableUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    focusableUndefinedTest_static_0100
     * @tc.name      focusableUndefinedTest_static_0100
     * @tc.desc      focusableUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('focusableUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[focusableUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('commonmethod_focusable');
      let focusableValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('focusable');
      expect(focusableValue.asBoolean()).assertFalse();

      let driver = Driver.create();
      let btn1: Component | null = await driver.findComponent(ON.id('button_focusable'));
      btn1?.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('commonmethod_focusable');
      let focusableValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('focusable');
      expect(focusableValue1.asBoolean()).assertTrue();

      let strJson2 = inspector.getInspectorByKey('commonmethod_focusable2');
      let focusableValue2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getElement('focusable');
      expect(focusableValue2.asBoolean()).assertTrue();

      let driver2 = Driver.create();
      let btn2: Component | null = await driver2.findComponent(ON.id('button_focusable2'));
      btn2?.click();
      await CommonFunc.sleep(2000);

      let strJson3 = inspector.getInspectorByKey('commonmethod_focusable2');
      let focusableValue3 = JSON.parseJsonElement(strJson3).getElement('$attrs').getElement('focusable');
      expect(focusableValue3.asBoolean()).assertFalse();

      console.info('[focusableUndefinedTest_static_0100] END');
      done();
    });
  })
}