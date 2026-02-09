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
export default function getTarget4Test() {
  describe('getTarget4Test', () => {

    beforeAll(() => {
      console.info("getTarget4Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("getTarget4Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getTarget/getTarget4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getTarget4Test state pages:" + JSON.stringify(pages));
        if (!("getTarget4Test" == pages.name)) {
          console.info("get getTarget4Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push getTarget4Test page error:" + err);
      }
      console.info("getTarget4Test beforeEach end");
    });


    
    
    /**
     * @tc.number   getTarget4Test_static_0100
     * @tc.name     getTarget4Test_static_0100
     * @tc.desc     getTarget4Test_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getTarget4Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('getTarget4Test_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('useGetTarget4_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget4Test_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('this.InfoV1Observed === g0 true');

      strJson = inspector.getInspectorByKey('useGetTarget4_2');
      obj = JSON.parseJsonElement(strJson);
      console.info("[getTarget4Test_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('UIUtils.getTarget(this.InfoV1Observed) === g0: true');

      console.info('[getTarget4Test_static_0100] END');
      done();
    });
  })
}

