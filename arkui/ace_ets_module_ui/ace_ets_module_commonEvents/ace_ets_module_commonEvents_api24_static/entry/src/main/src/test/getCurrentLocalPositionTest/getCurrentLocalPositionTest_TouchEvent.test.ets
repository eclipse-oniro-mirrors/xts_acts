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
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector';

export default function getCurrentLocalPositionTest_TouchEvent(): void {
  describe('getCurrentLocalPositionTest_TouchEvent', () => {
    beforeAll(async (): Promise<void> => {
      console.info("assemblyCallbackTest beforeAll start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api24.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getCurrentLocalPosition/getCurrentLocalPosition_TouchEvent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get getCurrentLocalPositionstate pages:' + JSON.stringify(pages));
        if (!('getCurrentLocalPosition' == pages.name)) {
          console.info('get getCurrentLocalPosition state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push getCurrentLocalPosition page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('getCurrentLocalPosition after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_TouchEvent_getCurrentLocalPosition_0100
     * @tc.number SUB_ARKUI_TouchEvent_getCurrentLocalPosition_0100
     * @tc.desc   test the getCurrentLocalPositionTest_static TouchEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_TouchEvent_getCurrentLocalPosition_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getCurrentLocalPositionTest_0100] START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('Button01'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);

      let strJson = inspector.getInspectorByKey('text01');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[getCurrentLocalPositionTest_0100] strJson is: ' + strJson);
      console.info('[getCurrentLocalPositionTest_0100] getCurrentLocalPositionTest obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('getCurrentLocalPosition获取的坐标:x:11,y:11');

      console.info('[getCurrentLocalPositionTest_0100] END')
      done();
    });
  })
}