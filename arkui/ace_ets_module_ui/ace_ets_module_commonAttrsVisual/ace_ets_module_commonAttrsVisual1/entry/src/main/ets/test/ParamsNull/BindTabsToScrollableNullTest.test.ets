/*
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function BindTabsToScrollableNullTest() {
  describe('BindTabsToScrollableNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('BindTabsToScrollableNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/BindTabsToScrollableNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get BindTabsToScrollableNullTest state pages:' + JSON.stringify(pages));
        if (!('BindTabsToScrollableNullTest' == pages.name)) {
          console.info('get BindTabsToScrollableNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push BindTabsToScrollableNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BindTabsToScrollableNullTest page error:' + err);
      }
      console.info('BindTabsToScrollableNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   BindTabsToScrollableNullTest_0100
     * @tc.number BindTabsToScrollableNullTest_0100
     * @tc.desc   bindTabsToScrollable null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BindTabsToScrollableNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('BindTabsToScrollableNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_bindTabsToScrollable_null'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_bindTabsToScrollable_undefined'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('bindTabsToScrollableNull')).assertEqual(undefined);
      expect(AppStorage.get('bindTabsToScrollableListScrollerNull')).assertEqual(undefined);
      expect(AppStorage.get('bindTabsToScrollableUndefined')).assertEqual(undefined);
      expect(AppStorage.get('bindTabsToScrollableListScrollerUndefined')).assertEqual(undefined);
      AppStorage.delete('bindTabsToScrollableNull');
      AppStorage.delete('bindTabsToScrollableListScrollerNull');
      AppStorage.delete('bindTabsToScrollableUndefined');
      AppStorage.delete('bindTabsToScrollableListScrollerUndefined');
      console.info('[BindTabsToScrollableNullTest_0100] END');
      done();
    });
  })
}