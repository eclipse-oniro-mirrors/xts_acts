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
import { Component, Driver, Component, ON, } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function visibilityUndefinedTest() {
  describe('visibilityUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("visibilityUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonMethod/visibilityUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get visibilityUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("visibilityUndefined" == pages.name)) {
          console.info("get visibilityUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push visibilityUndefinedTest page error:" + err);
      }
      console.info("visibilityUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    visibilityUndefinedTest_static_0100
     * @tc.name      visibilityUndefinedTest_static_0100
     * @tc.desc      visibilityUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('visibilityUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[visibilityUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('common_visibility');
      let visibilityValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('visibility');
      await CommonFunc.sleep(2000);
      expect(visibilityValue.asString()).assertEqual('Visibility.Visible');

      let driver = Driver.create();
      let btn2: Component | null = await driver.findComponent(ON.id('button_visibility'));
      btn2?.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('common_visibility');
      let visibilityValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('visibility');
      expect(visibilityValue1.asString()).assertEqual('Visibility.Hidden');

      console.info('[visibilityUndefinedTest_static_0100] END');
      done();
    });

  })
}