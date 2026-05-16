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

import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../../Util.test'

export default function pushNamedRoute6() {
  describe('pushNamedRoute6', () => {
    beforeAll(() => {
      console.info("pushNamedRoute6 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("pushNamedRoute6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/pushNamedRoute/pushNamedRoute6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get pushNamedRoute6 state pages:" + JSON.stringify(pages));
        if (!("pushNamedRoute6" == pages.name)) {
          console.info("get pushNamedRoute6 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push pushNamedRoute6 page error:" + err);
      }
      console.info("pushNamedRoute6 beforeEach end");
    });
    afterEach(async () => {
    });

    
    
/**
     * @tc.number   pushNamedRoute6_static_0100
     * @tc.name     pushNamedRoute6_static_0100
     * @tc.desc     pushNamedRoute6_static_0100
     * @tc.level    Level.LEVEL2
     */
it('pushNamedRoute6_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('pushNamedRoute6_static_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('pushNamedRoute6_btn1',10,"")
      await CommonFunc.sleep(2000);

      let text1 = inspector.getInspectorByKey('pageOne_text1');
      expect(String(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('pageOne');
      await CommonFunc.sleep(1000);

      console.info('pushNamedRoute6_static_0100 END');
      done();
    });

  })
}