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


export default function StorageLinkJsunit1() {
  describe('StorageLinkJsunit1', () => {
    beforeAll(() => {
      console.info("StorageLinkJsunit1 beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StorageLinkJsunit1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StorageLink1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StorageLinkJsunit1 state pages:" + JSON.stringify(pages));
        if (!("StorageLink1" == pages.name)) {
          console.info("get StorageLinkJsunit1 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StorageLinkJsunit1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageLinkJsunit1 page error:" + err);
      }
      console.info("StorageLinkJsunit1 beforeEach end");
    });


    /**
     * @tc.number   StorageLinkJsunit1_static_0100
     * @tc.name     StorageLinkJsunit1_static_0100
     * @tc.desc     StorageLinkJsunit1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son1
      console.info('[StorageLinkJsunit1_static_0100] START');
      let driver = Driver.create()
      let button_son1 = await driver.findComponent(ON.id('button_son1'));
      await( button_son1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('button_son1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageLinkJsunit1_static_0100] son1 obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('num: 11111');
      console.info('[StorageLinkJsunit1_static_0100] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_0200
     * @tc.name     StorageLinkJsunit1_static_0200
     * @tc.desc     StorageLinkJsunit1_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son2
      console.info('[StorageLinkJsunit1_static_0200] START');
      let driver = Driver.create()
      let button_son2 = await driver.findComponent(ON.id('button_son2'));
      await (button_son2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson2 = inspector.getInspectorByKey('button_son2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageLinkJsunit1_static_0200] son2 obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.getElement('$attrs').getString('label')).assertEqual('string: sss');
      console.info('[StorageLinkJsunit1_static_0200] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_0300
     * @tc.name     StorageLinkJsunit1_static_0300
     * @tc.desc     StorageLinkJsunit1_static_0300
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son3
      console.info('[StorageLinkJsunit1_static_0300] START');
      let driver = Driver.create()
      let button_son3 = await driver.findComponent(ON.id('button_son3'));
      await (button_son3?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson3 = inspector.getInspectorByKey('button_son3');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[StorageLinkJsunit1_static_0300] son3 obj3 is: " + JSON.stringify(obj3));
      await CommonFunc.sleep(1000);
      expect(obj3.getElement('$attrs').getString('label')).assertEqual('boolean: true');
      console.info('[StorageLinkJsunit1_static_0300] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_0400
     * @tc.name     StorageLinkJsunit1_static_0400
     * @tc.desc     StorageLinkJsunit1_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son4
      console.info('[StorageLinkJsunit1_static_0400] START');
      let driver = Driver.create()
      let button_son4 = await driver.findComponent(ON.id('button_son4'));
      await (button_son4?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson4 = inspector.getInspectorByKey('button_son4');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[StorageLinkJsunit1_static_0400] son4 obj4 is: " + JSON.stringify(obj4));
      await CommonFunc.sleep(1000);
      expect(obj4.getElement('$attrs').getString('label')).assertEqual('enu: 3');
      console.info('[StorageLinkJsunit1_static_0400] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_0500
     * @tc.name     StorageLinkJsunit1_static_0500
     * @tc.desc     StorageLinkJsunit1_static_0500
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son5
      console.info('[StorageLinkJsunit1_static_0500] START');
      let driver = Driver.create()
      let button_son5 = await driver.findComponent(ON.id('button_son5'));
      await (button_son5?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson5 = inspector.getInspectorByKey('button_son5');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[StorageLinkJsunit1_static_0500] son5 obj5 is: " + JSON.stringify(obj5));
      await CommonFunc.sleep(1000);
      expect(obj5.getElement('$attrs').getString('label')).assertEqual('class: Title:Hello C');
      console.info('[StorageLinkJsunit1_static_0500] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_0600
     * @tc.name     StorageLinkJsunit1_static_0600
     * @tc.desc     StorageLinkJsunit1_static_0600
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son6
      console.info('[StorageLinkJsunit1_static_0600] START');
      let driver = Driver.create()
      let button_son6 = await driver.findComponent(ON.id('button_son6'));
      await (button_son6?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson6 = inspector.getInspectorByKey('button_son6');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[StorageLinkJsunit1_static_0600] son6 obj6 is: " + JSON.stringify(obj6));
      await CommonFunc.sleep(1000);
      expect(obj6.getElement('$attrs').getString('label')).assertEqual('obj: {"name":"ls","age":13}');
      console.info('[StorageLinkJsunit1_static_0600] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_0700
     * @tc.name     StorageLinkJsunit1_static_0700
     * @tc.desc     StorageLinkJsunit1_static_0700
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son7
      console.info('[StorageLinkJsunit1_static_0700] START');
      let driver = Driver.create()
      let button_son7 = await driver.findComponent(ON.id('button_son7'));
      await (button_son7?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson7 = inspector.getInspectorByKey('button_son7');
      let obj7 = JSON.parseJsonElement(strJson7);
      console.info("[StorageLinkJsunit1_static_0700] son7 obj7 is: " + JSON.stringify(obj7));
      await CommonFunc.sleep(1000);
      expect(obj7.getElement('$attrs').getString('label')).assertEqual('strArray: ls,zs');
      console.info('[StorageLinkJsunit1_static_0700] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_0800
     * @tc.name     StorageLinkJsunit1_static_0800
     * @tc.desc     StorageLinkJsunit1_static_0800
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son8
      console.info('[StorageLinkJsunit1_static_0800] START');
      let driver = Driver.create()
      let button_son8 = await driver.findComponent(ON.id('button_son8'));
      await (button_son8?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson8 = inspector.getInspectorByKey('button_son8');
      let obj8 = JSON.parseJsonElement(strJson8);
      console.info("[StorageLinkJsunit1_static_0800] son8 obj8 is: " + JSON.stringify(obj8));
      await CommonFunc.sleep(1000);
      expect(obj8.getElement('$attrs').getString('label')).assertEqual('numArray: 2,3');
      console.info('[StorageLinkJsunit1_static_0800] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_0900
     * @tc.name     StorageLinkJsunit1_static_0900
     * @tc.desc     StorageLinkJsunit1_static_0900
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son9
      console.info('[StorageLinkJsunit1_static_0900] START');
      let driver = Driver.create()
      let button_son9 = await driver.findComponent(ON.id('button_son9'));
      await (button_son9?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson9 = inspector.getInspectorByKey('button_son9');
      let obj9 = JSON.parseJsonElement(strJson9);
      console.info("[StorageLinkJsunit1_static_0900] son9 obj9 is: " + JSON.stringify(obj9));
      await CommonFunc.sleep(1000);
      expect(obj9.getElement('$attrs').getString('label')).assertEqual('boolArray: false,true');
      console.info('[StorageLinkJsunit1_static_0900] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_1000
     * @tc.name     StorageLinkJsunit1_static_1000
     * @tc.desc     StorageLinkJsunit1_static_1000
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son9
      console.info('[StorageLinkJsunit1_static_1000] START');
      let driver = Driver.create()
      let button_son10 = await driver.findComponent(ON.id('button_son10'));
      await (button_son10?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson10 = inspector.getInspectorByKey('button_son10');
      let obj10 = JSON.parseJsonElement(strJson10);
      console.info("[StorageLinkJsunit1_static_1000] son10 obj10 is: " + JSON.stringify(obj10));
      await CommonFunc.sleep(1000);
      expect(obj10.getElement('$attrs').getString('label')).assertEqual('classArray: [{"value":"hello world"},{"value":"hello C"}]');
      console.info('[StorageLinkJsunit1_static_1000] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_1100
     * @tc.name     StorageLinkJsunit1_static_1100
     * @tc.desc     StorageLinkJsunit1_static_1100
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son11
      console.info('[StorageLinkJsunit1_static_1100] START');
      let driver = Driver.create()
      let button_son11 = await driver.findComponent(ON.id('button_son11'));
      await (button_son11?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson11 = inspector.getInspectorByKey('button_son11');
      let obj11 = JSON.parseJsonElement(strJson11);
      console.info("[StorageLinkJsunit1_static_1100] son11 obj11 is: " + JSON.stringify(obj11));
      await CommonFunc.sleep(1000);
      expect(obj11.getElement('$attrs').getString('label')).assertEqual('objArray: [{"name":"ls"},{"name":"zs"}]');
      console.info('[StorageLinkJsunit1_static_1100] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit1_static_1200
     * @tc.name     StorageLinkJsunit1_static_1200
     * @tc.desc     StorageLinkJsunit1_static_1200
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit1_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of button_son11
      console.info('[StorageLinkJsunit1_static_1200] START');
      let driver = Driver.create()
      let button_son12 = await driver.findComponent(ON.id('button_son12'));
      await (button_son12?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson12 = inspector.getInspectorByKey('button_son12');
      let obj12 = JSON.parseJsonElement(strJson12);
      console.info("[StorageLinkJsunit1_static_1200] son12 obj12 is: " + JSON.stringify(obj12));
      await CommonFunc.sleep(1000);
      expect(obj12.getElement('$attrs').getString('label')).assertEqual('menuArray: 2,3');
      console.info('[StorageLinkJsunit1_static_1200] END');
      done();
    });
  })
}
