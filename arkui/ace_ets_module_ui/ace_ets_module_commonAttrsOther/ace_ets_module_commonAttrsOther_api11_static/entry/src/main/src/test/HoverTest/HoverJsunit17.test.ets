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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: String = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function HoverJsunit17() {

  describe('HoverJsunit17', () => {
    beforeAll(async (): Promise<void> => {
      console.info("HoverJsunit5 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("HoverJsunit17 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Hover/Hover17',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get HoverJsunit17 state pages:" + JSON.stringify(pages));
        if (!("Hover17" == pages.name)) {
          console.info("get HoverJsunit17 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push HoverJsunit17 page error:" + err);
      }
      console.info("HoverJsunit17 beforeEach end");
    });
    
    
    
/**
     * @tc.number   HoverJsunit_static_0100
     * @tc.name     HoverJsunit_static_0100
     * @tc.desc     HoverJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('HoverJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('HoverJsunit_0200 START');
      let driver = Driver.create()
      let uiContext = AppStorage.get<UIContext>('uiContent')!;
      await driver.mouseMoveTo({
        x: Math.round((AppStorage.get<number>("winLeft") ?? 0) + uiContext.vp2px(100)) as int,
        y: Math.round((AppStorage.get<number>("winTop") ?? 0) + uiContext.vp2px(100)) as int
      })
      await CommonFunc.sleep(1000);
      let strJsonA = inspector.getInspectorByKey('hoverA17');
      await CommonFunc.sleep(1000);
      let objA = JSON.parseJsonElement(strJsonA);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(objA));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(objA.getElement('$attrs').getString('content')));
      expect(objA.getElement('$attrs').getString('content')).assertEqual('Atrue');

      let strJsonB = inspector.getInspectorByKey('hoverB17');
      await CommonFunc.sleep(1000);
      let objB = JSON.parseJsonElement(strJsonB);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(objB));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(objB.getElement('$attrs').getString('content')));
      expect(objB.getElement('$attrs').getString('content')).assertEqual('Bfalse');
      console.info('[HoverJsunit_0200] END');
      done();
    });

    
    
/**
     * @tc.number   HoverJsunit_static_0200
     * @tc.name     HoverJsunit_static_0200
     * @tc.desc     HoverJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('HoverJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('HoverJsunit_0200 START');
      let driver = Driver.create()
      let uiContext = AppStorage.get<UIContext>('uiContent')!;
      let buttonCl = await driver.findComponent(ON.id('hoverBColumn'));
      await CommonFunc.sleep(500);
      let point = await (buttonCl?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo({
        x: Math.round(point.x + uiContext.vp2px(100)).toInt(),
        y: Math.round(point.y + uiContext.vp2px(100)).toInt()
      })
      await CommonFunc.sleep(1000);
      let strJsonA = inspector.getInspectorByKey('hoverA17');
      await CommonFunc.sleep(1000);
      let objA = JSON.parseJsonElement(strJsonA);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(objA));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(objA.getElement('$attrs').getString('content')));
      expect(objA.getElement('$attrs').getString('content')).assertEqual('Afalse');

      let strJsonB = inspector.getInspectorByKey('hoverB17');
      await CommonFunc.sleep(1000);
      let objB = JSON.parseJsonElement(strJsonB);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(objB));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(objB.getElement('$attrs').getString('content')));
      expect(objB.getElement('$attrs').getString('content')).assertEqual('Btrue');
      console.info('[HoverJsunit_0200] END');
      done();
    });


    
    
/**
     * @tc.number   HoverJsunit_static_0300
     * @tc.name     HoverJsunit_static_0300
     * @tc.desc     HoverJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('HoverJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('HoverJsunit_0300 START');
      let uiContext = AppStorage.get<UIContext>('uiContent')!;
      let driver = Driver.create()
      let buttonCl = await driver.findComponent(ON.id('hoverBColumn'));
      await CommonFunc.sleep(500);
      let point = await (buttonCl?.getBoundsCenter() as Promise<Point>);
      await driver.mouseMoveTo({
        x: Math.round(point.x + uiContext.vp2px(100)) as int,
        y: Math.round(point.y + uiContext.vp2px(100)) as int
      })
      await CommonFunc.sleep(1000);
      let strJsonA = inspector.getInspectorByKey('hoverA17');
      await CommonFunc.sleep(1000);
      let objA = JSON.parseJsonElement(strJsonA);
      console.info("[HoverJsunit_0300] component obj is: " + JSON.stringify(objA));
      console.info("[HoverJsunit_0300] title: " + JSON.stringify(objA.getElement('$attrs').getString('content')));
      expect(objA.getElement('$attrs').getString('content')).assertEqual('Afalse');

      let strJsonB = inspector.getInspectorByKey('hoverB17');
      await CommonFunc.sleep(1000);
      let objB = JSON.parseJsonElement(strJsonB);
      console.info("[HoverJsunit_0300] component obj is: " + JSON.stringify(objB));
      console.info("[HoverJsunit_0300] title: " + JSON.stringify(objB.getElement('$attrs').getString('content')));
      expect(objB.getElement('$attrs').getString('content')).assertEqual('Btrue');
      console.info('[HoverJsunit_0300] END');
      done();
    });


  })
}

