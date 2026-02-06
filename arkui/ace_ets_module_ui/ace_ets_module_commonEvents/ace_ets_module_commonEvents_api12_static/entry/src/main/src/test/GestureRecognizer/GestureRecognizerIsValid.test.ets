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
const uiContext = new UIContext();


export default function GestureRecognizerIsValid() {
  describe('GestureRecognizerIsValid', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("GestureRecognizerIsValid beforeEach start");
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get GestureRecognizerIsValid state pages:" + JSON.stringify(pages));
        if (!("GestureRecognizerIsValid" == pages.name)) {
          console.info("get  GestureRecognizerIsValid pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/GestureRecognizer/GestureRecognizerIsValid"
          })
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GestureRecognizerIsValid page error:" + err);
      }
      console.info("GestureRecognizerIsValid foreEach end");
      //done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GestureRecognizerIsValid after each called");
    });


    
    
/**
     * @tc.number   GestureRecognizerIsValid_static_001
     * @tc.name     GestureRecognizerIsValid_static_001
     * @tc.desc     GestureRecognizerIsValid_static_001
     * @tc.level    Level.LEVEL0
     */
it('GestureRecognizerIsValid_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GestureRecognizerIsValid_001] START');
      await CommonFunc.sleep(1000);
      let areaObj1 = CommonFunc.getComponentRectOnScreen('FatherControlChildTest1_inner_0');
      let areaHeight = areaObj1.bottom - areaObj1.top
      let areaWidth = areaObj1.right - areaObj1.left
      console.log('GestureRecognizerIsValid_001 item height and width', areaHeight, areaWidth)
      // child scroll
      let driver = Driver.create();
      await ((driver.swipe(Math.round(areaObj1.left + areaWidth / 2) as Int,
        Math.round(areaObj1.bottom - areaHeight * 0.2) as Int, Math.round(areaObj1.left + areaWidth / 2) as Int,
        Math.round(areaObj1.top) as Int)) as Promise<void>);
      await CommonFunc.sleep(3000);
      let strJson1 = inspector.getInspectorByKey('recognizer_text');
      console.info('[GestureRecognizerIsValid_001] component strJson1 is: ' +
      JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info('[GestureRecognizerIsValid_001] strJson1 content: ' +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('valid');
      await CommonFunc.sleep(1000);
      // child none
      let button1 = await driver.findComponent(ON.id("childScrollVisBtn"));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let areaObj2 = CommonFunc.getComponentRectOnScreen('FatherControlChildTest1_text');
      let areaHeight2 = areaObj2.bottom - areaObj2.top
      let areaWidth2 = areaObj2.right - areaObj2.left
      console.log('GestureRecognizerIsValid_001 text height and width', areaHeight2, areaWidth2)
      // parent scroll
      await ((driver.swipe(Math.round(areaObj2.left + areaWidth2 / 2) as Int,
        Math.round(areaObj1.bottom - areaHeight2 * 0.1) as Int, Math.round(areaObj2.left + areaWidth2 / 2) as Int,
        Math.round(areaObj1.top - areaHeight2 * 0.3) as Int)) as Promise<void>);

      await CommonFunc.sleep(3000);
      let strJson2 = inspector.getInspectorByKey('recognizer_text');
      console.info('[GestureRecognizerIsValid_001] component strJson2 is: ' +
      JSON.stringify(JSON.parseJsonElement(strJson2)));
      console.info('[GestureRecognizerIsValid_001] strJson2 content: ' +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('notValid');
      await CommonFunc.sleep(1000);
      console.info('[GestureRecognizerIsValid_001] END');
      done();
    });
  })
}
