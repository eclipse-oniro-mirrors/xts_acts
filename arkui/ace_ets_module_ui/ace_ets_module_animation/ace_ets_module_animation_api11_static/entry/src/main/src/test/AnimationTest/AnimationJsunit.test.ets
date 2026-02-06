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
import emitter from '@ohos.events.emitter'
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Message, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import curves from '@ohos.curves';
import { PlayMode } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function AnimationJsunit() {
  describe('AnimationJsunit', () => {

    beforeAll(() => {
      console.info("playModeReverseTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("playModeReverseTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Animation/Animation",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get playModeReverseTest state pages:" + JSON.stringify(pages));
        if (!("Animation" == pages.name)) {
          console.info("get playModeReverseTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push playModeReverseTest page error:" + err);
      }
      console.info("playModeReverseTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("overlay after each called");
    });
    
    /**
     * @tc.number   AnimationJsunit_static_0100
     * @tc.name     AnimationJsunit_static_0100
     * @tc.desc     AnimationJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('AnimationJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[AnimationJsunit_0100] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await (scrollBar?.scrollSearch(ON.id('interpolating-springn')) as Promise<Component>);
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let button_Bottom2 = await (scrollBar?.scrollSearch(ON.id('create')) as Promise<Component>);
      await button_Bottom2.click();
      await CommonFunc.sleep(1000);
      let button_Bottom3 = await (scrollBar?.scrollSearch(ON.id('play')) as Promise<Component>);
      await button_Bottom3.click();
      await CommonFunc.sleep(1000);
      let finishBtn = await (scrollBar?.scrollSearch(ON.id('finish')) as Promise<Component>);
      await finishBtn.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onframe-value');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[AnimationJsunit_0100] obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content') > '100').assertTrue();
      console.info('[AnimationJsunit_0100] END');
      done();
    });

    
    /**
     * @tc.number   AnimationJsunit_static_0200
     * @tc.name     AnimationJsunit_static_0200
     * @tc.desc     AnimationJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('AnimationJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[AnimationJsunit_0200] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await (scrollBar?.scrollSearch(ON.id('interpolating-springn')) as Promise<Component>);
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let button_Bottom2 = await (scrollBar?.scrollSearch(ON.id('create')) as Promise<Component>);
      await button_Bottom2.click();
      await CommonFunc.sleep(1000);
      let button_Bottom3 = await (scrollBar?.scrollSearch(ON.id('play')) as Promise<Component>);
      await button_Bottom3.click();
      await CommonFunc.sleep(1000);
      let button_Bottom4 = await (scrollBar?.scrollSearch(ON.id('cancel')) as Promise<Component>);
      await button_Bottom4.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onframe-value');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[AnimationJsunit_0200] obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content') === '200').assertTrue();
      console.info('[AnimationJsunit_0200] END');
      done();
    });


    
    /**
     * @tc.number   AnimationJsunit_static_0300
     * @tc.name     AnimationJsunit_static_0300
     * @tc.desc     AnimationJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('AnimationJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[AnimationJsunit_0300] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await (scrollBar?.scrollSearch(ON.id('interpolating-springn')) as Promise<Component>);
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let button_Bottom2 = await (scrollBar?.scrollSearch(ON.id('create')) as Promise<Component>);
      await button_Bottom2.click();
      await CommonFunc.sleep(1000);
      let button_Bottom3 = await (scrollBar?.scrollSearch(ON.id('play')) as Promise<Component>);
      await button_Bottom3.click();
      await CommonFunc.sleep(1000);
      let button_Bottom4 = await (scrollBar?.scrollSearch(ON.id('pause')) as Promise<Component>);
      await button_Bottom4.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onframe-value');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[AnimationJsunit_0300] obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('onframe-value');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[AnimationJsunit_0300] obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content') === obj2.getElement('$attrs').getString('content'))
        .assertTrue();
      console.info('[AnimationJsunit_0300] END');
      done();
    });


    
    /**
     * @tc.number   AnimationJsunit_static_0400
     * @tc.name     AnimationJsunit_static_0400
     * @tc.desc     AnimationJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('AnimationJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[AnimationJsunit_0400] START');
      let driver2 = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar = await driver2.findComponent(ON.type('Scroll'));
      let button_Bottom = await (scrollBar?.scrollSearch(ON.id('interpolating-springn')) as Promise<Component>);
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let button_Bottom2 = await (scrollBar?.scrollSearch(ON.id('create')) as Promise<Component>);
      await button_Bottom2.click();
      await CommonFunc.sleep(1000);
      let button_Bottom3 = await (scrollBar?.scrollSearch(ON.id('play')) as Promise<Component>);
      await button_Bottom3.click();
      await CommonFunc.sleep(1000);
      let button_Bottom4 = await (scrollBar?.scrollSearch(ON.id('finish')) as Promise<Component>);
      await button_Bottom4.click();
      await CommonFunc.sleep(1000);
      let onframe = await (scrollBar?.scrollSearch(ON.id('onframe-value')) as Promise<Component>);
      let content = await onframe.getText()
      console.info("[AnimationJsunit_0400] obj3 is: " + JSON.stringify(content))
      expect(content === '200').assertTrue();
      console.info('[AnimationJsunit_0400] END');
      done();
    });


    
    /**
     * @tc.number   AnimationJsunit_static_0500
     * @tc.name     AnimationJsunit_static_0500
     * @tc.desc     AnimationJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('AnimationJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[AnimationJsunit_0500] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await (scrollBar?.scrollSearch(ON.id('velocity')) as Promise<Component>);
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let button_Bottom2 = await (scrollBar?.scrollSearch(ON.id('stiffness')) as Promise<Component>);
      await button_Bottom2.click();
      await CommonFunc.sleep(1000);
      let button_Bottom3 = await (scrollBar?.scrollSearch(ON.id('damping')) as Promise<Component>);
      await button_Bottom3.click();
      await CommonFunc.sleep(1000);
      let button_Bottom4 = await (scrollBar?.scrollSearch(ON.id('interpolating-springn')) as Promise<Component>);
      await button_Bottom4.click();
      await CommonFunc.sleep(1000);
      let button_Bottom5 = await (scrollBar?.scrollSearch(ON.id('create')) as Promise<Component>);
      await (button_Bottom5?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let curve = await (scrollBar?.scrollSearch(ON.id('curve')) as Promise<Component>);
      let content = await curve.getText()
      console.info("[AnimationJsunit_0500] obj is: " + JSON.stringify(content));
      expect(content).assertEqual('curve:interpolating-spring\(10,1,1,15\)');
      console.info('[AnimationJsunit_0500] END');
      done();
    });


    
    /**
     * @tc.number   AnimationJsunit_static_0600
     * @tc.name     AnimationJsunit_static_0600
     * @tc.desc     AnimationJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('AnimationJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[AnimationJsunit_0600] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await (scrollBar?.scrollSearch(ON.id('interpolating-springn')) as Promise<Component>);
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let button_Bottom2 = await (scrollBar?.scrollSearch(ON.id('create')) as Promise<Component>);
      await button_Bottom2.click();
      await CommonFunc.sleep(1000);
      let button_Bottom3 = await (scrollBar?.scrollSearch(ON.id('play')) as Promise<Component>);
      await button_Bottom3.click();
      await CommonFunc.sleep(1000);
      let button_Bottom4 = await (scrollBar?.scrollSearch(ON.id('cancel')) as Promise<Component>);
      await button_Bottom4.click();
      await CommonFunc.sleep(2000);
      let backAnimator = await (scrollBar?.scrollSearch(ON.id('backAnimator-onback')) as Promise<Component>);
      let content = await backAnimator.getText()
      console.info("[AnimationJsunit_0600] obj2 is: " + JSON.stringify(content));
      expect(content).assertEqual('backAnimator-onback:oncancel');
      console.info('[AnimationJsunit_0600] END');
      done();
    });


    
    /**
     * @tc.number   AnimationJsunit_static_0700
     * @tc.name     AnimationJsunit_static_0700
     * @tc.desc     AnimationJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('AnimationJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[AnimationJsunit_0700] START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let button_Bottom = await (scrollBar?.scrollSearch(ON.id('interpolating-springn')) as Promise<Component>);
      await button_Bottom.click();
      await CommonFunc.sleep(1000);
      let button_Bottom2 = await (scrollBar?.scrollSearch(ON.id('create')) as Promise<Component>);
      await button_Bottom2.click();
      await CommonFunc.sleep(1000);
      let button_Bottom3 = await (scrollBar?.scrollSearch(ON.id('play')) as Promise<Component>);
      await button_Bottom3.click();
      await CommonFunc.sleep(1000);
      let button_Bottom4 = await (scrollBar?.scrollSearch(ON.id('finish')) as Promise<Component>);
      await button_Bottom4.click();
      await CommonFunc.sleep(2000);
      let backAnimator = await (scrollBar?.scrollSearch(ON.id('backAnimator-onback')) as Promise<Component>);
      let content = await backAnimator.getText()
      console.info("[AnimationJsunit_0700] obj3 is: " + JSON.stringify(content));
      expect(content).assertEqual('backAnimator-onback:onfinish');
      console.info('[AnimationJsunit_0700] END');
      done();
    });
  })
}