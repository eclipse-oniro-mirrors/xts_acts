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

export default function CustomDialogControllerOptionsTest() {
  describe('CustomDialogControllerOptionsTest', () => {
    beforeAll(() => {
      console.info("CustomDialogControllerOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api19.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("CustomDialogControllerOptionsTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomDialogControllerOptionsTest state pages:" + JSON.stringify(pages));
        if (!("CustomDialogControllerOptions" == pages.name)) {
          console.info("get  CustomDialogControllerOptionsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/customDialog/CustomDialogControllerOptions',
          })
        }
      } catch (err) {
        console.error("push CustomDialogControllerOptionsTest page error:" + err);
      }
      console.info("CustomDialogControllerOptionsTest foreEach end");
    });

    
    
/**
     * @tc.number   CustomDialogControllerOptionsTest_static_0100
     * @tc.name     CustomDialogControllerOptionsTest_static_0100
     * @tc.desc     CustomDialogControllerOptionsTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('CustomDialogControllerOptionsTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info('CustomDialogControllerOptionsTest_static_0100 START');
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let btn = await driver.findComponent(ON.id('focusClick'));
        await (btn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await CommonFunc.sleep(1000);
        console.info("[CustomDialogControllerOptionsTest_static_0100] obj2 is: " + JSON.stringify(obj2));

        console.info("[CustomDialogControllerOptionsTest_static_0100] obj2.$children[1].$children[0] focusable is: " +
        JSON.stringify(obj2.getElement('$children')[1].getElement('$children')[0].getElement('$attrs')));
        console.info("[CustomDialogControllerOptionsTest_static_0100] obj2.$children[1].$children[0] focusable is: " +
        JSON.stringify(obj2.getElement('$children')[1]
          .getElement('$children')[0]
          .getElement('$attrs')?.getString('focusable')));

        expect(obj2.getElement('$children')[1].getElement('$children')[0].getElement('$attrs')?.getBoolean('focusable'))
          .assertTrue();
        let btn2: Component | null = await driver.findComponent(ON.id('close'));
        await (btn2?.click() as Promise<void>);
        console.info('CustomDialogControllerOptionsTest_static_0100 END');
        done();

      });
  })
}