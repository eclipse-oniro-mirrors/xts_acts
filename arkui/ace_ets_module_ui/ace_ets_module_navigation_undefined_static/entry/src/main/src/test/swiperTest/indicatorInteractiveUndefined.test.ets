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
  Component,
  ON,
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function indicatorInteractiveUndefinedTest() {
  describe('indicatorInteractiveUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.navigation.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('indicatorInteractiveUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/indicatorInteractive',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get indicatorInteractiveUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('indicatorInteractive' == pages.name)) {
          console.info('get indicatorInteractiveUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push indicatorInteractiveUndefinedTest page error:' + err);
      }
      console.info('indicatorInteractiveUndefinedTest beforeEach end');
    });

    /**
 	      * @tc.number    indicatorInteractiveUndefinedTest_0100
 	      * @tc.name      indicatorInteractiveUndefinedTest_0100
 	      * @tc.desc      indicatorInteractiveUndefinedTest_0100
 	      * @tc.level     Level.LEVEL1
 	      */
    it('indicatorInteractiveUndefinedTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('indicatorInteractiveUndefinedTest_0100 START');
      await CommonFunc.sleep(2000);

      let strJson = inspector.getInspectorByKey('swiper_text');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);

      let initialTextContent = obj.getElement('$attrs').getString('content');
      console.info('Initial swiper_text content is: ' + initialTextContent);

      expect(initialTextContent).assertEqual("false");

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await (btn_true?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('swiper_text');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);

      let afterClickTextContent = obj1.getElement('$attrs').getString('content');
      console.info('After click swiper_text content is: ' + afterClickTextContent);

      expect(afterClickTextContent).assertEqual("true");
      console.info('indicatorInteractiveUndefinedTest_0100 END');

      done();
    });
  })
}