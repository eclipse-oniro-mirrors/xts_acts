'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'

export default function next_Focus() {
  describe('Button', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");

      await UtilsTest.startAbility("com.open.harmony.nowearevent.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/next_Focus/next_Focus',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get Button state pages: ' + JSON.stringify(pages));
        if (!('Button' == pages.name)) {
          console.info('get Button state pages.name: ' + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(500);
          // console.info('push Button success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push Button page error: ' + err);
        expect().assertFail();
      }
    });

    
    
/**
     * @tc.number   Button_static_0101
     * @tc.name     Button_static_0101
     * @tc.desc     Button_static_0101
     * @tc.level    Level.LEVEL0
     */
it('Button_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Button_static_0101] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2012);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2013);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2014);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2015);
      await CommonFunc.sleep(500);
      await driver.triggerKey(2049);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2047,2049);
      await CommonFunc.sleep(500);

      // test the child component response
      let strJson = inspector.getInspectorByKey('a7');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[Button_static_0101] obj is: ' + obj.getElement('$attrs').getString('label'));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('suc');
      console.info('[Button_static_0101] END');
      done();
    });
  })
}