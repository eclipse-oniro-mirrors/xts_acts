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


export default function V2ToV1() {
  describe('V2ToV1', () => {

    beforeAll(() => {
      console.info("V2ToV1 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("V2ToV1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/V1V2Mix/V2ToV1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get V2ToV1 state pages:" + JSON.stringify(pages));
        if (!("V2ToV1" == pages.name)) {
          console.info("get V2ToV1 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push V2ToV1 page error:" + err);
      }
      console.info("V2ToV1 beforeEach end");
    });
   
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("V2ToV1 after each called");
    });

    
    
    /**
     * @tc.number   v2Tov1_static_0100
     * @tc.name     v2Tov1_static_0100
     * @tc.desc     v2Tov1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_0100] START');
      let Json = inspector.getInspectorByKey('string_param1');
      let Obj = JSON.parseJsonElement(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_static_0100] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 stringValue1: hello2');
      done();
    })
    
    /**
     * @tc.number   v2Tov1_static_0200
     * @tc.name     v2Tov1_static_0200
     * @tc.desc     v2Tov1_static_0200
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_0200] START');
      let Json = inspector.getInspectorByKey('enum_value1');
      let Obj = JSON.parseJsonElement(Json);
      console.log('[v2Tov1_static_0200] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 enumValue1: 2');
      done();
    })
    
    /**
     * @tc.number   v2Tov1_static_0300
     * @tc.name     v2Tov1_static_0300
     * @tc.desc     v2Tov1_static_0300
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_0300] START');
      let Json = inspector.getInspectorByKey('local_value1');
      let Obj = JSON.parseJsonElement(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_static_0300] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 localValue1: TestProvider');
      done();
    })
    
    /**
     * @tc.number   v2Tov1_static_0400
     * @tc.name     v2Tov1_static_0400
     * @tc.desc     v2Tov1_static_0400
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_0400] START');
      let Json = inspector.getInspectorByKey('bool_value1');
      let Obj = JSON.parseJsonElement(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_static_0400] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 boolValue1: false');
      done();
    })
    
    /**
     * @tc.number   v2Tov1_static_0500
     * @tc.name     v2Tov1_static_0500
     * @tc.desc     v2Tov1_static_0500
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_0500] START');
      let Json = inspector.getInspectorByKey('undefined_value1');
      let Obj = JSON.parseJsonElement(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_static_0500] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 undefinedValue1: undefined');
      done();
    })
    
    /**
     * @tc.number   v2Tov1_static_0600
     * @tc.name     v2Tov1_static_0600
     * @tc.desc     v2Tov1_static_0600
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_0600] START');
      let Json = inspector.getInspectorByKey('null_value1');
      let Obj = JSON.parseJsonElement(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_static_0600] Obj4 ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 nullValue1: null');
      done();
    })
    
     /**
     * @tc.number   v2Tov1_static_0700
     * @tc.name     v2Tov1_static_0700
     * @tc.desc     v2Tov1_static_0700
     * @tc.level    Level.LEVEL0
     */
//it('v2Tov1_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   console.info('[v2Tov1_static_0700] START');
    //   let Json = inspector.getInspectorByKey('func_value2');
    //   let Obj = JSON.parseJsonElement(Json);
    //   await CommonFunc.sleep(1000);
    //   console.log('[v2Tov1_static_0700] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
    //   expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 funcValue2: 0');
    //   done();
    // })
    
    /**
     * @tc.number   v2Tov1_static_0800
     * @tc.name     v2Tov1_static_0800
     * @tc.desc     v2Tov1_static_0800
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_0800] START');
      let Json = inspector.getInspectorByKey('map_value');
      let Obj = JSON.parseJsonElement(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_static_0800] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 mapValue: v2,v2');
      done();
    })
    
    /**
     * @tc.number   v2Tov1_static_0900
     * @tc.name     v2Tov1_static_0900
     * @tc.desc     v2Tov1_static_0900
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_0900] START');
      let Json = inspector.getInspectorByKey('date_value');
      let Obj = JSON.parseJsonElement(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_static_0900] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 dateValue: Mon Nov 11 2024 00:00:00 GMT+0800');
      done();
    })
    
    /**
     * @tc.number   v2Tov1_static_1000
     * @tc.name     v2Tov1_static_1000
     * @tc.desc     v2Tov1_static_1000
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_1000] START');
      let Json = inspector.getInspectorByKey('arr_value');
      let Obj = JSON.parseJsonElement(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_static_1000] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 arrValue: 1,2');
      done();
    })
    
    /**
     * @tc.number   v2Tov1_static_1100
     * @tc.name     v2Tov1_static_1100
     * @tc.desc     v2Tov1_static_1100
     * @tc.level    Level.LEVEL0
     */
it('v2Tov1_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[v2Tov1_static_1100] START');
      let Json = inspector.getInspectorByKey('set_value');
      let Obj = JSON.parseJsonElement(Json);
      await CommonFunc.sleep(1000);
      console.log('[v2Tov1_static_1100] Obj ' + JSON.stringify(Obj.getElement('$attrs').getString('content')));
      expect(Obj.getElement('$attrs').getString('content')).assertEqual('v1 setValue: v2, v2');
      done();
    })
  })
}