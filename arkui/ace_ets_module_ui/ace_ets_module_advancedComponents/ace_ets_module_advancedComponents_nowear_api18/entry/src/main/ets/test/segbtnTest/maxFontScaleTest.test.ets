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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function maxFontScaleTest() {
  describe('maxFontScaleTest', () => {
    beforeEach(async (done: Function) => {
      console.info('maxFontScaleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segbtn/maxFontScaleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get maxFontScaleTest state pages:' + JSON.stringify(pages));
        if (!('maxFontScaleTest' == pages.name)) {
          console.info('get maxFontScaleTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info('push maxFontScaleTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push maxFontScaleTest page error:' + err); 
      }
      console.info('maxFontScaleTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   maxFontScaleTest_0100
     * @tc.number maxFontScaleTest_0100
     * @tc.desc   To test the maximum font magnification of text for the Segmentation button option: 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('maxFontScaleTest_0100', Level.LEVEL3, async (done: Function) => {
     console.info('[maxFontScaleTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text = getInspectorByKey('text');
      console.info("[maxFontScaleTest_0100] JSON.parse(text) is: " + JSON.stringify(JSON.parse(text)));
      expect(JSON.parse(text).$attrs.content).assertEqual('maxFontScale: 2');
      console.info('[maxFontScaleTest_0100] END');
      done();
    });
  })
}