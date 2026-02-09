/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import CommonFunc from '../MainAbility/common/Common';

export default function LinearGradientBlurTest() {

  describe('LinearGradientBlurTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LinearGradientBlurTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get LinearGradientBlurTest state pages: ' + JSON.stringify(pages));
        if (!('LinearGradientBlurTest' == pages.name)) {
          console.info('get LinearGradientBlurTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push LinearGradientBlurTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push LinearGradientBlurTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('LinearGradientBlurTest after each called');
    });

    /**
     * @tc.number LinearGradientBlurTest_0100
     * @tc.name LinearGradientBlurTest_0100
     * @tc.desc test linearGradientBlur parma
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('LinearGradientBlurTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('LinearGradientBlurTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('imageId1');
      console.info("[LinearGradientBlurTest_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[LinearGradientBlurTest_0100] value1 is: " +
       JSON.parse(strJson)?.$attrs?.linearGradientBlur?.value);
      console.info("[LinearGradientBlurTest_0100] brightness1 is: " +
       JSON.parse(strJson)?.$attrs?.brightness);
      expect(JSON.parse(strJson).$attrs.linearGradientBlur?.value).assertEqual('-1.00px');
      expect(JSON.parse(strJson).$attrs.brightness).assertEqual(0);
      let strJson2 = getInspectorByKey('imageId2');
      console.info("[LinearGradientBlurTest_0100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[LinearGradientBlurTest_0100] value2 is: "  +
       JSON.parse(strJson2)?.$attrs?.linearGradientBlur?.value);
      console.info("[LinearGradientBlurTest_0100] brightness2 is: " +
       JSON.parse(strJson2)?.$attrs?.brightness);
      expect(JSON.parse(strJson2).$attrs.linearGradientBlur?.value).assertEqual('0.00px');
      expect(JSON.parse(strJson2).$attrs.brightness).assertEqual(-1);
      let strJson3 = getInspectorByKey('imageId3');
      console.info("[LinearGradientBlurTest_0100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[LinearGradientBlurTest_0100] value3 is: " +
       JSON.parse(strJson3)?.$attrs?.linearGradientBlur?.value);
      expect(JSON.parse(strJson3).$attrs.linearGradientBlur?.value).assertEqual('1000.00px');
      let strJson4 = getInspectorByKey('imageId4');
      console.info("[LinearGradientBlurTest_0100] obj4 is: " + JSON.stringify(JSON.parse(strJson4)));
      console.info("[LinearGradientBlurTest_0100] value4 is: " +
       JSON.parse(strJson4)?.$attrs?.linearGradientBlur?.value);
      expect(JSON.parse(strJson4).$attrs.linearGradientBlur?.value).assertEqual('1001.00px');
      done();
    });


  })
}
