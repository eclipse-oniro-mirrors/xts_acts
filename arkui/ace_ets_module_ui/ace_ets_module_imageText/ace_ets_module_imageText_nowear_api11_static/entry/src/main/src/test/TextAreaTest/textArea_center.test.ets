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
export default function textArea_center() {
  describe('textArea_center', () : void=> {
    beforeAll(() => {
      console.info("textArea_center beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textArea_center beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/textArea_center",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textArea_center state pages:" + "");
        if (!("textArea_center" == pages.name)) {
          console.info("get textArea_center pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textArea_center page error:" + err);
      }
      console.info("textArea_center beforeEach end");
    });


    
    
    
    /**
     * @tc.number   textArea_center_static_001
     * @tc.name     textArea_center_static_001
     * @tc.desc     textArea_center_static_001
     * @tc.level    Level.LEVEL2
     */
it('textArea_center_static_001', Level.LEVEL2, async (done: ()=>void ) => {

      console.info('[textArea_center_001] START');
      await CommonFunc.sleep(1000);

      if (AppStorage.get<number>("winLeft") == 0) {
        console.log('get click before  Initial value')
        let textArea_01 = CommonFunc.getComponentRect('textArea_center_textArea_01');

        console.log('assert position')
        let y1 = textArea_01.top

        let driver =  Driver.create();
        await CommonFunc.sleep(500);
        await (driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2) as int),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45) as int)
        ) as Promise<void>);
        await CommonFunc.sleep(1000);

        console.log('get click after Initial value')
        let textArea_02 = CommonFunc.getComponentRect('textArea_center_textArea_01');
        let y2 = textArea_02.top


          expect(y1).assertEqual(y2);

        let btn = await driver.findComponent(ON.id('textArea_center_btn'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      }

      done();
    });


    
    
    
    /**
     * @tc.number   textArea_center_static_002
     * @tc.name     textArea_center_static_002
     * @tc.desc     textArea_center_static_002
     * @tc.level    Level.LEVEL2
     */
it('textArea_center_static_002', Level.LEVEL2, async (done: ()=>void ) => {

      console.info('[textArea_center_002] START');
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>("winLeft") == 0) {
        console.log('get click before  Initial value')
        let textArea_01 = CommonFunc.getComponentRect('textArea_center_textArea_01');

        console.log('assert position')
        let y1 = textArea_01.top

        let driver =  Driver.create();
        await CommonFunc.sleep(500);
        await (driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2) as int),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /2 + AppStorage.get<UIContext>('uiContext')!.vp2px(20)) as int)
        ) as Promise<void>);
        await CommonFunc.sleep(1000);

        console.log('get click after Initial value')
        let textArea_02 = CommonFunc.getComponentRect('textArea_center_textArea_01');
        let y2 = textArea_02.top


          expect(y2).assertLess(y1);

        let btn = await driver.findComponent(ON.id('textArea_center_btn'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
      }

      done();
    });


    
    
    
    /**
     * @tc.number   textArea_center_static_003
     * @tc.name     textArea_center_static_003
     * @tc.desc     textArea_center_static_003
     * @tc.level    Level.LEVEL2
     */
it('textArea_center_static_003', Level.LEVEL2, async (done: ()=>void ) => {

      console.info('[textArea_center_003] START');
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>("winLeft") == 0) {
        let driver =  Driver.create()
        await CommonFunc.sleep(1000);
        let btn1 = await driver.findComponent(ON.id('textArea_center_btn'));
        await (btn1?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        console.log('get click before  Initial value')
        let textArea_01 = CommonFunc.getComponentRect('textArea_center_textArea_01');

        console.log('assert position')
        let y5 = textArea_01.bottom

        await CommonFunc.sleep(500);
        await (driver.click(
          (Math.round(textArea_01.left + (textArea_01.right - textArea_01.left) /2) as int),(Math.round(textArea_01.top + (textArea_01.bottom - textArea_01.top) /45 *40) as int)
        ) as Promise<void>);
        await CommonFunc.sleep(1000);

        console.log('get click after Initial value')
        let textArea_02 = CommonFunc.getComponentRect('textArea_center_textArea_01');
        let y6 = textArea_02.bottom


          expect(y6).assertLess(y5);

      }

      done();
    });


  })
}
