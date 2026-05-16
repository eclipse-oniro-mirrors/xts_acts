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

export default function HoverJsunit5() {



  describe('HoverJsunit5', () => {
    beforeAll(async (): Promise<void> => {
      console.info("HoverJsunit5 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsOther.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("HoverJsunit5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Hover/Hover5',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get HoverJsunit5 state pages:" + JSON.stringify(pages));
        if (!("Hover5" == pages.name)) {
          console.info("get HoverJsunit5 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push HoverJsunit5 page error:" + err);
      }
      console.info("HoverJsunit5 beforeEach end");
    });

    afterAll(async (): Promise<void> => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.back();
    })

    
    
/**
     * @tc.number   HoverJsunit_static_0102
     * @tc.name     HoverJsunit_static_0102
     * @tc.desc     HoverJsunit_static_0102
     * @tc.level    Level.LEVEL0
     */
it('HoverJsunit_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HoverJsunit_0200 START');
      let uiContext = AppStorage.get<UIContext>('uiContent')!;
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      await driver.mouseMoveTo({
        x: Math.round((AppStorage.get<number>("winLeft") ?? 0) + uiContext.vp2px(100)) as int,
        y: Math.round((AppStorage.get<number>("winTop") ?? 0) + uiContext.vp2px(100)) as int
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('hover5');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('AtrueBfalse');
      console.info('[HoverJsunit_0200] END');
      done();
    });

    
    
/**
     * @tc.number   HoverJsunit_static_0202
     * @tc.name     HoverJsunit_static_0202
     * @tc.desc     HoverJsunit_static_0202
     * @tc.level    Level.LEVEL0
     */
it('HoverJsunit_static_0202', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HoverJsunit_0200 START');
      let uiContext = AppStorage.get<UIContext>('uiContent')!;
      let driver = Driver.create()
      let buttonCl = await driver.findComponent(ON.id('columnBB'));
      await CommonFunc.sleep(1000);
      let point = await (buttonCl?.getBoundsCenter() as Promise<Point>)
      await CommonFunc.sleep(2000);
      await driver.mouseMoveTo({
        x: Math.round(point.x + uiContext.vp2px(100)) as int,
        y: Math.round(point.y + uiContext.vp2px(100)) as int
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('hover5');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[HoverJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('AfalseBtrue');
      console.info('[HoverJsunit_0200] END');
      done();
    });

    
    
/**
     * @tc.number   HoverJsunit_static_0302
     * @tc.name     HoverJsunit_static_0302
     * @tc.desc     HoverJsunit_static_0302
     * @tc.level    Level.LEVEL0
     */
it('HoverJsunit_static_0302', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HoverJsunit_0300 START');
      let uiContext = AppStorage.get<UIContext>('uiContent')!;
      let driver = Driver.create()
      let buttonCl = await driver.findComponent(ON.id('columnBB'));
      await CommonFunc.sleep(1000);
      let point = await (buttonCl?.getBoundsCenter() as Promise<Point>)
      await CommonFunc.sleep(2000);
      await driver.mouseMoveTo({
        x: Math.round(point.x + uiContext.vp2px(100)) as int,
        y: Math.round(point.y + uiContext.vp2px(100)) as int
      })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('hover5');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[HoverJsunit_0300] component obj is: " + JSON.stringify(obj));
      console.info("[HoverJsunit_0300] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('AfalseBtrue');
      console.info('[HoverJsunit_0300] END');
      done();
    });


  })
}
