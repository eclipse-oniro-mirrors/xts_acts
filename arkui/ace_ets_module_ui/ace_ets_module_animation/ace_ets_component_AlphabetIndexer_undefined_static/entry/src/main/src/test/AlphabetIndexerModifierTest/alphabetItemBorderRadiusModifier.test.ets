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

export default function AlphabetItemBorderRadiusModifierTest() {
  describe('AlphabetItemBorderRadiusModifierTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("AlphabetItemBorderRadiusModifierTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.alphabet.undefined.static", "EntryAbility");
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("AlphabetItemBorderRadiusModifierTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlphabetIndexerModifier/alphabetItemBorderRadiusModifier',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get AlphabetItemBorderRadiusModifierTest state pages:" + JSON.stringify(pages));
        if (!("alphabetItemBorderRadiusModifier" == pages.name)) {
          console.info("get AlphabetItemBorderRadiusModifierTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AlphabetItemBorderRadiusModifierTest page error:" + err);
      }
      console.info("AlphabetItemBorderRadiusModifierTest beforeEach end");
    });

    /**
     * @tc.number    AlphabetItemBorderRadiusModifierUndefinedTest_static_0100
     * @tc.name      AlphabetItemBorderRadiusModifierUndefinedTest_static_0100
     * @tc.desc      AlphabetItemBorderRadiusModifierUndefinedTest_static_0100
     * @tc.level     Level.LEVEL1
     */
    it('AlphabetItemBorderRadiusModifierUndefinedTest_static_0100', Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('[AlphabetItemBorderRadiusModifierUndefinedTest_static_0100] START');
        let driver: Driver = Driver.create()
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('AlphabetItemBorderRadiusModifier');
        await CommonFunc.sleep(1000);
        console.info("[AlphabetItemBorderRadiusModifierUndefinedTest_static_0100] $attrs: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs')));
        console.info("[AlphabetItemBorderRadiusModifierUndefinedTest_static_0100] itemBorderRadius: " +
        JSON.stringifyJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('itemBorderRadius')));
        expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('itemBorderRadius')))
          .assertEqual('\"2.00vp\"');
        let changeBtn = await driver.findComponent(ON.id('AlphabetIndexer_change'));
        await (changeBtn?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        strJson = inspector.getInspectorByKey('AlphabetItemBorderRadiusModifier');
        await CommonFunc.sleep(1000);
        expect(JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('itemBorderRadius')))
          .assertEqual('\"8.00vp\"');
        console.info('[AlphabetItemBorderRadiusModifierUndefinedTest_static_0100] END');
        done();
      });
  })
}
