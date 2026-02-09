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

import events_emitter from '@ohos.events.emitter';
import {Color,$r} from '@ohos.arkui.component'
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function sideBarShowSideBarJsunit() {
  describe('sideBarShowSideBarTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/sideBar',
      }
      try {
        await UtilsTest.startAbility("com.arkui.ace.navigationnowear12.static", "EntryAbility")

        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get sideBar state success " + JSON.stringify(pages));
        if (!("sideBar" == pages.name)) {
          console.info("get sideBar state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push sideBar page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("sideBarShowSideBar after each called");
    });

    
    
/**
     * @tc.number   testsideBarShowSideBar_static_0001
     * @tc.name     testsideBarShowSideBar_static_0001
     * @tc.desc     testsideBarShowSideBar_static_0001
     * @tc.level    Level.LEVEL0
     */
    it('testsideBarShowSideBar_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0001 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0001] component showSideBar strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('SideBarContainer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar')).assertEqual("true");
      console.info("[testsideBarShowSideBar0001] showSideBar value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('showSideBar'));
      done()
});

    
    
/**
     * @tc.number   testsideBarShowSideBar_static_0002
     * @tc.name     testsideBarShowSideBar_static_0002
     * @tc.desc     testsideBarShowSideBar_static_0002
     * @tc.level    Level.LEVEL0
     */
    it('testsideBarShowSideBar_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0002 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0002] component autoHide strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('SideBarContainer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide')).assertEqual('false');
      console.info("[testsideBarShowSideBar0002] autoHide value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide'));
  done()
});

    
    
/**
     * @tc.number   testsideBarShowSideBar_static_0003
     * @tc.name     testsideBarShowSideBar_static_0003
     * @tc.desc     testsideBarShowSideBar_static_0003
     * @tc.level    Level.LEVEL0
     */
    it('testsideBarShowSideBar_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sideBarShowSideBar testsideBarShowSideBar0003 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('SideBarContainer');
      console.info("[testsideBarShowSideBar0003] component autoHide strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('SideBarContainer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('sideBarPosition')).assertEqual('SideBarPosition.End');
      console.info("[testsideBarShowSideBar0003] autoHide value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoHide'));
      done()
});
  })
}
