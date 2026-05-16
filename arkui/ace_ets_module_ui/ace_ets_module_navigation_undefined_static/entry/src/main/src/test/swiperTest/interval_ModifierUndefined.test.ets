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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function interval_ModifierUndefinedTest() {
  describe('interval_ModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('interval_ModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/interval_Modifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get interval_ModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('interval_Modifier' == pages.name)) {
          console.info('get interval_ModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push interval_ModifierUndefinedTest page error:' + err);
      }
      console.info('interval_ModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    interval_ModifierUndefinedTest_0100
     * @tc.name      interval_ModifierUndefinedTest_0100
     * @tc.desc      interval_ModifierUndefinedTest_0100
     * @tc.level     Level.LEVEL1
     */
    it('interval_ModifierUndefinedTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('interval_ModifierUndefinedTest_0100 START');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('swiper_interval');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);

      let intervalValue = obj.getElement('$attrs').getString('interval');
      console.info('[Initial] interval value: ' + intervalValue);
      expect(intervalValue).assertEqual("1000");

      let driver = Driver.create();
      let btn_change = await driver.findComponent(ON.id('changeButton')) as Component;
      await (btn_change?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('swiper_interval');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);

      let intervalValue1 = obj1.getElement('$attrs').getString('interval');
      console.info('[After 1st click] interval value: ' + intervalValue1);
      expect(intervalValue1).assertEqual("3000");

      await (btn_change?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('swiper_interval');
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);

      let intervalValue2 = obj2.getElement('$attrs').getString('interval');
      console.info('[After 2nd click] interval value: ' + intervalValue2);
      expect(intervalValue2).assertEqual("1000");

      console.info('interval_ModifierUndefinedTest_0100 END');
      done();
    });
  })
}
