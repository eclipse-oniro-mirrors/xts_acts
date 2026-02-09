'use static';
/*
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
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON } from '@ohos.UiTest';

export default function Router3() {
  describe('Router3', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("GridFrictionPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Router/pageOne',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get " +
          " state pages:" + JSON.stringify(pages));
        if (!("pageOne" == pages.name)) {
          console.info("get Router3 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Router3 page error:" + err);
      }
      console.info("Router3 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.back()
      console.info("Router3 after each called");
    });
    

    
/**
     * @tc.number   Router3_static_0100
     * @tc.name     Router3_static_0100
     * @tc.desc     Router3_static_0100
     * @tc.level    Level.LEVEL2
     */
it('Router3_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[Router3_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);


      let strJson1 = inspector.getInspectorByKey('nameState');
      expect(JSON.parseJsonElement(strJson1)!.getElement('$attrs').getString('content')).assertEqual('pageOne');
      console.info('obj1_Router3' + JSON.parseJsonElement(strJson1)!.getElement('$attrs').getString('content'))
      await CommonFunc.sleep(500);

      let strJson2 = inspector.getInspectorByKey('getNum');
      expect(JSON.parseJsonElement(strJson2)!.getElement('$attrs').getString('content')).assertEqual('2');
      console.info('obj2_Router3' + JSON.parseJsonElement(strJson2)!.getElement('$attrs').getString('content'))
      await CommonFunc.sleep(500);


      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('page_Button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('pageTwo_name');
      expect(JSON.parseJsonElement(strJson3)!.getElement('$attrs').getString('content')).assertEqual('pageTwo');
      console.info('obj3_Router3' + JSON.parseJsonElement(strJson3)!.getElement('$attrs').getString('content'))
      await CommonFunc.sleep(500);
      let strJson4 = inspector.getInspectorByKey('pageTwo_length');
      expect(JSON.parseJsonElement(strJson4)!.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('obj4_Router3' + JSON.parseJsonElement(strJson4)!.getElement('$attrs').getString('content'))
      await CommonFunc.sleep(500);


      await CommonFunc.sleep(500);
      let btn1 = await driver.findComponent(ON.id('skip_back'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson5 = inspector.getInspectorByKey('nameState');
      expect(JSON.parseJsonElement(strJson5)!.getElement('$attrs').getString('content')).assertEqual('pageOne');
      console.info('obj5_Router3' + JSON.parseJsonElement(strJson5)!.getElement('$attrs').getString('content'))
      await CommonFunc.sleep(500);

      let strJson6 = inspector.getInspectorByKey('getNum');
      expect(JSON.parseJsonElement(strJson6)!.getElement('$attrs').getString('content')).assertEqual('2');
      console.info('obj6_Router3' + JSON.parseJsonElement(strJson6)!.getElement('$attrs').getString('content'))
      await CommonFunc.sleep(100);
      done();
    });
  })
}
