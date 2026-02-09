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
import {PointerMatrix, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode} from '@ohos.UiTest';
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
import { Driver, ON, Point } from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function RotationGestureTemplateTest() {
  describe('RotationGestureTemplateTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      console.info("RotationGestureTemplateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RotationGesture/RotationGestureTemplate',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get RotationGestureTemplateTest state pages:" + JSON.stringify(pages));
        if (!("RotationGestureTemplate" == pages.name)) {
          console.info("get RotationGestureTemplateTest pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RotationGestureTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RotationGestureTemplateTest page error:" + err);
      }
      console.info("RotationGestureTemplateTest beforeEach end");
      // done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("RotationGestureTemplateTest after each called");
    });

    
    
    
/**
     * @tc.number   RotationGestureTemplateTest_static_0010
     * @tc.name     RotationGestureTemplateTest_static_0010
     * @tc.desc     RotationGestureTemplateTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('RotationGestureTemplateTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RotationGestureTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let areaObj1 = CommonFunc.getComponentRectOnScreen('RotationGestureTemplate_Click');
      let areaHeight1 = areaObj1.bottom - areaObj1.top
      let areaWidth1 = areaObj1.right - areaObj1.left
      console.log('RotationGestureTemplateTest_0010 areaObj1 start',areaObj1.left,areaObj1.top,areaObj1.right,areaObj1.bottom)
      console.log('RotationGestureTemplateTest_0010 areaObj1 clicked finger[0] start',Math.round(areaObj1.left),Math.round(areaObj1.top))
      console.log('RotationGestureTemplateTest_0010 areaObj1 clicked finger[0] end',Math.round(areaObj1.right),Math.round(areaObj1.top))
      console.log('RotationGestureTemplateTest_0010 areaObj1 clicked finger[1] start',Math.round(areaObj1.right),Math.round(areaObj1.bottom))
      console.log('RotationGestureTemplateTest_0010 areaObj1 clicked finger[1] end',Math.round(areaObj1.left),Math.round(areaObj1.bottom))
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let pointersSize = 120;
      let pointers = PointerMatrix.create(2, pointersSize);
      for (let step = 0; step < pointersSize; step++) {
        pointers.setPoint(0, step, {x: Math.round(areaObj1.left * (pointersSize - step)/pointersSize+ areaObj1.right * (0 + step)/pointersSize) as Int,y: Math.round(areaObj1.top) as Int} as Point)
      }
      for (let step = 0; step < pointersSize; step++) {
        pointers.setPoint(1, step, {x: Math.round(areaObj1.left * (0 + step)/pointersSize+ areaObj1.right * (pointersSize - step)/pointersSize) as Int,y: Math.round(areaObj1.bottom) as Int} as Point)
      }
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(4000);
      let button = await driver.findComponent(ON.id('RotationGestureTemplate_template'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let text1 = inspector.getInspectorByKey('RotationGestureTemplate_Text');
      let obj1 = JSON.parseJsonElement(text1);
      console.log('RotationGestureTemplateTest_0010 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),obj1)
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('templateFlag:true');
      console.info('RotationGestureTemplateTest_0010 END');
      done();
    });
  })
}
