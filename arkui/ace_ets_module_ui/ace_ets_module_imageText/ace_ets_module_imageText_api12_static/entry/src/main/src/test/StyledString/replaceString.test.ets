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
import { Driver, ON, Component, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function replaceString() {
  describe('replaceString', (): void => {
    beforeAll(() => {
      console.info("replaceString beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api12.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("replaceString beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/StyledString/replaceString',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get replaceString state pages:" + JSON.stringify(pages));
        if (!("replaceString" == pages.name)) {
          console.info("get replaceString pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push replaceString page error:" + err);
      }
      console.info("replaceString beforeEach end");
    });
    afterEach(async () => {
    });

    
    /**
     * @tc.number   replaceString_static_0100
     * @tc.name     replaceString_static_0100
     * @tc.desc     replaceString_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('replaceString_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('replaceString_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('replaceString'));
      await CommonFunc.sleep(500);
      await (but2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('replaceString_0100---obj.getElement($attrs).content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("401");

      console.info('replaceString_0100 END');
      done();
    });


    
    /**
     * @tc.number   replaceString_static_0200
     * @tc.name     replaceString_static_0200
     * @tc.desc     replaceString_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('replaceString_static_0200',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('replaceString_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('insertString'));
      await CommonFunc.sleep(500);
      await (but2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('replaceString_0200---obj.getElement($attrs).content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("401");

      console.info('replaceString_0200 END');
      done();
    });

    
    /**
     * @tc.number   replaceString_static_0300
     * @tc.name     replaceString_static_0300
     * @tc.desc     replaceString_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('replaceString_static_0300',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('replaceString_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('removeString'));
      await CommonFunc.sleep(500);
      await (but2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('replaceString_0300---obj.getElement($attrs).content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("401");

      console.info('replaceString_0300 END');
      done();
    });

    
    /**
     * @tc.number   replaceString_static_0400
     * @tc.name     replaceString_static_0400
     * @tc.desc     replaceString_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('replaceString_static_0400',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('replaceString_0400 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('replaceStyle'));
      await CommonFunc.sleep(500);
      await (but2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('replaceString_0400---obj.getElement($attrs).content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("401");

      console.info('replaceString_0400 END');
      done();
    });

    
    /**
     * @tc.number   replaceString_static_0500
     * @tc.name     replaceString_static_0500
     * @tc.desc     replaceString_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('replaceString_static_0500',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('replaceString_0500 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('setStyle'));
      await CommonFunc.sleep(500);
      await (but2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('replaceString_0500---obj.getElement($attrs).content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("401");

      console.info('replaceString_0500 END');
      done();
    });

    
    /**
     * @tc.number   replaceString_static_0600
     * @tc.name     replaceString_static_0600
     * @tc.desc     replaceString_static_0600
     * @tc.level    Level.LEVEL0
     */
    it('replaceString_static_0600',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('replaceString_0600 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('removeStyle'));
      await CommonFunc.sleep(500);
      await (but2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('replaceString_0600---obj.getElement($attrs).content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("401");

      console.info('replaceString_0600 END');
      done();
    });

    
    /**
     * @tc.number   replaceString_static_0700
     * @tc.name     replaceString_static_0700
     * @tc.desc     replaceString_static_0700
     * @tc.level    Level.LEVEL0
     */
    it('replaceString_static_0700',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('replaceString_0700 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('removeStyles'));
      await CommonFunc.sleep(500);
      await (but2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('replaceString_0700---obj.getElement($attrs).content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("401");

      console.info('replaceString_0700 END');
      done();
    });

    
    /**
     * @tc.number   replaceString_static_0800
     * @tc.name     replaceString_static_0800
     * @tc.desc     replaceString_static_0800
     * @tc.level    Level.LEVEL0
     */
    it('replaceString_static_0800',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('replaceString_0800 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('replaceStyledString'));
      await CommonFunc.sleep(500);
      await (but2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('replaceString_0800---obj.getElement($attrs).content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("401");

      console.info('replaceString_0800 END');
      done();
    });

    
    /**
     * @tc.number   replaceString_static_0900
     * @tc.name     replaceString_static_0900
     * @tc.desc     replaceString_static_0900
     * @tc.level    Level.LEVEL0
     */
    it('replaceString_static_0900',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('replaceString_0900 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let but = await driver.findComponent(ON.id('but'));
      await CommonFunc.sleep(500);
      await (but?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let but2 = await driver.findComponent(ON.id('insertStyledString'));
      await CommonFunc.sleep(500);
      await (but2?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.log('replaceString_0900---obj.getElement($attrs).content---' +
        JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect('' + obj.getElement('$attrs').getString('content')).assertEqual("401");

      console.info('replaceString_0900 END');
      done();
    });

  })
}