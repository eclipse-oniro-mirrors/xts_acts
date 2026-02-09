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


export default function CombinationState6Jsunit() {
  describe('CombinationState6Jsunit', () => {
    beforeAll(() => {
      console.info("CombinationState6Jsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("CombinationState6Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/CombinationState6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CombinationState6Jsunit state pages:" + JSON.stringify(pages));
        if (!("CombinationState6" == pages.name)) {
          console.info("get CombinationState6Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CombinationState6Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CombinationState6Jsunit page error:" + err);
      }
      console.info("CombinationState6Jsunit beforeEach end");
    });

    /**
     * @tc.number   CombinationState6Jsunit_static_0100
     * @tc.name     CombinationState6Jsunit_static_0100
     * @tc.desc     CombinationState6Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('CombinationState6Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      console.info('[CombinationState6Jsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('PropObjectLink1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState6Jsunit_static_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PropObjectLink:1');
      console.info('[CombinationState6Jsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   CombinationState6Jsunit_static_0200
     * @tc.name     CombinationState6Jsunit_static_0200
     * @tc.desc     CombinationState6Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('CombinationState6Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      console.info('[CombinationState6Jsunit_static_0200] START');
      let strJson1 = inspector.getInspectorByKey('PropObjectLink2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState6Jsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('PropObjectLink:2');
      console.info('[CombinationState6Jsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   CombinationState6Jsunit_static_0300
     * @tc.name     CombinationState6Jsunit_static_0300
     * @tc.desc     CombinationState6Jsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('CombinationState6Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      console.info('[CombinationState6Jsunit_static_0300] START');
      let strJson2 = inspector.getInspectorByKey('PropObjectLink3');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[CombinationState6Jsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('PropObjectLink:3');
      console.info('[CombinationState6Jsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   CombinationState6Jsunit_static_0500
     * @tc.name     CombinationState6Jsunit_static_0500
     * @tc.desc     CombinationState6Jsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('CombinationState6Jsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      console.info('[CombinationState6Jsunit_static_0500] START');
      let strJson4 = inspector.getInspectorByKey('PropObjectLink5');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[CombinationState6Jsunit_static_0500] component obj4 is: " + JSON.stringify(obj4));
      await CommonFunc.sleep(1000);
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('PropObjectLink:5');
      console.info('[CombinationState6Jsunit_static_0500] END');
      done();
    });
  })
}
