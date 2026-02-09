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

export default function StateTrackTest() {
  describe('StateTrackTest', () => {

    beforeAll(() => {
      console.info("StateTrackTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StateTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Track/StateTrack',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateTrackTest state pages:" + JSON.stringify(pages));
        if (!("StateTrack" == pages.name)) {
          console.info("get StateTrackTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StateTrackTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateTrackTest page error:" + err);
      }
      console.info("StateTrackTest beforeEach end");
    });
  

    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('StateTrack_reset'));
      await (button?.click() as Promise<void>);
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
    });
    
    /**
     * @tc.number   StateTrackTest_0100
     * @tc.name     StateTrackTest_0100
     * @tc.desc     StateTrackTest_0100
     * @tc.level    Level.LEVEL0
     */
it('StateTrackTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('StateTrackTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('change_stateA'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Track_prop');
      let strJson1 = inspector.getInspectorByKey('Track_objectlink');
      let strJson2 = inspector.getInspectorByKey('Track_link');
      let strJson3 = inspector.getInspectorByKey('Track_state');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[StateTrackTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateTrackTest_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('memberA=21');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('memberA=21');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('memberA=21');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('memberA=21');
      console.info('[StateTrackTest_0100] END');
      done();
    });
    
    /**
     * @tc.number   StateTrackTest_0200
     * @tc.name     StateTrackTest_0200
     * @tc.desc     StateTrackTest_0200
     * @tc.level    Level.LEVEL0
     */
it('StateTrackTest_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('StateTrackTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('change_stateB'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Track_prop1');
      let strJson1 = inspector.getInspectorByKey('Track_objectlink1');
      let strJson2 = inspector.getInspectorByKey('Track_link1');
      let strJson3 = inspector.getInspectorByKey('Track_state1');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[StateTrackTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateTrackTest_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('memberC=31');
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('memberC=31');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('memberC=31');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('memberC=31');
      console.info('[StateTrackTest_0100] END');
      done();
    });
  })
}

