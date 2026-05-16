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


export default function ObjectLinkFirJsunit() {
  describe('ObjectLinkFirJsunit', () => {
    beforeAll(() => {
      console.info("ObjectLinkFirJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ObjectLinkFirJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkFir',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObjectLinkFirJsunit state pages:" + JSON.stringify(pages));
        if (!("ObjectLinkFir" == pages.name)) {
          console.info("get ObjectLinkFirJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ObjectLinkFirJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkFirJsunit page error:" + err);
      }
      console.info("ObjectLinkFirJsunit beforeEach end");
    });



    /**
     * @tc.number   ObjectLinkFirJsunit_static_0100
     * @tc.name     ObjectLinkFirJsunit_static_0100
     * @tc.desc     ObjectLinkFirJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkFirJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkFirJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('fir_state');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkFirJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkFirJsunit_static_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("5");
      console.info('[ObjectLinkFirJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkFirJsunit_static_0200
     * @tc.name     ObjectLinkFirJsunit_static_0200
     * @tc.desc     ObjectLinkFirJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkFirJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkFirJsunit_static_0200 START');
      let strJson = inspector.getInspectorByKey('fir_provide');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkFirJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkFirJsunit_static_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("5");
      console.info('[ObjectLinkFirJsunit_static_0200] END');
      done();
    });


    /**
     * @tc.number   ObjectLinkFirJsunit_static_0300
     * @tc.name     ObjectLinkFirJsunit_static_0300
     * @tc.desc     ObjectLinkFirJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkFirJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkFirJsunit_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btn_state1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('fir_state');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkFirJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkFirJsunit_static_0300] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("6");

      console.info('[ObjectLinkFirJsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkFirJsunit_static_0400
     * @tc.name     ObjectLinkFirJsunit_static_0400
     * @tc.desc     ObjectLinkFirJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkFirJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkFirJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btn_provide1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('fir_provide');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkFirJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkFirJsunit_static_0400] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("6");

      console.info('[ObjectLinkFirJsunit_static_0400] END');
      done();
    });
  })
}

