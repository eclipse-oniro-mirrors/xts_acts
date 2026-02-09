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

export default function tabTitleBarLabelTest() {
  describe('tabTitleBarLabelTest', () => {
    beforeAll(() => {
      console.info("tabTitleBarLabelTest beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("tabTitleBarLabelTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabTitleBar/tabTitleBarLabelTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get tabTitleBarLabelTest state pages:" + JSON.stringify(pages));
        if (!("tabTitleBarLabelTest" == pages.name)) {
          console.info("get tabTitleBarLabelTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push tabTitleBarLabelTest page error:" + err);
      }
      console.info("tabTitleBarLabelTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("tabTitleBarLabelTest after each called");
    })

    /**
     * @tc.number   tabTitleBarLabelTest_static_0100
     * @tc.name     tabTitleBarLabelTest_static_0100
     * @tc.desc     tabTitleBarLabelTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('tabTitleBarLabelTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('[tabTitleBarLabelTest_static_0100] START');
        let driver = Driver.create();
        await driver.delayMs(2000);
        // 查看tabTitleBarLabelTest是否存在以下入口。
        let tab1 = await driver.findComponent(ON.text("tab1"));
        expect(tab1 !== null).assertTrue();
        console.info('[tabTitleBarLabelTest_static_0100] END');
        done();
      });
  })
}