'use static';
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

export default function globalListenerTest(): void {
  describe('globalListenerTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api24.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/globalListener/globalListenerTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get globalListenerTest pages:' + JSON.stringify(pages));
        if (!('globalListenerTest' == pages.name)) {
          console.info('get globalListenerTest state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push globalListenerTest page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('globalListenerTest after each called');
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GLOBAL_LISTENER_0100
     * @tc.number SUB_ACE_ARKUI_GLOBAL_LISTENER_0100
     * @tc.desc   test the globalListener_static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GLOBAL_LISTENER_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[globalListenerTest_0100] START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('listenTest'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('listenTouch');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[globalListenerTest_0100] strJson is: ' + strJson);
      console.info('[globalListenerTest_0100] globalListener obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('listenTouchType=1');

      console.info('[globalListenerTest_0100] END')
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GLOBAL_LISTENER_0200
     * @tc.number SUB_ACE_ARKUI_GLOBAL_LISTENER_0200
     * @tc.desc   test the globalListener_static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GLOBAL_LISTENER_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[globalListenerTest_0200] START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('listenTest'));
      let point: Point = await (button?.getBoundsCenter() as Promise<Point>);
      await driver!.mouseClick({x: point.x, y: point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('listenMouse');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[globalListenerTest_0200] strJson is: ' + strJson);
      console.info('[globalListenerTest_0200] globalListener obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('listenButton=2,Action=2');

      console.info('[globalListenerTest_0200] END')
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GLOBAL_LISTENER_0300
     * @tc.number SUB_ACE_ARKUI_GLOBAL_LISTENER_0300
     * @tc.desc   test the globalListener_static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GLOBAL_LISTENER_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[globalListenerTest_0300] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('listenKey');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[globalListenerTest_0300] strJson is: ' + strJson);
      console.info('[globalListenerTest_0300] globalListener obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('listenKeyType=1');

      console.info('[globalListenerTest_0300] END')
      done();
    });
  })
}