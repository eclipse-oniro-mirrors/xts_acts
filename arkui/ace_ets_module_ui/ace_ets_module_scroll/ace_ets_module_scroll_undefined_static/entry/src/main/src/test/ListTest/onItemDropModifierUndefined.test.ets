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

export default function onItemDropModifierUndefinedTest() {
  describe('onItemDropModifierUndefinedTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.scroll.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('onItemDropModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/onItemDropModifier',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get onItemDropModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('onItemDropModifier' == pages.name)) {
          console.info('get onItemDropModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push onItemDropModifierUndefinedTest page error:' + err);
      }
      console.info('onItemDropModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    onItemDropModifierUndefinedTest_static_0100
     * @tc.name      onItemDropModifierUndefinedTest_static_0100
     * @tc.desc      onItemDropModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('onItemDropModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('onItemDropModifierUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      let listItem = await driver.findComponent(ON.id('List_item3'));
      await CommonFunc.sleep(500);
      let dragText = await driver.findComponent(ON.id('dragText')) as Component;
      await CommonFunc.sleep(500);
      await (listItem?.dragTo(dragText) as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('dragText');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('TestList component obj is: ' + obj.getElement('$attrs'));
      console.info('TestList component obj.dragText is: ' + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('1');

      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      await (listItem?.dragTo(dragText) as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('dragText');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info('TestList component obj is: ' + obj1.getElement('$attrs'));
      console.info('TestList component obj.dragText is: ' + obj1.getElement('$attrs').getString('label'));
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('1');
      done();
    });
  })
}
