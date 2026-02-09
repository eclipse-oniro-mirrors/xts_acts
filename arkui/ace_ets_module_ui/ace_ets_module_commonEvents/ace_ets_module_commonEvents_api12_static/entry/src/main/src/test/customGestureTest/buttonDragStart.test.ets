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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  MouseButton,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
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


export default function btnDragStart() {
  describe('btnDragStart', () => {

    waitForCompletion(async ()=>{await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")})
    

    const uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!

    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      console.info("btnDragStart beforeEach start");
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get btnDragStart state pages:" + JSON.stringify(pages));
        if (!("buttonDragStart" == pages.name)) {
          console.info("get  btnDragStart pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/customGestureTest/buttonDragStart"
          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push btnDragStart page error:" + err);
      }
      console.info("btnDragStart foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("btnDragStart after each called");
    });


    
    
/**
     * @tc.number   btnDragStart_static_001
     * @tc.name     btnDragStart_static_001
     * @tc.desc     btnDragStart_static_001
     * @tc.level    Level.LEVEL0
     */
it('btnDragStart_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[btnDragStart_001] START');
      let str1 = inspector.getInspectorByKey("bttonDrag_key1");
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(str1)
      const str = obj.getString("$rect")
      let parts = str.substring(1, str.length - 1).split("],[");
      let rectInfo = parts.map((part: string) => {
        return part.split(",").map((item: string): double => parseFloat(item.trim()));
      });
      CommonFunc.rect_left = Number(Number(rectInfo[0][0] ?? 0) + Number(AppStorage.get<number>("winLeft") ?? 0));
      CommonFunc.rect_top = Number(Number(rectInfo[0][1] ?? 0) + Number(AppStorage.get<number>("winTop") ?? 0));

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.drag(Math.round(CommonFunc.rect_left + uiContext.vp2px(33.33)) as Int,
        Math.round(CommonFunc.rect_top + uiContext.vp2px(26.66)) as Int, 200, 200, 600);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey("buttonDrag_2");
      await CommonFunc.sleep(200);
      console.info("[btnDragStart_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('拖拽事件响应成功--GestureControl.GestureType.DRAG is true');
      await CommonFunc.sleep(1000);
      console.info('[btnDragStart_001] END');
      done();
    });
  })
}

function getComponentRectOnScreen(arg0: string) {
  throw new Error('Function not implemented.');
}
