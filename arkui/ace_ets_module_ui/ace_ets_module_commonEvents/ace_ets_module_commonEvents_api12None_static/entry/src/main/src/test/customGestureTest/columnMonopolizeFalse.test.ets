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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'


export default function columnMonopolizeFalse() {
  describe('columnMonopolizeFalse', () => {
    beforeAll(async (): Promise<void> => {

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12None.static", "EntryAbility")

    });
    beforeEach(async ():Promise<void> => {
      console.log("columnMonopolizeFalse beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.log("get columnMonopolizeFalse state pages:" + JSON.stringify(pages));
        if (!("columnMonopolizeFalse" == pages.name)) {
          console.log("get  columnMonopolizeFalse pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: "MainAbility/pages/customGestureTest/columnMonopolizeFalse"
          })
          await CommonFunc.sleep(2000);
          // console.log("push columnMonopolizeFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnMonopolizeFalse page error:" + err);
      }
      console.log("columnMonopolizeFalse foreEach end");
      //done();
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.log("columnMonopolizeFalse after each called");
    });

    

    

/**
     * @tc.number   columnMonopolizeFalse_static_001
     * @tc.name     columnMonopolizeFalse_static_001
     * @tc.desc     columnMonopolizeFalse_static_001
     * @tc.level    Level.LEVEL0
     */
it('columnMonopolizeFalse_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('[columnMonopolizeFalse_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let column1 = await driver.findComponent(ON.id('column1'));
      await CommonFunc.sleep(200);
      await (column1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson1 = inspector.getInspectorByKey("text1");
      console.log("[columnMonopolizeFalse_001] component obj1 is: " , JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('inner column touch down');
      let strJson2 = inspector.getInspectorByKey('text2');
      console.log("[columnMonopolizeFalse_001] component obj2 is: " , JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('inner column touch down');
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('button1'));
      let button2 = await driver.findComponent(ON.id('button2'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('text');
      console.log("[columnMonopolizeFalse_001] component obj3 is: " , JSON.stringify(JSON.parseJsonElement(strJson3)));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('set monopolizeEvents true');
      await CommonFunc.sleep(1000);

      await (column1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson4 = inspector.getInspectorByKey('text1');
      console.log("[columnMonopolizeFalse_001] component obj4 is: " , JSON.stringify(JSON.parseJsonElement(strJson4)));
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')).assertEqual(' ');
      let strJson5 = inspector.getInspectorByKey('text2');
      console.log("[columnMonopolizeFalse_001] component obj5 is: " , JSON.stringify(JSON.parseJsonElement(strJson5)));
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('content')).assertEqual('inner column touch down');
      console.log('[columnMonopolizeFalse_001] END');
      done();
    });
  })
}
