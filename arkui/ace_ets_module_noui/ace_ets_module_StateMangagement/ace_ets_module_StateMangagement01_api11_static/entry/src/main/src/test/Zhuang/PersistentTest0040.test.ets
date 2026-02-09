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
import router from '@ohos.router';
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

export default function PersistentTest0040() {
  describe('PersistentTest0040', () => {
    beforeAll(() => {
      console.info("PersistentTest0040 beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement01.api11.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("PersistentTest0040 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Zhuang/Persistent0040",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PersistentTest0040 state pages:" + JSON.stringify(pages));
        if (!("PersistentTest0040" == pages.name)) {
          console.info("get PersistentTest0040 pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PersistentTest0040 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistentTest0040 page error:" + err);
      }
      console.info("PersistentTest0040 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PersistentTest0040 after each called");
    });

    
    
/**
     * @tc.number   PersistentTest0040_static_001
     * @tc.name     PersistentTest0040_static_001
     * @tc.desc     PersistentTest0040_static_001
     * @tc.level    Level.LEVEL0
     */
it('PersistentTest0040_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[PersistentTest0040_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component|null = await driver.findComponent(ON.id("btnChangePS0040")) ;
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>) ;
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvPS0040'));
      console.info("[PersistentTest0040] component obj content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('value:HelloArkUI');
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await driver.findComponent(ON.id("btnDelPS0040"));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>) ;
      console.info('[PersistentTest0040_static_001] END');
      done();
    });
  })
}
