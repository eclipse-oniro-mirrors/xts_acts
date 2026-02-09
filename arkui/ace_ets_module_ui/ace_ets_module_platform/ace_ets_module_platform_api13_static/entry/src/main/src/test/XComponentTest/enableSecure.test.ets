'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';


export default function enableSecureTest() {
  describe('enableSecureTest', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.platform.api13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("enableSecureTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/XComponent/enableSecure",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get enableSecureTest state pages: " + JSON.stringify(pages));
        if (!("enableSecureTest" == pages.name)) {
          console.info("get enableSecureTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push enableSecureTest page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   enableSecureTest_static_0010
     * @tc.name     enableSecureTest_static_0010
     * @tc.desc     enableSecureTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('enableSecureTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('enableSecureTest_static_0010 START');
      let driver = Driver.create()
	  console.info('enableSecureTest_static_0010 Driver');
      await CommonFunc.sleep(1000);
      let button1 = await (driver.findComponent(ON.id('enableSecureTest_button1')) as Promise<Component>);
	  console.info('enableSecureTest_static_0010 getButton1');
      await CommonFunc.sleep(1000);
      await button1.click();
	  console.info('enableSecureTest_static_0010 Click1');
      await CommonFunc.sleep(2000);
      let button2 = await (driver.findComponent(ON.id('enableSecureTest_button2')) as Promise<Component>);
	  console.info('enableSecureTest_static_0010 getButton2');
      await CommonFunc.sleep(1000);
      await button2.click();
	  console.info('enableSecureTest_static_0010 Click2');
      await CommonFunc.sleep(1500);
	  let strJson = inspector.getInspectorByKey('xcomponent');
	  console.info("[enableSecureTest_static_0010] img1_attrs: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
	  console.info("[enableSecureTest_static_0010] img1_attrs_enableSecure: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSecure')));
	  console.info("[enableSecureTest_static_0010] img1_attrs_height: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('enableSecure')).assertEqual('true');

      console.info('[enableSecureTest_static_0010] END');
      done();
    });
  })
}


