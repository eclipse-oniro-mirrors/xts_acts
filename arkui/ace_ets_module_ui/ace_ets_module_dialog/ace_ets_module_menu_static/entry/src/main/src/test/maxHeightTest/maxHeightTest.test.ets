/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON, MouseButton, Point } from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import { Driver, ON, Rect } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';

export default function maxHeightTest(): void{
  describe('maxHeightTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('assemblyCallbackTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.menu.static', 'EntryAbility')
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/maxHeight/maxHeightTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get maxHeightTest pages:' + JSON.stringify(pages));
        if (!('maxHeightTest' == pages.name)) {
          console.info('get maxHeightTest state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push maxHeightTest page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('maxHeightTest after each called');
    });

    /**
     * @tc.name   maxHeightTest_0100
     * @tc.number SUB_ARKUI_MENU_maxHeightTest_0100
     * @tc.desc   test the Menu_static maxHeight percent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('maxHeightTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maxHeightTest_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button1 = await driver.findComponent(ON.id('percent'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      const btn1 = await driver.findComponent(ON.id('menu'));
      expect(btn1 !== null).assertTrue();
      await CommonFunc.sleep(500);

      const rect1 = await (btn1?.getBounds() as Promise<Rect>)
      console.info('maxHeightTest_0100 height: ' + JSON.stringify(rect1));
      console.info('maxHeightTest_0100 bottom: ' + rect1.bottom);
      await CommonFunc.sleep(1500);

      expect(Math.round(rect1.bottom) > 0).assertTrue();
      await CommonFunc.sleep(1500);
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maxHeightTest_0100] END')
      done();
    });

    /**
     * @tc.name   maxHeightTest_0200
     * @tc.number SUB_ARKUI_MENU_maxHeightTest_0200
     * @tc.desc   test the Menu_static maxHeight vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('maxHeightTest_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maxHeightTest_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button2 = await driver.findComponent(ON.id('vp'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      const btn2 = await driver.findComponent(ON.id('menu'));
      expect(btn2 !== null).assertTrue();
      await CommonFunc.sleep(500);

      const rect2 = await (btn2?.getBounds() as Promise<Rect>)
      console.info('maxHeightTest_0200 height: ' + JSON.stringify(rect2));
      console.info('maxHeightTest_0200 bottom: ' + rect2.bottom);
      await CommonFunc.sleep(1500);

      expect(Math.round(rect2.bottom) > 0).assertTrue();
      await CommonFunc.sleep(1500);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maxHeightTest_0200] END')
      done();
    });

    /**
     * @tc.name   maxHeightTest_0300
     * @tc.number SUB_ARKUI_MENU_maxHeightTest_0300
     * @tc.desc   test the Menu_static maxHeight px
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('maxHeightTest_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maxHeightTest_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button3 = await driver.findComponent(ON.id('px'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      const btn3 = await driver.findComponent(ON.id('menu'));
      expect(btn3 !== null).assertTrue();
      await CommonFunc.sleep(500);

      const rect3 = await (btn3?.getBounds() as Promise<Rect>)
      console.info('maxHeightTest_0300 height: ' + JSON.stringify(rect3));
      console.info('maxHeightTest_0300 bottom: ' + rect3.bottom);
      await CommonFunc.sleep(1500);

      expect(Math.round(rect3.bottom) > 0).assertTrue();
      await CommonFunc.sleep(1500);
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maxHeightTest_0300] END')
      done();
    });

    /**
     * @tc.name   maxHeightTest_0400
     * @tc.number SUB_ARKUI_MENU_maxHeightTest_0400
     * @tc.desc   test the Menu_static maxHeight fp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('maxHeightTest_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maxHeightTest_0400] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button4 = await driver.findComponent(ON.id('fp'));
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      const btn4 = await driver.findComponent(ON.id('menu'));
      expect(btn4 !== null).assertTrue();
      await CommonFunc.sleep(500);

      const rect4 = await (btn4?.getBounds() as Promise<Rect>)
      console.info('maxHeightTest_0400 height: ' + JSON.stringify(rect4));
      console.info('maxHeightTest_0400 bottom: ' + rect4.bottom);
      await CommonFunc.sleep(1500);

      expect(Math.round(rect4.bottom) > 0).assertTrue();
      await CommonFunc.sleep(1500);
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maxHeightTest_0400] END')
      done();
    });

    /**
     * @tc.name   maxHeightTest_0500
     * @tc.number SUB_ARKUI_MENU_maxHeightTest_0500
     * @tc.desc   test the Menu_static maxHeight lpx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('maxHeightTest_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[maxHeightTest_0500] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button5 = await driver.findComponent(ON.id('lpx'));
      await (button5?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      const btn5 = await driver.findComponent(ON.id('menu'));
      expect(btn5 !== null).assertTrue();
      await CommonFunc.sleep(500);

      const rect5 = await (btn5?.getBounds() as Promise<Rect>)
      console.info('maxHeightTest_0500 height: ' + JSON.stringify(rect5));
      console.info('maxHeightTest_0500 bottom: ' + rect5.bottom);
      await CommonFunc.sleep(1500);

      expect(Math.round(rect5.bottom) > 0).assertTrue();
      await CommonFunc.sleep(1500);
      await (button5?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maxHeightTest_0500] END')
      done();
    });

    /**
     * @tc.name   maxHeightTest_0600
     * @tc.number SUB_ARKUI_MENU_maxHeightTest_0600
     * @tc.desc   test the Menu_static maxHeight 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('maxHeightTest_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[maxHeightTest_0600] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button6 = await driver.findComponent(ON.id('0'));
      await (button6?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      const btn6 = await driver.findComponent(ON.id('menu'));
      expect(btn6 !== null).assertTrue();
      await CommonFunc.sleep(500);

      const rect6 = await (btn6?.getBounds() as Promise<Rect>)
      console.info('maxHeightTest_0600 height: ' + JSON.stringify(rect6));
      console.info('maxHeightTest_0600 bottom: ' + rect6.bottom);
      await CommonFunc.sleep(1500);

      expect(Math.round(rect6.bottom) > 0).assertTrue();
      await CommonFunc.sleep(1500);
      await (button6?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maxHeightTest_0600] END')
      done();
    });

    /**
     * @tc.name   maxHeightTest_0700
     * @tc.number SUB_ARKUI_MENU_maxHeightTest_0700
     * @tc.desc   test the Menu_static maxHeight -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('maxHeightTest_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[maxHeightTest_0700] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button7 = await driver.findComponent(ON.id('-1'));
      await (button7?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      const btn7 = await driver.findComponent(ON.id('menu'));
      expect(btn7 !== null).assertTrue();
      await CommonFunc.sleep(500);

      const rect7 = await (btn7?.getBounds() as Promise<Rect>)
      console.info('maxHeightTest_0700 height: ' + JSON.stringify(rect7));
      console.info('maxHeightTest_0700 bottom: ' + rect7.bottom);
      await CommonFunc.sleep(1500);

      expect(Math.round(rect7.bottom) > 0).assertTrue();
      await CommonFunc.sleep(1500);
      await (button7?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maxHeightTest_0700] END')
      done();
    });

    /**
     * @tc.name   maxHeightTest_0800
     * @tc.number SUB_ARKUI_MENU_maxHeightTest_0800
     * @tc.desc   test the Menu_static maxHeight undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('maxHeightTest_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[maxHeightTest_0800] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button8 = await driver.findComponent(ON.id('undefined'));
      await (button8?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      const btn8 = await driver.findComponent(ON.id('menu'));
      expect(btn8 !== null).assertTrue();
      await CommonFunc.sleep(500);

      const rect8 = await (btn8?.getBounds() as Promise<Rect>)
      console.info('maxHeightTest_0800 height: ' + JSON.stringify(rect8));
      console.info('maxHeightTest_0800 bottom: ' + rect8.bottom);
      await CommonFunc.sleep(1500);

      expect(Math.round(rect8.bottom) > 0).assertTrue();
      await CommonFunc.sleep(1500);
      await (button8?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      console.info('[maxHeightTest_0800] END')
      done();
    });
  })
}