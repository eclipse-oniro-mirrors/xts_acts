'use static'
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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import {
  Driver, ON
} from '@ohos.UiTest';

export default function OutlineRadiusModifierTest() {
  describe('OutlineRadiusModifierTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("OutlineRadiusModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("OutlineRadiusModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/outlineRadius/outlineRadiusModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get OutlineRadiusModifierTest state pages:" + JSON.stringify(pages));
        if (!("outlineRadiusModifier" == pages.name)) {
          console.info("get OutlineRadiusModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OutlineRadiusModifierTest page error:" + err);
      }
      console.info("OutlineRadiusModifierTest beforeEach end");
    });
    /**
     * @tc.number    OutlineRadiusModifierUndefinedTest_static_0100
     * @tc.name      OutlineRadiusModifierUndefinedTest_static_0100
     * @tc.desc      OutlineRadiusModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('OutlineRadiusModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[OutlineRadiusModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('outlineRadiusModifierTest');
      await CommonFunc.sleep(1000);

      console.info("[OutlineRadiusModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[OutlineRadiusModifierUndefinedTest_static_0100] outlineRadius: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('outlineRadius')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('outlineRadius')))
        .assertEqual('\"5.00vp\"');
      let changeBtn = await driver.findComponent(ON.id('outlineRadiusModifier'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[OutlineRadiusModifierUndefinedTest_static_0100] click outlineRadius");
      strJson = inspector.getInspectorByKey('outlineRadiusModifierTest');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('outlineRadius')))
        .assertEqual('{"topLeft":"0.00vp","topRight":"0.00vp","bottomLeft":"0.00vp","bottomRight":"0.00vp"}');
      console.info('[OutlineRadiusModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
