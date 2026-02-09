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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { startAbility, UtilsTest } from '../Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function confirmDialogTest() {
  describe('confirmDialogTest', () => {
    beforeAll(() => {
      console.info("confirmDialogTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("confirmDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/confirmDialogTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get confirmDialogTest state pages:" + JSON.stringify(pages));
        if (!("confirmDialogTest" == pages.name)) {
          console.info("get confirmDialogTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push confirmDialogTest page error:" + err);
      }
      console.info("confirmDialogTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('confirmDialogTest after each called');
    })

    /**
     * @tc.number   confirmDialogTest_static_0100
     * @tc.name     confirmDialogTest_static_0100
     * @tc.desc     confirmDialogTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('confirmDialogTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[confirmDialogTest_static_0100] START');
        let driver = Driver.create();
        await CommonFunc.sleep(2000);
        // 点击打开ConfirmDialog
        let openAlertDialog = await driver.findComponent(ON.type('Button').text('ConfirmDialog'))
        await (openAlertDialog?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        // 点击打开ConfirmDialog是否存在以下入口。
        let primaryTitle = await driver.findComponent(ON.text('文本标题'));
        let checkTips = await driver.findComponent(ON.text('禁止后不再提示'));
        let content = await driver.findComponent(ON.text('这里是内容区'));
        let cancelButton = await driver.findComponent(ON.type('Button').text('禁止'));
        let confirmButton = await driver.findComponent(ON.type('Button').text('允许'));
        expect(primaryTitle !== null).assertTrue();
        expect(checkTips !== null).assertTrue();
        expect(content !== null).assertTrue();
        expect(cancelButton !== null).assertTrue();
        expect(confirmButton !== null).assertTrue();
        // 关闭ConfirmDialog
        await (cancelButton?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info('[confirmDialogTest_static_0100] END');
        done();
      });
  })
}