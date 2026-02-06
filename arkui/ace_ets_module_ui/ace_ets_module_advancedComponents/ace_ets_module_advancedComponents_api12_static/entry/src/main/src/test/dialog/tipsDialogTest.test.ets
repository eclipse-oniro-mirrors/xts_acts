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

export default function tipsDialogTest() {
  describe('tipsDialogTest', () => {
    beforeAll(() => {
      console.info("tipsDialogTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("tipsDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/tipsDialogTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get tipsDialogTest state pages:" + JSON.stringify(pages));
        if (!("tipsDialogTest" == pages.name)) {
          console.info("get tipsDialogTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push tipsDialogTest page error:" + err);
      }
      console.info("tipsDialogTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('tipsDialogTest after each called');
    })

    /**
     * @tc.number   tipsDialogTest_static_0100
     * @tc.name     tipsDialogTest_static_0100
     * @tc.desc     tipsDialogTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('tipsDialogTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[tipsDialogTest_static_0100] START');
        let driver = Driver.create();
        await CommonFunc.sleep(2000);
        // 点击打开TipsDialog
        let openAlertDialog = await driver.findComponent(ON.type('Button').text('TipsDialog'))
        await (openAlertDialog?.click() as Promise<void>);;
        await CommonFunc.sleep(1000);
        // 点击打开TipsDialog是否存在以下入口。
        let content = await driver.findComponent(ON.text('想要卸载这个APP嘛?'));
        let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
        let confirmButton = await driver.findComponent(ON.type('Button').text('删除'));
        expect(content !== null).assertTrue();
        expect(cancelButton !== null).assertTrue();
        expect(confirmButton !== null).assertTrue();
        // 关闭TipsDialog
        await (cancelButton?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info('[tipsDialogTest_static_0100] END');
        done();
      });

    /**
     * @tc.number   tipsDialogTest_static_0200
     * @tc.name     tipsDialogTest_static_0200
     * @tc.desc     tipsDialogTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('tipsDialogTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[tipsDialogTest_static_0200] START');
        let driver = Driver.create();
        await CommonFunc.sleep(2000);
        // 点击打开TipsDialog
        let openAlertDialog = await driver.findComponent(ON.type('Button').text('TipsDialogTitle'))
        await (openAlertDialog?.click() as Promise<void>);;
        await CommonFunc.sleep(1000);
        // 点击打开TipsDialog是否存在以下入口。
        let title = await driver.findComponent(ON.text('TipsDialog'));
        let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
        let confirmButton = await driver.findComponent(ON.type('Button').text('删除'));
        expect(title !== null).assertTrue();
        expect(cancelButton !== null).assertTrue();
        expect(confirmButton !== null).assertTrue();
        // 关闭TipsDialog
        await (cancelButton?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info('[tipsDialogTest_static_0200] END');
        done();
      });

    /**
     * @tc.number   tipsDialogTest_static_0300
     * @tc.name     tipsDialogTest_static_0300
     * @tc.desc     tipsDialogTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('tipsDialogTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[tipsDialogTest_static_0300] START');
        let driver = Driver.create();
        await CommonFunc.sleep(2000);
        // 点击打开TipsDialog
        let openAlertDialog = await driver.findComponent(ON.type('Button').text('TipsDialogTips'))
        await (openAlertDialog?.click() as Promise<void>);;
        await CommonFunc.sleep(1000);
        // 点击打开TipsDialog是否存在以下入口。
        let checkTips = await driver.findComponent(ON.text('checkTips'));
        let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
        let confirmButton = await driver.findComponent(ON.type('Button').text('删除'));
        expect(checkTips !== null).assertTrue();
        expect(cancelButton !== null).assertTrue();
        expect(confirmButton !== null).assertTrue();
        // 关闭TipsDialog
        await (cancelButton?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info('[tipsDialogTest_static_0300] END');
        done();
      });
  })
}