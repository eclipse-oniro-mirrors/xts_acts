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
import { Driver, ON, MouseButton, Point } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Router,UIContext } from '@ohos.arkui.UIContext';
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
let testAbilityContext: common.UIAbilityContext;

export default function SelectionMenuOptions() {
  describe('SelectionMenuOptions', () => {
    beforeAll(() => {
      console.info("SelectionMenuOptions beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api15.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("SelectionMenuOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/SelectionMenuOptions",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectionMenuOptions state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get SelectionMenuOptions pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SelectionMenuOptions page error:" + err);
      }
      console.info("SelectionMenuOptions beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SelectionMenuOptions after each called");
    });
    /**
     * @tc.number   SelectionMenuOptions_static_0003
     * @tc.name     SelectionMenuOptions_static_0003
     * @tc.desc     SelectionMenuOptions_static_0003
     * @tc.level    Level.LEVEL1
     */
    it('SelectionMenuOptions_static_0003', Level.LEVEL1, async (done: () => void) => {

      try{
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0003 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('richEditor'))
        await CommonFunc.sleep(500);
        let point: Point = await (richEditor?.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(500);
        await driver.mouseDrag({
          x: Math.round(point.x - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))) as int, y: Math.round(point.y) as int
        }, {
          x: Math.round(point.x + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))) as int, y: Math.round(point.y) as int
        }, 600);
        await CommonFunc.sleep(2000);
        try{
          await driver.assertComponentExist(ON.text('自定义菜单'));
        }catch(e:Error){}
      }catch(e){
        expect().assertFail();
      }
      console.info("[SelectionMenuOptions0003] end");
      done();
    });

    /**
         * @tc.number   SelectionMenuOptions_static_0006
         * @tc.name     SelectionMenuOptions_static_0006
         * @tc.desc     SelectionMenuOptions_static_0006
         * @tc.level    Level.LEVEL1
         */
    it('SelectionMenuOptions_static_0006', Level.LEVEL1, async (done: () => void) => {

      try{
        let driver = Driver.create();
        console.info('SelectionMenuOptions SelectionMenuOptions0006 START');
        await CommonFunc.sleep(1000);
        let update = await driver.findComponent(ON.id('update'))
        await CommonFunc.sleep(500);
        await (update?.click() as Promise<void>);
        await CommonFunc.sleep(500);
        let image = await driver.findComponent(ON.id('image'))
        await CommonFunc.sleep(500);
        let point: Point = await (image?.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(500);
        await driver.mouseDrag({
          x: Math.round(point.x + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(24))) as int, y: Math.round(point.y) as int
        }, {
          x: Math.round(point.x - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(26))) as int, y: Math.round(point.y) as int
        }, 600);
        await CommonFunc.sleep(2000);
        try{
          await driver.assertComponentExist(ON.text('自定义菜单'));
        }catch(e:Error){}
        console.info("[SelectionMenuOptions0006] end");
        done();
      }catch(e){
        expect().assertFail();
        done();
      }
    });

    /**
         * @tc.number   SelectionMenuOptions_static_0009
         * @tc.name     SelectionMenuOptions_static_0009
         * @tc.desc     SelectionMenuOptions_static_0009
         * @tc.level    Level.LEVEL1
         */
    it('SelectionMenuOptions_static_0009', Level.LEVEL1, async (done: () => void) => {
      try{
      let driver = Driver.create();
      console.info('SelectionMenuOptions SelectionMenuOptions0009 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('update'))
      await CommonFunc.sleep(500);
      await (update?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let mixed = await driver.findComponent(ON.id('mixed'))
      await CommonFunc.sleep(500);
      let point: Point = await (mixed?.getBoundsCenter() as Promise<Point>);
      await CommonFunc.sleep(500);
      await driver.mouseDrag({
        x: Math.round(point.x - Number(AppStorage.get<UIContext>('uiContext')?.vp2px(20))) as int, y: Math.round(point.y) as int
      }, {
        x: Math.round(point.x + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(50))) as int, y: Math.round(point.y) as int
      }, 600);
      await CommonFunc.sleep(2000);

        try{
          await driver.assertComponentExist(ON.text('自定义菜单'));
        }catch(e){}
      }catch(e:Error){
        expect().assertFail();
      }
      console.info("[SelectionMenuOptions0009] end");
      done();
    });
  })
}