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

import { describe, beforeEach, it, expect, Level, beforeAll } from "../../../../hypium/index"
import router from '@ohos.router';
import { Driver, ON, Point,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function TextMenuItemId() {
  describe('TextMenuItemId', () => {
    beforeAll(() => {
      console.info("TextMenuItemId beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api16.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextMenuItemId beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/TextMenuItemId",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextMenuItemId state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get TextMenuItemId pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextMenuItemId page error:" + err);
      }
      console.info("TextMenuItemId beforeEach end");
    });

    
    /**
     * @tc.number   TextMenuItemId_static_0001
     * @tc.name     TextMenuItemId_static_0001
     * @tc.desc     TextMenuItemId_static_0001
     * @tc.level    Level.LEVEL0
     */
it('TextMenuItemId_static_0001', Level.LEVEL0, async (done: ()=>void) => {
      console.info("[TextMenuItemId0001] start");
      try {
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0001 START');
        await CommonFunc.sleep(500);
        let text = await (driver.findComponent(ON.id('text')) as Promise<Component>);
        await CommonFunc.sleep(500);
        let point :Point= await text.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
        console.info("[TextMenuItemId0001] end");
      }catch(error) {
        expect().assertFail();
      }

      done();
    });

    
    /**
     * @tc.number   TextMenuItemId_static_0002
     * @tc.name     TextMenuItemId_static_0002
     * @tc.desc     TextMenuItemId_static_0002
     * @tc.level    Level.LEVEL0
     */
it('TextMenuItemId_static_0002', Level.LEVEL0, async (done: ()=>void) => {
      try {
        console.info("[TextMenuItemId0002] start");
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0002 START');
        await CommonFunc.sleep(500);
        let textArea = await (driver.findComponent(ON.id('textArea')) as Promise<Component>);
        await CommonFunc.sleep(500);
        let point :Point= await textArea.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
        console.info("[TextMenuItemId0002] end");
      }catch(error) {
        expect().assertFail();
      }

      done();
    });

    
    /**
     * @tc.number   TextMenuItemId_static_0003
     * @tc.name     TextMenuItemId_static_0003
     * @tc.desc     TextMenuItemId_static_0003
     * @tc.level    Level.LEVEL0
     */
it('TextMenuItemId_static_0003', Level.LEVEL0, async (done: ()=>void) => {
      console.info("[TextMenuItemId0003] start");

      try {
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0003 START');
        await CommonFunc.sleep(500);
        let textInput = await (driver.findComponent(ON.id('textInput')) as Promise<Component>);
        await CommonFunc.sleep(500);
        let point :Point= await textInput.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
      }catch(error) {
        expect().assertFail();
      }
      console.info("[TextMenuItemId0003] end");
      done();
    });

    
    /**
     * @tc.number   TextMenuItemId_static_0004
     * @tc.name     TextMenuItemId_static_0004
     * @tc.desc     TextMenuItemId_static_0004
     * @tc.level    Level.LEVEL0
     */
it('TextMenuItemId_static_0004', Level.LEVEL0, async (done: ()=>void) => {
      console.info("[TextMenuItemId0004] start");
      try {
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0004 START');
        await CommonFunc.sleep(500);
        let richEditor = await (driver.findComponent(ON.id('richEditor')) as Promise<Component>);
        await CommonFunc.sleep(500);
        let point :Point= await richEditor.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
      }catch(error) {
        expect().assertFail();
      }

      console.info("[TextMenuItemId0004] end");
      done();
    });

    
    /**
     * @tc.number   TextMenuItemId_static_0005
     * @tc.name     TextMenuItemId_static_0005
     * @tc.desc     TextMenuItemId_static_0005
     * @tc.level    Level.LEVEL0
     */
it('TextMenuItemId_static_0005', Level.LEVEL0, async (done: ()=>void) => {
      console.info("[TextMenuItemId0005] start");

      try {
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0005 START');
        await CommonFunc.sleep(500);
        let search = await (driver.findComponent(ON.id('search')) as Promise<Component>);
        await CommonFunc.sleep(500);
        let point :Point= await search.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
      }catch(error) {
        expect().assertFail();
      }
      console.info("[TextMenuItemId0005] end");
      done();
    });
  })
}