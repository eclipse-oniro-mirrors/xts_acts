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


export default function StorageProp20Jsunit() {
  describe('StorageProp20Jsunit', () => {
    beforeAll(() => {
      console.info("StorageProp20Jsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StorageProp20Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StorageProp20',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StorageProp20Jsunit state pages:" + JSON.stringify(pages));
        if (!("StorageProp20" == pages.name)) {
          console.info("get StorageProp20Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StorageProp20Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageProp20Jsunit page error:" + err);
      }
      console.info("StorageProp20Jsunit beforeEach end");
    });

    /**
     * @tc.number   StorageProp20Jsunit_static_0100
     * @tc.name     StorageProp20Jsunit_static_0100
     * @tc.desc     StorageProp20Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('StorageProp20Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageProp20Jsunit_static_0100] START');
      let strJson1 = inspector.getInspectorByKey('text_state');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp20Jsunit_static_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('State:10');
      console.info('[StorageProp20Jsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   StorageProp20Jsunit_static_0200
     * @tc.name     StorageProp20Jsunit_static_0200
     * @tc.desc     StorageProp20Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StorageProp20Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageProp20Jsunit_static_0200] START');
      let strJson1 = inspector.getInspectorByKey('text_Link');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp20Jsunit_static_0200] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Link:10');
      console.info('[StorageProp20Jsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   StorageProp20Jsunit_static_0300
     * @tc.name     StorageProp20Jsunit_static_0300
     * @tc.desc     StorageProp20Jsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('StorageProp20Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageProp20Jsunit_static_0300] START');
      let strJson1 = inspector.getInspectorByKey('text_Prop');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp20Jsunit_static_0300] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('PropRef:10');
      console.info('[StorageProp20Jsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   StorageProp20Jsunit_static_0400
     * @tc.name     StorageProp20Jsunit_static_0400
     * @tc.desc     StorageProp20Jsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StorageProp20Jsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageProp20Jsunit_static_0400] START');
      let strJson1 = inspector.getInspectorByKey('text_Provide');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp20Jsunit_static_0400] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Provide:10');
      console.info('[StorageProp20Jsunit_static_0400] END');
      done();
    });
  })
}
