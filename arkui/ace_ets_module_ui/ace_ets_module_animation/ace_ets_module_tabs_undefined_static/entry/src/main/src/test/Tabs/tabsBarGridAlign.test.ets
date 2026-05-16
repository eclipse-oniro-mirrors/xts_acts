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

export default function TabsBarGridAlignTest() {
  describe('TabsBarGridAlignTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TabsBarGridAlignTest beforeAll start");

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.tabs.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TabsBarGridAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/tabsBarGridAlign',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get TabsBarGridAlignTest state pages:" + JSON.stringify(pages));
        if (!("tabsBarGridAlign" == pages.name)) {
          console.info("get TabsBarGridAlignTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TabsBarGridAlignTest page error:" + err);
      }
      console.info("TabsBarGridAlignTest beforeEach end");

    });

    /**
     * @tc.number    TabsBarGridAlignUndefinedTest_static_0100
     * @tc.name      TabsBarGridAlignUndefinedTest_static_0100
     * @tc.desc      TabsBarGridAlignUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('TabsBarGridAlignUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[TabsBarGridAlignUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabsBarGridAlign');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barGridAlign')))
        .assertEqual('{"gutter":"24.00vp","margin":"24.00vp","sm":"-1","md":"-1","lg":"-1"}');
      let changeBtn = await driver.findComponent(ON.id('buttonBarGridAlign'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[TabsBarGridAlignUndefinedTest_static_0100] click barGridAlign");
      strJson = inspector.getInspectorByKey('tabsBarGridAlign');
      await CommonFunc.sleep(1000);
      expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barGridAlign')))
        .assertEqual('{"gutter":"70.00vp","margin":"70.00vp","sm":"4","md":"-1","lg":"-1"}');
      await CommonFunc.sleep(1000);
      await (changeBtn?.click() as Promise<void>);
      console.info('[TabsBarGridAlignUndefinedTest_static_0100] END');
      done();
    });
  })
}
