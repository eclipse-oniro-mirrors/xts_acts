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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  MouseButton,
  Point
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"

// import { vp2px } from '@ohos.arkui.component'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function bindSelectionMenuTest() {
  describe('bindSelectionMenuTest', () => {
    beforeAll(() => {
      console.info("bindSelectionMenuTest beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("bindSelectionMenuTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SelectionMenuTest/bindSelectionMenuTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindSelectionMenuTest state success " + JSON.stringify(pages));
        // let result = routerInstance.replaceUrl(options);
        routerInstance.pushUrl(options);
        if (!("bindSelectionMenuTest" == pages.name)) {
          console.info("get bindSelectionMenuTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          // console.info("push bindSelectionMenuTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindSelectionMenuTest page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("bindSelectionMenuTest after each called");
    });


    
    /**
     * @tc.number   bindSelectionMenuTest_static_0001
     * @tc.name     bindSelectionMenuTest_static_0001
     * @tc.desc     bindSelectionMenuTest_static_0001
     * @tc.level    Level.LEVEL1
     */
it('bindSelectionMenuTest_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
          console.info('bindSelectionMenuTest bindSelectionMenuTest0001 START');
          await CommonFunc.sleep(1000);
          let Text = await driver.findComponent(ON.id('text'))
          await CommonFunc.sleep(500);
          let point = await (Text?.getBoundsCenter() as Promise<Point>);
          await CommonFunc.sleep(500);
          await (driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT) as Promise<void>);
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('自定义菜单'));
          console.info("[bindSelectionMenuTest0001] end");
          done();
      } catch (error) {
        expect().assertFail();
      }

    });


    
    /**
     * @tc.number   bindSelectionMenuTest_static_0002
     * @tc.name     bindSelectionMenuTest_static_0002
     * @tc.desc     bindSelectionMenuTest_static_0002
     * @tc.level    Level.LEVEL1
     */
it('bindSelectionMenuTest_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
          console.info('bindSelectionMenuTest bindSelectionMenuTest0002 START');
          await CommonFunc.sleep(1000);
          let Text = await driver.findComponent(ON.id('text'))
          await CommonFunc.sleep(500);
          await (Text?.click() as Promise<void>);
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('自定义菜单'));
          console.info("[bindSelectionMenuTest0002] end");
          done();
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   bindSelectionMenuTest_static_0003
     * @tc.name     bindSelectionMenuTest_static_0003
     * @tc.desc     bindSelectionMenuTest_static_0003
     * @tc.level    Level.LEVEL1
     */
it('bindSelectionMenuTest_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
          console.info('bindSelectionMenuTest bindSelectionMenuTest0003 START');
          await CommonFunc.sleep(1000);
          let Text = await driver.findComponent(ON.id('text'))
          await CommonFunc.sleep(500);
          let point = await Text!.getBoundsCenter();
          await CommonFunc.sleep(500);
          await driver.mouseDrag({
            x: Math.round(point.x - UIContext.resolveUIContext()!.vp2px(20)) as int,
            y: Math.round(point.y) as int
          }, { x: Math.round(point.x + UIContext.resolveUIContext()!.vp2px(20)) as int, y: Math.round(point.y) as int },
            600);
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('自定义菜单'));
          console.info("[bindSelectionMenuTest0003] end");
          done();
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   bindSelectionMenuTest_static_0004
     * @tc.name     bindSelectionMenuTest_static_0004
     * @tc.desc     bindSelectionMenuTest_static_0004
     * @tc.level    Level.LEVEL1
     */
it('bindSelectionMenuTest_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
          console.info('bindSelectionMenuTest bindSelectionMenuTest0004 START');
          await CommonFunc.sleep(1000);
          let image = await driver.findComponent(ON.id('image'))
          await CommonFunc.sleep(500);
          let point = await image!.getBoundsCenter();
          await CommonFunc.sleep(500);
          await (driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT) as Promise<void>);
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('自定义菜单'));
          console.info("[bindSelectionMenuTest0004] end");
          done();
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   bindSelectionMenuTest_static_0005
     * @tc.name     bindSelectionMenuTest_static_0005
     * @tc.desc     bindSelectionMenuTest_static_0005
     * @tc.level    Level.LEVEL1
     */
it('bindSelectionMenuTest_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
          console.info('bindSelectionMenuTest bindSelectionMenuTest0005 START');
          await CommonFunc.sleep(1000);
          let image = await driver.findComponent(ON.id('image'))
          await CommonFunc.sleep(500);
          await (image?.longClick() as Promise<void>);
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('自定义菜单'));
          console.info("[bindSelectionMenuTest0005] end");
          done();
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   bindSelectionMenuTest_static_0006
     * @tc.name     bindSelectionMenuTest_static_0006
     * @tc.desc     bindSelectionMenuTest_static_0006
     * @tc.level    Level.LEVEL1
     */
it('bindSelectionMenuTest_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
          console.info('bindSelectionMenuTest bindSelectionMenuTest0006 START');
          await CommonFunc.sleep(1000);
          let image = await driver.findComponent(ON.id('image'))
          await CommonFunc.sleep(500);
          let point = await image!.getBoundsCenter();
          await CommonFunc.sleep(500);
          await driver.mouseDrag({
            x: Math.round(point.x - UIContext.resolveUIContext()!.vp2px(24)) as int,
            y: Math.round(point.y) as int
          }, { x: Math.round(point.x + UIContext.resolveUIContext()!.vp2px(24)) as int, y: Math.round(point.y) as int },
            600);
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('自定义菜单'));
          console.info("[bindSelectionMenuTest0006] end");
          done();
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   bindSelectionMenuTest_static_0007
     * @tc.name     bindSelectionMenuTest_static_0007
     * @tc.desc     bindSelectionMenuTest_static_0007
     * @tc.level    Level.LEVEL1
     */
it('bindSelectionMenuTest_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
          console.info('bindSelectionMenuTest bindSelectionMenuTest0007 START');
          await CommonFunc.sleep(1000);
          let mixed = await driver.findComponent(ON.id('mixed'))
          await CommonFunc.sleep(500);
          let point = await mixed!.getBoundsCenter();
          await CommonFunc.sleep(500);
          await (driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT) as Promise<void>);
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('自定义菜单'));
          console.info("[bindSelectionMenuTest0007] end");
          done();
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   bindSelectionMenuTest_static_0008
     * @tc.name     bindSelectionMenuTest_static_0008
     * @tc.desc     bindSelectionMenuTest_static_0008
     * @tc.level    Level.LEVEL1
     */
it('bindSelectionMenuTest_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
          console.info('bindSelectionMenuTest bindSelectionMenuTest0008 START');
          await CommonFunc.sleep(1000);
          console.info('bindSelectionMenuTest bindSelectionMenuTest0008 START:' + JSON.stringify(ON.id('mixed')));
          let mixed = await driver.findComponent(ON.id('mixed'))
          await CommonFunc.sleep(500);
          await (mixed?.longClick() as Promise<void>);
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('自定义菜单'));
          console.info("[bindSelectionMenuTest0008] end");
          done();
      } catch (error) {
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   bindSelectionMenuTest_static_0009
     * @tc.name     bindSelectionMenuTest_static_0009
     * @tc.desc     bindSelectionMenuTest_static_0009
     * @tc.level    Level.LEVEL1
     */
it('bindSelectionMenuTest_static_0009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let driver = Driver.create();
          console.info('bindSelectionMenuTest bindSelectionMenuTest0009 START');
          await CommonFunc.sleep(1000);
          console.info('bindSelectionMenuTest bindSelectionMenuTest0008 START:' + JSON.stringify(ON.id('mixed')));
          let mixed = await driver.findComponent(ON.id('mixed'))
          await CommonFunc.sleep(500);
          let point = await mixed!.getBoundsCenter();
          await CommonFunc.sleep(500);
          await driver.mouseDrag({
            x: Math.round(point.x - UIContext.resolveUIContext()!.vp2px(20)) as int,
            y: Math.round(point.y) as int
          }, { x: Math.round(point.x + UIContext.resolveUIContext()!.vp2px(50)) as int, y: Math.round(point.y) as int },
            600);
          await CommonFunc.sleep(500);
          driver.assertComponentExist(ON.text('自定义菜单'));
          console.info("[bindSelectionMenuTest0009] end");
          done();
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}