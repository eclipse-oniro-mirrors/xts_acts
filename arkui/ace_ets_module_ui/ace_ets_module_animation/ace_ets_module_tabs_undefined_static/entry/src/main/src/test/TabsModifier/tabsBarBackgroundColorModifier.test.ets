'use static'
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

export default function TabsBarBackgroundColorModifierTest() {
  describe('TabsBarBackgroundColorModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabsBarBackgroundColorModifierTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.tabs.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabsBarBackgroundColorModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabsModifier/tabsBarBackgroundColorModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabsBarBackgroundColorModifierTest state pages:" + JSON.stringify(pages));
        if (!("tabsBarBackgroundColorModifier" == pages.name)) {
          console.info("get TabsBarBackgroundColorModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push EventPage page error:" + err);
      }
      console.info("TabsBarBackgroundColorModifierTest beforeEach end");
    });

    /**
     * @tc.number    TabsBarBackgroundColorModifierUndefinedTest_static_0100
     * @tc.name      TabsBarBackgroundColorModifierUndefinedTest_static_0100
     * @tc.desc      TabsBarBackgroundColorModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TabsBarBackgroundColorModifierUndefinedTest_static_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('[TabsBarBackgroundColorModifierUndefinedTest_static_0100] START');
        let driver: Driver = Driver.create()
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('tabsTarBackgroundColorModifier');
        await CommonFunc.sleep(1000);
        expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('barBackgroundColor')))
          .assertEqual('\"#FFFF0000\"');
        let changeBtn = await driver.findComponent(ON.id('buttonBarBackgroundColorModifier'));
        await (changeBtn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info("[TabsBarBackgroundColorModifierUndefinedTest_static_0100] click barBackgroundColor");
        strJson = inspector.getInspectorByKey('tabsTarBackgroundColorModifier');
        let strJsonTwo = inspector.getInspectorByKey('tabsTarBackgroundColorModifierTwo');
        await CommonFunc.sleep(1000);
        expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('barBackgroundColor')))
          .assertEqual(JSON.stringifyJsonElement(JSON.parseJsonElement(strJsonTwo)
            .getElement('$attrs')
            .getElement('barBackgroundColor')));
        await CommonFunc.sleep(1000);
        await (changeBtn?.click() as Promise<void>);
        console.info('[TabsBarBackgroundColorModifierUndefinedTest_static_0100] END');
        done();
      });
  })
}
