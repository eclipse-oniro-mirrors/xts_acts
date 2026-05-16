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

export default function onTerminatedJsunit() {
  describe('onTerminatedJsunit', () => {
    beforeAll(() => {
      
      
      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("onTerminated beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/EmbeddedComponent/onTerminated",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onTerminated state pages: " + JSON.stringify(pages));
        if (!("onTerminated" == pages.name)) {
          console.info("get onTerminated state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onTerminated page error: " + err);
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   onTerminatedTest_static_0010
     * @tc.name     onTerminatedTest_static_0010
     * @tc.desc     onTerminatedTest_static_0010
     * @tc.level    Level.LEVEL2
     */
it('onTerminatedTest_static_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('onTerminatedTest_static_0010 START');
      let strJson = inspector.getInspectorByKey('OnTerminated_text');
      console.log('strJson=======' + strJson)
      console.info("[onTerminatedTest_static_0010] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onTerminated succ');
      console.info('[onTerminatedTest_static_0010] END');
      done();
    });
  })
}

