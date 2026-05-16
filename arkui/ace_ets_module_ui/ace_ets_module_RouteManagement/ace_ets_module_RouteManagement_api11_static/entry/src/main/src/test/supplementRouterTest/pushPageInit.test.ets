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
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';

export default function pushPageInit() {
  describe('pushPageInit', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("pushPageInit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/supplementRouter/pushPageInit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get pushPageInit state pages: " + JSON.stringify(pages));
        if (!("pushPageInit" == pages.name)) {
          console.info("get pushPageInit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push pushPageInit page error: " + err);
        expect().assertFail();
      }
    });

    
    
/**
     * @tc.number   pushPageInit_static_0100
     * @tc.name     pushPageInit_static_0100
     * @tc.desc     pushPageInit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('pushPageInit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('pushPageInit_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('pushPageInit'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('pushPageA_amount');
      let strJson2 = inspector.getInspectorByKey('pushPageA_page');

      expect(JSON.parseJsonElement(strJson1)!.getElement('$attrs').getString('content')).assertEqual('3');
      expect(JSON.parseJsonElement(strJson2)!.getElement('$attrs').getString('content')).assertEqual('3');

      let button2 = await driver.findComponent(ON.id('pushPageA'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('pushPageB_amount');
      let strJson4 = inspector.getInspectorByKey('pushPageB_page');
      expect(JSON.parseJsonElement(strJson3)!.getElement('$attrs').getString('content')).assertEqual('4');
      expect(JSON.parseJsonElement(strJson4)!.getElement('$attrs').getString('content')).assertEqual('4');
      let button3 = await driver.findComponent(ON.id('pushPageB'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson5 = inspector.getInspectorByKey('pushPageC_amount');
      let strJson6 = inspector.getInspectorByKey('pushPageC_page');
      expect(JSON.parseJsonElement(strJson5)!.getElement('$attrs').getString('content')).assertEqual('5');
      expect(JSON.parseJsonElement(strJson6)!.getElement('$attrs').getString('content')).assertEqual('5');
      let button4 = await driver.findComponent(ON.id('pushPageC'));
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson7 = inspector.getInspectorByKey('pushPageA_amount');
      let strJson8 = inspector.getInspectorByKey('pushPageA_page');
      expect(JSON.parseJsonElement(strJson7)!.getElement('$attrs').getString('content')).assertEqual('3');
      expect(JSON.parseJsonElement(strJson8)!.getElement('$attrs').getString('content')).assertEqual('3');
      await CommonFunc.sleep(1000);
      console.info('[pushPageInit_static_0100] END');
      done();
    });
  })
}

