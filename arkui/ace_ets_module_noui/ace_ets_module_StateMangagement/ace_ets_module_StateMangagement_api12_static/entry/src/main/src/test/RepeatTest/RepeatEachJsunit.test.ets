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

export default function RepeatEachJsunit() {
  describe('RepeatEachJsunit', () => {

    beforeAll(() => {
      console.info("RepeatEachJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("RepeatEachJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Repeat/RepeatEach',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RepeatEachJsunit state pages:" + JSON.stringify(pages));
        if (!("RepeatEach" == pages.name)) {
          console.info("get RepeatEachJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push RepeatEachJsunit page error:" + err);
      }
      console.info("RepeatEachJsunit beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let init = await driver.findComponent(ON.id('init_repeat'));
      await ( init?.click() as Promise<void> );
      console.info(" RepeatEachJsunit after each called");
    });


    
    
    /**
     * @tc.number   RepeatEachJsunit_static_0100
     * @tc.name     RepeatEachJsunit_static_0100
     * @tc.desc     RepeatEachJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('RepeatEachJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RepeatEachJsunit_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver =  Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_modify'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info("[RepeatEachJsunit_static_0100] repeat_modify success");

      let strJson = inspector.getInspectorByKey('mess_repeat');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RepeatEachJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('message: new three');
      console.info('[RepeatEachJsunit_static_0100] END');
      done();
    });

    
    
    /**
     * @tc.number   RepeatEachJsunit_static_0200
     * @tc.name     RepeatEachJsunit_static_0200
     * @tc.desc     RepeatEachJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('RepeatEachJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RepeatEachJsunit_static_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('length_repeat');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RepeatEachJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_static_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("length: 4");
      console.info('[RepeatEachJsunit_static_0200] END');
      done();
    });
	
    
    
    /**
     * @tc.number   RepeatEachJsunit_static_0300
     * @tc.name     RepeatEachJsunit_static_0300
     * @tc.desc     RepeatEachJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('RepeatEachJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RepeatEachJsunit_static_0300 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('mess_repeat');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RepeatEachJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_static_0300] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("message: two");
      console.info('[RepeatEachJsunit_static_0300] END');
      done();
    });
	
    
    
    /**
     * @tc.number   RepeatEachJsunit_static_0400
     * @tc.name     RepeatEachJsunit_static_0400
     * @tc.desc     RepeatEachJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('RepeatEachJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RepeatEachJsunit_static_0400 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('length_repeat');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RepeatEachJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_static_0400] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("length: 2");
      console.info('[RepeatEachJsunit_static_0400] END');
      done();
    });
	
    
    
    /**
     * @tc.number   RepeatEachJsunit_static_0500
     * @tc.name     RepeatEachJsunit_static_0500
     * @tc.desc     RepeatEachJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('RepeatEachJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RepeatEachJsunit_static_0500 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('length_repeat');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RepeatEachJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_static_0500] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("length: 3");

      let strJson2 = inspector.getInspectorByKey('mess_repeat');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[RepeatEachJsunit_static_0500] component obj2 is: " + JSON.stringify(obj2));
      console.info("[RepeatEachJsunit_static_0500] text2: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("message: 我");

      console.info('[RepeatEachJsunit_static_0500] END');
      done();
    });
	
    
    
    /**
     * @tc.number   RepeatEachJsunit_static_0600
     * @tc.name     RepeatEachJsunit_static_0600
     * @tc.desc     RepeatEachJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('RepeatEachJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RepeatEachJsunit_static_0600 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('repeat_5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('length_repeat');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[RepeatEachJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      console.info("[RepeatEachJsunit_static_0600] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("length: 4");

      let strJson2 = inspector.getInspectorByKey('mess_repeat');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[RepeatEachJsunit_static_0600] component obj2 is: " + JSON.stringify(obj2));
      console.info("[RepeatEachJsunit_static_0600] text2: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("message: 你");

      console.info('[RepeatEachJsunit_static_0600] END');
      done();
    });

  })
}

