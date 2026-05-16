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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
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
const uiContext = new UIContext();


export default function APIPreDragStatusTest() {
  describe('APIPreDragStatusTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("APIPreDragStatusTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/APIPreDragStatus',
      }
      try {
        const router = AppStorage.get<Router>('router') as Router
        router.clear();
        let pages = router.getState();
        console.info("get APIPreDragStatusTest state pages:" + JSON.stringify(pages));
        if (!("APIPreDragStatus" == pages.name)) {
          console.info("get APIPreDragStatusTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push APIPreDragStatusTest page error:" + err);
      }
      console.info("APIPreDragStatusTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("APIPreDragStatusTest after each called");
    });

    afterAll(() => {
      const router = AppStorage.get<Router>('router') as Router
      // router.back();
    })

    
    
/**
     * @tc.number   APIPreDragStatusTest_static_0010
     * @tc.name     APIPreDragStatusTest_static_0010
     * @tc.desc     APIPreDragStatusTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('APIPreDragStatusTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIPreDragStatusTest_0010 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let obj1 = await driver.findComponent(ON.id('APIPreDragStatusColumn'));
      await CommonFunc.sleep(2000);
      await (obj1?.longClick() as Promise<void>);
      let text2 = inspector.getInspectorByKey('APIPreDragStatusText01');
      await CommonFunc.sleep(2000);
      let obj2 = JSON.parseJsonElement(text2);
      console.log('APIPreDragStatusTest_0010 obj2', obj2)
      console.log('APIPreDragStatusTest_0010 obj2 $attrs content', obj2.getElement('$attrs').getString('content'))
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('ACTION_DETECTING_STATUS');
      console.info('APIPreDragStatusTest_0010 END');
      done();
    });


    
    
/**
     * @tc.number   APIPreDragStatusTest_static_0020
     * @tc.name     APIPreDragStatusTest_static_0020
     * @tc.desc     APIPreDragStatusTest_static_0020
     * @tc.level    Level.LEVEL0
     */
it('APIPreDragStatusTest_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIPreDragStatusTest_0020 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusButton')) as Promise<Component | null>);
      await (obj?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let obj1 = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusColumn')) as Promise<Component | null>);
      await (obj1?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);
      let text2 = inspector.getInspectorByKey('APIPreDragStatusText02');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('APIPreDragStatusTest_0020 obj2', obj2)
      console.log('APIPreDragStatusTest_0020 obj2 $attrs content', obj2.getElement('$attrs').getString('content'))
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('READY_TO_TRIGGER_DRAG_ACTION');
      console.info('APIPreDragStatusTest_0020 END');
      done();
    });


    
    
/**
     * @tc.number   APIPreDragStatusTest_static_0030
     * @tc.name     APIPreDragStatusTest_static_0030
     * @tc.desc     APIPreDragStatusTest_static_0030
     * @tc.level    Level.LEVEL0
     */
it('APIPreDragStatusTest_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIPreDragStatusTest_0030 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusButton')) as Promise<Component | null>);
      await (obj?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let obj1 = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusColumn')) as Promise<Component | null>);
      await (obj1?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);
      let text2 = inspector.getInspectorByKey('APIPreDragStatusText03');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('APIPreDragStatusTest_0030 obj2', obj2)
      console.log('APIPreDragStatusTest_0030 obj2 $attrs content', obj2.getElement('$attrs').getString('content'))
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('PREVIEW_LIFT_STARTED');
      console.info('APIPreDragStatusTest_0030 END');
      done();
    });

    
    
/**
     * @tc.number   APIPreDragStatusTest_static_0040
     * @tc.name     APIPreDragStatusTest_static_0040
     * @tc.desc     APIPreDragStatusTest_static_0040
     * @tc.level    Level.LEVEL0
     */
it('APIPreDragStatusTest_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIPreDragStatusTest_0040 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusButton')) as Promise<Component | null>);
      await (obj?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let obj1 = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusColumn')) as Promise<Component | null>);
      await (obj1?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);

      let text2 = inspector.getInspectorByKey('APIPreDragStatusText04');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('APIPreDragStatusTest_0040 obj2', obj2)
      console.log('APIPreDragStatusTest_0040 obj2 $attrs content', obj2.getElement('$attrs').getString('content'))
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('PREVIEW_LIFT_FINISHED');
      console.info('APIPreDragStatusTest_0040 END');
      done();
    });

    
    
/**
     * @tc.number   APIPreDragStatusTest_static_0050
     * @tc.name     APIPreDragStatusTest_static_0050
     * @tc.desc     APIPreDragStatusTest_static_0050
     * @tc.level    Level.LEVEL0
     */
it('APIPreDragStatusTest_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIPreDragStatusTest_0050 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusButton')) as Promise<Component | null>);
      await (obj?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let obj1 = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusColumn')) as Promise<Component | null>);
      await (obj1?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);
      let text2 = inspector.getInspectorByKey('APIPreDragStatusText05');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('APIPreDragStatusTest_0050 obj2', obj2)
      console.log('APIPreDragStatusTest_0050 obj2 $attrs content', obj2.getElement('$attrs').getString('content'))
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('PREVIEW_LANDING_STARTED');
      console.info('APIPreDragStatusTest_0050 END');
      done();
    });


    
    
/**
     * @tc.number   APIPreDragStatusTest_static_0060
     * @tc.name     APIPreDragStatusTest_static_0060
     * @tc.desc     APIPreDragStatusTest_static_0060
     * @tc.level    Level.LEVEL0
     */
it('APIPreDragStatusTest_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIPreDragStatusTest_0060 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let obj = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusButton')) as Promise<Component | null>);
      await (obj?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let obj1 = await (scrollBar?.scrollSearch(ON.id('APIPreDragStatusColumn')) as Promise<Component | null>);
      await (obj1?.longClick() as Promise<void>);
      await CommonFunc.sleep(2000);
      let text2 = inspector.getInspectorByKey('APIPreDragStatusText06');
      let obj2 = JSON.parseJsonElement(text2);
      console.log('APIPreDragStatusTest_0060 obj2', obj2)
      console.log('APIPreDragStatusTest_0060 obj2 $attrs content', obj2.getElement('$attrs').getString('content'))
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('PREVIEW_LANDING_FINISHED');
      console.info('APIPreDragStatusTest_0060 END');
      done();
    });


  })
}
