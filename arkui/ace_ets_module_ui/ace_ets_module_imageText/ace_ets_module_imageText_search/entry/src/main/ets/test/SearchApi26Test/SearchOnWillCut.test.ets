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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { inputMethod } from '@kit.IMEKit';

export default function SearchOnWillCutTest() {
  describe('SearchOnWillCutTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchOnWillCutTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi26/SearchOnWillCut',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchOnWillCut state pages: " + JSON.stringify(pages));
        if (!("SearchOnWillCut" == pages.name)) {
          console.info("get SearchOnWillCut state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchOnWillCut success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchOnWillCut page error: " + err);
        expect().assertFail();
      }
      done();
    });
    afterAll(async (done: Function) => {
      AppStorage.delete('SearchAllowCutResult')
      AppStorage.delete('SearchBlockCutResult')
      done();
    })

    /**
     * @tc.name   searchOnWillCut_allow_0100
     * @tc.number SUB_ARKUI_SEARCH_ONWILLCUT_ALLOW_0100
     * @tc.desc   Test Search onWillCut event callback with allow (return true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('searchOnWillCut_allow_0100', Level.LEVEL0, async () => {
      console.info('[searchOnWillCut_allow_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Search = await driver.findComponent(ON.id('search_onWillCut_allow'))
      await CommonFunc.sleep(500);
      await Search.longClick()
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2017);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2040);
      await CommonFunc.sleep(500);
      await inputMethod.getController().stopInputSession();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('SearchAllowCutResult')).assertEqual('onWillCutAllowCut');
      console.info('[searchOnWillCut_allow_0100] END');
    })

    /**
     * @tc.name   searchOnWillCut_block_0100
     * @tc.number SUB_ARKUI_SEARCH_ONWILLCUT_BLOCK_0100
     * @tc.desc   Test Search onWillCut event callback with block (return false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('searchOnWillCut_block_0100', Level.LEVEL0, async () => {
      console.info('[searchOnWillCut_block_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Search = await driver.findComponent(ON.id('search_onWillCut_block'))
      await CommonFunc.sleep(500);
      await Search.longClick()
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2017);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2040);
      await CommonFunc.sleep(500);
      await inputMethod.getController().stopInputSession();
      await CommonFunc.sleep(500);
      expect(AppStorage.get('SearchBlockCutResult')).assertEqual('onWillCutBlockCut');
      console.info('[searchOnWillCut_block_0100] END');
    })
  })
}