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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { inputMethod } from '@kit.IMEKit';

export default function TextOnWillCopyTest() {
  describe('TextOnWillCopyTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextOnWillCopyTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextOnWillCopy beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextOnWillCopy',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextOnWillCopy state pages:" + JSON.stringify(pages));
        if (!("TextOnWillCopy" == pages.name)) {
          console.info("get TextOnWillCopy state pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          console.info("push TextOnWillCopy success ");
        }
      } catch (err) {
          console.error("push TextOnWillCopy page error:" + err);
	        expect().assertFail();
      }
    });

    afterAll(async(): Promise<void> => {
      AppStorage.delete('TextAllowCopyResult')
      AppStorage.delete('TextBlockCopyResult')
    })

    /**
     * @tc.name   textOnWillCopy_allow_static_0100
     * @tc.number SUB_ARKUI_TEXT_ONWILLCOPY_ALLOW_static_0100
     * @tc.desc   Test Text onWillCopy event callback with allow (return true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textOnWillCopy_allow_static_0100', Level.LEVEL0, async () => {
      console.info('[textOnWillCopy_allow_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Text = await driver.findComponent(ON.id('text_onWillCopy_allow'))
      await CommonFunc.sleep(500);
      await (Text?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2017);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2019);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('TextAllowCopyResult')).assertEqual('onWillCopyAllowCopy');
      console.info('[textOnWillCopy_allow_static_0100] END');
    })

    /**
     * @tc.name   textOnWillCopy_block_static_0100
     * @tc.number SUB_ARKUI_TEXT_ONWILLCOPY_BLOCK_static_0100
     * @tc.desc   Test Text onWillCopy event callback with block (return false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textOnWillCopy_block_static_0100', Level.LEVEL0, async () => {
      console.info('[textOnWillCopy_block_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let Text = await driver.findComponent(ON.id('text_onWillCopy_block'))
      await CommonFunc.sleep(500);
      await (Text?.longClick() as Promise<void>);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2017);
      await CommonFunc.sleep(500);
      await driver.triggerCombineKeys(2072,2019);
      await CommonFunc.sleep(500);
      expect(AppStorage.get<string>('TextBlockCopyResult')).assertEqual('onWillCopyBlockCopy');
      console.info('[textOnWillCopy_block_static_0100] END');
    })
  })
}