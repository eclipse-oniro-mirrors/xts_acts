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

import { describe, beforeEach, beforeAll, afterEach, it, expect, Level} from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager,Callback  } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UtilsTest, startAbility } from '../Util.test';
import {SharedTransitionEffectType,Color} from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function queryNavigationInfoTest() {
  describe('queryNavigationInfoTest', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("queryNavigationInfoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/queryNavigationInfoTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get queryNavigationInfoTest state success " + JSON.stringify(pages));
        if (!("queryNavigationInfoTest" == pages.name)) {
          console.info("get queryNavigationInfoTest state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push queryNavigationInfoTest page success ");
        }
      } catch (err) {
        console.error("push queryNavigationInfoTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("queryNavigationInfoTest after each called");
    });


    

    /**
     * @tc.number   queryNavigationInfoTest_static_0100
     * @tc.name     queryNavigationInfoTest_static_0100
     * @tc.desc     queryNavigationInfoTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('queryNavigationInfoTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[queryNavigationInfoTest_static_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('queryNavigationInfoTest_btn1'));
      await (btn?.click() as Promise<void>);
      console.info('[queryNavigationInfoTest_static_0100] btn click');
      await CommonFunc.sleep(2000);

      let btn2 = await driver.findComponent(ON.text('queryNavigationInfo'));
      await (btn2?.click() as Promise<void>);
      console.info('[queryNavigationInfoTest_static_0100] btn2 click');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('queryNavigationInfoTest_text1');
      await CommonFunc.sleep(1000);
      console.info("[queryNavigationInfoTest_static_0100] obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('queryNavigationInfoTest_navId');

      let btn3 = await driver.findComponent(ON.id('queryNavigationInfoTest_btn2'));
      await (btn3?.click() as Promise<void>);
      console.info('[queryNavigationInfoTest_static_0100] btn3 click');
      await CommonFunc.sleep(2000);

      let strJson2 = inspector.getInspectorByKey('queryNavigationInfoTest_text2');
      await CommonFunc.sleep(1000);
      console.info("[queryNavigationInfoTest_static_0100] obj2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('pageTwo');

      console.info('[queryNavigationInfoTest_static_0100] END');
      done();
    });
  })
}

