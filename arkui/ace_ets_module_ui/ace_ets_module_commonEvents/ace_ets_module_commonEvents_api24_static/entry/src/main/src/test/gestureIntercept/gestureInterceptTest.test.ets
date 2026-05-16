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

export default function gestureInterceptTest(): void {
  describe('gestureInterceptTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api24.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gestureIntercept/gestureInterceptTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get gestureInterceptTest pages:' + JSON.stringify(pages));
        if (!('gestureInterceptTest' == pages.name)) {
          console.info('get gestureInterceptTest state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push gestureInterceptTest page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('getCurrentLocalPosition after each called');
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTURE_INTERCEPT_0100
     * @tc.number SUB_ACE_ARKUI_GESTURE_INTERCEPT_0100
     * @tc.desc   test the gestureIntercept_static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTURE_INTERCEPT_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gestureInterceptTest_0100] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('0'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let button2 = await driver.findComponent(ON.id('button1'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('InterceptTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[gestureInterceptTest_0100] strJson is: ' + strJson);
      console.info('[gestureInterceptTest_0100] gestureIntercept obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result1111');

      console.info('[gestureInterceptTest_0100] END')
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTURE_INTERCEPT_0200
     * @tc.number SUB_ACE_ARKUI_GESTURE_INTERCEPT_0200
     * @tc.desc   test the gestureIntercept_static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTURE_INTERCEPT_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gestureInterceptTest_0200] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('clear'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('1'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('button1'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('InterceptTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[gestureInterceptTest_0200] strJson is: ' + strJson);
      console.info('[gestureInterceptTest_0200] gestureIntercept obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result0011');

      console.info('[gestureInterceptTest_0200] END')
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTURE_INTERCEPT_0300
     * @tc.number SUB_ACE_ARKUI_GESTURE_INTERCEPT_0300
     * @tc.desc   test the gestureIntercept_static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTURE_INTERCEPT_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gestureInterceptTest_0300] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('clear'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('2'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('button1'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('InterceptTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[gestureInterceptTest_0300] strJson is: ' + strJson);
      console.info('[gestureInterceptTest_0300] gestureIntercept obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result1100');

      console.info('[gestureInterceptTest_0300] END')
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTURE_INTERCEPT_0400
     * @tc.number SUB_ACE_ARKUI_GESTURE_INTERCEPT_0400
     * @tc.desc   test the gestureIntercept_static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTURE_INTERCEPT_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gestureInterceptTest_0400] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('clear'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('3'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('button1'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('InterceptTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[gestureInterceptTest_0400] strJson is: ' + strJson);
      console.info('[gestureInterceptTest_0400] gestureIntercept obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result1101');

      console.info('[gestureInterceptTest_0400] END')
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GESTURE_INTERCEPT_0500
     * @tc.number SUB_ACE_ARKUI_GESTURE_INTERCEPT_0500
     * @tc.desc   test the gestureIntercept_static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GESTURE_INTERCEPT_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[gestureInterceptTest_0500] START');
      let driver: Driver = Driver.create();
      let button1 = await driver.findComponent(ON.id('clear'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('4'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('button1'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('InterceptTest');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[gestureInterceptTest_0500] strJson is: ' + strJson);
      console.info('[gestureInterceptTest_0500] gestureIntercept obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('result1011');

      console.info('[gestureInterceptTest_0500] END')
      done();
    });
  })
}