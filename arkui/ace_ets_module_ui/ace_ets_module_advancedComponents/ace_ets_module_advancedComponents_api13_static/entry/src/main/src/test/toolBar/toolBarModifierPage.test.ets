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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType, beforeAll } from '../../../../hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function toolBarModifierPage() {
  describe('toolBarModifierPage', () => {
    beforeAll(() => {
      console.info("toolBarModifierPage beforeEach start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("toolBarModifierPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/toolBar/toolBarModifierPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get toolBarModifierPage state pages:" + JSON.stringify(pages));
        if (!("toolBarModifierPage" == pages.name)) {
          console.info("get toolBarModifierPage pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push toolBarModifierPage page error:" + err);
      }
      console.info("toolBarModifierPage beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("toolBarModifierPage after each called");
    })

    
    
    /**
     * @tc.number   toolBarModifierPage_static_0100
     * @tc.name     toolBarModifierPage_static_0100
     * @tc.desc     toolBarModifierPage_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('toolBarModifierPage_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[toolBarModifierPage_static_0100] START');
      let driver = Driver.create();
      await driver.delayMs(2000);
      // 查看ToolBarPage是否存在以下入口。
      let itemText = await driver.findComponent(ON.text('Paste'));
      expect(itemText !== null).assertTrue();
      console.info('[toolBarModifierPage_static_0100] END');
      done();
    });
  })
}