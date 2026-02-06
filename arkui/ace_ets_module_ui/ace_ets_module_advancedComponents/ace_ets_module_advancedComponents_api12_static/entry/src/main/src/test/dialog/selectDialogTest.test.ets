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
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { startAbility, UtilsTest } from '../Util.test';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function selectDialogTest() {
  describe('selectDialogTest', () => {
    beforeAll(() => {
      console.info("selectDialogTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("selectDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/selectDialogTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get selectDialogTest state pages:" + JSON.stringify(pages));
        if (!("selectDialogTest" == pages.name)) {
          console.info("get selectDialogTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectDialogTest page error:" + err);
      }
      console.info("selectDialogTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('selectDialogTest after each called');
    })

    /**
     * @tc.number   selectDialogTest_static_0100
     * @tc.name     selectDialogTest_static_0100
     * @tc.desc     selectDialogTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('selectDialogTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[selectDialogTest_static_0100] START');
        let driver = Driver.create();
        await CommonFunc.sleep(2000);
        // 点击打开SelectDialog
        let openAlertDialog = await driver.findComponent(ON.type('Button').text('SelectDialog'))
        await (openAlertDialog?.click() as Promise<void>);;
        await CommonFunc.sleep(1000);
        // 点击打开SelectDialog是否存在以下入口。
        let primaryTitle = await driver.findComponent(ON.text('文本标题'));
        let content = await driver.findComponent(ON.text('内容内容'));
        let radioContent = await driver.findComponent(ON.text('文本文本文本文本文本'));
        let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
        expect(primaryTitle !== null).assertTrue();
        expect(content !== null).assertTrue();
        expect(radioContent !== null).assertTrue();
        expect(cancelButton !== null).assertTrue();
        // 关闭SelectDialog
        await (cancelButton?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        console.info('[selectDialogTest_static_0100] END');
        done();
      });
  })
}