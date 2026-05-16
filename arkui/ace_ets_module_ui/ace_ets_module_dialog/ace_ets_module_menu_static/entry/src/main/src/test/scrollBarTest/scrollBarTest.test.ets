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
import { Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';

export default function scrollBarTest(): void{
  describe('scrollBarTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('assemblyCallbackTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.menu.static', 'EntryAbility')
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scrollBar/scrollBarTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get scrollBarTest pages:' + JSON.stringify(pages));
        if (!('scrollBarTest' == pages.name)) {
          console.info('get scrollBarTest state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push scrollBarTest page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('scrollBarTest after each called');
    });

    /**
     * @tc.name   scrollBarTest_0100
     * @tc.number SUB_ARKUI_MENU_scrollBarTest_0100
     * @tc.desc   test the static Menu scrollBar Off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollBarTest_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let button1 = await driver.findComponent(ON.id('off'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('textOff');
      let obc = JSON.parseJsonElement(strJson);
      console.info('[scrollBarTest_0100] strJson is: ' + strJson);
      console.info('[scrollBarTest_0100] getCurrentLocalPositionTest obc is: ' + JSON.stringify(obc.getElement('$attrs').getString('content')));
      expect(obc.getElement('$attrs').getString('content')).assertEqual('0');

      console.info('[scrollBarTest_0100] END')
      done();
    });

    /**
     * @tc.name   scrollBarTest_0200
     * @tc.number SUB_ARKUI_MENU_scrollBarTest_0200
     * @tc.desc   test the static Menu scrollBar Auto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarTest_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollBarTest_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('auto'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('textAuto');
      let obc = JSON.parseJsonElement(strJson);
      console.info('[scrollBarTest_0200] strJson is: ' + strJson);
      console.info('[scrollBarTest_0200] getCurrentLocalPositionTest obc is: ' + JSON.stringify(obc.getElement('$attrs').getString('content')));
      expect(obc.getElement('$attrs').getString('content')).assertEqual('1');

      console.info('[scrollBarTest_0200] END')
      done();
    });

    /**
     * @tc.name   scrollBarTest_0300
     * @tc.number SUB_ARKUI_MENU_scrollBarTest_0300
     * @tc.desc   test the static Menu scrollBar On
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarTest_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollBarTest_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);

      let button3 = await driver.findComponent(ON.id('on'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('textOn');
      let obc = JSON.parseJsonElement(strJson);
      console.info('[scrollBarTest_0300] strJson is: ' + strJson);
      console.info('[scrollBarTest_0300] getCurrentLocalPositionTest obc is: ' + JSON.stringify(obc.getElement('$attrs').getString('content')));
      expect(obc.getElement('$attrs').getString('content')).assertEqual('2');

      console.info('[scrollBarTest_0300] END')
      done();
    });
  })
}