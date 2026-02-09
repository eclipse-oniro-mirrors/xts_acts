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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function addOrDelText() {
  describe('addOrDelText', () => {
    beforeAll(() => {
      console.info("addOrDelText beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("addOrDelText beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextArea/addOrDelText",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get addOrDelText state pages:" + "");
        if (!("addOrDelText" == pages.name)) {
          console.info("get addOrDelText pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push addOrDelText page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push addOrDelText page error:" + err);
      }
      console.info("addOrDelText beforeEach end");
    });

    

    /**
     * @tc.number   addOrDelText_static_0001
     * @tc.name     addOrDelText_static_0001
     * @tc.desc     addOrDelText_static_0001
     * @tc.level    Level.LEVEL1
     */
it('addOrDelText_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('addOrDelText addOrDelText_static_0001 START');
      await CommonFunc.sleep(500);
      let add = await driver.findComponent(ON.id('add'));
      await CommonFunc.sleep(500);
      await (add?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let del = await driver.findComponent(ON.id('del'));
      await CommonFunc.sleep(500);
      await (del?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText_static_0001---obj.$attrs.text---' +
      obj.getElement('$attrs').getString('text'));
      expect(obj.getElement('$attrs').getString('text')).assertEqual("文本123");

      let strJson2 = inspector.getInspectorByKey('textInput');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.log('addOrDelText_static_0001---obj2.$attrs.text---' +
      obj2.getElement('$attrs').getString('text'));
      expect(obj2.getElement('$attrs').getString('text')).assertEqual("");

      let strJson3 = inspector.getInspectorByKey('search');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.log('addOrDelText_static_0001---obj3.$attrs.value---' +
      obj3.getElement('$attrs').getString('value'));
      expect(obj3.getElement('$attrs').getString('value')).assertEqual("文本123");

      console.info("[addOrDelText_static_0001] end");
      done();
    });


    

    /**
     * @tc.number   addOrDelText_static_0002
     * @tc.name     addOrDelText_static_0002
     * @tc.desc     addOrDelText_static_0002
     * @tc.level    Level.LEVEL1
     */
it('addOrDelText_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('addOrDelText addOrDelText_static_0002 START');
      await CommonFunc.sleep(500);
      let del11 = await driver.findComponent(ON.id('del2'));
      await CommonFunc.sleep(500);
      await (del11?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let add11 = await driver.findComponent(ON.id('add2'));
      await CommonFunc.sleep(500);
      await (add11?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let add = await driver.findComponent(ON.id('add2'));
      await CommonFunc.sleep(500);
      await (add?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let del = await driver.findComponent(ON.id('del'));
      await CommonFunc.sleep(500);
      await (del?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText_static_0002---obj.$attrs.text---' +
      obj.getElement('$attrs').getString('text'));
      expect(obj.getElement('$attrs').getString('text')).assertEqual("文本添加文本");

      let strJson2 = inspector.getInspectorByKey('textInput');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.log('addOrDelText_static_0002---obj2.$attrs.text---' +
      obj2.getElement('$attrs').getString('text'));
      expect(obj2.getElement('$attrs').getString('text')).assertEqual("");

      let strJson3 = inspector.getInspectorByKey('search');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.log('addOrDelText_static_0002---obj3.$attrs.value---' +
      obj3.getElement('$attrs').getString('value'));
      expect(obj3.getElement('$attrs').getString('value')).assertEqual("文本添加文本");

      console.info("[addOrDelText_static_0002] end");
      done();

    });


    

    /**
     * @tc.number   addOrDelText_static_0003
     * @tc.name     addOrDelText_static_0003
     * @tc.desc     addOrDelText_static_0003
     * @tc.level    Level.LEVEL1
     */
it('addOrDelText_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('addOrDelText addOrDelText_static_0003 START');
      await CommonFunc.sleep(500);
      let del11 = await driver.findComponent(ON.id('del2'));
      await CommonFunc.sleep(500);
      await (del11?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let add11 = await driver.findComponent(ON.id('add2'));
      await CommonFunc.sleep(500);
      await (add11?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let del = await driver.findComponent(ON.id('del2'));
      await CommonFunc.sleep(500);
      await (del?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText_static_0003---obj.$attrs.text---' +
      obj.getElement('$attrs').getString('text'));
      expect(obj.getElement('$attrs').getString('text')).assertEqual("");

      let strJson2 = inspector.getInspectorByKey('textInput');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.log('addOrDelText_static_0003---obj2.$attrs.text---' +
      obj2.getElement('$attrs').getString('text'));
      expect(obj2.getElement('$attrs').getString('text')).assertEqual("");

      let strJson3 = inspector.getInspectorByKey('search');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.log('addOrDelText_static_0003---obj3.$attrs.value---' +
      obj3.getElement('$attrs').getString('value'));
      expect(obj3.getElement('$attrs').getString('value')).assertEqual("");

      console.info("[addOrDelText_static_0003] end");
      done();

    });

    

    /**
     * @tc.number   addOrDelText_static_0008
     * @tc.name     addOrDelText_static_0008
     * @tc.desc     addOrDelText_static_0008
     * @tc.level    Level.LEVEL1
     */
it('addOrDelText_static_0008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      console.info('addOrDelText addOrDelText_static_0008 START');
      await CommonFunc.sleep(500);
      let del11 = await driver.findComponent(ON.id('del2'));
      await CommonFunc.sleep(500);
      await (del11?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let add11 = await driver.findComponent(ON.id('add2'));
      await CommonFunc.sleep(500);
      await (add11?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let del = await driver.findComponent(ON.id('del7'));
      await CommonFunc.sleep(500);
      await (del?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('textArea');
      let obj = JSON.parseJsonElement(strJson);
      console.log('addOrDelText_static_0008---obj.$attrs.text---' +
      obj.getElement('$attrs').getString('text'));
      expect(obj.getElement('$attrs').getString('text')).assertEqual("");

      let strJson2 = inspector.getInspectorByKey('textInput');
      let obj2 = JSON.parseJsonElement(strJson);
      console.log('addOrDelText_static_0007---obj2.$attrs.text---' +
      obj2.getElement('$attrs').getString('text'));
      expect(obj2.getElement('$attrs').getString('text')).assertEqual("");

      let strJson3 = inspector.getInspectorByKey('search');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.log('addOrDelText_static_0008---obj3.$attrs.value---' +
      obj3.getElement('$attrs').getString('value'));
      expect(obj3.getElement('$attrs').getString('value')).assertEqual("");

      console.info("[addOrDelText_static_0008] end");
      done();

    });


  })
}