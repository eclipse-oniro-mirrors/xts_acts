/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function freezeTest() {

  describe('freezeTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageEffect/freeze',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get freezeTest state pages: ' + JSON.stringify(pages));
        if (!('freeze' == pages.name)) {
          console.info('get freezeTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push freezeTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push freezeTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('freezeTest after each called');
    });

    /**
     * @tc.name   freezeTest_0100
     * @tc.number freezeTest_0100
     * @tc.desc   test api of freeze
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('freezeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('freezeTest_0100 START');
      let strJson = getInspectorByKey('OffscreenCanvasFreeze_id');
      expect(JSON.parse(strJson).$attrs.width).assertEqual('300.00vp');
      console.info('[freezeTest_0100] END');
      done();
    });
  })
}
