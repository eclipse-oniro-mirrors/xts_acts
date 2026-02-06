/**
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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';;

export default function CustomDialogRouter() {
  describe('CustomDialogRouter', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomDialogRouter beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/customDialog/CustomDialogRouter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomDialogRouter state pages: " + JSON.stringify(pages));
        if (!("CustomDialog" == pages.name)) {
          console.info("get CustomDialogRouter state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomDialogRouter success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomDialogRouter page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_CustomDialogRouter_0100
     * @tc.name      CustomDialogRouter_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('CustomDialogRouter_0100', Level.LEVEL2, async (done: Function) => {
      console.info('CustomDialogRouter_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Custom_Dialog_Router'));
      await button.click();
      await CommonFunc.sleep(1000);

      // router page is change
      let routerButton = await driver.findComponent(ON.id('CustomDialogRouterButton'));
      await routerButton.click();
      await CommonFunc.sleep(1000);

      // api 11, dialog is closed, confirmButton is not exist
      let confirmButton = await driver.findComponent(ON.id('CustomDialogConfirm'));
      expect(confirmButton != null).assertTrue();
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
        console.info('CustomDialogRouter_0100 END');
      done();
    });


  })
}

