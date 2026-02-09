'use static'
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
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test';

export default function ContainerBarrierUndefinedTest() {
  describe('ContainerBarrierUndefinedTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.layout.undefined.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('ContainerBarrierUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Relative_Container/rcBarrierUndefined',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info('get ContainerBarrierUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('relativeContainerUndefined' == pages.name)) {
          console.info('get ContainerBarrierUndefinedTest pages.name:' + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ContainerBarrierUndefinedTest page error:' + err);
      }
      console.info('ContainerBarrierUndefinedTest beforeEach end');
    });

    /**
     * @tc.number    ContainerBarrierUndefinedTest_static_0100
     * @tc.name      ContainerBarrierUndefinedTest_static_0100
     * @tc.desc      ContainerBarrierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('ContainerBarrierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContainerBarrierUndefinedTest_static_0100 START');
      await CommonFunc.sleep(500);
      let driver: Driver = Driver.create();
      let container = await driver.findComponent(ON.id('row4')) as Component;
      let target = await container.getBounds();
      let row = await driver.findComponent(ON.id('row1')) as Component;
      let bounds = await row.getBounds();
      expect(Math.abs(Math.round(bounds.left - target.left)) <= 1).assertTrue();

      let changeBtn = await driver.findComponent(ON.id('changeButton1'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      container = await driver.findComponent(ON.id('row4')) as Component;
      target = await container.getBounds();
      row = await driver.findComponent(ON.id('row1')) as Component;
      bounds = await row.getBounds();
      expect(Math.abs(Math.round(bounds.left - target.left)) == 0).assertTrue();
      console.info('ContainerBarrierUndefinedTest_static_0100 END');
      done();
    });

    /**
     * @tc.number    ContainerBarrierUndefinedTest_static_0200
     * @tc.name      ContainerBarrierUndefinedTest_static_0200
     * @tc.desc      ContainerBarrierUndefinedTest_static_0200
     * @tc.level     Level.LEVEL1
     */
    it('ContainerBarrierUndefinedTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ContainerBarrierUndefinedTest_static_0200 START');
      await CommonFunc.sleep(500);
      let driver: Driver = Driver.create();
      let container = await driver.findComponent(ON.id('row14')) as Component;
      let target = await container.getBounds();
      let row = await driver.findComponent(ON.id('row11')) as Component;
      let bounds = await row.getBounds();
      expect(Math.abs(Math.round(bounds.left - target.left)) <= 1).assertTrue();
      let changeBtn = await driver.findComponent(ON.id('changeButton2'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      container = await driver.findComponent(ON.id('row14')) as Component;
      target = await container.getBounds();
      row = await driver.findComponent(ON.id('row11')) as Component;
      bounds = await row.getBounds();
      expect(Math.abs(Math.round(bounds.left - target.left)) == 0).assertTrue();
      console.info('ContainerBarrierUndefinedTest_static_0200 END');
      done();
    });
  })
}
