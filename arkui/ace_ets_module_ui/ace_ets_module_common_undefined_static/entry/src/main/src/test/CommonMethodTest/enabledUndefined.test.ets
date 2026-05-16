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

export default function enabledUndefinedTest() {
  describe('enabledUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("enabledUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonMethod/enabledUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get enabledUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("enabledUndefined" == pages.name)) {
          console.info("get enabledUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push enabledUndefinedTest page error:" + err);
      }
      console.info("enabledUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    enabledUndefinedTest_static_0100
     * @tc.name      enabledUndefinedTest_static_0100
     * @tc.desc      enabledUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('enabledUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[enabledUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('commonmethod_enabled');
      let enabledValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('enabled');
      expect(enabledValue.asBoolean()).assertFalse();

      let driver = Driver.create();
      let btn1: Component | null = await driver.findComponent(ON.id('button_enabled'));
      btn1?.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('commonmethod_enabled');
      let enabledValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('enabled');
      expect(enabledValue1.asBoolean()).assertTrue();

      console.info('[enabledUndefinedTest_static_0100] END');
      done();
    });

  })
}