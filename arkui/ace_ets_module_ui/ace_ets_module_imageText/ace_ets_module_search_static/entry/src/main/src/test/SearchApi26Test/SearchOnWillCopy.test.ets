'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { inputMethod } from '@kit.IMEKit';

export default function SearchOnWillCopyTest() {
  describe('SearchOnWillCopyTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('SearchOnWillCopyTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.search.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info("SearchOnWillCopyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi26/SearchOnWillCopy',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SearchOnWillCopy state pages: " + JSON.stringify(pages));
        if (!("SearchOnWillCopy" == pages.name)) {
          console.info("get SearchOnWillCopy state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchOnWillCopy success ");
        }
      } catch (err) {
        console.error("push SearchOnWillCopy page error: " + err);
        expect().assertFail();
      }
    });

    afterAll(async (): Promise<void> => {
      AppStorage.delete('SearchAllowCopyResult')
      AppStorage.delete('SearchBlockCopyResult')
    })

    /**
     * @tc.name   searchOnWillCopy_allow_static_0100
     * @tc.number SUB_ARKUI_SEARCH_ONWILLCOPY_ALLOW_static_0100
     * @tc.desc   Test Search onWillCopy event callback with allow (return true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('searchOnWillCopy_allow_static_0100', Level.LEVEL0, async () => {
      console.info('[searchOnWillCopy_allow_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Search = await driver.findComponent(ON.id('search_onWillCopy_allow'))
      await CommonFunc.sleep(500);
      await (Search?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2017);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2019);
      await CommonFunc.sleep(500);
      await inputMethod.getController().stopInputSession();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('SearchAllowCopyResult')).assertEqual('onWillCopyAllowCopy');
      console.info('[searchOnWillCopy_allow_static_0100] END');
    })

    /**
     * @tc.name   searchOnWillCopy_block_static_0100
     * @tc.number SUB_ARKUI_SEARCH_ONWILLCOPY_BLOCK_static_0100
     * @tc.desc   Test Search onWillCopy event callback with block (return false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('searchOnWillCopy_block_static_0100', Level.LEVEL0, async () => {
      console.info('[searchOnWillCopy_block_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Search = await driver.findComponent(ON.id('search_onWillCopy_block'))
      await CommonFunc.sleep(500);
      await (Search?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2017);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2019);
      await CommonFunc.sleep(500);
      await inputMethod.getController().stopInputSession();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('SearchBlockCopyResult')).assertEqual('onWillCopyBlockCopy');
      console.info('[searchOnWillCopy_block_static_0100] END');
    })
  })
}