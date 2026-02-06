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

export default function localTrackTest() {
  describe('localTrackTest', () => {

    beforeAll(() => {
      console.info("localTrackTestckTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("localTrackTestckTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Track/localTrack',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get localTrackTestckTest state pages:" + JSON.stringify(pages));
        if (!("localTrack" == pages.name)) {
          console.info("get localTrackTestckTest pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push localTrackTestckTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push localTrackTestckTest page error:" + err);
      }
      console.info("localTrackTestckTest beforeEach end");
    });

    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('localTrack_reset'));
      await (button?.click() as Promise<void>);
      console.log('reset button click succ')
      await CommonFunc.sleep(2000);
    });
    
    /**
     * @tc.number   localTrackTest_0100
     * @tc.name     localTrackTest_0100
     * @tc.desc     localTrackTest_0100
     * @tc.level    Level.LEVEL0
     */
it('localTrackTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('localTrackTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('Track_LocalStorageProp'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Track_LocalStorageProp');
      let strJson1 = inspector.getInspectorByKey('Track_LocalStorageLink');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[localTrackTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[localTrackTest_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('LocalStoragePropRef:11');
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('LocalStorageLink:10');
      console.info('[localTrackTest_0100] END');
      done();
    });
    
    /**
     * @tc.number   localTrackTest_0200
     * @tc.name     localTrackTest_0200
     * @tc.desc     localTrackTest_0200
     * @tc.level    Level.LEVEL0
     */
it('localTrackTest_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('localTrackTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('Track_LocalStorageLink'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Track_LocalStorageProp');
      let strJson1 = inspector.getInspectorByKey('Track_LocalStorageLink');
      let obj = JSON.parseJsonElement(strJson);
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[localTrackTest_0200] component obj is: " + JSON.stringify(obj));
      console.info("[localTrackTest_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('LocalStoragePropRef:12');
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('LocalStorageLink:12');
      console.info('[localTrackTest_0200] END');
      done();
    });
  })
}

