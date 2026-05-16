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

export default function pushUrl22() {
  describe('pushUrl22', () => {
    beforeAll(() => {
      console.info("pushUrl22 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api12.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("pushUrl22 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/pushUrl/pushUrl22',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get pushUrl22 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get pushUrl22 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push pushUrl22 page error:" + err);
      }
      console.info("pushUrl22 beforeEach end");
    });
    afterEach(async () => {
    });

    
    
/**
     * @tc.number   pushUrl22_static_0100
     * @tc.name     pushUrl22_static_0100
     * @tc.desc     pushUrl22_static_0100
     * @tc.level    Level.LEVEL2
     */
it('pushUrl22_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('pushUrl22_static_0100 START');
      await CommonFunc.sleep(1000);

      inspector.sendEventByKey('pushUrl22_btn1',10,"")
      await CommonFunc.sleep(1000);

      let text1 = inspector.getInspectorByKey('page2_text');
      expect(String(JSON.parseJsonElement(text1).getElement('$attrs').getString('content'))).assertEqual('page2');
      await CommonFunc.sleep(1000);

      console.info('pushUrl22_static_0100 END');
      done();
    });

  })
}