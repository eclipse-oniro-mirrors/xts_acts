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

export default function getSizeLimitationTest(): void {
  describe('getSizeLimitationTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("getSizeLimitationTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api24.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getSizeLimitation/GetSizeLimitation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get getSizeLimitationTest pages:' + JSON.stringify(pages));
        if (!('getSizeLimitationTest' == pages.name)) {
          console.info('get getSizeLimitationTest state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push getSizeLimitationTest page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('getSizeLimitationTest after each called');
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_GET_SIZE_LIMITATION_0100
     * @tc.number SUB_ACE_ARKUI_GET_SIZE_LIMITATION_0100
     * @tc.desc   test the getSizeLimitation_static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_GET_SIZE_LIMITATION_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[getSizeLimitationTest_0100] START');
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('getSizeLimitationTestButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('getSizeLimitationText');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[getSizeLimitationTest_0100] strJson is: ' + strJson);
      console.info('[getSizeLimitationTest_0100] getSizeLimitation obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('getSizeLimitation success');
      console.info('[getSizeLimitationTest_0100] END')
      done();
    });
  })
}