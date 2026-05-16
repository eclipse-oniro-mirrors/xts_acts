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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {Component,  Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textEnabledJsunit() {
  describe('textEnabledJsunit', () => {
    beforeAll(() => {
      console.info("textEnabledJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textEnabledJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textEnabled',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textEnabledJsunit state pages:" + JSON.stringify(pages));
        if (!("textEnabled" == pages.name)) {
          console.info("get textEnabledJsunit pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textEnabledJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textEnabledJsunit page error:" + err);
      }
      console.info("textEnabledJsunit beforeEach end");
    });

    
    /**
     * @tc.number   textEnabledJsunit_static_0100
     * @tc.name     textEnabledJsunit_static_0100
     * @tc.desc     textEnabledJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('textEnabledJsunit_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textEnabledJsunit_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('texEnd1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('texEnd1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textEnabledJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_static_0100] text1: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("onClick-禁用");
      console.info('[textEnabledJsunit_static_0100] END');
      done();
    });

    
    /**
     * @tc.number   textEnabledJsunit_static_0200
     * @tc.name     textEnabledJsunit_static_0200
     * @tc.desc     textEnabledJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('textEnabledJsunit_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textEnabledJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('texEnd2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('texEnd2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textEnabledJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_static_0200] text2: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("onTouch-禁用");
      console.info('[textEnabledJsunit_static_0200] END');
      done();
    });

    
    /**
     * @tc.number   textEnabledJsunit_static_0300
     * @tc.name     textEnabledJsunit_static_0300
     * @tc.desc     textEnabledJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('textEnabledJsunit_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textEnabledJsunit_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('texEnd3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('texEnd3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textEnabledJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_static_0300] text3: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("onKeyEvent-禁用");
      console.info('[textEnabledJsunit_static_0300] END');
      done();
    });

    
    /**
     * @tc.number   textEnabledJsunit_static_0400
     * @tc.name     textEnabledJsunit_static_0400
     * @tc.desc     textEnabledJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('textEnabledJsunit_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textEnabledJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('texEnd4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('texEnd4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textEnabledJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_static_0400] text4: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("鼠标事件onHover-禁用");
      console.info('[textEnabledJsunit_static_0400] END');
      done();
    });

    
    /**
     * @tc.number   textEnabledJsunit_static_0500
     * @tc.name     textEnabledJsunit_static_0500
     * @tc.desc     textEnabledJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('textEnabledJsunit_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textEnabledJsunit_static_0500 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('texEnd5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('texEnd5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textEnabledJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_static_0500] text5: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("鼠标事件onMouse-禁用");
      console.info('[textEnabledJsunit_static_0500] END');
      done();
    });

    
    /**
     * @tc.number   textEnabledJsunit_static_0600
     * @tc.name     textEnabledJsunit_static_0600
     * @tc.desc     textEnabledJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
    it('textEnabledJsunit_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('textEnabledJsunit_static_0600 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('texEnd6'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('texEnd6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textEnabledJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      console.info("[textEnabledJsunit_static_0600] text6: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("焦点事件-禁用");
      console.info('[textEnabledJsunit_static_0600] END');
      done();
    });
  })
}

