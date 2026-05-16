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

export default function UnbindTabsFromNestedScrollableNullTest() {
  describe('UnbindTabsFromNestedScrollableNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('UnbindTabsFromNestedScrollableNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/UnbindTabsFromNestedScrollableNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get UnbindTabsFromNestedScrollableNullTest state pages:' + JSON.stringify(pages));
        if (!('UnbindTabsFromNestedScrollableNullTest' == pages.name)) {
          console.info('get UnbindTabsFromNestedScrollableNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push UnbindTabsFromNestedScrollableNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push UnbindTabsFromNestedScrollableNullTest page error:' + err);
      }
      console.info('UnbindTabsFromNestedScrollableNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   UnbindTabsFromNestedScrollableNullTest_0100
     * @tc.number UnbindTabsFromNestedScrollableNullTest_0100
     * @tc.desc   unbindTabsFromNestedScrollable null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UnbindTabsFromNestedScrollableNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('UnbindTabsFromNestedScrollableNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_unbindTabsFromNestedScrollable_null'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_unbindTabsFromNestedScrollable_undefined'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('unbindTabsFromNestedScrollable1Null')).assertEqual(undefined);
      expect(AppStorage.get('unbindTabsFromNestedScrollable2Null')).assertEqual(undefined);
      expect(AppStorage.get('unbindTabsFromNestedScrollable3Null')).assertEqual(undefined);
      expect(AppStorage.get('unbindTabsFromNestedScrollable1Undefined')).assertEqual(undefined);
      expect(AppStorage.get('unbindTabsFromNestedScrollable2Undefined')).assertEqual(undefined);
      expect(AppStorage.get('unbindTabsFromNestedScrollable3Undefined')).assertEqual(undefined);
      AppStorage.delete('unbindTabsFromNestedScrollable1Null');
      AppStorage.delete('unbindTabsFromNestedScrollable2Null');
      AppStorage.delete('unbindTabsFromNestedScrollable3Null');
      AppStorage.delete('unbindTabsFromNestedScrollable1Undefined');
      AppStorage.delete('unbindTabsFromNestedScrollable2Undefined');
      AppStorage.delete('unbindTabsFromNestedScrollable3Undefined');
      console.info('[UnbindTabsFromNestedScrollableNullTest_0100] END');
      done();
    });
  })
}