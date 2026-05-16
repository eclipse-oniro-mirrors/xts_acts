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
  ON
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function onVisibleAreaChangeModifierUndefinedTest() {
  describe('onVisibleAreaChangeModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.common.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("onVisibleAreaChangeModifierUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CommonMethod/onVisibleAreaChangeModifierUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onVisibleAreaChangeModifierUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("onVisibleAreaChangeModifierUndefined" == pages.name)) {
          console.info("get onVisibleAreaChangeModifierUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onVisibleAreaChangeModifierUndefinedTest page error:" + err);
      }
      console.info("onVisibleAreaChangeModifierUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    onVisibleAreaChangeModifierUndefinedTest_static_0100
     * @tc.name      onVisibleAreaChangeModifierUndefinedTest_static_0100
     * @tc.desc      onVisibleAreaChangeModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('onVisibleAreaChangeModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[onVisibleAreaChangeModifierUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let driver1 = Driver.create();
      let onVisibleAreaChangeModifier1 = await driver1.findComponent(ON.id('commonmethod_onVisibleAreaChangeModifier22')) as Component;
      await CommonFunc.sleep(500);
      let onVisibleAreaChangeModifier2 = await driver1.findComponent(ON.id('commonmethod_onVisibleAreaChangeModifier21')) as Component;
      await CommonFunc.sleep(500);
      await (onVisibleAreaChangeModifier1?.dragTo(onVisibleAreaChangeModifier2) as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('commonmethod_onVisibleAreaChangeModifier1');
      let onVisibleAreaChangeModifierValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('content');
      expect(onVisibleAreaChangeModifierValue.asString()).assertEqual('The component is completely invisible!');

      let driver2 = Driver.create();
      let btn2: Component | null = await driver2.findComponent(ON.id('button_onVisibleAreaChangeModifier1'));
      btn2?.click();
      await CommonFunc.sleep(500);
      let driver3 = Driver.create();
      let btn3: Component | null = await driver3.findComponent(ON.id('button_onVisibleAreaChangeModifier2'));
      btn3?.click();
      await CommonFunc.sleep(2000);
      let driver4 = Driver.create();
      let onVisibleAreaChangeModifier3 = await driver4.findComponent(ON.id('commonmethod_onVisibleAreaChangeModifier24')) as Component;
      await CommonFunc.sleep(500);
      await (onVisibleAreaChangeModifier1?.dragTo(onVisibleAreaChangeModifier3) as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson1 = inspector.getInspectorByKey('commonmethod_onVisibleAreaChangeModifier1');
      let onVisibleAreaChangeModifierValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('content');
      expect(onVisibleAreaChangeModifierValue1.asString()).assertEqual('The component is completely invisible!');

      console.info('[onVisibleAreaChangeModifierUndefinedTest_static_0100] END');
      done();
    });

  })
}