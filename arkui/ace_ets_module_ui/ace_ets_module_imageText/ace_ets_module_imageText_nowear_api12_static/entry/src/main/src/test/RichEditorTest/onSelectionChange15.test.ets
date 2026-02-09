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
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Point} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function onSelectionChange15() {
  describe('onSelectionChange15', () => {
    beforeAll(() => {
      console.info("onSelectionChange15 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("onSelectionChange15 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange15',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange15 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange15" == pages.name)) {
          console.info("get onSelectionChange15 pages.name:" + JSON.stringify(pages.name));
          //let result = await router.push(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push onSelectionChange15 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange15 page error:" + err);
      }
      console.info("onSelectionChange15 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange15 after each called");
    });
    
    
/**
     * @tc.number   onSelectionChange15_static_0100
     * @tc.name     onSelectionChange15_static_0100
     * @tc.desc     onSelectionChange15_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('onSelectionChange15_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[onSelectionChange15_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);



        let richEditor = await driver.findComponent(ON.id('onSelectionChange15_RichEditor'));
        await (richEditor?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let text0 = inspector.getInspectorByKey('onSelectionChange15_text1');
        let Obj0=JSON.parseJsonElement(text0);
        expect(Obj0.getElement('$attrs').getString('content')).assertEqual('1');

        let btn1 = await driver.findComponent(ON.id('onSelectionChange15_btn1'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let text1_1 = inspector.getInspectorByKey('onSelectionChange15_text1');
        let Obj1_1=JSON.parseJsonElement(text1_1);
        expect(Obj1_1.getElement('$attrs').getString('content')).assertEqual('2');
        let text2_1 = inspector.getInspectorByKey('onSelectionChange15_text2');
        let Obj2_1=JSON.parseJsonElement(text2_1);
        expect(Obj2_1.getElement('$attrs').getString('content')).assertEqual('3');
        let text3_1 = inspector.getInspectorByKey('onSelectionChange15_text3');
        let Obj3_1=JSON.parseJsonElement(text3_1);
        expect(Obj3_1.getElement('$attrs').getString('content')).assertEqual('3');

      console.info('[onSelectionChange15_0100] END');
      done();
    });

  })
}
