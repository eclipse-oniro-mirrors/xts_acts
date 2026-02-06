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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function textShadowTest() {
  describe('textShadowTest', () => {
    beforeAll(() => {
      console.info("textShadowTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.other.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("textShadowTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/textShadowTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get textShadowTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get textShadowTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textShadowTest page error:" + err);
      }
      console.info("textShadowTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textShadowTest after each called");
    });


    
    
    


/**
     * @tc.number   textShadowTest_static_0001
     * @tc.name     textShadowTest_static_0001
     * @tc.desc     textShadowTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('textShadowTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0001 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle1'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      get!.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<number>('shadowRadius0')).assertEqual(5);
      expect(AppStorage.get<number>('shadowRadius1')).assertEqual(0);
      expect(AppStorage.get<string>('shadowColor0')).assertEqual('#FF000000');
      expect(AppStorage.get<string>('shadowColor1')).assertEqual('#FF000000');
      expect(AppStorage.get<number>('shadowOffsetX0')).assertEqual(-1);
      expect(AppStorage.get<number>('shadowOffsetX1')).assertEqual(0);
      expect(AppStorage.get<number>('shadowOffsetY0')).assertEqual(-1);
      expect(AppStorage.get<number>('shadowOffsetY1')).assertEqual(0);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowRadius1')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowColor1')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetX1')
      AppStorage.delete('shadowOffsetY0')
      AppStorage.delete('shadowOffsetY1')
      console.info("[textShadowTest0001] end");
      done();
    });


    
    
    


/**
     * @tc.number   textShadowTest_static_0002
     * @tc.name     textShadowTest_static_0002
     * @tc.desc     textShadowTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('textShadowTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0002 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle2'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      get!.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<number>('shadowRadius0')).assertEqual(5);
      expect(AppStorage.get<string>('shadowColor0')).assertEqual('#FF000000');
      expect(AppStorage.get<number>('shadowOffsetX0')).assertEqual(2);
      expect(AppStorage.get<number>('shadowOffsetY0')).assertEqual(2);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0002] end");
      done();
    });


    
    
    


/**
     * @tc.number   textShadowTest_static_0003
     * @tc.name     textShadowTest_static_0003
     * @tc.desc     textShadowTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('textShadowTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0003 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle3'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      get!.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<number>('shadowRadius0')).assertEqual(0);
      expect(AppStorage.get<string>('shadowColor0')).assertEqual('#FF000000');
      expect(AppStorage.get<number>('shadowOffsetX0')).assertEqual(0);
      expect(AppStorage.get<number>('shadowOffsetY0')).assertEqual(0);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0003] end");
      done();
    });


    
    
    


/**
     * @tc.number   textShadowTest_static_0004
     * @tc.name     textShadowTest_static_0004
     * @tc.desc     textShadowTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('textShadowTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0004 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle4'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      get!.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<number>('shadowRadius0')).assertEqual(5);
      expect(AppStorage.get<string>('shadowColor0')).assertEqual('#FFFF0000');
      expect(AppStorage.get<number>('shadowOffsetX0')).assertEqual(0);
      expect(AppStorage.get<number>('shadowOffsetY0')).assertEqual(0);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0004] end");
      done();
    });


    
    
    


/**
     * @tc.number   textShadowTest_static_0005
     * @tc.name     textShadowTest_static_0005
     * @tc.desc     textShadowTest_static_0005
     * @tc.level    Level.LEVEL1
     */
it('textShadowTest_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0005 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle5'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      get!.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<number>('shadowRadius0')).assertEqual(0);
      expect(AppStorage.get<string>('shadowColor0')).assertEqual('#FFFF0000');
      expect(AppStorage.get<number>('shadowOffsetX0')).assertEqual(2);
      expect(AppStorage.get<number>('shadowOffsetY0')).assertEqual(0);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0005] end");
      done();
    });


    
    
    


/**
     * @tc.number   textShadowTest_static_0006
     * @tc.name     textShadowTest_static_0006
     * @tc.desc     textShadowTest_static_0006
     * @tc.level    Level.LEVEL1
     */
it('textShadowTest_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textShadowTest0006 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('updateSpanStyle6'))
      await CommonFunc.sleep(500);
      set!.click();
      await CommonFunc.sleep(1000);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      get!.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<number>('shadowRadius0')).assertEqual(5);
      expect(AppStorage.get<string>('shadowColor0')).assertEqual('#FF000000');
      expect(AppStorage.get<number>('shadowOffsetX0')).assertEqual(-1);
      expect(AppStorage.get<number>('shadowOffsetY0')).assertEqual(-1);
      AppStorage.delete('shadowRadius0')
      AppStorage.delete('shadowColor0')
      AppStorage.delete('shadowOffsetX0')
      AppStorage.delete('shadowOffsetY0')
      console.info("[textShadowTest0006] end");
      done();
    });
  })
}