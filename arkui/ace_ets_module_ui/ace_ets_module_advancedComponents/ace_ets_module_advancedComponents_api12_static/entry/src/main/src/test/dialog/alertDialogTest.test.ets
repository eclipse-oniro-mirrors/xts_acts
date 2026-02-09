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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium';
import { Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Component} from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function alertDialogTest() {
  describe('alertDialogTest', () => {
    beforeAll(() => {
      console.info("alertDialogTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("alertDialogTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialog/alertDialogTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get alertDialogTest state pages:" + JSON.stringify(pages));
        if (!("alertDialogTest" == pages.name)) {
          console.info("get alertDialogTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push alertDialogTest page error:" + err);
      }
      console.info("alertDialogTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('alertDialogTest after each called');
    })

    
    
    /**
     * @tc.number   alertDialogTest_static_0100
     * @tc.name     alertDialogTest_static_0100
     * @tc.desc     alertDialogTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('alertDialogTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[alertDialogTest_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      // 点击打开AlertDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('AlertDialog'))
      await (openAlertDialog?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      // 点击打开AlertDialog是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('弹框一级标题'));
      let secondaryTitle = await driver.findComponent(ON.text('弹框二级标题'));
      let content = await driver.findComponent(ON.text('文本文本文本文本文本'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      let confirmButton = await driver.findComponent(ON.type('Button').text('确认'));
      expect(primaryTitle !== null).assertTrue();
      expect(secondaryTitle !== null).assertTrue();
      expect(content !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      expect(confirmButton !== null).assertTrue();
      // 关闭AlertDialog
       await (cancelButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('[alertDialogTest_0100] END');
      done();
    });
  })
}