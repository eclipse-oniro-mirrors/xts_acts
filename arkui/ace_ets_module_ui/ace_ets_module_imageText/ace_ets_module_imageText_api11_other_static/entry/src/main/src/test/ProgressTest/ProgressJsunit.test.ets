'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Color, ProgressStyle, ProgressType } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;



export default function ProgressJsunit() {
  describe('ProgressJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ProgressJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/ProgressPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ProgressJsunit state pages:" + JSON.stringify(pages));
        if (!("ProgressPage" == pages.name)) {
          console.info("get ProgressJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ProgressJsunit page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push ProgressJsunit page error: " + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   ProgressJsunit_static_0100
     * @tc.name     ProgressJsunit_static_0100
     * @tc.desc     ProgressJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ProgressJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Get the information of the Progress component
      console.info('[ProgressJsunit_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('20.000000');
      expect(obj.getElement('$attrs').getString('total')).assertEqual('100.000000');
      expect(obj.getElement('$attrs').getString("type")).assertEqual('ProgressStyle.Linear');
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FF808080');
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('pro3');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ProgressJsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('strokeWidth')).assertEqual('15.00vp');
      expect(obj1.getElement('$attrs').getString('scaleCount')).assertEqual('15');
      expect(obj1.getElement('$attrs').getString('scaleWidth')).assertEqual('5.00vp');
      await CommonFunc.sleep(1000);
      console.info('[ProgressJsunit_static_0100] END');
      done();
    });

    
/**
     * @tc.number   ProgressJsunit_static_0200
     * @tc.name     ProgressJsunit_static_0200
     * @tc.desc     ProgressJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ProgressJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the total value of the Progress component
      console.info('[ProgressJsunit_static_0200] START');
      AppStorage.setOrCreate<number>('total', 200);
      await CommonFunc.sleep(2000);
      // Get the total value of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('total')).assertEqual('200.000000');
      console.info('[ProgressJsunit_static_0200] END');
      done();
    });


    
/**
     * @tc.number   ProgressJsunit_static_0300
     * @tc.name     ProgressJsunit_static_0300
     * @tc.desc     ProgressJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ProgressJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the type of the Progress component
      console.info('[ProgressJsunit_static_0300] START');
      AppStorage.setOrCreate<ProgressType>('type', ProgressType.Capsule);
      await CommonFunc.sleep(2000);
      // Get the type of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("type")).assertEqual('ProgressStyle.Capsule');
      console.info('[ProgressJsunit_static_0300] END');
      done();
    });

    
/**
     * @tc.number   ProgressJsunit_static_0400
     * @tc.name     ProgressJsunit_static_0400
     * @tc.desc     ProgressJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ProgressJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the color of the Progress component
      console.info('[ProgressJsunit_static_0400] START');
      AppStorage.setOrCreate<Color>('color', Color.Blue);
      await CommonFunc.sleep(2000);
      // Get the color of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      // 和1.1区别，设置了蓝色却和别的色值比较
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FF0000FF');
      await CommonFunc.sleep(1000);
      console.info('[ProgressJsunit_static_0400] END');
      done();
    });

    
/**
     * @tc.number   ProgressJsunit_static_0500
     * @tc.name     ProgressJsunit_static_0500
     * @tc.desc     ProgressJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
it('ProgressJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the backgroundColor of the Progress component
      console.info('[ProgressJsunit_static_0500] START');
      AppStorage.setOrCreate<Color>('backColor', Color.Black);
      await CommonFunc.sleep(2000);
      // Get the backgroundColor of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF000000');
      console.info('[ProgressJsunit_static_0500] END');
      done();
    });

    
/**
     * @tc.number   ProgressJsunit_static_0600
     * @tc.name     ProgressJsunit_static_0600
     * @tc.desc     ProgressJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
it('ProgressJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the style of the Progress component
      console.info('[ProgressJsunit_static_0600] START');
      AppStorage.setOrCreate<ProgressType>('type', ProgressType.ScaleRing);
      await CommonFunc.sleep(2000);

      // Get the value of the modified style attribute
      let strJson = inspector.getInspectorByKey('pro3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunProgressJsunit_static_0600it_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("type")).assertEqual('ProgressStyle.ScaleRing');
      console.info('[ProgressJsunit_static_0600] END');
      done();
    });

    
/**
     * @tc.number   ProgressJsunit_static_0700
     * @tc.name     ProgressJsunit_static_0700
     * @tc.desc     ProgressJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
it('ProgressJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the value of the Progress component
      console.info('[ProgressJsunit_static_0700] START');
      AppStorage.setOrCreate<number>('value', 20);
      await CommonFunc.sleep(2000);
      // Get the value of the Progress component
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('20.000000');
      console.info('[ProgressJsunit_static_0700] END');
      done();
    });

    
/**
     * @tc.number   ProgressJsunit_static_0800
     * @tc.name     ProgressJsunit_static_0800
     * @tc.desc     ProgressJsunit_static_0800
     * @tc.level    Level.LEVEL1
     */
it('ProgressJsunit_static_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Illegal modification of the value of the Progress component
      console.info('[ProgressJsunit_static_0800] START');
      AppStorage.setOrCreate<number>('value', -20);
      await CommonFunc.sleep(1500);
      // Get the value of Progress component after illegal modification
      let strJson = inspector.getInspectorByKey('pro1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_0800] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('value')).assertEqual('0.000000');
      AppStorage.setOrCreate<number>('value', 400);
      await CommonFunc.sleep(1500);
      // Get the value of the Progress component after illegal modification again
      let strJson1 = inspector.getInspectorByKey('pro1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ProgressJsunit_static_0800] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('value')).assertEqual('200.000000');
      console.info('[ProgressJsunit_static_0800] END');
      done();
    });

    
/**
     * @tc.number   ProgressJsunit_static_0900
     * @tc.name     ProgressJsunit_static_0900
     * @tc.desc     ProgressJsunit_static_0900
     * @tc.level    Level.LEVEL1
     */
it('ProgressJsunit_static_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Get the default value of the Progress component
      console.info('[ProgressJsunit_static_0900] START');
      let strJson = inspector.getInspectorByKey('pro2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressJsunit_static_0900] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('value')).assertEqual('10.000000');
      expect(obj.getElement('$attrs').getString('total')).assertEqual('100.000000');
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ProgressStyle.Linear');
      console.info('[ProgressJsunit_static_0900] END');
      done();
    });
  })
}
