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

export default function twoWayBindTest() {
  describe('twoWayBindTest', () => {

    beforeAll(() => {
      console.info("StateTrackTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StateTrackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/twoWayBind/twoWayBind',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateTrackTest state pages:" + JSON.stringify(pages));
        if (!("twoWayBind" == pages.name)) {
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


    
    /**
     * @tc.number   twoWayBindTest_0100
     * @tc.name     twoWayBindTest_0100
     * @tc.desc     twoWayBindTest_0100
     * @tc.level    Level.LEVEL0
     */
it('twoWayBindTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('twoWayBindTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);

      let radio = await driver.findComponent(ON.id('radio'));
      await ( radio?.click() as Promise<void>);;
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('V1BindText');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[twoWayBindTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Radio1 is checked: true');

      console.info('[twoWayBindTest_0100] END');
      done();
    });
  })
}

