/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {  Component,  Driver,  ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function ColumnAlignItemsModifierUndefinedTest() {
  describe('ColumnAlignItemsModifierUndefinedTest', () => {
    beforeAll(async () => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('ColumnAlignItemsModifierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/columnAlignItemsModifierUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get ColumnAlignItemsModifierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('columnAlignItemsModifierUndefined' == pages.name)) {
          console.info('get ColumnAlignItemsModifierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ColumnAlignItemsModifierUndefinedTest page error:' + err);
      }
      console.info('ColumnAlignItemsModifierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    ColumnAlignItemsModifierUndefinedTest_static_0100
     * @tc.name      ColumnAlignItemsModifierUndefinedTest_static_0100
     * @tc.desc      ColumnAlignItemsModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ColumnAlignItemsModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ColumnAlignItemsModifierUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('Column_AlignItems_Modifier');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj.getElement('$attrs'));
      console.info('Test component obj.alignItems is: ' + obj.getElement('$attrs').getString('alignItems'));
      expect(obj.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.End');


      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('changeButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('Column_AlignItems_Modifier');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info('Test component obj is: ' + obj1.getElement('$attrs'));
      console.info('Test component obj.alignItems is: ' + obj1.getElement('$attrs').getString('alignItems'));
      expect(obj1.getElement('$attrs').getString('alignItems')).assertEqual('HorizontalAlign.Center');
      console.info('ColumnAlignItemsModifierUndefinedTest_static_0100 END');
      done();
    });
  })
}