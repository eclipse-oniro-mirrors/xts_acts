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



export default function ObjectLinkArrayJsunit() {
  describe('ObjectLinkArrayJsunit', () => {
    beforeAll(() => {
      console.info("ObjectLinkArrayJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ObjectLinkArrayJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkArray',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObjectLinkArrayJsunit state pages:" + JSON.stringify(pages));
        if (!("ObjectLinkArray" == pages.name)) {
          console.info("get ObjectLinkArrayJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ObjectLinkArrayJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkArrayJsunit page error:" + err);
      }
      console.info("ObjectLinkArrayJsunit beforeEach end");
    });

    afterEach(async (): Promise<void>  => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('arrViewB_reset'));
      await (button?.click() as Promise<void>);
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.number   ObjectLinkArrayJsunit_static_0100
     * @tc.name     ObjectLinkArrayJsunit_static_0100
     * @tc.desc     ObjectLinkArrayJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkArrayJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkArrayJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('view_arrObl');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkArrayJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_static_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello: [{"num":5,"id":0},{"num":6,"id":1}]');
      console.info('[ObjectLinkArrayJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkArrayJsunit_static_0200
     * @tc.name     ObjectLinkArrayJsunit_static_0200
     * @tc.desc     ObjectLinkArrayJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkArrayJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkArrayJsunit_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('change_ArrObl'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('view_arrObl');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkArrayJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_static_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello: [{"num":8,"id":2},{"num":6,"id":1}]');
      console.info('[ObjectLinkArrayJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkArrayJsunit_static_0300
     * @tc.name     ObjectLinkArrayJsunit_static_0300
     * @tc.desc     ObjectLinkArrayJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkArrayJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkArrayJsunit_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('add_ArrObl'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('view_arrObl');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkArrayJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_static_0300] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello: [{"num":5,"id":0},{"num":6,"id":1},{"num":7,"id":2}]');
      console.info('[ObjectLinkArrayJsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkArrayJsunit_static_0400
     * @tc.name     ObjectLinkArrayJsunit_static_0400
     * @tc.desc     ObjectLinkArrayJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkArrayJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkArrayJsunit_static_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('delete_Arr1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('view_arrObl');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkArrayJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_static_0400] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello: [{"num":6,"id":1}]');
      console.info('[ObjectLinkArrayJsunit_static_0400] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkArrayJsunit_static_0500
     * @tc.name     ObjectLinkArrayJsunit_static_0500
     * @tc.desc     ObjectLinkArrayJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkArrayJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkArrayJsunit_static_0500 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('delete_Arr2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('view_arrObl');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkArrayJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_static_0500] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello: [{"num":5,"id":0}]');
      console.info('[ObjectLinkArrayJsunit_static_0500] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkArrayJsunit_static_0600
     * @tc.name     ObjectLinkArrayJsunit_static_0600
     * @tc.desc     ObjectLinkArrayJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkArrayJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkArrayJsunit_static_0600 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('reset_ArrObl'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('view_arrObl');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkArrayJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkArrayJsunit_static_0600] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello: [{"num":5,"id":2},{"num":6,"id":3}]');
      console.info('[ObjectLinkArrayJsunit_static_0600] END');
      done();
    });
  })
}

