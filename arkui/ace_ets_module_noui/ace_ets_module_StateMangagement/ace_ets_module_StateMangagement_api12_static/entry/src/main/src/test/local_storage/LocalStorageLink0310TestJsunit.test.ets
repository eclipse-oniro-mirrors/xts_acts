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


export default function LocalStorageLink0310TestJsunit() {
  describe('LocalStorageLink0310TestJsunit', () => {

    beforeAll(() => {
      console.info("LocalStorageLink0310TestJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LocalStorageLink0310TestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/local_storage/LocalStorageLink0310",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LocalStorageLink0310TestJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalStorageLink0310TestJsunit" == pages.name)) {
          console.info("get LocalStorageLink0310TestJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LocalStorageLink0310TestJsunit page error:" + err);
      }
      console.info("LocalStorageLink0310TestJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalStorageLink0310TestJsunit after each called");
    });

    
    
    /**
     * @tc.number   LocalStorageLink0310TestJsunit_static_001
     * @tc.name     LocalStorageLink0310TestJsunit_static_001
     * @tc.desc     LocalStorageLink0310TestJsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('LocalStorageLink0310TestJsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorageLink0310TestJsunit_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("btnLocalStorageLink0310"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ParentSet'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('0,1');
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ParentMap'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('newValue');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ParentDate'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Thu Feb 01 2024 08:09:31 GMT+0800');
      await CommonFunc.sleep(1000);
      let obj3 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ParentUnd'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('Helloundefined');
      await CommonFunc.sleep(1000);
      let obj4 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ParentNull'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('Hellonull');
      await CommonFunc.sleep(1000);
      let obj5 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ChildSet'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj1 is: " + JSON.stringify(obj5));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('0,1');
      await CommonFunc.sleep(1000);
      let obj6 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ChildMap'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('newValue');
      await CommonFunc.sleep(1000);
      let obj7 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ChildDate'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj7 is: " + JSON.stringify(obj7));
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('Thu Feb 01 2024 08:09:31 GMT+0800');
      await CommonFunc.sleep(1000);
      let obj8 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ChildUnd'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj8 is: " + JSON.stringify(obj8));
      expect(obj8.getElement('$attrs').getString('content')).assertEqual('Helloundefined');
      await CommonFunc.sleep(1000);
      let obj9 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ChildNull'));
      console.info("[LocalStorageLink0310TestJsunit_static_001] component obj9 is: " + JSON.stringify(obj9));
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('Hellonull');
      console.info('[LocalStorageLink0310TestJsunit_static_001] END');
      done();
    });
    
    
    /**
     * @tc.number   LocalStorageLink0310TestJsunit_static_002
     * @tc.name     LocalStorageLink0310TestJsunit_static_002
     * @tc.desc     LocalStorageLink0310TestJsunit_static_002
     * @tc.level    Level.LEVEL0
     */
it('LocalStorageLink0310TestJsunit_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorageLink0310TestJsunit_static_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("btnLocalStorageLink0310"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ParentArr'));
      console.info("[LocalStorageLink0310TestJsunit_static_002] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Arr[1,true,{"propB":48}]');
      await CommonFunc.sleep(1000);

      let obj5 = JSON.parseJsonElement(inspector.getInspectorByKey('tv0310ChildArr'));
      console.info("[LocalStorageLink0310TestJsunit_static_002] component obj1 is: " + obj5.getElement('$attrs').getString('content'));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('Arr[1,true,{"propB":48}]');
      await CommonFunc.sleep(1000);

      console.info('[LocalStorageLink0310TestJsunit_static_001] END');
      done();
    });
  })
}
