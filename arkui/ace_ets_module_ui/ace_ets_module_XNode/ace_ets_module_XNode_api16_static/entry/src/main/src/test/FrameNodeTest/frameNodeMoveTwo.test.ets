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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest,startAbility} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function frameNodeMoveTwoTest() {
  describe('frameNodeMoveTwoTest', () => {
    beforeAll(() => {
      console.info("frameNodeMoveTwoTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("frameNodeMoveTwoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeMoveTwoTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get frameNodeMoveTwoTest state pages:" + JSON.stringify(pages));
        if (!("frameNodeMoveTwoTest" == pages.name)) {
          console.info("get frameNodeMoveTwoTest pages.name:" + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push frameNodeMoveTwoTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeMoveTwoTest page error:" + err);
      }
      console.info("frameNodeMoveTwoTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("frameNodeMoveTwoTest after each called");
    });

    
    



    /**
     * @tc.number   frameNodeMoveTwoTest_static_0100
     * @tc.name     frameNodeMoveTwoTest_static_0100
     * @tc.desc     frameNodeMoveTwoTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('frameNodeMoveTwoTest_static_0100', Level.LEVEL2, async (done: () => void) => {

      console.info('frameNodeMoveTwoTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('customPopupOptions_id'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('popup_id'));
      await (button2?.click() as Promise<void>);

      await CommonFunc.sleep(1000);
      let strJson1: string = inspector.getInspectorByKey('frame1ChildCount');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[frameNodeMoveTwoTest_0100] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      let strJson2: string = inspector.getInspectorByKey('frame2ChildCount');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[frameNodeMoveTwoTest_0100] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      let strJson3: string = inspector.getInspectorByKey('frame3ChildCount');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[frameNodeMoveTwoTest_0100] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('1');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[frameNodeMoveTwoTest_0100] END');
      done();
    });

  })
}