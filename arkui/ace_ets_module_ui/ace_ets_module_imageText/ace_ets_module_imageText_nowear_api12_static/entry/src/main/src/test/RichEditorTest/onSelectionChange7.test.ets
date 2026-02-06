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
import inspector from '@ohos.arkui.inspector'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function onSelectionChange7() {
  describe('onSelectionChange7', () => {
    beforeAll(() => {
      console.info("onSelectionChange7 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("onSelectionChange7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange7',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange7 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange7" == pages.name)) {
          console.info("get onSelectionChange7 pages.name:" + JSON.stringify(pages.name));
          //let result = await router.push(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push onSelectionChange7 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange7 page error:" + err);
      }
      console.info("onSelectionChange7 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange7 after each called");
    });
    
    
/**
     * @tc.number   onSelectionChange7_static_0100
     * @tc.name     onSelectionChange7_static_0100
     * @tc.desc     onSelectionChange7_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('onSelectionChange7_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[onSelectionChange7_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);



        let richEditor = await driver.findComponent(ON.id('onSelectionChange7_RichEditor'));
        await (richEditor?.click() as Promise<void>);
        await CommonFunc.sleep(300);
        let btn2 = await driver.findComponent(ON.id('onSelectionChange7_btn2'));
        await (btn2?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let text1_0 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_0=JSON.parseJsonElement(text1_0);
        expect(Obj1_0.getElement('$attrs').getString('content')).assertEqual('2');
        let text2_0 = inspector.getInspectorByKey('onSelectionChange7_text2');
        let Obj2_0=JSON.parseJsonElement(text2_0);
        expect(Obj2_0.getElement('$attrs').getString('content')).assertEqual('83');
        let text3_0 = inspector.getInspectorByKey('onSelectionChange7_text3');
        let Obj3_0=JSON.parseJsonElement(text3_0);
        expect(Obj3_0.getElement('$attrs').getString('content')).assertEqual('83');

        await driver.triggerKey(2015);
        await CommonFunc.sleep(1000);
        let text1_1 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_1=JSON.parseJsonElement(text1_1);
        expect(Obj1_1.getElement('$attrs').getString('content')).assertEqual('2');
        let text2_1 = inspector.getInspectorByKey('onSelectionChange7_text2');
        let Obj2_1=JSON.parseJsonElement(text2_1);
        expect(Obj2_1.getElement('$attrs').getString('content')).assertEqual('83');
        let text3_1 = inspector.getInspectorByKey('onSelectionChange7_text3');
        let Obj3_1=JSON.parseJsonElement(text3_1);
        expect(Obj3_1.getElement('$attrs').getString('content')).assertEqual('83');

        await driver.triggerKey(2013);
        await CommonFunc.sleep(1000);
        let text1_2 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_2=JSON.parseJsonElement(text1_2);
        expect(Obj1_2.getElement('$attrs').getString('content')).assertEqual('2');
        let text2_2 = inspector.getInspectorByKey('onSelectionChange7_text2');
        let Obj2_2=JSON.parseJsonElement(text2_2);
        expect(Obj2_2.getElement('$attrs').getString('content')).assertEqual('83');
        let text3_2 = inspector.getInspectorByKey('onSelectionChange7_text3');
        let Obj3_2=JSON.parseJsonElement(text3_2);
        expect(Obj3_2.getElement('$attrs').getString('content')).assertEqual('83');

        await driver.triggerKey(2014);
        await CommonFunc.sleep(1000);
        let text1_3 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_3=JSON.parseJsonElement(text1_3);
        expect(Obj1_3.getElement('$attrs').getString('content')).assertEqual('3');
        let text2_3 = inspector.getInspectorByKey('onSelectionChange7_text2');
        let Obj2_3=JSON.parseJsonElement(text2_3);
        expect(Obj2_3.getElement('$attrs').getString('content')).assertEqual('82');
        let text3_3 = inspector.getInspectorByKey('onSelectionChange7_text3');
        let Obj3_3=JSON.parseJsonElement(text3_3);
        expect(Obj3_3.getElement('$attrs').getString('content')).assertEqual('82');

        await driver.triggerKey(2015);
        await CommonFunc.sleep(1000);
        let text1_4 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_4=JSON.parseJsonElement(text1_4);
        expect(Obj1_4.getElement('$attrs').getString('content')).assertEqual('4');
        let text2_4 = inspector.getInspectorByKey('onSelectionChange7_text2');
        let Obj2_4=JSON.parseJsonElement(text2_4);
        expect(Obj2_4.getElement('$attrs').getString('content')).assertEqual('83');
        let text3_4 = inspector.getInspectorByKey('onSelectionChange7_text3');
        let Obj3_4=JSON.parseJsonElement(text3_4);
        expect(Obj3_4.getElement('$attrs').getString('content')).assertEqual('83');

        await driver.triggerKey(2012);
        await CommonFunc.sleep(1000);
        let text1_5 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_5=JSON.parseJsonElement(text1_5);
        expect(Obj1_5.getElement('$attrs').getString('content')).assertEqual('5');

        await driver.triggerKey(2013);
        await CommonFunc.sleep(1000);
        let text1_6 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_6=JSON.parseJsonElement(text1_6);
        expect(Obj1_6.getElement('$attrs').getString('content')).assertEqual('6');

        let btn1 = await driver.findComponent(ON.id('onSelectionChange7_btn1'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let text1_7 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_7=JSON.parseJsonElement(text1_7);
        expect(Obj1_7.getElement('$attrs').getString('content')).assertEqual('7');
        let text2_7 = inspector.getInspectorByKey('onSelectionChange7_text2');
        let Obj2_7=JSON.parseJsonElement(text2_7);
        expect(Obj2_7.getElement('$attrs').getString('content')).assertEqual('0');
        let text3_7 = inspector.getInspectorByKey('onSelectionChange7_text3');
        let Obj3_7=JSON.parseJsonElement(text3_7);
        expect(Obj3_7.getElement('$attrs').getString('content')).assertEqual('0');

        await driver.triggerKey(2012);
        await CommonFunc.sleep(1000);
        let text1_8 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_8=JSON.parseJsonElement(text1_8);
        expect(Obj1_8.getElement('$attrs').getString('content')).assertEqual('7');
        let text2_8 = inspector.getInspectorByKey('onSelectionChange7_text2');
        let Obj2_8=JSON.parseJsonElement(text2_8);
        expect(Obj2_8.getElement('$attrs').getString('content')).assertEqual('0');
        let text3_8 = inspector.getInspectorByKey('onSelectionChange7_text3');
        let Obj3_8=JSON.parseJsonElement(text3_8);
        expect(Obj3_8.getElement('$attrs').getString('content')).assertEqual('0');

        await driver.triggerKey(2014);
        await CommonFunc.sleep(1000);
        let text1_9 = inspector.getInspectorByKey('onSelectionChange7_text1');
        let Obj1_9= JSON.parseJsonElement(text1_9);
        expect(Obj1_9.getElement('$attrs').getString('content')).assertEqual('7');
        let text2_9 = inspector.getInspectorByKey('onSelectionChange7_text2');
        let Obj2_9=JSON.parseJsonElement(text2_9);
        expect(Obj2_9.getElement('$attrs').getString('content')).assertEqual('0');
        let text3_9 = inspector.getInspectorByKey('onSelectionChange7_text3');
        let Obj3_9=JSON.parseJsonElement(text3_9);
        expect(Obj3_9.getElement('$attrs').getString('content')).assertEqual('0');

      console.info('[onSelectionChange7_0100] END');
      done();
    });

  })
}
