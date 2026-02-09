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
import events_emitter from '@ohos.events.emitter'
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;;

const CAPACITY: string[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function LocalStoageLinkOneJsunit() {
  describe('LocalStoageLinkOneJsunit', () => {
    beforeAll(() => {
      console.info("LocalStoageLinkOneJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("LocalStoageLinkOneJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/State/LocalStoageLinkOne",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LocalStoageLinkOneJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalStoageLinkOne" == pages.name)) {
          console.info("get LocalStoageLinkOneJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LocalStoageLinkOneJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStoageLinkOneJsunit page error:" + err);
      }
      console.info("LocalStoageLinkOneJsunit beforeEach end");
    });

    /**
     * @tc.number   LocalStoageLinkOneJsunit_static_0100
     * @tc.name     LocalStoageLinkOneJsunit_static_0100
     * @tc.desc     LocalStoageLinkOneJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LocalStoageLinkOneJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[LocalStoageLinkOneJsunit_static_0100] START');
      let driver = Driver.create()
      let button_has = await driver.findComponent(ON.id('button_has'));
      await (button_has?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('button_has');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalStoageLinkOneJsunit_static_0100] obj1 is: " + JSON.stringify(obj1));

      expect(obj1.getElement('$attrs').getString('label')).assertEqual('Has Has1:true,Has2:false');
      console.info('[LocalStoageLinkOneJsunit_static_0100] END');
      done();
    });


    /**
     * @tc.number   LocalStoageLinkOneJsunit_static_0200
     * @tc.name     LocalStoageLinkOneJsunit_static_0200
     * @tc.desc     LocalStoageLinkOneJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('LocalStoageLinkOneJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[LocalStoageLinkOneJsunit_static_0200] START');
      let driver = Driver.create()
      let button_set = await driver.findComponent(ON.id('button_set'));
      await (button_set?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('button_set');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalStoageLinkOneJsunit_static_0200] obj1 is: " + JSON.stringify(obj1));

      expect(obj1.getElement('$attrs').getString('label')).assertEqual('Set Set1:true,Set2:false');
      console.info('[LocalStoageLinkOneJsunit_static_0200] END');
      done();
    });


    /**
     * @tc.number   LocalStoageLinkOneJsunit_static_0300
     * @tc.name     LocalStoageLinkOneJsunit_static_0300
     * @tc.desc     LocalStoageLinkOneJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('LocalStoageLinkOneJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[LocalStoageLinkOneJsunit_static_0300] START');
      let driver = Driver.create()
      let button_setOrCreate = await driver.findComponent(ON.id('button_setOrCreate'));
      await (button_setOrCreate?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('button_setOrCreate');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalStoageLinkOneJsunit_static_0300] obj1 is: " + JSON.stringify(obj1));

      expect(obj1.getElement('$attrs').getString('label')).assertEqual('setOrCreate setOrCreate1:true,setOrCreate2:true');
      console.info('[LocalStoageLinkOneJsunit_static_0300] END');
      done();
    });


    /**
     * @tc.number   LocalStoageLinkOneJsunit_static_0400
     * @tc.name     LocalStoageLinkOneJsunit_static_0400
     * @tc.desc     LocalStoageLinkOneJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('LocalStoageLinkOneJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStoageLinkOneJsunit_static_0400] START');
      let strJson1 = inspector.getInspectorByKey('text_getValue1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalStoageLinkOneJsunit_static_0400] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('localstorage:2,storLink2:2');

      let driver = Driver.create()
      let button_changeInitialValue = await driver.findComponent(ON.id('button_changeInitialValue'));
      await (button_changeInitialValue?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('text_getValue1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[LocalStoageLinkOneJsunit_static_0400] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('localstorage:12,storLink2:12');

      let button_changeLocalStorageValue = await driver.findComponent(ON.id('button_changeLocalStorageValue'));
      await (button_changeLocalStorageValue?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson3 = inspector.getInspectorByKey('text_getValue1');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[LocalStoageLinkOneJsunit_static_0400] obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('localstorage:666,storLink2:666');
      console.info('[LocalStoageLinkOneJsunit_static_0400] END');
      done();

    });

  })
}
