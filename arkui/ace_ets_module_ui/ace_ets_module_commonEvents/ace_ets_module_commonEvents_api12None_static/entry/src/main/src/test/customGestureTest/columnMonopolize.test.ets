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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'

export default function columnMonopolize() {
  describe('columnMonopolize', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12None.static", "EntryAbility")

    });
    beforeEach(async ():Promise<void> => {
      console.log("columnMonopolize beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.log("get columnMonopolize state pages:" + JSON.stringify(pages));
        if (!("columnMonopolize" == pages.name)) {
          console.log("get  columnMonopolize pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: "MainAbility/pages/customGestureTest/columnMonopolize"
          })
          await CommonFunc.sleep(2000);
          // console.log("push columnMonopolize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnMonopolize page error:" + err);
      }
      console.log("columnMonopolize foreEach end");
      //done();
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.log("columnMonopolize after each called");
    });

    

    

/**
     * @tc.number   columnMonopolize_static_001
     * @tc.name     columnMonopolize_static_001
     * @tc.desc     columnMonopolize_static_001
     * @tc.level    Level.LEVEL0
     */
it('columnMonopolize_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('[columnMonopolize_001] START');
      // get column left and top on screen
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let column2 = await (scrollBar?.scrollSearch(ON.id('column2')) as Promise<Component | null>);
      let column1 = await (scrollBar?.scrollSearch(ON.id('column1')) as Promise<Component | null>);

      await CommonFunc.sleep(200);
      await (column1?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (column2?.click() as Promise<void>);
      let strJson1 = inspector.getInspectorByKey('columnText');
      console.log("[columnMonopolize_001] component obj is: " , JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('LongPressGesture onAction success;');
      await CommonFunc.sleep(1000);
      let button = await (scrollBar?.scrollSearch(ON.id('buttonBoolean')) as Promise<Component | null>);
      let button_clean = await (scrollBar?.scrollSearch(ON.id('button_clean')) as Promise<Component | null>);

      await (button_clean?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      // change the status of monopolize Attribute
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (column1?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (column2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson2 = inspector.getInspectorByKey('columnText');
      console.log("[columnMonopolize_001] component obj2 is: " , JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('LongPressGesture onAction success;TapGesture success');
      await CommonFunc.sleep(3000);
      await (button_clean?.click() as Promise<void>);
      console.log('[columnMonopolize_001] END');
      done();
    });
  })
}
