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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function overlayManager() {
  describe('overlayManager', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api15.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info("overlayManager beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/overlayManager",
      }
      try {
        const overlayManager = AppStorage.get<Router>("router") as Router
        overlayManager.clear();
        let pages:router.RouterState = overlayManager.getState();
        console.info("get overlayManager state pages: " + JSON.stringify(pages));
        if (!("overlayManager" == pages.name)) {
          console.info("get overlayManager state pages.name: " + JSON.stringify(pages.name));
          // let result = await overlayManager.pushUrl(options);
          overlayManager.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push overlayManager success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push overlayManager page error: " + err);
        expect().assertFail();
      }
    });



    
    

/**
     * @tc.number   overlayManager_static_0100
     * @tc.name     overlayManager_static_0100
     * @tc.desc     overlayManager_static_0100
     * @tc.level    Level.LEVEL1
     */
it('overlayManager_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('overlayManager_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('set')) ) as Component;
      await ( btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1: Component = ( await driver.findComponent(ON.id('get')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = inspector.getInspectorByKey('text');
      console.info("[overlayManager_static_0100] attrs is: " + JSON.stringify(JSON.parseJsonElement(text).getElement('$attrs').getString('content')))
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('true')
      console.info('[overlayManager_static_0100] END');
      done();
    });


    
    

/**
     * @tc.number   overlayManager_static_0200
     * @tc.name     overlayManager_static_0200
     * @tc.desc     overlayManager_static_0200
     * @tc.level    Level.LEVEL1
     */
it('overlayManager_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('overlayManager_static_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let btn0: Component = ( await driver.findComponent(ON.id('fal')) ) as Component;
      await ( btn0?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let btn: Component = ( await driver.findComponent(ON.id('set')) ) as Component;
      await ( btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1: Component = ( await driver.findComponent(ON.id('get')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let text = inspector.getInspectorByKey('text');
      console.info("[overlayManager_static_0200] attrs is: " + JSON.stringify(JSON.parseJsonElement(text).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('true');
      console.info('[overlayManager_static_0200] END');
      done();
    });
  })
}