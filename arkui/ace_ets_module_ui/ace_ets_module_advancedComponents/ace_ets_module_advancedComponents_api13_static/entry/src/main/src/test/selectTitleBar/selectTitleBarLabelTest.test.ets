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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { startAbility, UtilsTest } from '../Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function selectTitleBarLabelTest() {
  describe('selectTitleBarLabelTest', () => {
    beforeAll(() => {
      console.info("selectTitleBarLabelTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("selectTitleBarLabelTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectTitleBar/selectTitleBarLabelPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get selectTitleBarLabelTest state pages:" + JSON.stringify(pages));
        if (!("selectTitleBarLabelPage" == pages.name)) {
          console.info("get selectTitleBarLabelTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push selectTitleBarLabelTest page error:" + err);
      }
      console.info("selectTitleBarLabelTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('selectTitleBarLabelTest after each called');
    })

    /**
    * @tc.number   selectTitleBarLabelTest_static_0100
    * @tc.name     selectTitleBarLabelTest_static_0100
    * @tc.desc     selectTitleBarLabelTest_static_0100
    * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
    */
    it('selectTitleBarLabelTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[selectTitleBarLabelTest_static_0100] START');
        let driver = Driver.create();
        await driver.delayMs(2000);
        // 查看是否存在以下入口。
        let found = await driver.findComponent(ON.text('所有照片'));
        expect(found !== null).assertTrue();
        console.info('[selectTitleBarLabelTest_static_0100] END');
        done();
      });
  })
}