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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton,Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function commonEventTest1() {
  describe('commonEventTest1', () => {
    beforeAll(() => {
      console.info("commonEventTest1 beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("commonEventTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/commonEventTest1',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get commonEventTest1 state pages:" + JSON.stringify(pages));
        if (!("commonEventTest1" == pages.name)) {
          console.info("get commonEventTest1 pages.name:" + JSON.stringify(pages.name));
          //let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push commonEventTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push commonEventTest1 page error:" + err);
      }
      console.info("commonEventTest1 beforeEach end");
      //done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("commonEventTest1 after each called");
    });
    
    



    /**
     * @tc.number   commonEventTest1_static_0100
     * @tc.name     commonEventTest1_static_0100
     * @tc.desc     commonEventTest1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('commonEventTest1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('commonEventTest1_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let node: Component | null = await driver.findComponent(ON.id('commonEventTest1_node'));
      let point = await (node?.getBoundsCenter() as Promise<Point>);
      await driver.mouseClick({x:Math.round(point.x) as Int, y:Math.round(point.y) as Int}, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('commonEventTest1_getOnMouse'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('commonEventTest1_text1');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[commonEventTest1_static_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('setOnMouseFrameNode')
      console.info('commonEventTest1_static_0100 END');
      done();
    });
    
    



    /**
     * @tc.number   commonEventTest1_static_0200
     * @tc.name     commonEventTest1_static_0200
     * @tc.desc     commonEventTest1_static_0200
     * @tc.level    Level.LEVEL0
     */
it('commonEventTest1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('commonEventTest1_static_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('commonEventTest1_changeSize'));
      await (btn1?.click() as Promise<void>)
      console.info("[commonEventTest1_static_0200] btn1");
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('commonEventTest1_getOnSizeChange'));
      await (btn2?.click() as Promise<void>)
      console.info("[commonEventTest1_static_0200] btn2");
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('commonEventTest1_text2');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[commonEventTest1_static_0200] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('setOnSizeChangeFrameNode')
      console.info('commonEventTest1_static_0200 END');
      done();
    });
  })
}