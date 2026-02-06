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
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
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
        url: 'MainAbility/pages/dialogV2/selectDialogV2TestPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get selectDialogTest state pages:" + JSON.stringify(pages));
        if (!("selectDialogV2TestPage" == pages.name)) {
          console.info("get selectDialogTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push selectDialogTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push selectDialogTest page error:" + err);
      }
      console.info("selectDialogTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('selectDialogTest after each called');
    })

    
    
    
    /**
     * @tc.number   selectDialogTest_static_0100
     * @tc.name     selectDialogTest_static_0100
     * @tc.desc     selectDialogTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('selectDialogTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectDialogTest_static_0100] START');
      let driver = Driver.create();
      await Utils.sleep(1000);
      // 点击打开SelectDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('SelectDialogV2'))
      await (openAlertDialog?.click() as Promise<void>);
      await Utils.sleep(1000);
      // 点击打开SelectDialog是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('文本标题'));
      let content = await driver.findComponent(ON.text('文本文本文本文本文本'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      expect(primaryTitle !== null).assertTrue();
      expect(content !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      // 关闭SelectDialog
      await (cancelButton?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[selectDialogTest_static_0100] END');
      done();
    });

    
    
    
    /**
     * @tc.number   selectDialogTest_static_0200
     * @tc.name     selectDialogTest_static_0200
     * @tc.desc     selectDialogTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('selectDialogTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[selectDialogTest_static_0200] START');
      let driver = Driver.create();
      await Utils.sleep(2000);
      // 点击打开SelectDialog
      let openAlertDialog = await driver.findComponent(ON.type('Button').text('SecSelectDialogV2'))
      await (openAlertDialog?.click() as Promise<void>);
      await Utils.sleep(1000);
      // 点击打开SelectDialog是否存在以下入口。
      let primaryTitle = await driver.findComponent(ON.text('文本标题'));
      let content = await driver.findComponent(ON.text('文本内容'));
      let selectContent = await driver.findComponent(ON.text('文本文本文本文本文本'));
      let cancelButton = await driver.findComponent(ON.type('Button').text('取消'));
      expect(primaryTitle !== null).assertTrue();
      expect(content !== null).assertTrue();
      expect(selectContent !== null).assertTrue();
      expect(cancelButton !== null).assertTrue();
      // 关闭SelectDialog
      await (cancelButton?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[selectDialogTest_static_0200] END');
      done();
    });
  })
}