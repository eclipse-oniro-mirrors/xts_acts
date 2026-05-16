/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function measureFromViewportOnVisibleTest() {

  describe('measureFromViewportOnVisibleTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/measureFromViewport/measureFromViewportOnVisible',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get measureFromViewportOnVisible state pages: " + JSON.stringify(pages));
        if (!("measureFromViewportOnVisible" == pages.name)) {
          console.info("get measureFromViewportOnVisible state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push measureFromViewportOnVisible success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push measureFromViewportOnVisible page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("measureFromViewportOnVisible after each called");
    });

    /**
     * @tc.name   measureFromViewportOnVisible_0010
     * @tc.number measureFromViewportOnVisible_0010
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('measureFromViewportOnVisible_0010', Level.LEVEL0, async (done: Function) => {
      console.info('measureFromViewportOnVisible_0010 START');
      await CommonFunc.sleep(500);
      expect(AppStorage.get('measureFromViewportOnVisibleIsTrue')).assertEqual(1);
      console.info('[measureFromViewportOnVisible_0010] END');
      done();
    });

    /**
     * @tc.name   measureFromViewportOnVisible_0020
     * @tc.number measureFromViewportOnVisible_0020
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('measureFromViewportOnVisible_0020', Level.LEVEL0, async (done: Function) => {
      console.info('measureFromViewportOnVisible_0020 START');
      await CommonFunc.sleep(500);
      expect(AppStorage.get('measureFromViewportOnVisibleIsFalse')).assertLess(1);
      console.info('[measureFromViewportOnVisible_0020] END');
      done();
    });
  })
}