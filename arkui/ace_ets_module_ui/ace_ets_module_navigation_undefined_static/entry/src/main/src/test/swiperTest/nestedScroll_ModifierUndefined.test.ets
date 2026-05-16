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

export default function nestedScroll_ModifierUndefinedTest() {
  describe('nestedScroll_ModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('nestedScroll_ModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/nestedScroll_Modifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get nestedScroll_ModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('nestedScroll_Modifier' == pages.name)) {
          console.info('get nestedScroll_ModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push nestedScroll_ModifierUndefinedTest page error:' + err);
      }
      console.info('nestedScroll_ModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    nestedScroll_ModifierUndefinedTest_0100
     * @tc.name      nestedScroll_ModifierUndefinedTest_0100
     * @tc.desc      nestedScroll_ModifierUndefinedTest_0100
     * @tc.level     Level.LEVEL1
     */
    it('nestedScroll_ModifierUndefinedTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('nestedScroll_ModifierUndefinedTest_0100 START');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('swiper_nestedScroll');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);

      let nestedScrollValue = obj.getElement('$attrs').getString('nestedScroll');
      console.info('[Initial] nestedScroll value: ' + nestedScrollValue);
      expect(nestedScrollValue).assertEqual("SwiperNestedScrollMode.SELF_FIRST");

      let driver = Driver.create();
      let btn_change = await driver.findComponent(ON.id('changeButton')) as Component;
      await (btn_change?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('swiper_nestedScroll');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);

      let nestedScrollValue1 = obj1.getElement('$attrs').getString('nestedScroll');
      console.info('[After 1st click] nestedScroll value: ' + nestedScrollValue1);
      expect(nestedScrollValue1).assertEqual("SwiperNestedScrollMode.SELF_ONLY");

      await (btn_change?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('swiper_nestedScroll');
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);

      let nestedScrollValue2 = obj2.getElement('$attrs').getString('nestedScroll');
      console.info('[After 2nd click] nestedScroll value: ' + nestedScrollValue2);
      expect(nestedScrollValue2).assertEqual("SwiperNestedScrollMode.SELF_FIRST");

      console.info('nestedScroll_ModifierUndefinedTest_0100 END');
      done();
    });
  })
}
