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

export default function defaultFocusModifierUndefinedTest() {
  describe('defaultFocusModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("defaultFocusModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonMethod/defaultFocusModifierUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get defaultFocusModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("defaultFocusModifierUndefined" == pages.name)) {
          console.info("get defaultFocusModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push defaultFocusModifierUndefinedTest page error:" + err);
      }
      console.info("defaultFocusModifierUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    defaultFocusModifierUndefinedTest_static_0100
     * @tc.name      defaultFocusModifierUndefinedTest_static_0100
     * @tc.desc      defaultFocusModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('defaultFocusModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[defaultFocusModifierUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('commonmethod_defaultFocusModifier');
      let defaultFocusModifierValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('defaultFocus');
      expect(defaultFocusModifierValue.asBoolean()).assertFalse();

      console.info('[defaultFocusModifierUndefinedTest_static_0100] END');
      done();
    });

  })
}