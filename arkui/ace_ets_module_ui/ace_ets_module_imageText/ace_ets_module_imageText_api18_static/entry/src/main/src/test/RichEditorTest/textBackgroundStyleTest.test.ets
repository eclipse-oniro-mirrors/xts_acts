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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function textBackgroundStyleTest() {
  describe('textBackgroundStyleTest', () => {
    beforeAll(() => {
      console.info("textBackgroundStyleTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textBackgroundStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/textBackgroundStyleTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textBackgroundStyleTest state pages:" + JSON.stringify(pages));
        if (!("textBackgroundStyleTest" == pages.name)) {
          console.info("get textBackgroundStyleTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textBackgroundStyleTest page error:" + err);
      }
      console.info("textBackgroundStyleTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textBackgroundStyleTest after each called");
    });


    
    /**
     * @tc.number   textBackgroundStyleTest_static_0001
     * @tc.name     textBackgroundStyleTest_static_0001
     * @tc.desc     textBackgroundStyleTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('textBackgroundStyleTest_static_0001', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0001 START');
      await CommonFunc.sleep(1000);
      let get: Component = await driver.findComponent(ON.id('getSpans')) as Component
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('RichEditorTextBackgroundStyleColor')).assertEqual(undefined);
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleRadius')).assertEqual("undefined");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0001] end");
      done();
    });


    
    /**
     * @tc.number   textBackgroundStyleTest_static_0002
     * @tc.name     textBackgroundStyleTest_static_0002
     * @tc.desc     textBackgroundStyleTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('textBackgroundStyleTest_static_0002', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0002 START');
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('updateSpanStyle1')) as Component
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get: Component = await driver.findComponent(ON.id('getSpans')) as Component
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleColor')).assertEqual(undefined);
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleRadius'))
        .assertEqual("undefined");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0002] end");
      done();
    });


    
    /**
     * @tc.number   textBackgroundStyleTest_static_0003
     * @tc.name     textBackgroundStyleTest_static_0003
     * @tc.desc     textBackgroundStyleTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('textBackgroundStyleTest_static_0003', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0003 START');
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('updateSpanStyle2')) as Component
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get: Component = await driver.findComponent(ON.id('getSpans')) as Component
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleColor')).assertEqual("#FFFF0000");
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleRadius'))
        .assertEqual("{\"topLeft\":\"5.00vp\",\"topRight\":\"5.00vp\",\"bottomLeft\":\"5.00vp\",\"bottomRight\":\"5.00vp\"}");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0003] end");
      done();
    });


    
    /**
     * @tc.number   textBackgroundStyleTest_static_0004
     * @tc.name     textBackgroundStyleTest_static_0004
     * @tc.desc     textBackgroundStyleTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('textBackgroundStyleTest_static_0004', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0004 START');
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('updateSpanStyle3')) as Component
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get: Component = await driver.findComponent(ON.id('getSpans')) as Component
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleColor')).assertEqual(undefined);
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleRadius'))
        .assertEqual("{\"topLeft\":\"5.00vp\",\"topRight\":\"5.00vp\",\"bottomLeft\":\"5.00vp\",\"bottomRight\":\"5.00vp\"}");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0004] end");
      done();
    });


    
    /**
     * @tc.number   textBackgroundStyleTest_static_0005
     * @tc.name     textBackgroundStyleTest_static_0005
     * @tc.desc     textBackgroundStyleTest_static_0005
     * @tc.level    Level.LEVEL1
     */
it('textBackgroundStyleTest_static_0005', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0005 START');
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('updateSpanStyle4')) as Component
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get: Component = await driver.findComponent(ON.id('getSpans')) as Component
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleColor')).assertEqual("#FFFF0000");
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleRadius'))
        .assertEqual("{\"topLeft\":\"10.00vp\",\"topRight\":\"5.00vp\",\"bottomLeft\":\"20.00vp\",\"bottomRight\":\"15.00vp\"}");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0005] end");
      done();
    });


    
    /**
     * @tc.number   textBackgroundStyleTest_static_0006
     * @tc.name     textBackgroundStyleTest_static_0006
     * @tc.desc     textBackgroundStyleTest_static_0006
     * @tc.level    Level.LEVEL1
     */
it('textBackgroundStyleTest_static_0006', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0006 START');
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('updateSpanStyle5')) as Component
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get: Component = await driver.findComponent(ON.id('getSpans')) as Component
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleColor')).assertEqual("#FFE0DBEB");
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleRadius'))
        .assertEqual("{}");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0006] end");
      done();
    });


    
    /**
     * @tc.number   textBackgroundStyleTest_static_0007
     * @tc.name     textBackgroundStyleTest_static_0007
     * @tc.desc     textBackgroundStyleTest_static_0007
     * @tc.level    Level.LEVEL1
     */
it('textBackgroundStyleTest_static_0007', Level.LEVEL1, async (done: () => void) => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle textBackgroundStyleTest0007 START');
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('updateSpanStyle6')) as Component
      await CommonFunc.sleep(500);
      await set.click();
      await CommonFunc.sleep(500);
      let get: Component = await driver.findComponent(ON.id('getSpans')) as Component
      await CommonFunc.sleep(500);
      await get.click();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('RichEditorTextBackgroundStyleColor')).assertEqual("#FFF04B3D");
      AppStorage.delete('RichEditorTextBackgroundStyleColor')
      AppStorage.delete('RichEditorTextBackgroundStyleRadius')
      console.info("[textBackgroundStyleTest0007] end");
      done();
    });
  })
}
