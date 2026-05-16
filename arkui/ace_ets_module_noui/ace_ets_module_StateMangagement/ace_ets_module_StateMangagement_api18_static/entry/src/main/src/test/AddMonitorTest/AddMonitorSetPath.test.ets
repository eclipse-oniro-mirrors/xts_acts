'use static'
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Component, Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext,Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function AddMonitorSetPath() {
  describe('AddMonitorSetPath', () => {
    beforeAll(() => {
      console.info("AddMonitorSetPath beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("AddMonitorSetPath beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AddMonitor/AddMonitorSetPath",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AddMonitorSetPath state pages:" + JSON.stringify(pages));
        if (!("AddMonitorSetPath" == pages.name)) {
          console.info("get AddMonitorSetPath pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AddMonitorSetPath page error:" + err);
      }
      console.info("AddMonitorSetPath beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AddMonitorSetPath after each called");
    })

    /**
     * @tc.number   AddMonitorSetPath_static_0100
     * @tc.name     AddMonitorSetPath_static_0100
     * @tc.desc     AddMonitorSetPath_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('AddMonitorSetPath_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'AddMonitorSetPath_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('AddPathButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('AddPathText');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] value first has changed from 5 to 6');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

