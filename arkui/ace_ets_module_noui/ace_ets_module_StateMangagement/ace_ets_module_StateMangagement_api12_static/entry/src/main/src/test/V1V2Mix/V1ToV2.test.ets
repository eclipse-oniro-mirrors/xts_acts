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


export default function V1ToV2() {
  describe('V1ToV2', () => {

    beforeAll(() => {
      console.info("V1ToV2 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("V1ToV2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/V1V2Mix/V1ToV2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get V1ToV2 state pages:" + JSON.stringify(pages));
        if (!("V1ToV2" == pages.name)) {
          console.info("get V1ToV2 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push V1ToV2 page error:" + err);
      }
      console.info("V1ToV2 beforeEach end");
    });
    
  
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("V1ToV2 after each called");
    });

    
    
    /**
     * @tc.number   v1Tov2_static_001
     * @tc.name     v1Tov2_static_001
     * @tc.desc     v1Tov2_static_001
     * @tc.level    Level.LEVEL0
     */
it('v1Tov2_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v1Tov2_static_001] START');
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('state_string_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_static_001] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello v1');
      console.info('[v1Tov2_static_001] END');
      done();
    })
    
    /**
     * @tc.number   v1Tov2_static_002
     * @tc.name     v1Tov2_static_002
     * @tc.desc     v1Tov2_static_002
     * @tc.level    Level.LEVEL0
     */
it('v1Tov2_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v1Tov2_static_002] START');
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('prop_number_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_static_002] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[v1Tov2_static_002] END');
      done();
    })
    
    /**
     * @tc.number   v1Tov2_static_003
     * @tc.name     v1Tov2_static_003
     * @tc.desc     v1Tov2_static_003
     * @tc.level    Level.LEVEL0
     */
it('v1Tov2_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v1Tov2_static_003] START');
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('provide_enum_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_static_003] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[v1Tov2_static_003] END');
      done();
    })
    
    /**
     * @tc.number   v1Tov2_static_004
     * @tc.name     v1Tov2_static_004
     * @tc.desc     v1Tov2_static_004
     * @tc.level    Level.LEVEL0
     */
it('v1Tov2_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v1Tov2_static_004] START');
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('consume_null_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_static_004] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('null');
      console.info('[v1Tov2_static_004] END');
      done();
    })
    
    /**
     * @tc.number   v1Tov2_static_005
     * @tc.name     v1Tov2_static_005
     * @tc.desc     v1Tov2_static_005
     * @tc.level    Level.LEVEL0
     */
it('v1Tov2_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v1Tov2_static_005] START');
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('storage_link_undefined_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_static_005] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('undefined');
      console.info('[v1Tov2_static_005] END');
      done();
    })
    
    /**
     * @tc.number   v1Tov2_static_006
     * @tc.name     v1Tov2_static_006
     * @tc.desc     v1Tov2_static_006
     * @tc.level    Level.LEVEL0
     */
it('v1Tov2_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v1Tov2_static_006] START');
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('storage_prop_string_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_static_006] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello v1');
      console.info('[v1Tov2_static_006] END');
      done();
    })
    
    /**
     * @tc.number   v1Tov2_static_007
     * @tc.name     v1Tov2_static_007
     * @tc.desc     v1Tov2_static_007
     * @tc.level    Level.LEVEL0
     */
it('v1Tov2_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v1Tov2_static_007] START');
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('func_value2'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_static_007] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('hello v1,1,1,null,hello v1,undefined');
      console.info('[v1Tov2_static_007] END');
      done();
    })
    
    /**
     * @tc.number   v1Tov2_static_008
     * @tc.name     v1Tov2_static_008
     * @tc.desc     v1Tov2_static_008
     * @tc.level    Level.LEVEL0
     */
it('v1Tov2_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v1Tov2_static_008] START');
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('link_boolean_value'));
      await CommonFunc.sleep(1000);
      console.info("[v1Tov2_static_008] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('false');
      console.info('[v1Tov2_static_008] END');
      done();
    })
  })
}