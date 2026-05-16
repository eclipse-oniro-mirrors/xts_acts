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

export default function GetNavigationInfoByUniqueIdNullTest() {
  describe('GetNavigationInfoByUniqueIdNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('GetNavigationInfoByUniqueIdNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/GetNavigationInfoByUniqueIdNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get GetNavigationInfoByUniqueIdNullTest state pages:' + JSON.stringify(pages));
        if (!('GetNavigationInfoByUniqueIdNullTest' == pages.name)) {
          console.info('get GetNavigationInfoByUniqueIdNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push GetNavigationInfoByUniqueIdNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GetNavigationInfoByUniqueIdNullTest page error:' + err);
      }
      console.info('GetNavigationInfoByUniqueIdNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   GetNavigationInfoByUniqueIdNullTest_0100
     * @tc.number GetNavigationInfoByUniqueIdNullTest_0100
     * @tc.desc   getNavigationInfoByUniqueId null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetNavigationInfoByUniqueIdNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('GetNavigationInfoByUniqueIdNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_getNavigationInfoByUniqueId_null'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('btn_getNavigationInfoByUniqueId_undefined'));
      await button2.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('getNavigationInfoByUniqueIdNull')).assertEqual(undefined);
      expect(AppStorage.get('getNavigationInfoByUniqueIdUndefined')).assertEqual(undefined);
      AppStorage.delete('getNavigationInfoByUniqueIdNull');
      AppStorage.delete('getNavigationInfoByUniqueIdUndefined');
      console.info('[GetNavigationInfoByUniqueIdNullTest_0100] END');
      done();
    });
  })
}