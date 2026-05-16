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

export default function back7() {
  describe('back7', () => {
    beforeAll(() => {
      console.info("back7 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api12.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("back7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/back/back7',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get back7 state success " + JSON.stringify(pages));
        if (!("back7" == pages.name)) {
          console.info("get back7 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push back7 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("back7 after each called");
    });

    
    
/**
     * @tc.number   back7_static_0100
     * @tc.name     back7_static_0100
     * @tc.desc     back7_static_0100
     * @tc.level    Level.LEVEL2
     */
it('back7_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[back7_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('back7_btn'));
      await btn1!.click();
      await CommonFunc.sleep(2000);
      console.info('[back7_static_0100] btn1');

      let btn2 = await driver.findComponent(ON.id('back07_btn'));
      await btn2!.click();
      await CommonFunc.sleep(2000);
      console.info('[back7_static_0100] btn2');

      let btn3 = await driver.findComponent(ON.text('取消'));
      await btn3!.click();
      await CommonFunc.sleep(2000);
      console.info('[back7_static_0100] btn3');

      let text1 = inspector.getInspectorByKey('back07_text');
      let Obj1 = JSON.parseJsonElement(text1);
      console.info("[back7_static_0100] component obj is: " + JSON.stringify(Obj1));
      expect(Obj1.getElement('$attrs').getString('content')).assertEqual('back07');

      console.info('[back7_static_0100] END');
      done();
    });

  })
}
