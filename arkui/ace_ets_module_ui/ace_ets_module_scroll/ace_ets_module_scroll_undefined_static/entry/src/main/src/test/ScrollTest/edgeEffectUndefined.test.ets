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

export default function edgeEffectUndefinedTest() {
  describe('edgeEffectUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("edgeEffectUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/edgeEffectUndefined",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get edgeEffectUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("edgeEffectUndefined" == pages.name)) {
          console.info("get edgeEffectUndefinedTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push edgeEffectUndefinedTest page error:" + err);
      }
      console.info("edgeEffectUndefinedTest beforeEach end");
    });

    /**
     * @tc.number    edgeEffectUndefinedTest_static_0100
     * @tc.name      edgeEffectUndefinedTest_static_0100
     * @tc.desc      edgeEffectUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('edgeEffectUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[edgeEffectUndefinedTest_static_0100] START.');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('common_edgeEffect');
      let edgeEffectValue = JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffect');
      console.info('$edgeEffect: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('edgeEffect')));
      expect(edgeEffectValue.asString()).assertEqual('EdgeEffect.Spring');

      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('button_edgeEffect')) as Component;
      await btn1.click();
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('common_edgeEffect');
      let edgeEffectValue1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('edgeEffect');
      console.info('$edgeEffect: ' +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson1).getElement('$attrs').getElement('edgeEffect')));
      expect(edgeEffectValue1.asString()).assertEqual('EdgeEffect.None');

      console.info('[edgeEffectUndefinedTest_static_0100] END');
      done();
    });
  })
}