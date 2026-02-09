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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function RowReverseUndefinedTest() {
  describe('RowReverseUndefinedTest', () => {
    beforeAll(async () => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('RowReverseUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/rowReverseUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get RowReverseUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('rowReverseUndefined' == pages.name)) {
          console.info('get RowReverseUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RowReverseUndefinedTest page error:' + err);
      }
      console.info('RowReverseUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    RowReverseUndefinedTest_static_0100
     * @tc.name      RowReverseUndefinedTest_static_0100
     * @tc.desc      RowReverseUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('RowReverseUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('RowReverseUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);
      let driver: Driver = Driver.create();
      let component2 = await driver.findComponent(ON.id('row2')) as Component;
      let row2 = await component2.getBounds();
      let component1 = await driver.findComponent(ON.id('row1')) as Component;
      let row1 = await component1.getBounds();
      expect(Math.abs(Math.round(row1.left - row2.right)) > 1).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('changeButton'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      component2 = await driver.findComponent(ON.id('row2')) as Component;
      row2 = await component2.getBounds();
      component1 = await driver.findComponent(ON.id('row1')) as Component;
      row1 = await component1.getBounds();
      expect(Math.abs(Math.round(row1.left - row2.right)) <= 1).assertTrue();
      console.info('RowReverseUndefinedTest_static_0100 END');
      done();
    });
  })
}