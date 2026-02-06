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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Point} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector'
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function onSelectionChange1() {
  describe('onSelectionChange1', () => {
    beforeAll(() => {
      console.info("onSelectionChange1 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("onSelectionChange1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange1',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange1 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange1" == pages.name)) {
          console.info("get onSelectionChange1 pages.name:" + JSON.stringify(pages.name));
          //let result = await router.push(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push onSelectionChange1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        // console.error("push onSelectionChange1 page error:" + err);
      }
      console.info("onSelectionChange1 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange1 after each called");
    });
    
    
/**
     * @tc.number   onSelectionChange1_static_0100
     * @tc.name     onSelectionChange1_static_0100
     * @tc.desc     onSelectionChange1_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('onSelectionChange1_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[onSelectionChange1_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let richEditor = await driver.findComponent(ON.id('onSelectionChange_RichEditor'));
      await (richEditor?.click() as Promise<void>);
      await CommonFunc.sleep(1000);



        let btn1 = await driver.findComponent(ON.id('onSelectionChange1_btn1'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let text1 = inspector.getInspectorByKey('onSelectionChange1_text1');
        let Obj1=JSON.parseJsonElement(text1);
        expect(Obj1.getElement('$attrs').getString('content')).assertEqual('2');

        let btn2 = await driver.findComponent(ON.id('onSelectionChange1_btn2'));
        await (btn2?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let text2 = inspector.getInspectorByKey('onSelectionChange1_text1');
        let Obj2=JSON.parseJsonElement(text2);
        expect(Obj2.getElement('$attrs').getString('content')).assertEqual('3');

        let btn3 = await driver.findComponent(ON.id('onSelectionChange1_btn3'));
        await (btn3?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let text3 = inspector.getInspectorByKey('onSelectionChange1_text1');
        let Obj3=JSON.parseJsonElement(text3);
        expect(Obj3.getElement('$attrs').getString('content')).assertEqual('4');

      console.info('[onSelectionChange1_0100] END');
      done();
    });

  })
}
