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
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function onChildTouchTest() {
  describe('onChildTouchTest', () => {
    beforeAll(() => {
      console.info("onChildTouchTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("onChildTouchTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/onChildTouch/onChildTouch",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("onChildTouch" == pages.name)) {
          console.info("get onChildTouchTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onChildTouchTest page error:" + err);
      }
      console.info("onChildTouchTest beforeEach end");
    });


    
    
    /**
     * @tc.number   onChildTouchTest_static_0100
     * @tc.name     onChildTouchTest_static_0100
     * @tc.desc     onChildTouchTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('onChildTouchTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('onChildTouchTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(500);
      let button = await (driver.findComponent(ON.id('onChild_list')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onChild_Button');
      console.info("[onChildTouchTest_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[onChildTouchTest_static_0100] component obj.getElement('$attrs') is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[onChildTouchTest_static_0100] text: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('onChildTouch');
      console.info('[onChildTouchTest_static_0100] END');
      done();
    });
  })
}

