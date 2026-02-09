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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function PanGestureExampleTemplateTest() {
  describe('PanGestureExampleTemplateTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      console.info("PanGestureExampleTemplateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PanGesture/PanGestureExampleTemplate',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get PanGestureExampleTemplateTest state pages:" + JSON.stringify(pages));
        if (!("PanGestureExampleTemplate" == pages.name)) {
          console.info("get PanGestureExampleTemplateTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PanGestureExampleTemplateTest page error:" + err);
      }
      console.info("PanGestureExampleTemplateTest beforeEach end");
      // done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("PanGestureExampleTemplateTest after each called");
    });

    
    
    
/**
     * @tc.number   PanGestureExampleTemplateTest_static_0010
     * @tc.name     PanGestureExampleTemplateTest_static_0010
     * @tc.desc     PanGestureExampleTemplateTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('PanGestureExampleTemplateTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PanGestureExampleTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let areaObj1 = CommonFunc.getComponentRectOnScreen('PanGestureExampleTemplate_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('PanGestureExampleTemplateTest_0010 areaObj1',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('PanGestureExampleTemplateTest_0010 areaObj1 clicked start',Math.round(areaObj1.left + areaWidth1 * 0.2),Math.round(areaObj1.top + areaHeight1/2))
      console.log('PanGestureExampleTemplateTest_0010 areaObj1 clicked end',Math.round(areaObj1.left + areaWidth1 * 0.8),Math.round(areaObj1.top + areaHeight1/2))

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      await ((driver.swipe(Math.round(areaObj1.left + areaWidth1 * 0.2) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int,Math.round(areaObj1.left + areaWidth1 * 0.8) as Int,Math.round(areaObj1.top + areaHeight1/2) as Int)) as Promise<void>)
      await CommonFunc.sleep(4000);
      let button = await driver.findComponent(ON.id('PanGestureExampleTemplate_template'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(3000);

      let text1 = inspector.getInspectorByKey('PanGestureExampleTemplate_Text');
      let obj1 = JSON.parseJsonElement(text1);
      console.log('PanGestureExampleTemplateTest_0010 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),obj1)
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('templateFlag:true');
      console.info('PanGestureExampleTemplateTest_0010 END');
      done();
    });
  })
}
