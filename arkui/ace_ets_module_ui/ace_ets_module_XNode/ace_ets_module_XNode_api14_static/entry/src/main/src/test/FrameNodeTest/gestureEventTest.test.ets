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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
export default function gestureEventTest() {
  describe('gestureEventTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.XNode.api14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("gestureEventTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/gestureEventTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get gestureEventTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get gestureEventTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push gestureEventTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureEventTest page error:" + err);
      }
      console.info("gestureEventTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gestureEventTest after each called");
    });


    
    
/**
     * @tc.number   gestureEventTest_static_0100
     * @tc.name     gestureEventTest_static_0100
     * @tc.desc     gestureEventTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('gestureEventTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('gestureEventTest_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let node: Component = await driver.findComponent(ON.id('gestureEventTest_node')) as Component;
      let point = await node.getBoundsCenter();
      console.info("[gestureEventTest_static_0100] getBoundsCenter point.x: " + point.x + ", point.y: " + point.y);
      await driver.swipe((Math.round(point.x - UIContext.resolveUIContext()!.vp2px(50))).toInt(), (Math.round(point.y)).toInt(), (Math.round(point.x + UIContext.resolveUIContext()!.vp2px(50))).toInt(), (Math.round(point.y)).toInt());
      await CommonFunc.sleep(2000);
      let btn = await driver.findComponent(ON.id('getpanGestureInfo')) as Component;
      await btn.click()
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('panGesture_text1');
      let strJson2 = inspector.getInspectorByKey('panGesture_text2');
      let strJson3 = inspector.getInspectorByKey('panGesture_text3');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      await CommonFunc.sleep(1000);
      console.info("[gestureEventTest_static_0100] panGesture_text1 is: " + obj1.getElement('$attrs').getString('content'));
      console.info("[gestureEventTest_static_0100] panGesture_text2 is: " + obj2.getElement('$attrs').getString('content'));
      console.info("[gestureEventTest_static_0100] panGesture_text3 is: " + obj3.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Pan start')
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Pan update')
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('Pan end')
      console.info('gestureEventTest_static_0100 END');
      done();
    });
  })
}