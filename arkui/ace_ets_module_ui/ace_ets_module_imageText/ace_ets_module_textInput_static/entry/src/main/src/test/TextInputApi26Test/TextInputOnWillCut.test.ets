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
import { describe, beforeAll, beforeEach, afterEach, beforeAll, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { inputMethod } from '@kit.IMEKit';

export default function TextInputOnWillCutTest() {
  describe('TextInputOnWillCutTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextInputOnWillCutTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.textInput.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextInputOnWillCutTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInputApi26/TextInputOnWillCut',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextInputOnWillCut state pages: " + JSON.stringify(pages));
        if (!("TextInputOnWillCut" == pages.name)) {
          console.info("get TextInputOnWillCut state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputOnWillCut success ");
        }
      } catch (err) {
        console.error("push TextInputOnWillCut page error: " + err);
        expect().assertFail();
      }
    })
    afterAll(async (): Promise<void> => {
      AppStorage.delete('TextInputAllowCutResult')
      AppStorage.delete('TextInputBlockCutResult')
    })

    /**
     * @tc.name   textInputOnWillCut_allow_static_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ONWILLCUT_ALLOW_static_0100
     * @tc.desc   Test TextInput onWillCut event callback with allow (return true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputOnWillCut_allow_static_0100', Level.LEVEL0, async () => {
      console.info('[textInputOnWillCut_allow_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let TextInput = await driver.findComponent(ON.id('textInput_onWillCut_allow'))
      await CommonFunc.sleep(500);
      await (TextInput?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2017);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2040);
      await CommonFunc.sleep(500);
      await inputMethod.getController().stopInputSession();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('TextInputAllowCutResult')).assertEqual('onWillCutAllowCut');
      console.info('[textInputOnWillCut_allow_static_0100] END');
    })

    /**
     * @tc.name   textInputOnWillCut_block_static_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ONWILLCUT_BLOCK_static_0100
     * @tc.desc   Test TextInput onWillCut event callback with block (return false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textInputOnWillCut_block_static_0100', Level.LEVEL0, async () => {
      console.info('[textInputOnWillCut_block_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let TextInput = await driver.findComponent(ON.id('textInput_onWillCut_block'))
      await CommonFunc.sleep(500);
      await (TextInput?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2017);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2040);
      await CommonFunc.sleep(500);
      await inputMethod.getController().stopInputSession();
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('TextInputBlockCutResult')).assertEqual('onWillCutBlockCut');
      console.info('[textInputOnWillCut_block_static_0100] END');
    })
  })
}