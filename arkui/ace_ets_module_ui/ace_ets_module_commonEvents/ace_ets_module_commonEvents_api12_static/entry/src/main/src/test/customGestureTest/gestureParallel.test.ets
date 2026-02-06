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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function gestureParallelTest() {
  describe('gestureParallelTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      console.info("gestureParallelTest beforeEach start");
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get gestureParallelTest state pages:" + JSON.stringify(pages));
        if (!("gestureParallel" == pages.name)) {
          console.info("get  gestureParallelTest pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl({
          //   url: "MainAbility/pages/customGestureTest/gestureParallel"
          // })
          router.pushUrl({
            url: "MainAbility/pages/customGestureTest/gestureParallel"
          })
          await CommonFunc.sleep(2000);
          // console.info("push gestureParallelTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureParallelTest page error:" + err);
      }
      console.info("gestureParallelTest foreEach end");
      //done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gestureParallelTest after each called");
    });

    

    
    
/**
     * @tc.number   gestureParallelTest_static_001
     * @tc.name     gestureParallelTest_static_001
     * @tc.desc     gestureParallelTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('gestureParallelTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[gestureParallelTest_001] START');
      let str1 = inspector.getInspectorByKey("parallelGestureKey");
      let obj: Record<string, Object> = JSON.parse<Object>(str1, Class.from<String>()) as Record<string, Object>;
      console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
      // get column left and top on screen
      let rectInfo: Array<Array<number>> = JSON.parse<Object>('[' + obj["getElement('$rect')"]! + ']', Class.from<String>()) as Array<Array<number>>;
      CommonFunc.rect_left =
        Number(Number(rectInfo[0][0] ?? 0) + Number(AppStorage.get<number>("winLeft") ?? 0));
      CommonFunc.rect_top =
        Number(Number(rectInfo[0][1] ?? 0) + Number(AppStorage.get<number>("winTop") ?? 0));
      console.info("rect_left = " + CommonFunc.rect_left + "CommonFunc.rect_top = " + CommonFunc.rect_top);
      let driver = Driver.create();
      await driver.longClick(Math.round(CommonFunc.rect_left + uiContext.vp2px(66.66)) as Int, Math.round(CommonFunc.rect_top + uiContext.vp2px(133.33)) as Int);
      await driver.doubleClick(Math.round(CommonFunc.rect_left + uiContext.vp2px(66.66)) as Int, Math.round(CommonFunc.rect_top + uiContext.vp2px(133.33)) as Int);
      let strJson1 = inspector.getInspectorByKey("longPressMsg");
      await CommonFunc.sleep(200);
      console.info("[gestureParallelTest_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('LongPress onActionEnd');
      await CommonFunc.sleep(200);
      let strJson2 = inspector.getInspectorByKey("tapGestureMsg");
      await CommonFunc.sleep(200);
      console.info("[gestureParallelTest_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('tapGesture onAction');
      await CommonFunc.sleep(1000);
      console.info('[gestureParallelTest_001] END');
      done();
    });
  })
}
