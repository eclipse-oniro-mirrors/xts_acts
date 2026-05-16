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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function nextMarginUndefinedTest() {
  describe('nextMarginUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('nextMarginUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/nextMargin',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get nextMarginUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('nextMargin' == pages.name)) {
          console.info('get nextMarginUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push nextMarginUndefinedTest page error:' + err);
      }
      console.info('nextMarginUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    nextMarginUndefinedTest_0100
     * @tc.name      nextMarginUndefinedTest_0100
     * @tc.desc      nextMarginUndefinedTest_0100
     * @tc.level     Level.LEVEL1
     */
    it('nextMarginUndefinedTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('nextMarginUndefinedTest_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('swiper_nextMargin');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj.getElement('$attrs'));
      console.info('Test component obj.nextMargin is: ' + obj.getElement('$attrs').getString('nextMargin'));
      expect(obj.getElement('$attrs').getString('nextMargin')).assertEqual('50.00vp');


      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await (btn_true?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('swiper_nextMargin');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj1.getElement('$attrs'));
      console.info('Test component obj.nextMargin is: ' + obj1.getElement('$attrs').getString('nextMargin'));

      // 使用 UIContext.resolveUIContext()!.px2vp() 进行转换
      let nextMarginValue = obj1.getElement('$attrs').getString('nextMargin');
      let nextMarginInVp: number;
      if (nextMarginValue.endsWith('px')) {
        // 如果是 px，转换为 vp
        nextMarginInVp = Math.round(UIContext.resolveUIContext()!.px2vp(parseFloat(nextMarginValue.replace('px', ''))));
      } else {
        // 如果是 vp，直接取值
        nextMarginInVp = Math.round(parseFloat(nextMarginValue.replace('vp', '')));
      }
      console.info('Test component nextMarginInVp is: ' + nextMarginInVp);
      expect(nextMarginInVp).assertEqual(0);

      console.info('nextMarginUndefinedTest_0100 END');
      done();
    });
  })
}
