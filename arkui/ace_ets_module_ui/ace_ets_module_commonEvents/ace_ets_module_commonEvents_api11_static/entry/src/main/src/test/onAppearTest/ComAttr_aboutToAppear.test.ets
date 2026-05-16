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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  MouseButton,
  ON,
  Point,
  PointerMatrix,
  ResizeDirection,
  UiDirection,
  UIElementInfo,
  UIEventObserver,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11.static/EntryAbility';

export default function aboutToAppearTest() {
  describe('aboutToAppearTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("aboutToAppearTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAppear/aboutToAppear',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get aboutToAppearTest state pages:" + JSON.stringify(pages));
        if (!("aboutToAppear" == pages.name)) {
          console.info("get aboutToAppearTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push aboutToAppearTest page error:" + err);
      }
      console.info("aboutToAppearTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("aboutToAppearTest after each called");
    });

    
    
/**
     * @tc.number   aboutToAppearTest_static_0100
     * @tc.name     aboutToAppearTest_static_0100
     * @tc.desc     aboutToAppearTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('aboutToAppearTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[aboutToAppearTest_0100] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('aboutToAppear'));
      await CommonFunc.sleep(1000);
      await (button?.longClick() as Promise<void>);
      await CommonFunc.sleep(3000);

      let closeButton = await driver.findComponent(ON.id('close'))!;
      await CommonFunc.sleep(2000);
      let point = await (closeButton?.getBoundsCenter() as Promise<Point>);
      await CommonFunc.sleep(2000);
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('aboutToAppear');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[aboutToAppearTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[aboutToAppearTest_0100] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFFF0000");
      console.info('[aboutToAppearTest_0100] END');
      await CommonFunc.sleep(3000);
      done();
    });

    
    
/**
     * @tc.number   aboutToAppearTest_static_0200
     * @tc.name     aboutToAppearTest_static_0200
     * @tc.desc     aboutToAppearTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('aboutToAppearTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[aboutToAppearTest_0200] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('aboutToAppear'));
      await CommonFunc.sleep(1000);
      await (button?.longClick() as Promise<void>);
      await CommonFunc.sleep(3000);
      let closeButton: Component | null = await driver.findComponent(ON.id('close'))!;
      let point = await (closeButton?.getBoundsCenter() as Promise<Point>);
      await CommonFunc.sleep(1000);
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('aboutToAppear');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[aboutToAppearTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[aboutToAppearTest_0200] component obj is: " +
      JSON.stringify(obj.getElement('$attrs').getString('fontColor')));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FF0000FF");
      console.info('[aboutToAppearTest_0200] END');
      await CommonFunc.sleep(3000);
      done();
    });
  })
}
