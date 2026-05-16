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


export default function LongPressGestureTemplateTest() {
  describe('LongPressGestureTemplateTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async ():Promise<void> => {
      console.info("LongPressGestureTemplateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LongPressGesture/LongPressGestureTemplate',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get LongPressGestureTemplateTest state pages:" + JSON.stringify(pages));
        if (!("LongPressGestureTemplate" == pages.name)) {
          console.info("get LongPressGestureTemplateTest pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LongPressGestureTemplateTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LongPressGestureTemplateTest page error:" + err);
      }
      console.info("LongPressGestureTemplateTest beforeEach end");
      //done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("LongPressGestureTemplateTest after each called");
    });

    
    
    
/**
     * @tc.number   LongPressGestureTemplateTest_static_0010
     * @tc.name     LongPressGestureTemplateTest_static_0010
     * @tc.desc     LongPressGestureTemplateTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('LongPressGestureTemplateTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LongPressGestureTemplateTest_0010 START');
      await CommonFunc.sleep(1000);
      let FatherObj = CommonFunc.getComponentRectOnScreen('LongPressGestureTemplate_Father');
      let FatherObjHeight = FatherObj.bottom - FatherObj.top
      let FatherObjWidth = FatherObj.right - FatherObj.left
      console.log('LongPressGestureTemplateTest_0010 FatherObj',FatherObj.left,FatherObj.top,FatherObj.right,FatherObj.bottom)
      await CommonFunc.sleep(1000);
      let areaObj = CommonFunc.getComponentRectOnScreen('LongPressGestureTemplate_Click');
      let areaHeight = areaObj.bottom - areaObj.top
      let areaWidth = areaObj.right - areaObj.left
      console.log('LongPressGestureTemplateTest_0010 areaObj',areaObj.left,areaObj.top,areaObj.right,areaObj.bottom)
      console.log('LongPressGestureTemplateTest_0010 areaObj clicked',Math.round(areaObj.left + areaWidth/2),Math.round(areaObj.top + areaHeight/2))
      let timeSpace:number = 3000
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let quyu: Component | null = await driver.findComponent(ON.id('LongPressGestureTemplate_Click'));
      await CommonFunc.sleep(1000);
      let timeA:number = Date.now();
      await (quyu?.longClick() as Promise<void>);
      let timeB:number = Date.now();
      await CommonFunc.sleep(3000);
      let timeC:number = Date.now();
      await (quyu?.longClick() as Promise<void>);
      let timeD:number = Date.now();
      await CommonFunc.sleep(4000);
      let text1 = inspector.getInspectorByKey('LongPressGestureTemplate_Text01');
      let obj1 = JSON.parseJsonElement(text1);
      let time1:number = Number(obj1.getElement('$attrs').getString('content'))
      console.log('LongPressGestureTemplateTest_0010 obj1 $attrs content',obj1.getElement('$attrs').getString('content'),time1)
      let text2 = inspector.getInspectorByKey('LongPressGestureTemplate_Text02');
      let obj2 = JSON.parseJsonElement(text2);
      let time2:number = Number(obj2.getElement('$attrs').getString('content'))
      console.log('LongPressGestureTemplateTest_0010 obj2 $attrs content',obj2.getElement('$attrs').getString('content'),time2)
      console.log('LongPressGestureTemplateTest_0010 obj2 time $attrs content',time1,time2);
      console.log('LongPressGestureTemplateTest_0010 obj2 timeA timeB',timeA,timeB);
      console.log('LongPressGestureTemplateTest_0010 obj2 timeC timeD',timeC,timeD);
      console.log('LongPressGestureTemplateTest_0010 obj2 timeD-timeC',timeD - timeC);
      console.log('LongPressGestureTemplateTest_0010 obj2 timeB-timeA',timeB - timeA);
      console.log('LongPressGestureTemplateTest_0010 obj2 time time2-time1',time2 - time1);
      console.log('LongPressGestureTemplateTest_0010 obj2 time timeSpace',timeSpace);
      let flag:number = time2 - time1 - timeSpace * 1000000
      console.log('LongPressGestureTemplateTest_0010 flag',flag)
      expect( flag <= (16 * 1000000)).assertTrue();
      console.info('LongPressGestureTemplateTest_0010 END');
      done();
    });
  })
}
