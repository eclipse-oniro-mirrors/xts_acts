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

export default function InterpolateNullTest() {
  describe('InterpolateNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info('InterpolateNullTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ParamsNull/InterpolateNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get InterpolateNullTest state pages:' + JSON.stringify(pages));
        if (!('InterpolateNullTest' == pages.name)) {
          console.info('get InterpolateNullTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push InterpolateNullTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push InterpolateNullTest page error:' + err);
      }
      console.info('InterpolateNullTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   InterpolateNullTest_0100
     * @tc.number InterpolateNullTest_0100
     * @tc.desc   interpolate null test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InterpolateNullTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('InterpolateNullTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('btn_interpolate_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('interpolateNull')).assertEqual('success');
      expect(AppStorage.get('interpolateUndefined')).assertEqual('success');
      AppStorage.delete('interpolateNull');
      AppStorage.delete('interpolateUndefined');
      console.info('[InterpolateNullTest_0100] END');
      done();
    });
  })
}