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
import Utils from '../../../ets/MainAbility/common/Utils';
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function closeMenuTest() {
  describe('closeMenuTest', () => {
    beforeAll(() => {
      console.info("closeMenuTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api19.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("closeMenuTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get closeMenuTest state pages:" + JSON.stringify(pages));
        if (!("closeMenuTest" == pages.name)) {
          console.info("get  closeMenuTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/promptAction/closeMenu',
          })
        }
      } catch (err) {
        console.error("push closeMenuTest page error:" + err);
      }
      console.info("closeMenuTest foreEach end");
    });
    
    
/**
     * @tc.number   closeMenuTest_0100
     * @tc.name     closeMenuTest_0100
     * @tc.desc     closeMenuTest_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('closeMenuTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'closeMenuTest_0100';
        console.info('[' + tagName + '] START============================');
        await CommonFunc.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('btn'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(3500);
        let closeMenu = inspector.getInspectorByKey('closeMenu');
        console.info("[closeMenuTest_0100] attrs is: " +
        JSON.stringify(JSON.parseJsonElement(closeMenu).getElement('$attrs')));
        expect(JSON.parseJsonElement(closeMenu).getElement('$attrs').getString('content')).assertEqual('closeMenu');
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}