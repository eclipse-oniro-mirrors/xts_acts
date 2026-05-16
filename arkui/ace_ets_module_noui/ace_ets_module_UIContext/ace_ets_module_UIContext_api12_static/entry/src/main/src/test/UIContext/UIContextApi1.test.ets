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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'

export default function UIContextApi1() {
  describe('UIContextApi1', () => {
    beforeAll(() => {
      console.info("UIContextApi1 beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.UIContext12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("UIContextApi1 beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/UIContext/UIContextApi1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get UIContextApi1 state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get UIContextApi1 pages.name:" + '');
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push UIContextApi1 page error:" + err);
      }
      console.info("UIContextApi1 beforeEach end");
    });


    afterEach(async () => {
    });
    

    
/**
     * @tc.number   UIContextApi1_static_0100
     * @tc.name     UIContextApi1_static_0100
     * @tc.desc     UIContextApi1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('UIContextApi1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('UIContextApi1_static_0100 START');
      await CommonFunc.sleep(1000);
      inspector.sendEventByKey('UIContextApi1_btn2',10,"")
      await CommonFunc.sleep(1000);
      let UIContextApi1_1 = inspector.getInspectorByKey('UIContextApi1_btn2');
      expect(JSON.stringify(JSON.parseJsonElement(UIContextApi1_1).getElement('$attrs').getString('backgroundColor'))).assertEqual('"#FF0000FF"');
      console.info('UIContextApi1_static_0100 END');
      done();
    });
  })
}