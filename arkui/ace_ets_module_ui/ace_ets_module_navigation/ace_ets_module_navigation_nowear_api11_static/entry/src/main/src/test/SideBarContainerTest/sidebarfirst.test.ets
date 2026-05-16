'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function sidebarIconsJsunit() {
  describe('sidebarIconsTest', () => {
    beforeAll(() => {
      console.info("sidebarIconsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear11.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/sidebar2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sidebar state success " + JSON.stringify(pages));
        if (!("sidebar2" == pages.name)) {
          console.info("get sidebar state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push sidebar page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("sidebarIcons after each called");
    });


    
/**
     * @tc.number   testsidebarIcons_static_0011
     * @tc.name     testsidebarIcons_static_0011
     * @tc.desc     testsidebarIcons_static_0011
     * @tc.level    Level.LEVEL0
     */
    it('testsidebarIcons_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sidebarIcons testsidebarIcons0011 START');
      await Utils.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('SideBarContainer');
      console.info("[testsidebarIcons0011] component controlButton strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SideBarContainer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('controlButton').tryGetElement('icons')).assertEqual(undefined);
      console.info("[testsidebarIcons0011] controlButton value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('controlButton'));
      done();
    });
  })
}
