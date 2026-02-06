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
export default function LocalStorageAbsTestJsunit() {
  describe('LocalStorageAbsTestJsunit', () => {

    beforeAll(() => {
      console.info("LocalStorageAbsTestJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LocalStorageAbsTestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/local_storage/LocalStorageAbs",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LocalStorageAbsTestJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalStorageAbsTestJsunit" == pages.name)) {
          console.info("get LocalStorageAbsTestJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LocalStorageAbsTestJsunit page error:" + err);
      }
      console.info("LocalStorageAbsTestJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalStorageAbsTestJsunit after each called");
    });

    
    
    /**
     * @tc.number   LocalStorageAbsTestJsunit_static_001
     * @tc.name     LocalStorageAbsTestJsunit_static_001
     * @tc.desc     LocalStorageAbsTestJsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('LocalStorageAbsTestJsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorageAbsTestJsunit_static_001] START');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsNum'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('35');
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsStr'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('value');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsBoo'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('false');
      await CommonFunc.sleep(1000);
      let obj3 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsObj'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('value');
      await CommonFunc.sleep(1000);
      let obj4 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsClass'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('00');
      await CommonFunc.sleep(1000);
      let obj5 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsEnum'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj5 is: " + JSON.stringify(obj5));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('PA');
      await CommonFunc.sleep(1000);
      let obj6 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsArr'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('1');
      await CommonFunc.sleep(1000);
      let obj7 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsMap'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj7 is: " + JSON.stringify(obj7));
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('value');
      await CommonFunc.sleep(1000);
      let obj8 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsSet'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj8 is: " + JSON.stringify(obj8));
      expect(obj8.getElement('$attrs').getString('content')).assertEqual('0');
      await CommonFunc.sleep(1000);
      let obj9 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsDate'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj9 is: " + JSON.stringify(obj9));
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('Thu Feb 01 2024');
      await CommonFunc.sleep(1000);
      let obj10 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsNull'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj10 is: " + JSON.stringify(obj10));
      expect(obj10.getElement('$attrs').getString('content')).assertEqual('Hello,null');
      await CommonFunc.sleep(1000);
      let obj11 = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsUnd'));
      console.info("[LocalStorageAbsTestJsunit_static_001] component obj11 is: " + JSON.stringify(obj11));
      expect(obj11.getElement('$attrs').getString('content')).assertEqual('Hello,undefined');
      console.info('[LocalStorageAbsTestJsunit_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   LocalStorageAbsTestJsunit_static_002
     * @tc.name     LocalStorageAbsTestJsunit_static_002
     * @tc.desc     LocalStorageAbsTestJsunit_static_002
     * @tc.level    Level.LEVEL0
     */
it('LocalStorageAbsTestJsunit_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorageAbsTestJsunit_static_002] START');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsInfo'));
      console.info("[LocalStorageAbsTestJsunit_static_002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Info,localStorageAbsNum');
      console.info('[LocalStorageAbsTestJsunit_static_002] END');
      done();
    });

    
    
    /**
     * @tc.number   LocalStorageAbsTestJsunit_static_003
     * @tc.name     LocalStorageAbsTestJsunit_static_003
     * @tc.desc     LocalStorageAbsTestJsunit_static_003
     * @tc.level    Level.LEVEL0
     */
it('LocalStorageAbsTestJsunit_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorageAbsTestJsunit_static_003] START');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsNotName'));
      console.info("[LocalStorageAbsTestJsunit_static_003] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('NotName,undefined');
      console.info('[LocalStorageAbsTestJsunit_static_003] END');
      done();
    });

    
    
    /**
     * @tc.number   LocalStorageAbsTestJsunit_static_004
     * @tc.name     LocalStorageAbsTestJsunit_static_004
     * @tc.desc     LocalStorageAbsTestJsunit_static_004
     * @tc.level    Level.LEVEL0
     */
it('LocalStorageAbsTestJsunit_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorageAbsTestJsunit_static_004] START');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsHasName'));
      console.info("[LocalStorageAbsTestJsunit_static_004] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('HasName,35');
      console.info('[LocalStorageAbsTestJsunit_static_004] END');
      done();
    });

    
    
    /**
     * @tc.number   LocalStorageAbsTestJsunit_static_005
     * @tc.name     LocalStorageAbsTestJsunit_static_005
     * @tc.desc     LocalStorageAbsTestJsunit_static_005
     * @tc.level    Level.LEVEL0
     */
it('LocalStorageAbsTestJsunit_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorageAbsTestJsunit_static_005] START');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsNotRefName'));
      console.info("[LocalStorageAbsTestJsunit_static_005] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('NotRefName,44');
      console.info('[LocalStorageAbsTestJsunit_static_005] END');
      done();
    });

    
    
    /**
     * @tc.number   LocalStorageAbsTestJsunit_static_006
     * @tc.name     LocalStorageAbsTestJsunit_static_006
     * @tc.desc     LocalStorageAbsTestJsunit_static_006
     * @tc.level    Level.LEVEL0
     */
it('LocalStorageAbsTestJsunit_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorageAbsTestJsunit_static_006] START');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvLocalStorageAbsHasRefName'));
      console.info("[LocalStorageAbsTestJsunit_static_006] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('HasRefName,value');
      console.info('[LocalStorageAbsTestJsunit_static_006] END');
      done();
    });

  })
}
