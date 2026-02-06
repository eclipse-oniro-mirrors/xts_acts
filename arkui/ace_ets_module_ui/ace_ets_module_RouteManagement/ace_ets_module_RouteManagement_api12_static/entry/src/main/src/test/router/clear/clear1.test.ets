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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../../Util.test'

export default function clear1() {
  describe('clear1', () => {
    beforeAll(() => {
      console.info("clear1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("clear1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/clear/clear1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get clear1 state success " + JSON.stringify(pages));
        if (!("clear1" == pages.name)) {
          console.info("get clear1 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push clear1 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("clear1 after each called");
    });

    
    
/**
     * @tc.number   clear1_static_0100
     * @tc.name     clear1_static_0100
     * @tc.desc     clear1_static_0100
     * @tc.level    Level.LEVEL2
     */
it('clear1_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[clear1_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('clear1_get'));
      await btn!.click()
      await CommonFunc.sleep(1000);
      console.info('[clear1_static_0100] btn click');

      let strJson = inspector.getInspectorByKey('clear1_text2');
      await CommonFunc.sleep(1000);
      console.info("[clear1_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('size2');

      let btn2 = await driver.findComponent(ON.id('clear1_btn'));
      await btn2!.click()
      await CommonFunc.sleep(1000);
      console.info('[clear1_static_0100] btn2 click');

      await btn!.click()
      await CommonFunc.sleep(1000);
      console.info('[clear1_static_0100] btn click2');

      let strJson2 = inspector.getInspectorByKey('clear1_text2');
      await CommonFunc.sleep(1000);
      console.info("[clear1_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('size1');

      await btn2!.click()
      await CommonFunc.sleep(1000);
      console.info('[clear1_static_0100] btn2 click2');

      await btn!.click()
      await CommonFunc.sleep(1000);
      console.info('[clear1_static_0100] btn click3');

      let strJson3 = inspector.getInspectorByKey('clear1_text2');
      await CommonFunc.sleep(1000);
      console.info("[clear1_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson3)));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('size1');

      console.info('[clear1_static_0100] END');
      done();
    });
  })
}

