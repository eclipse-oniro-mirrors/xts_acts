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

export default function OpacityTest() {

  describe('OpacityTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/OpacityTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get OpacityTest state pages: ' + JSON.stringify(pages));
        if (!('OpacityTest' == pages.name)) {
          console.info('get OpacityTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push OpacityTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push OpacityTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('OpacityTest after each called');
    });

    /**
     * @tc.number OpacityTest_0100
     * @tc.name OpacityTest_0100
     * @tc.desc test opacity param
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('OpacityTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('OpacityTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('id0');
      console.info("[OpacityTest_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[OpacityTest_0100] component opacity1 is: " + JSON.parse(strJson).$attrs.opacity);
      expect(JSON.parse(strJson).$attrs.opacity).assertEqual(0);
      let strJson2 = getInspectorByKey('id1');
      console.info("[OpacityTest_0100] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[OpacityTest_0100] component opacity2 is: " + JSON.parse(strJson2).$attrs.opacity);
      expect(JSON.parse(strJson2).$attrs.opacity).assertEqual(0);
      let strJson3 = getInspectorByKey('id2');
      console.info("[OpacityTest_0100] component obj3 is: " + JSON.stringify(JSON.parse(strJson3)));
      console.info("[OpacityTest_0100] component opacity3 is: " + JSON.parse(strJson3).$attrs.opacity);
      expect(JSON.parse(strJson3).$attrs.opacity).assertEqual(1);
      let strJson4 = getInspectorByKey('id3');
      console.info("[OpacityTest_0100] component obj4 is: " + JSON.stringify(JSON.parse(strJson4)));
      console.info("[OpacityTest_0100] component opacity4 is: " + JSON.parse(strJson4).$attrs.opacity);
      expect(JSON.parse(strJson4).$attrs.opacity).assertEqual(1);
      let strJson5 = getInspectorByKey('id4');
      console.info("[OpacityTest_0100] component obj5 is: " + JSON.stringify(JSON.parse(strJson5)));
      console.info("[OpacityTest_0100] component opacity5 is: " + JSON.parse(strJson5).$attrs.opacity);
      expect(JSON.parse(strJson5).$attrs.opacity).assertEqual(1);
      console.info('[OpacityTest_0100] END');
      done();
    });

  })
}
