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

export default function indicator_ModifierUndefinedTest() {
  describe('indicator_ModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('indicator_ModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/indicator_Modifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get indicator_ModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('indicator_Modifier' == pages.name)) {
          console.info('get indicator_ModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push indicator_ModifierUndefinedTest page error:' + err);
      }
      console.info('indicator_ModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    indicator_ModifierUndefinedTest_0100
     * @tc.name      indicator_ModifierUndefinedTest_0100
     * @tc.desc      test indicator with attributeModifier undefined behavior
     * @tc.level     Level.LEVEL1
     */
    it('indicator_ModifierUndefinedTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('indicator_ModifierUndefinedTest_0100 START');
      await CommonFunc.sleep(2000);

      // 初始状态：isUndefined=false，indicator=false
      let strJson = inspector.getInspectorByKey('swiper_indicator');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);

      let indicatorValue = obj.getElement('$attrs').getString('indicator');
      console.info('[Initial] indicator value: ' + indicatorValue);
      expect(indicatorValue).assertEqual("false");

      // 第一次点击：isUndefined 从 false 变为 true，indicator 变为 undefined
      let driver = Driver.create();
      let btn_change = await driver.findComponent(ON.id('changeButton')) as Component;
      await (btn_change?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('swiper_indicator');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);

      // indicator 为 undefined 时，应该使用默认值 true
      let indicatorValue1 = obj1.getElement('$attrs').getString('indicator');
      console.info('[After 1st click] indicator value: ' + indicatorValue1);
      expect(indicatorValue1).assertEqual("true");

      // 第二次点击：isUndefined 从 true 变回 false，indicator 变回 false
      await (btn_change?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('swiper_indicator');
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);

      let indicatorValue2 = obj2.getElement('$attrs').getString('indicator');
      console.info('[After 2nd click] indicator value: ' + indicatorValue2);
      expect(indicatorValue2).assertEqual("false");

      console.info('indicator_ModifierUndefinedTest_0100 END');
      done();
    });
  })
}

