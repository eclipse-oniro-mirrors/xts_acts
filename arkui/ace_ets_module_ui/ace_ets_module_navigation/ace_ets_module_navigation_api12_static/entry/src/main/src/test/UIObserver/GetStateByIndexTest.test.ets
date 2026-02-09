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
export default function GetStateByIndexTest() {
  describe('GetStateByIndexTest', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000);
      await startAbility("com.arkui.ace.navigation12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("GetStateByIndexTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIObserver/GetStateByIndexPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GetStateByIndexTest state pages:" + JSON.stringify(pages));
        if (!("GetStateByIndexPage" == pages.name)) {
          console.info("get GetStateByIndexTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GetStateByIndexTest page result:");
        }
      } catch (err) {
        console.error("push GetStateByIndexTest page error:" + err);
      }
      console.info("GetStateByIndexTest beforeEach end");
    });
    afterEach(async () => {
    });

    
    

    /**
     * @tc.number   GetStateByIndexTest_static_0100
     * @tc.name     GetStateByIndexTest_static_0100
     * @tc.desc     GetStateByIndexTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('GetStateByIndexTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {

      console.info('GetStateByIndexTest_static_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id("getStateByIndex_btn_push"));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let button2 = await driver.findComponent(ON.id("getStateByIndex_btn_get"));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('getStateByIndex_content');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GetStateByIndexTest_static_0100] strJson:" + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('OK');

      console.info('GetStateByIndexTest_static_0100 END');
      done();
    });
  })
}