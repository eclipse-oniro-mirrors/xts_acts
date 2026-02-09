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

export default function AddMonitorTwoDimensionalArray() {
  describe('AddMonitorTwoDimensionalArray', () => {
    beforeAll(() => {
      console.info("AddMonitorTwoDimensionalArray beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("AddMonitorTwoDimensionalArray beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AddMonitor/AddMonitorTwoDimensionalArray",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AddMonitorTwoDimensionalArray state pages:" + JSON.stringify(pages));
        if (!("AddMonitorTwoDimensionalArray" == pages.name)) {
          console.info("get AddMonitorTwoDimensionalArray pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AddMonitorTwoDimensionalArray page error:" + err);
      }
      console.info("AddMonitorTwoDimensionalArray beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AddMonitorTwoDimensionalArray after each called");
    })

    /**
     * @tc.number   AddMonitorTwoDimensionalArray_static_0100
     * @tc.name     AddMonitorTwoDimensionalArray_static_0100
     * @tc.desc     AddMonitorTwoDimensionalArray_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('AddMonitorTwoDimensionalArray_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'AddMonitorTwoDimensionalArray_static_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('change1')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('matrixText1');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] 二维数组 value has changed from 1,2,3,4,5,6,7,8,9 to 12,23,34,44,55,66,77,88,99');
      let btn_true1 = await driver.findComponent(ON.id('clearArrayMonitor1')) as Component;
      await btn_true1.click();
      await CommonFunc.sleep(1000);
      let btn_true2 = await driver.findComponent(ON.id('change2')) as Component;
      await btn_true2.click();
      await CommonFunc.sleep(1000);
      let strJsonNew1 = inspector.getInspectorByKey('matrixText1');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] 二维数组 value has changed from 1,2,3,4,5,6,7,8,9 to 12,23,34,44,55,66,77,88,99');
      console.info('[' + tagName + '] END ===========================');
      done();
      });

    /**
     * @tc.number   AddMonitorTwoDimensionalArray_static_0200
     * @tc.name     AddMonitorTwoDimensionalArray_static_0200
     * @tc.desc     AddMonitorTwoDimensionalArray_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('AddMonitorTwoDimensionalArray_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'AddMonitorTwoDimensionalArray_static_0200';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('change11')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('matrixText2');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] 二维数组下的数组 value has changed from 123,234,345 to 11,22,33');
      let btn_true1 = await driver.findComponent(ON.id('clearArrayMonitor11')) as Component;
      await btn_true1.click();
      await CommonFunc.sleep(1000);
      let btn_true2 = await driver.findComponent(ON.id('change22')) as Component;
      await btn_true2.click();
      await CommonFunc.sleep(1000);
      let strJsonNew1 = inspector.getInspectorByKey('matrixText2');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] 二维数组下的数组 value has changed from 123,234,345 to 11,22,33');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number   AddMonitorTwoDimensionalArray_static_0300
     * @tc.name     AddMonitorTwoDimensionalArray_static_0300
     * @tc.desc     AddMonitorTwoDimensionalArray_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('AddMonitorTwoDimensionalArray_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'AddMonitorTwoDimensionalArray_static_0300';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      let btn_true = await driver.findComponent(ON.id('change111')) as Component;
      await btn_true.click();
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('matrixText3');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] 二维数组下的元素 value has changed from 555 to 999');
      let btn_true1 = await driver.findComponent(ON.id('clearArrayMonitor111')) as Component;
      await btn_true1.click();
      await CommonFunc.sleep(1000);
      let btn_true2 = await driver.findComponent(ON.id('change222')) as Component;
      await btn_true2.click();
      await CommonFunc.sleep(1000);
      let strJsonNew1 = inspector.getInspectorByKey('matrixText3');
      console.info('[' + tagName + '] text is: ' + JSON.stringify(JSON.parseJsonElement(strJsonNew1)
        .getElement('$attrs')
        .getString('content')));
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content')).assertEqual('[addMonitorTest] 二维数组下的元素 value has changed from 555 to 999');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}