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

export default function nestedScrollListModifierUndefinedTest() {
  describe('nestedScrollListModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.scroll.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('nestedScrollListModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/nestedScrollModifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get nestedScrollListModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('nestedScrollModifier' == pages.name)) {
          console.info('get nestedScrollListModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push nestedScrollListModifierUndefinedTest page error:' + err);
      }
      console.info('nestedScrollListModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    nestedScrollListModifierUndefinedTest_static_0100
     * @tc.name      nestedScrollListModifierUndefinedTest_static_0100
     * @tc.desc      nestedScrollListModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL0
     */
    it('nestedScrollListModifierUndefinedTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('nestedScrollListModifierUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('nestedScrollModifier');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('TestList component obj is: ' + obj.getElement('$attrs'));
      console.info('TestList component obj.nestedScroll is: ' + obj.getElement('$attrs').getElement('nestedScroll'));
      let nestedScroll = obj.getElement('$attrs').getElement('nestedScroll');
      expect(nestedScroll.getString('scrollForward')).assertEqual("NestedScrollMode.PARENT_FIRST");
      expect(nestedScroll.getString('scrollBackward')).assertEqual("NestedScrollMode.SELF_FIRST");

      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('nestedScrollModifier');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info('TestList component obj is: ' + obj1.getElement('$attrs'));
      console.info('TestList component obj.nestedScroll is: ' + obj1.getElement('$attrs').getElement('nestedScroll'));
      let nestedScroll1 = obj1.getElement('$attrs').getElement('nestedScroll');
      expect(nestedScroll1.getString('scrollForward')).assertEqual("NestedScrollMode.SELF_ONLY");
      expect(nestedScroll1.getString('scrollBackward')).assertEqual("NestedScrollMode.SELF_ONLY");
      done();
    });
  })
}
