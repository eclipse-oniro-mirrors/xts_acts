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
import {Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import text from "@ohos.graphics.text"
import inspector from '@ohos.arkui.inspector'
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

export default function styledStringChange() {
  describe('styledStringChange', () : void=> {
    beforeAll(() => {
      console.info("styledStringChange beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("styledStringChange beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get styledStringChange state pages:" + "");
        if (!("styledStringChange" == pages.name)) {
          console.info("get  Context pages.name:" + '');
          routerInstance.pushUrl({
            url: "MainAbility/pages/Text/styledStringChange"
          })
          await CommonFunc.sleep(2000);
          //console.info("push styledStringChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push styledStringChange page error:" + err);
      }
      console.info("styledStringChange foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("styledStringChange after each called");
    });

    

    
/**
     * @tc.number   styledStringChange_static_001
     * @tc.name     styledStringChange_static_001
     * @tc.desc     styledStringChange_static_001
     * @tc.level    Level.LEVEL3
     */
    it('styledStringChange_static_001', Level.LEVEL3, async (done: ()=>void) => {
      console.info('[styledStringChange_001] START');
      await CommonFunc.sleep(200);
      let driver: Driver = Driver.create();
      let text: Component | null= await driver.findComponent(ON.id('styledStringText'));
      let input: Component | null= await driver.findComponent(ON.id('styledStringInput'));
      await text!.longClick();
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('全选'));
      await (text1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      text?.dragTo(input!);
      await CommonFunc.sleep(4000);

      let strJson = inspector.getInspectorByKey('changeText');
      await CommonFunc.sleep(1000);


        let obj = JSON.parseJsonElement(strJson);
        console.info("[styledStringChange_001] component obj is: " + JSON.stringify(obj));
        await CommonFunc.sleep(1000);
        expect(obj.getElement('$attrs').getString('content')).assertEqual('change');

      console.info('[styledStringChange_001] END');
      done();
    });

    

    
/**
     * @tc.number   styledStringChange_static_002
     * @tc.name     styledStringChange_static_002
     * @tc.desc     styledStringChange_static_002
     * @tc.level    Level.LEVEL3
     */
    it('styledStringChange_static_002', Level.LEVEL3, async (done: ()=>void) => {
      console.info('[styledStringChange_002] START');
      await CommonFunc.sleep(200);
      let driver: Driver = Driver.create();
      let text: Component | null= await driver.findComponent(ON.id('styledStringText'));
      let input: Component | null= await driver.findComponent(ON.id('styledStringInput'));
      await (text?.longClick() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text1 = await driver.findComponent(ON.text('全选'));
      await (text1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text2 = await driver.findComponent(ON.text('复制'));
      await (text2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (input?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      await (input?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let paste = await driver.findComponent(ON.text('粘贴'));
      await (paste?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


        let strJson = inspector.getInspectorByKey('changeText2');
        await CommonFunc.sleep(200);
        let obj = JSON.parseJsonElement(strJson);
        console.info("[styledStringChange_002] component obj is: " + JSON.stringify(obj));
        await CommonFunc.sleep(1000);
        expect(obj.getElement('$attrs').getString('content')).assertEqual('paste');

      console.info('[styledStringChange_002] END');
      done();
    });
  })
}
