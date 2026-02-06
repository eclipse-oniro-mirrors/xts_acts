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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function onTouchIntercept() {
  describe('onTouchIntercept', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api12.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("onTouchIntercept beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get onTouchIntercept state pages:" + JSON.stringify(pages));
        if (!("onTouchIntercept" == pages.name)) {
          console.info("get  onTouchIntercept pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: "MainAbility/pages/onTouchIntercept/onTouchIntercept"
          })
        }
      } catch (err) {
        console.error("push onTouchIntercept page error:" + err);
      }
      console.info("onTouchIntercept foreEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("onTouchIntercept after each called");
    });

    /**
     * @tc.number onTouchIntercept_static_001
     * @tc.name   onTouchIntercept_static_001
     * @tc.desc onTouchIntercept test
     * @tc.level Level 3
     * @tc.type
     */
    it('onTouchIntercept_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onTouchIntercept_static_001] START');

      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button = await (driver.findComponent(ON.id('onTouchIntercept')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('onTouchInterceptText');
      await CommonFunc.sleep(200);
      console.info("[onTouchIntercept_static_001] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      await CommonFunc.sleep(1000);

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content') != '').assertTrue();
      console.info('[onTouchIntercept_static_001] END');
      done();
    });


  })
}
