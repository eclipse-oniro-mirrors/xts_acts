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

export default function onDetachUndefinedTest() {
  describe('onDetachUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("onDetachUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonMethod/onDetachUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onDetachUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("onDetachUndefined" == pages.name)) {
          console.info("get onDetachUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onDetachUndefinedTest page error:" + err);
      }
      console.info("onDetachUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    onDetachUndefinedTest_static_0100
     * @tc.name      onDetachUndefinedTest_static_0100
     * @tc.desc      onDetachUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('onDetachUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[onDetachUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let driver2 = Driver.create();
      let btn2: Component | null = await driver2.findComponent(ON.id('button_onDetach2'));
      btn2?.click();
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('commonmethod_onDetach');
      let onDetachValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onDetachValue.asString()).assertEqual('Count1');

      let driver = Driver.create();
      let btn1: Component | null = await driver.findComponent(ON.id('button_onDetach'));
      btn1?.click();
      await CommonFunc.sleep(2000);

      btn2?.click();
      await CommonFunc.sleep(2000);
      btn2?.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('commonmethod_onDetach');
      let onDetachValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onDetachValue1.asString()).assertEqual('Count1');

      console.info('[onDetachUndefinedTest_static_0100] END');
      done();
    });

  })
}