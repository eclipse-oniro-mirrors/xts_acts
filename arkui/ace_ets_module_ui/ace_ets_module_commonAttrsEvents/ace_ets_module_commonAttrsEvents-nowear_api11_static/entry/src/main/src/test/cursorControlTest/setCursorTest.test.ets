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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import Utils from '../../../ets/MainAbility/common/Utils';
import { startAbility, UtilsTest } from '../Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function setCursorTest() {
  describe('setCursorTest', () => {
    beforeAll(() => {
      console.info("setCursorTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.nowear.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("setCursorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/cursorControl/setCursor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setCursorTest state pages:" + JSON.stringify(pages));
        if (!("setCursor" == pages.name)) {
          console.info("get setCursorTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push setCursorTest page error:" + err);
      }
      console.info("setCursorTest beforeEach end");
    });
    
    
/**
     * @tc.number   setCursorTest_static_0100
     * @tc.name     setCursorTest_static_0100
     * @tc.desc     setCursorTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('setCursorTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('setCursorTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('setCursor_2'));
      console.log('test button ' + JSON.stringify(button))
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('setCursor_1'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setCursor_1');
      await CommonFunc.sleep(1000);
      console.info("[setCursorTest_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[setCursorTest_static_0100] component obj.$attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[setCursorTest_static_0100] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('setCursor枚举值：3');
      console.info('[setCursorTest_static_0100] END');
      done();
    });
    
    
/**
     * @tc.number   setCursorTest_static_0200
     * @tc.name     setCursorTest_static_0200
     * @tc.desc     setCursorTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('setCursorTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('setCursorTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('setCursor_3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('setCursor_1'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('setCursor_1');
      await CommonFunc.sleep(1000);
      console.info("[setCursorTest_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[setCursorTest_static_0200] component obj.$attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[setCursorTest_static_0200] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('setCursor枚举值：0');
      console.info('[setCursorTest_static_0100] END');
      done();
    });
  })
}

