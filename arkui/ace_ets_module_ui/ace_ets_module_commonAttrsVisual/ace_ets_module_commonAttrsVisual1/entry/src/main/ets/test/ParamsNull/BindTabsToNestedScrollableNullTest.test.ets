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

export default function BindTabsToNestedScrollableNullTest() {
  describe('BindTabsToNestedScrollableNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('BindTabsToNestedScrollableNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/BindTabsToNestedScrollableNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get BindTabsToNestedScrollableNullTest state pages:' + JSON.stringify(pages));
        if (!('BindTabsToNestedScrollableNullTest' == pages.name)) {
          console.info('get BindTabsToNestedScrollableNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push BindTabsToNestedScrollableNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BindTabsToNestedScrollableNullTest page error:' + err);
      }
      console.info('BindTabsToNestedScrollableNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   BindTabsToNestedScrollableNullTest_0100
     * @tc.number BindTabsToNestedScrollableNullTest_0100
     * @tc.desc   bindTabsToNestedScrollable null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BindTabsToNestedScrollableNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('BindTabsToNestedScrollableNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_bindTabsToNestedScrollable_null'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_bindTabsToNestedScrollable_undefined'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('bindTabsToNestedScrollable1Null')).assertEqual(undefined);
      expect(AppStorage.get('bindTabsToNestedScrollable2Null')).assertEqual(undefined);
      expect(AppStorage.get('bindTabsToNestedScrollable3Null')).assertEqual(undefined);
      expect(AppStorage.get('bindTabsToNestedScrollable1Undefined')).assertEqual(undefined);
      expect(AppStorage.get('bindTabsToNestedScrollable2Undefined')).assertEqual(undefined);
      expect(AppStorage.get('bindTabsToNestedScrollable3Undefined')).assertEqual(undefined);
      AppStorage.delete('bindTabsToNestedScrollable1Null');
      AppStorage.delete('bindTabsToNestedScrollable2Null');
      AppStorage.delete('bindTabsToNestedScrollable3Null');
      AppStorage.delete('bindTabsToNestedScrollable1Undefined');
      AppStorage.delete('bindTabsToNestedScrollable2Undefined');
      AppStorage.delete('bindTabsToNestedScrollable3Undefined');
      console.info('[BindTabsToNestedScrollableNullTest_0100] END');
      done();
    });
  })
}