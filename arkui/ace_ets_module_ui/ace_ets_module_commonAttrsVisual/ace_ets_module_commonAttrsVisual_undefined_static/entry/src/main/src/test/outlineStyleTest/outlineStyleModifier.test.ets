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

export default function OutlineStyleModifierTest() {
  describe('OutlineStyleModifierTest', () => {
    beforeAll(async ():Promise<void> => {
      console.info("OutlineStyleModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("OutlineStyleModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/outlineStyle/outlineStyleModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get OutlineStyleModifierTest state pages:" + JSON.stringify(pages));
        if (!("outlineStyleModifier" == pages.name)) {
          console.info("get OutlineStyleModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OutlineStyleModifierTest page error:" + err);
      }
      console.info("OutlineStyleModifierTest beforeEach end");
    });
    /**
     * @tc.number    OutlineStyleModifierUndefinedTest_static_0100
     * @tc.name      OutlineStyleModifierUndefinedTest_static_0100
     * @tc.desc      OutlineStyleModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('OutlineStyleModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[OutlineStyleModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('outlineStyleModifierTest');
      await CommonFunc.sleep(1000);

      console.info("[OutlineStyleModifierUndefinedTest_static_0100] $attrs: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[OutlineStyleModifierUndefinedTest_static_0100] outlineStyle: " +
      JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('outlineStyle')));
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('outlineStyle')))
        .assertEqual('\"OutlineStyle.DASHED\"');
      let changeBtn = await driver.findComponent(ON.id('outlineStyleModifier'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[OutlineStyleModifierUndefinedTest_static_0100] click outlineStyle");
      strJson = inspector.getInspectorByKey('outlineStyleModifierTest');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('outlineStyle')))
        .assertEqual('\"OutlineStyle.SOLID\"');
      console.info('[OutlineStyleModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
