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

export default function itemSpace_ModifierUndefinedTest() {
  describe('itemSpace_ModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('itemSpace_ModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/itemSpace_Modifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get itemSpace_ModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('itemSpace_Modifier' == pages.name)) {
          console.info('get itemSpace_ModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push itemSpace_ModifierUndefinedTest page error:' + err);
      }
      console.info('itemSpace_ModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    itemSpace_ModifierUndefinedTest_0100
     * @tc.name      itemSpace_ModifierUndefinedTest_0100
     * @tc.desc      itemSpace_ModifierUndefinedTest_0100
     * @tc.level     Level.LEVEL1
     */
    it('itemSpace_ModifierUndefinedTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('itemSpace_ModifierUndefinedTest_0100 START');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('swiper_itemSpace');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);

      let itemSpaceValue = obj.getElement('$attrs').getString('itemSpace');
      console.info('[Initial] itemSpace value: ' + itemSpaceValue);
      expect(itemSpaceValue).assertEqual("30.00vp");

      let driver = Driver.create();
      let btn_change = await driver.findComponent(ON.id('changeButton')) as Component;
      await (btn_change?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('swiper_itemSpace');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);

      let itemSpaceValue1 = obj1.getElement('$attrs').getString('itemSpace');
      console.info('[After 1st click] itemSpace value: ' + itemSpaceValue1);
      expect(itemSpaceValue1).assertEqual("0.00px");

      await (btn_change?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('swiper_itemSpace');
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);

      let itemSpaceValue2 = obj2.getElement('$attrs').getString('itemSpace');
      console.info('[After 2nd click] itemSpace value: ' + itemSpaceValue2);
      expect(itemSpaceValue2).assertEqual("30.00vp");

      console.info('itemSpace_ModifierUndefinedTest_0100 END');
      done();
    });
  })
}