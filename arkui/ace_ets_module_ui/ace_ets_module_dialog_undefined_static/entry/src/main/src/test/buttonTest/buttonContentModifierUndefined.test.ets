'use static';
/**
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

import { describe, beforeAll, beforeEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function buttonContentModifierUndefinedTest() {
  describe('buttonContentModifierUndefinedTest', () => {
    beforeAll(async ():Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.dialog.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("buttonContentModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/button/buttonContentModifierUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get buttonContentModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("buttonContentModifierUndefined" == pages.name)) {
          console.info("get buttonContentModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push buttonContentModifierUndefinedTest page error:" + err);
      }
      console.info("buttonContentModifierUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    buttonContentModifierUndefinedTest_static_0100
     * @tc.name      buttonContentModifierUndefinedTest_static_0100
     * @tc.desc      buttonContentModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('buttonContentModifierUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[buttonContentModifierUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('buttonContentModifierUndefined');
      let contentModifierValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      console.info('$contentModifier: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content')));
      expect(contentModifierValue.asString()).assertEqual('enabled true');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('buttonContentModifierUndefined2')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('buttonContentModifierUndefined');
      expect(strJson1).assertEqual(undefined);

      console.info('[buttonContentModifierUndefinedTest_static_0100] END');
      done();
    });

  })
}