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


export default function StorageLinkJsunit2() {
  describe('StorageLinkJsunit2', () => {
    beforeAll(() => {
      console.info("StorageLinkJsunit2 beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StorageLinkJsunit2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StorageLink2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StorageLinkJsunit2 state pages:" + JSON.stringify(pages));
        if (!("StorageLink2" == pages.name)) {
          console.info("get StorageLinkJsunit2 pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StorageLinkJsunit2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageLinkJsunit2 page error:" + err);
      }
      console.info("StorageLinkJsunit2 beforeEach end");
    });

    /**
     * @tc.number   StorageLinkJsunit2_static_0100
     * @tc.name     StorageLinkJsunit2_static_0100
     * @tc.desc     StorageLinkJsunit2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of son1 and son2
      console.info('[StorageLinkJsunit2_static_0100] START');
      let driver = Driver.create()
      let button_son111 = await driver.findComponent(ON.id('button_son111'));
      await (button_son111?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('button_son111');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageLinkJsunit2_static_0100] son1 obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('has1: true');
      console.info('[StorageLinkJsunit2_static_0100] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit2_static_0200
     * @tc.name     StorageLinkJsunit2_static_0200
     * @tc.desc     StorageLinkJsunit2_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit2_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of son1 and son2
      console.info('[StorageLinkJsunit2_static_0200] START');
      let driver = Driver.create()
      let button_son2 = await driver.findComponent(ON.id('button_son2'));
      await (button_son2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('button_son2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageLinkJsunit2_static_0200] son2 obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.getElement('$attrs').getString('label')).assertEqual('has2: false');
      console.info('[StorageLinkJsunit2_static_0200] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit2_static_0300
     * @tc.name     StorageLinkJsunit2_static_0300
     * @tc.desc     StorageLinkJsunit2_static_0300
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit2_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of son1 and son2
      console.info('[StorageLinkJsunit2_static_0300] START');
      let driver = Driver.create()
      let button_son3 = await driver.findComponent(ON.id('button_son3'));
      await (button_son3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let Storage12ContentJson = inspector.getInspectorByKey('text');
      let text = JSON.parseJsonElement(Storage12ContentJson);
      console.info("[StorageLinkJsunit2_static_0300] son3 text is: " + JSON.stringify(text));
      await CommonFunc.sleep(1000);
      expect(text.getElement('$attrs').getString('content')).assertEqual('has3: true');
      console.info('[StorageLinkJsunit2_static_0300] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit2_static_0400
     * @tc.name     StorageLinkJsunit2_static_0400
     * @tc.desc     StorageLinkJsunit2_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit2_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Get the init value of son1 and son2
      console.info('[StorageLinkJsunit2_static_0400] START');
      let driver = Driver.create()
      let button_son4 = await driver.findComponent(ON.id('button_son4'));
      await (button_son4?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson4 = inspector.getInspectorByKey('button_son4');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[StorageLinkJsunit2_static_0400] son4 obj4 is: " + JSON.stringify(obj4));
      await CommonFunc.sleep(1000);
      expect(obj4.getElement('$attrs').getString('label')).assertEqual('has4: true');
      console.info('[StorageLinkJsunit2_static_0400] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit2_static_0500
     * @tc.name     StorageLinkJsunit2_static_0500
     * @tc.desc     StorageLinkJsunit2_static_0500
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit2_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Click to change the value of Storage
      console.info('[StorageLinkJsunit2_static_0500] START');
      let driver = Driver.create()
      let button_son5 = await driver.findComponent(ON.id('button_son5'));
      await (button_son5?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson5 = inspector.getInspectorByKey('button_son5');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[StorageLinkJsunit2_static_0500] son5 obj5 is: " + JSON.stringify(obj5));
      await CommonFunc.sleep(2000);
      expect(obj5.getElement('$attrs').getString('label')).assertEqual('son1: 48');
      console.info('[StorageLinkJsunit2_static_0500] END');
      done();
    });

    /**
     * @tc.number   StorageLinkJsunit2_static_0600
     * @tc.name     StorageLinkJsunit2_static_0600
     * @tc.desc     StorageLinkJsunit2_static_0600
     * @tc.level    Level.LEVEL0
     */
it('StorageLinkJsunit2_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Click to change the value of Storage
      console.info('[StorageLinkJsunit2_static_0600] START');
      let driver = Driver.create()
      let button_son6 = await driver.findComponent(ON.id('button_son6'));
      await (button_son6?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let strJson6 = inspector.getInspectorByKey('button_son6');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[StorageLinkJsunit2_static_0600] son6 obj6 is: " + JSON.stringify(obj6));
      await CommonFunc.sleep(1000);
      expect(obj6.getElement('$attrs').getString('label')).assertEqual('son2: 49');
      console.info('[StorageLinkJsunit2_static_0600] END');
      done();
    });
  })
}
