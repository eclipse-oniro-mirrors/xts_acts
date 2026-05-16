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

export default function focusOnTouchUndefinedTest() {
  describe('focusOnTouchUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("focusOnTouchUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonMethod/focusOnTouchUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get focusOnTouchUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("focusOnTouchUndefined" == pages.name)) {
          console.info("get focusOnTouchUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push focusOnTouchUndefinedTest page error:" + err);
      }
      console.info("focusOnTouchUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    focusOnTouchUndefinedTest_static_0100
     * @tc.name      focusOnTouchUndefinedTest_static_0100
     * @tc.desc      focusOnTouchUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('focusOnTouchUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[focusOnTouchUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('commonmethod_focusOnTouch');
      let focusOnTouchValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('focusOnTouch');
      expect(focusOnTouchValue.asBoolean()).assertTrue();

      let driver = Driver.create();
      let btn1: Component | null = await driver.findComponent(ON.id('button_focusOnTouch'));
      btn1?.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('commonmethod_focusOnTouch');
      let focusOnTouchValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('focusOnTouch');
      expect(focusOnTouchValue1.asBoolean()).assertFalse();

      console.info('[focusOnTouchUndefinedTest_static_0100] END');
      done();
    });

  })
}