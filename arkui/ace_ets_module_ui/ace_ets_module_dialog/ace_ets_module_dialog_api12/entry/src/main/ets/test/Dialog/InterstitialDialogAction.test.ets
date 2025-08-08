/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, it, expect} from "@ohos/hypium"
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function interstitialDialogActionTest() {

  describe('interstitialDialogActionTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Dialog/InterstitialDialogAction',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get interstitialDialogActionTest state pages: " + JSON.stringify(pages));
        if (!("InterstitialDialogAction" == pages.name)) {
          console.info("get interstitialDialogActionTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push interstitialDialogActionTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push interstitialDialogActionTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("interstitialDialogActionTest after each called");
    });

    /**
     * @tc.number    interstitialDialogActionTest_0010
     * @tc.name      interstitialDialogActionTest_0010
     * @tc.desc      interstitialDialogAction: openDialog
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('interstitialDialogActionTest_0010', 0, async (done: Function) => {
      console.info('interstitialDialogActionTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('interstitialDialogAction_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      await driver.assertComponentExist(ON.text('Main Title'));
      await CommonFunc.sleep(5000);
      console.info('[interstitialDialogActionTest_0010] END');
      done();
    });

    /**
     * @tc.number    interstitialDialogActionTest_0020
     * @tc.name      interstitialDialogActionTest_0020
     * @tc.desc      interstitialDialogAction: closeDialog
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('interstitialDialogActionTest_0020', 0, async (done: Function) => {
      console.info('interstitialDialogActionTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('interstitialDialogAction_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      await driver.assertComponentExist(ON.text('Main Title'));
      await CommonFunc.sleep(5000);
      let strJson = getInspectorByKey('interstitialDialogAction_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[interstitialDialogActionTest_0020] dragPreviewOptions: " + JSON.stringify(obj));
      console.info("[interstitialDialogActionTest_0020] dragPreviewOptions: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.label).assertEqual('closeDialog succ');
      console.info('[interstitialDialogActionTest_0020] END');
      done();
    });
  })
}
