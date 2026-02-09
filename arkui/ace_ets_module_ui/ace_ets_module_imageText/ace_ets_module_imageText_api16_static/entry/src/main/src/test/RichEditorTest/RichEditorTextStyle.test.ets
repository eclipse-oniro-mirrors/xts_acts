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

import router from '@ohos.router';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import { Driver, MouseButton, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { RichEditorImageSpanResult } from '@ohos.arkui.component'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function RichEditorTextStyle() {
  describe('RichEditorTextStyle', () => {
    beforeAll(() => {
      console.info("RichEditorTextStyle beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("RichEditorTextStyle beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RichEditor/RichEditorTextStyle",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RichEditorTextStyle state pages:" + "");
        if (!("RichEditorTextStyle" == pages.name)) {
          console.info("get RichEditorTextStyle pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RichEditorTextStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTextStyle page error:" + err);
      }
      console.info("RichEditorTextStyle beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RichEditorTextStyle after each called");
    });


    
    
    /**
     * @tc.number   RichEditorTextStyle_static_0001
     * @tc.name     RichEditorTextStyle_static_0001
     * @tc.desc     RichEditorTextStyle_static_0001
     * @tc.level    Level.LEVEL1
     */
it('RichEditorTextStyle_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle RichEditorTextStyle0001 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setTypingStyle1'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getTypingStyle'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('RichEditor_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("true");
      console.info("[RichEditorTextStyle0001] end");
      done();
    });


    
    
    /**
     * @tc.number   RichEditorTextStyle_static_0002
     * @tc.name     RichEditorTextStyle_static_0002
     * @tc.desc     RichEditorTextStyle_static_0002
     * @tc.level    Level.LEVEL1
     */
it('RichEditorTextStyle_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle RichEditorTextStyle0002 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setTypingStyle2'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getTypingStyle'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('RichEditor_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("false");
      console.info("[RichEditorTextStyle0002] end");
      done();
    });


    
    
    /**
     * @tc.number   RichEditorTextStyle_static_0003
     * @tc.name     RichEditorTextStyle_static_0003
     * @tc.desc     RichEditorTextStyle_static_0003
     * @tc.level    Level.LEVEL1
     */
it('RichEditorTextStyle_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle RichEditorTextStyle0003 START');
      await CommonFunc.sleep(1000);
      let set = await driver.findComponent(ON.id('setTypingStyle3'))
      await CommonFunc.sleep(500);
      await (set?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getTypingStyle'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('RichEditor_Text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("undefined");
      console.info("[RichEditorTextStyle0003] end");
      done();
    });


    
    
    /**
     * @tc.number   RichEditorTextStyle_static_0004
     * @tc.name     RichEditorTextStyle_static_0004
     * @tc.desc     RichEditorTextStyle_static_0004
     * @tc.level    Level.LEVEL1
     */
it('RichEditorTextStyle_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle RichEditorTextStyle0004 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('updateSpanStyle1'))
      await CommonFunc.sleep(500);
      await (update?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('RichEditor_Text2');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("true");
      console.info("[RichEditorTextStyle0004] end");
      done();
    });


    
    
    /**
     * @tc.number   RichEditorTextStyle_static_0005
     * @tc.name     RichEditorTextStyle_static_0005
     * @tc.desc     RichEditorTextStyle_static_0005
     * @tc.level    Level.LEVEL1
     */
it('RichEditorTextStyle_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle RichEditorTextStyle0005 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('updateSpanStyle2'))
      await CommonFunc.sleep(500);
      await (update?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('RichEditor_Text2');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("false");
      console.info("[RichEditorTextStyle0005] end");
      done();
    });


    
    
    /**
     * @tc.number   RichEditorTextStyle_static_0006
     * @tc.name     RichEditorTextStyle_static_0006
     * @tc.desc     RichEditorTextStyle_static_0006
     * @tc.level    Level.LEVEL1
     */
it('RichEditorTextStyle_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('RichEditorTextStyle RichEditorTextStyle0006 START');
      await CommonFunc.sleep(1000);
      let update = await driver.findComponent(ON.id('updateSpanStyle3'))
      await CommonFunc.sleep(500);
      await (update?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let get = await driver.findComponent(ON.id('getSpans'))
      await CommonFunc.sleep(500);
      await (get?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('RichEditor_Text2');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText0001---obj.$attrs.content---' +
      JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("false");
      console.info("[RichEditorTextStyle0006] end");
      done();
    });
  })
}