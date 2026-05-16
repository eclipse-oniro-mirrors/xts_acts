'use static'
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

import { describe, beforeAll, beforeEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import {
  Driver, ON
} from '@ohos.UiTest';

export default function AlphabetOnSelectModifierTest() {
  describe('AlphabetOnSelectModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("AlphabetOnSelectModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.alphabet.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlphabetOnSelectModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlphabetIndexerModifier/alphabetOnSelectModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get AlphabetOnSelectModifierTest state pages:" + JSON.stringify(pages));
        if (!("alphabetOnSelectModifier" == pages.name)) {
          console.info("get AlphabetOnSelectModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlphabetOnSelectModifierTest page error:" + err);
      }
      console.info("AlphabetOnSelectModifierTest beforeEach end");
    });

    /**
     * @tc.number    AlphabetOnSelectModifierUndefinedTest_static_0100
     * @tc.name      AlphabetOnSelectModifierUndefinedTest_static_0100
     * @tc.desc      AlphabetOnSelectModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('AlphabetOnSelectModifierUndefinedTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[AlphabetOnSelectModifierUndefinedTest_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let alphabet = await driver.findComponent(ON.id('AlphabetOnSelectModifier'));
      await (alphabet?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let testText = await driver.findComponent(ON.id('Text_test'));
      expect(await (testText?.getText() as Promise<string>)).assertEqual('selected success')
      let changeBtn = await driver.findComponent(ON.id('AlphabetOnSelectModifier'));
      await (changeBtn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (alphabet?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      expect(await (testText?.getText() as Promise<string>)).assertEqual('selected success')
      console.info('[AlphabetOnSelectModifierUndefinedTest_static_0100] END');
      done();
    });
  })
}
