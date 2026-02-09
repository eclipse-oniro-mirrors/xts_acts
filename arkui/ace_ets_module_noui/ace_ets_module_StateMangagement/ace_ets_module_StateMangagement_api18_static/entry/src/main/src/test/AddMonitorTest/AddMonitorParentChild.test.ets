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

export default function AddMonitorParentChild() {
  describe('AddMonitorParentChild', () => {
    beforeAll(() => {
      console.info("AddMonitorParentChild beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("AddMonitorParentChild beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AddMonitor/AddMonitorParentChild",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AddMonitorParentChild state pages:" + JSON.stringify(pages));
        if (!("AddMonitorParentChild" == pages.name)) {
          console.info("get AddMonitorParentChild pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AddMonitorParentChild page error:" + err);
      }
      console.info("AddMonitorParentChild beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AddMonitorParentChild after each called");
    })

    /**
     * @tc.number   AddMonitorParentChild_static_0100
     * @tc.name     AddMonitorParentChild_static_0100
     * @tc.desc     AddMonitorParentChild_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('AddMonitorParentChild_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'AddMonitorParentChild_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('ParentButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('ParentText');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] ParentComponent message changed from Hello from Parent to Parent Value: 2');
      let btn_true1 = await driver.findComponent(ON.id('ClearParentMonitor')) as Component;
      await btn_true1.click();
      await CommonFunc.sleep(1000);
      await btn_true.click();
      await CommonFunc.sleep(1000);
      let strJsonNew1 = inspector.getInspectorByKey('ParentText');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] ParentComponent message changed from Hello from Parent to Parent Value: 2');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   AddMonitorParentChild_static_0200
     * @tc.name     AddMonitorParentChild_static_0200
     * @tc.desc     AddMonitorParentChild_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('AddMonitorParentChild_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'AddMonitorParentChild_static_0200';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('ChildButton')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('ChildText');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] ChildComponent childMsg changed from Parent Value: 3 to Message from Child');
      let btn_true1 = await driver.findComponent(ON.id('ClearChildMonitor')) as Component;
      await btn_true1.click();
      await CommonFunc.sleep(1000);
      await btn_true.click();
      await CommonFunc.sleep(1000);
      let strJsonNew1 = inspector.getInspectorByKey('ChildText');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] ChildComponent childMsg changed from Parent Value: 3 to Message from Child');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}

