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
import inspector from '@ohos.arkui.inspector'
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function frameNodeMoveOneTest() {
  describe('frameNodeMoveOneTest', () => {
    beforeAll(() => {
      console.info("frameNodeMoveOneTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("frameNodeMoveOneTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/frameNodeMoveOneTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        // let result = await router.replaceUrl(options);
        router.replaceUrl(options);
        console.info("get frameNodeMoveOneTest state pages:" + JSON.stringify(pages));
        if (!("frameNodeMoveOneTest" == pages.name)) {  //"frameNodeMoveOneTest" == pages.name
          console.info("get frameNodeMoveOneTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          //console.info("push frameNodeMoveOneTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push frameNodeMoveOneTest page error:" + err);
      }
      console.info("frameNodeMoveOneTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("frameNodeMoveOneTest after each called");
    });

    
    



    /**
     * @tc.number   frameNodeMoveOneTest_static_0100
     * @tc.name     frameNodeMoveOneTest_static_0100
     * @tc.desc     frameNodeMoveOneTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('frameNodeMoveOneTest_static_0100', Level.LEVEL2, async (done: () => void) => {

      console.info('frameNodeMoveOneTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('addFrame2_id'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('frame1AddBlue_id'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button3 = await driver.findComponent(ON.id('move_id'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button4 = await driver.findComponent(ON.id('count_id'));
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1: string = inspector.getInspectorByKey('frame1ChildCount_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[frameNodeMoveOneTest_0100] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      let strJson2: string = inspector.getInspectorByKey('frame2ChildCount_id');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[frameNodeMoveOneTest_0100] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('2');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[frameNodeMoveOneTest_0100] END');
      done();
    });

    
    



    /**
     * @tc.number   frameNodeMoveOneTest_static_0200
     * @tc.name     frameNodeMoveOneTest_static_0200
     * @tc.desc     frameNodeMoveOneTest_static_0200
     * @tc.level    Level.LEVEL2
     */
it('frameNodeMoveOneTest_static_0200', Level.LEVEL2, async (done: () => void) => {

      console.info('frameNodeMoveOneTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('addFrame2_id'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button2 = await driver.findComponent(ON.id('addText_id'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let button3 = await driver.findComponent(ON.id('moveText_id'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button4 = await driver.findComponent(ON.id('count_id'));
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1: string = inspector.getInspectorByKey('frame3ChildCount_id');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[frameNodeMoveOneTest_0200] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      let strJson2: string = inspector.getInspectorByKey('getNodeParentId_id');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[frameNodeMoveOneTest_0200] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('3');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('root_id1');
      console.info('[frameNodeMoveOneTest_0200] END');
      done();
    });

  })
}