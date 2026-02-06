'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function provide2() {
  describe('provide2', () => {
    beforeAll(() => {
      console.info("provide2 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.nowear.api11.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("provide2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Zhuang/provide2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get provide2 state pages:" + JSON.stringify(pages));
        if (!("provide2" == pages.name)) {
          console.info("get provide2 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push provide2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push provide2 page error:" + err);
      }
      console.info("provide2 beforeEach end");
    });


    /**
     * @tc.number   provide2_0100
     * @tc.name     provide2_0100
     * @tc.desc     provide2_0100
     * @tc.level    Level.LEVEL0
     */
    it('provide2_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provide2_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('prBtn1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prBtn1');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[provide2_0100] component obj is: " + JSON.stringify(obj));
      console.info("[provide2_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      console.info('[provide2_0100] END');
      done();

    });

    /**
     * @tc.number   provide2_0200
     * @tc.name     provide2_0200
     * @tc.desc     provide2_0200
     * @tc.level    Level.LEVEL0
     */
    it('provide2_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provide2_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('prBtn2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prBtn2');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[provide2_0200] component obj is: " + JSON.stringify(obj));
      console.info("[provide2_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      console.info('[provide2_0200] END');
      done();

    });


    /**
     * @tc.number   provide2_0300
     * @tc.name     provide2_0300
     * @tc.desc     provide2_0300
     * @tc.level    Level.LEVEL0
     */
    it('provide2_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provide2_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('prBtn3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prBtn3');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[provide2_0300] component obj is: " + JSON.stringify(obj));
      console.info("[provide2_0300] title: " + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      let compareBtnStrJson = inspector.getInspectorByKey('compareBtn');
      let compareBtnObj= JSON.parseJsonElement(compareBtnStrJson);
      console.info("[provide2_0300] component compareBtnObj is: " + JSON.stringify(compareBtnObj));
      console.info("[provide2_0300] title: " + JSON.stringify(compareBtnObj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual(compareBtnObj.getElement('$attrs').getString('fontSize'));
      console.info('[provide2_0300] END');
      done();

    });

    /**
     * @tc.number   provide2_0400
     * @tc.name     provide2_0400
     * @tc.desc     provide2_0400
     * @tc.level    Level.LEVEL0
     */
    it('provide2_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provide2_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('prBtn4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prBtn4');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[provide2_0400] component obj is: " + JSON.stringify(obj));
      console.info("[provide2_0400] title: " + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      let compareBtnStrJson = inspector.getInspectorByKey('compareBtn');
      let compareBtnObj= JSON.parseJsonElement(compareBtnStrJson);
      console.info("[provide2_0400] component compareBtnObj is: " + JSON.stringify(compareBtnObj));
      console.info("[provide2_0400] title: " + JSON.stringify(compareBtnObj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual(compareBtnObj.getElement('$attrs').getString('fontSize'));
      console.info('[provide2_0400] END');
      done();

    });


    /**
     * @tc.number   provide2_0500
     * @tc.name     provide2_0500
     * @tc.desc     provide2_0500
     * @tc.level    Level.LEVEL0
     */
    it('provide2_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provide2_0500 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('coBtn1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('coBtn1');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[provide2_0500] component obj is: " + JSON.stringify(obj));
      console.info("[provide2_0500] title: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      console.info('[provide2_0500] END');
      done();

    });

    /**
     * @tc.number   provide2_0600
     * @tc.name     provide2_0600
     * @tc.desc     provide2_0600
     * @tc.level    Level.LEVEL0
     */
    it('provide2_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provide2_0600 START');
      let driver = Driver.create()
      // await driver.swipe(100,500,100,100)原代码注释
      // await CommonFunc.sleep(1000);原代码注释
      let button = await driver.findComponent(ON.id('coBtn2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('coBtn2');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[provide2_0600] component obj is: " + JSON.stringify(obj));
      console.info("[provide2_0600] title: " + JSON.stringify(obj.getElement('$attrs').getString('type')));
      expect(obj.getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      console.info('[provide2_0600] END');
      done();

    });


    /**
     * @tc.number   provide2_0700
     * @tc.name     provide2_0700
     * @tc.desc     provide2_0700
     * @tc.level    Level.LEVEL0
     */
    it('provide2_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provide2_0700 START');
      let driver = Driver.create()
      // await driver.swipe(100,500,100,100)原代码注释
      // await CommonFunc.sleep(1000);原代码注释
      let button = await driver.findComponent(ON.id('coBtn3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('coBtn3');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[provide2_0700] component obj is: " + JSON.stringify(obj));
      console.info("[provide2_0700] title: " + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      let compareBtnStrJson = inspector.getInspectorByKey('compareBtn');
      let compareBtnObj= JSON.parseJsonElement(compareBtnStrJson);
      console.info("[provide2_0700] component compareBtnObj is: " + JSON.stringify(compareBtnObj));
      console.info("[provide2_0700] title: " + JSON.stringify(compareBtnObj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual(compareBtnObj.getElement('$attrs').getString('fontSize'));
      console.info('[provide2_0700] END');
      done();

    });

    /**
     * @tc.number   provide2_0800
     * @tc.name     provide2_0800
     * @tc.desc     provide2_0800
     * @tc.level    Level.LEVEL0
     */
    it('provide2_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('provide2_0800 START');
      let driver = Driver.create()
      // await driver.swipe(100,500,100,100)原代码注释
      // await CommonFunc.sleep(1000);原代码注释
      let button = await driver.findComponent(ON.id('coBtn4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('coBtn4');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[provide2_0800] component obj is: " + JSON.stringify(obj));
      console.info("[provide2_0800] title: " + JSON.stringify(obj.getElement('$attrs').getString('fontSize')));
      let compareBtnStrJson = inspector.getInspectorByKey('compareBtn');
      let compareBtnObj= JSON.parseJsonElement(compareBtnStrJson);
      console.info("[provide2_0800] component compareBtnObj is: " + JSON.stringify(compareBtnObj));
      console.info("[provide2_0800] title: " + JSON.stringify(compareBtnObj.getElement('$attrs').getString('fontSize')));
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual(compareBtnObj.getElement('$attrs').getString('fontSize'));
      console.info('[provide2_0800] END');
      done();

    });


  })
}

