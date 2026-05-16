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

export default function SetFrameRateRangeNullTest() {
  describe('SetFrameRateRangeNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SetFrameRateRangeNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/SetFrameRateRangeNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SetFrameRateRangeNullTest state pages:' + JSON.stringify(pages));
        if (!('SetFrameRateRangeNullTest' == pages.name)) {
          console.info('get SetFrameRateRangeNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push SetFrameRateRangeNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SetFrameRateRangeNullTest page error:' + err);
      }
      console.info('SetFrameRateRangeNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SetFrameRateRangeNullTest_0100
     * @tc.number SetFrameRateRangeNullTest_0100
     * @tc.desc   setFrameRateRange null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetFrameRateRangeNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('SetFrameRateRangeNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_setFrameRateRange_null'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('setFrameRateRangeNull')).assertEqual('fail');
      expect(AppStorage.get('setFrameRateRangeUndefined')).assertEqual('fail');
      AppStorage.delete('setFrameRateRangeNull');
      AppStorage.delete('setFrameRateRangeUndefined');
      console.info('[SetFrameRateRangeNullTest_0100] END');
      done();
    });
  })
}