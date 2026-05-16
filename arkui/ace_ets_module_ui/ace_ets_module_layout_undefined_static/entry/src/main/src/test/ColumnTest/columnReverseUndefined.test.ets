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

export default function ColumnReverseUndefinedTest() {
  describe('ColumnReverseUndefinedTest', () => {
    beforeAll(async () => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('ColumnReverseUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/columnReverseUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get ColumnReverseUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('columnReverseUndefined' == pages.name)) {
          console.info('get reverseUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ColumnReverseUndefinedTest page error:' + err);
      }
      console.info('ColumnReverseUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    ColumnReverseModifierUndefinedTest_static_0100
     * @tc.name      ColumnReverseModifierUndefinedTest_static_0100
     * @tc.desc      ColumnReverseModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ColumnReverseModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ColumnReverseModifierUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);
      let driver: Driver = Driver.create();
      let container = await driver.findComponent(ON.id('column2')) as Component;
      let column2 = await container.getBounds();
      let target = await driver.findComponent(ON.id('column1')) as Component;
      let column1 = await target.getBounds();
      expect(Math.abs(Math.round(column1.left - column2.right)) > 1).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('changeButton'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      container = await driver.findComponent(ON.id('column2')) as Component;
      column2 = await container.getBounds();
      target = await driver.findComponent(ON.id('column1')) as Component;
      column1 = await target.getBounds();
      expect(Math.abs(Math.round(column2.right - column1.left)) > 1).assertTrue();
      console.info('ColumnReverseModifierUndefinedTest_static_0100 END');
      done();
    });
  })
}