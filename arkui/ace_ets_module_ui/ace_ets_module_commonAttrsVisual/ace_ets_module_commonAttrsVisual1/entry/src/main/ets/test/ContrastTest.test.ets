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

export default function ContrastTest() {

  describe('ContrastTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ContrastTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ContrastTest state pages: ' + JSON.stringify(pages));
        if (!('ContrastTest' == pages.name)) {
          console.info('get ContrastTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ContrastTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ContrastTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ContrastTest after each called');
    });

    /**
     * @tc.number ContrastTest_0100
     * @tc.name ContrastTest_0100
     * @tc.desc test contrast grayscale saturate sepia sphericalEffect lightUpEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContrastTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ContrastTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('imageContrastId1');
      console.info("[ContrastTest_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[ContrastTest_0100] contrast1 is: " + JSON.parse(strJson1)?.$attrs?.contrast);
      console.info("[ContrastTest_0100] grayscale1 is: " + JSON.parse(strJson1)?.$attrs?.grayscale);
      console.info("[ContrastTest_0100] saturate1 is: " + JSON.parse(strJson1)?.$attrs?.saturate);
      console.info("[ContrastTest_0100] sepia1 is: " + JSON.parse(strJson1)?.$attrs?.sepia);
      console.info("[ContrastTest_0100] sphericalEffect1 is: " + JSON.parse(strJson1)?.$attrs?.sphericalEffect);
      console.info("[ContrastTest_0100] lightUpEffect1 is: " + JSON.parse(strJson1)?.$attrs?.lightUpEffect);

      let strJson2 = getInspectorByKey('imageContrastId2');
      console.info("[ContrastTest_0100] obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[ContrastTest_0100] contrast2 is: " + JSON.parse(strJson2)?.$attrs?.contrast);
      console.info("[ContrastTest_0100] grayscale2 is: " + JSON.parse(strJson2)?.$attrs?.grayscale);
      console.info("[ContrastTest_0100] saturate2 is: " + JSON.parse(strJson2)?.$attrs?.saturate);
      console.info("[ContrastTest_0100] sepia2 is: " + JSON.parse(strJson2)?.$attrs?.sepia);
      console.info("[ContrastTest_0100] sphericalEffect2 is: " + JSON.parse(strJson2)?.$attrs?.sphericalEffect);
      console.info("[ContrastTest_0100] lightUpEffect2 is: " + JSON.parse(strJson2)?.$attrs?.lightUpEffect);

      let strJson3 = getInspectorByKey('imageContrastId3');
      console.info("[ContrastTest_0100] obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[ContrastTest_0100] contrast3 is: " + JSON.parse(strJson3)?.$attrs?.contrast);
      console.info("[ContrastTest_0100] grayscale3 is: " + JSON.parse(strJson3)?.$attrs?.grayscale);
      console.info("[ContrastTest_0100] saturate3 is: " + JSON.parse(strJson3)?.$attrs?.saturate);
      console.info("[ContrastTest_0100] sepia3 is: " + JSON.parse(strJson3)?.$attrs?.sepia);
      console.info("[ContrastTest_0100] sphericalEffect3 is: " + JSON.parse(strJson3)?.$attrs?.sphericalEffect);
      console.info("[ContrastTest_0100] lightUpEffect3 is: " + JSON.parse(strJson3)?.$attrs?.lightUpEffect);

      let strJson4 = getInspectorByKey('imageContrastId4');
      console.info("[ContrastTest_0100] obj4 is: " + JSON.stringify(JSON.parse(strJson4)));
      console.info("[ContrastTest_0100] contrast4 is: " + JSON.parse(strJson4)?.$attrs?.contrast);
      console.info("[ContrastTest_0100] grayscale4 is: " + JSON.parse(strJson4)?.$attrs?.grayscale);
      console.info("[ContrastTest_0100] saturate4 is: " + JSON.parse(strJson4)?.$attrs?.saturate);
      console.info("[ContrastTest_0100] sphericalEffect4 is: " + JSON.parse(strJson4)?.$attrs?.sphericalEffect);
      console.info("[ContrastTest_0100] lightUpEffect4 is: " + JSON.parse(strJson4)?.$attrs?.lightUpEffect);

      let strJson5 = getInspectorByKey('imageContrastId5');
      console.info("[ContrastTest_0100] obj5 is: " + JSON.stringify(JSON.parse(strJson5)));
      console.info("[ContrastTest_0100] contrast5 is: " + JSON.parse(strJson5)?.$attrs?.contrast);
      console.info("[ContrastTest_0100] grayscale5 is: " + JSON.parse(strJson5)?.$attrs?.grayscale);
      console.info("[ContrastTest_0100] saturate5 is: " + JSON.parse(strJson5)?.$attrs?.saturate);

      expect(JSON.parse(strJson1)?.$attrs?.contrast).assertEqual(0);
      expect(JSON.parse(strJson1)?.$attrs?.grayscale).assertEqual(0);
      expect(JSON.parse(strJson1)?.$attrs?.saturate).assertEqual(0);
      expect(JSON.parse(strJson1)?.$attrs?.sepia).assertEqual(0);
      expect(JSON.parse(strJson1)?.$attrs?.sphericalEffect).assertEqual(0);
      expect(JSON.parse(strJson1)?.$attrs?.lightUpEffect).assertEqual(0);

      expect(JSON.parse(strJson2)?.$attrs?.contrast).assertEqual(0);
      expect(JSON.parse(strJson2)?.$attrs?.grayscale).assertEqual(0);
      expect(JSON.parse(strJson2)?.$attrs?.saturate).assertEqual(0);
      expect(JSON.parse(strJson2)?.$attrs?.sepia).assertEqual(0);
      expect(JSON.parse(strJson2)?.$attrs?.sphericalEffect).assertEqual(0);
      expect(JSON.parse(strJson2)?.$attrs?.lightUpEffect).assertEqual(0);

      expect(JSON.parse(strJson3)?.$attrs?.contrast).assertEqual(10);
      expect(JSON.parse(strJson3)?.$attrs?.grayscale).assertEqual(1);
      expect(JSON.parse(strJson3)?.$attrs?.saturate).assertEqual(50);
      expect(JSON.parse(strJson3)?.$attrs?.sepia).assertEqual(0);
      expect(JSON.parse(strJson3)?.$attrs?.sphericalEffect).assertEqual(1);
      expect(JSON.parse(strJson3)?.$attrs?.lightUpEffect).assertEqual(1);

      expect(JSON.parse(strJson4)?.$attrs?.contrast).assertEqual(9);
      expect(JSON.parse(strJson4)?.$attrs?.grayscale).assertEqual(1);
      expect(JSON.parse(strJson4)?.$attrs?.saturate).assertEqual(49);
      expect(JSON.parse(strJson4)?.$attrs?.sepia).assertEqual(0);
      expect(JSON.parse(strJson4)?.$attrs?.sphericalEffect).assertEqual(0);
      expect(JSON.parse(strJson4)?.$attrs?.lightUpEffect).assertEqual(1);

      expect(JSON.parse(strJson5)?.$attrs?.contrast).assertEqual(11);
      expect(JSON.parse(strJson5)?.$attrs?.grayscale).assertEqual(0);
      expect(JSON.parse(strJson5)?.$attrs?.saturate).assertEqual(1);
      done();
    });

  })
}
