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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
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
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext();


export default function columnMonopolizeFalse() {
  describe('columnMonopolizeFalse', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.log("columnMonopolizeFalse beforeEach start");
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.log("get columnMonopolizeFalse state pages:" + JSON.stringify(pages));
        if (!("columnMonopolizeFalse" == pages.name)) {
          console.log("get  columnMonopolizeFalse pages.name:" + JSON.stringify(pages.name))
          router.pushUrl({
            url: "MainAbility/pages/customGestureTest/columnMonopolizeFalse"
          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push columnMonopolizeFalse page error:" + err);
      }
      console.log("columnMonopolizeFalse foreEach end");
    });
    afterEach(async () => {
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
      // get column left and top on screen
      let str1 = inspector.getInspectorByKey("columnLongPress1");
      let obj: Record<string, Object> =
        JSON.parse<Object>(str1, Class.from<String>()) as Record<string, Object>;
      console.info("[getInspectorByKey] current component obj is: " + JSON.stringify(obj));
      let rectInfo: Array<Array<number>> = JSON.parse<Object>('[' + obj["getElement('$rect')"]! + ']',
        Class.from<String>()) as Array<Array<number>>;
      CommonFunc.rect_left =
        Number(Number(rectInfo[0][0] ?? 0) + Number(AppStorage.get<number>("winLeft") ?? 0));
      CommonFunc.rect_top =
        Number(Number(rectInfo[0][1] ?? 0) + Number(AppStorage.get<number>("winTop") ?? 0));
      console.info("rect_left = " + CommonFunc.rect_left + "CommonFunc.rect_top = " + CommonFunc.rect_top);
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let column2 = await driver.findComponent(ON.id('columnClick2'));

      await CommonFunc.sleep(200);
      await driver.longClick(Math.round(CommonFunc.rect_left + uiContext.vp2px(33.33)) as Int,
        Math.round(CommonFunc.rect_top + uiContext.vp2px(26.66)) as Int);
      await CommonFunc.sleep(1000);
      await (column2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson1 = inspector.getInspectorByKey('columnTextFalse');
      console.log("[columnMonopolizeFalse_001] component obj1 is: ", JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        .assertEqual('LongPressGesture onAction success;TapGesture success');
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('buttonFalse1'));
      // change the status of monopolize Attribute

      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(CommonFunc.rect_left + uiContext.vp2px(33.33)) as Int,
        Math.round(CommonFunc.rect_top + uiContext.vp2px(26.66)) as Int);
      await CommonFunc.sleep(1000);
      await (column2?.click() as Promise<void>);
      let strJson2 = inspector.getInspectorByKey('columnTextFalse');
      console.log("[columnMonopolizeFalse_001] component obj2 is: ", JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
        .assertEqual('LongPressGesture onAction success;');
      await CommonFunc.sleep(1000);
      console.log('[columnMonopolizeFalse_001] END');
      done();
    });
  })
}
