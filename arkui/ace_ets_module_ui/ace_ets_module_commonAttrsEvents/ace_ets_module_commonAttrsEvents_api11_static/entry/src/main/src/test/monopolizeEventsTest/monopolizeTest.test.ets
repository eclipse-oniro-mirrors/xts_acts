'use static';
/**
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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function monopolizeTest() {
  describe('monopolizeTest', () => {

    beforeAll(() => {
      console.info("monopolizeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("monopolizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/monopolizeEvents/monopolize",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("monopolize" == pages.name)) {
          console.info("get monopolizeTest state pages:" + JSON.stringify(pages));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push monopolizeTest page error:" + err);
      }
      console.info("monopolizeTest beforeEach end");
    });


    
    
    /**
     * @tc.number   monopolizeTest_static_0100
     * @tc.name     monopolizeTest_static_0100
     * @tc.desc     monopolizeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('monopolizeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('monopolizeTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('monopolize_column');
      console.info("[monopolizeTest_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[monopolizeTest_static_0100] component obj.getElement('$attrs') is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[monopolizeTest_static_0100] text: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('monopolizeEvents')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('monopolizeEvents')).assertEqual(false);
      console.info('[monopolizeTest_static_0100] END');
      done();
    });
  })
}

