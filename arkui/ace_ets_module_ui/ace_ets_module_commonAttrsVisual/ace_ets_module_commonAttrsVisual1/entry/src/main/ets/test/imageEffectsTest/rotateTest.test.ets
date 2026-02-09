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

export default function rotateTest() {
  describe('rotateTest', () => {
    beforeEach(async (done: Function) => {
      console.info('rotateTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/rotatePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get rotateTest state pages:' + JSON.stringify(pages));
        if (!('rotatePage' == pages.name)) {
          console.info('get rotateTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push rotateTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push rotateTest page error:' + err);
      }
      console.info('rotateTest beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   rotateTest_0100
     * @tc.number rotateTest_0100
     * @tc.desc   rotateTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('rotateTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('rotateTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('rotatePage_image');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[rotateTest_0100] strJson:' + obj.$attrs.transform.matrix);
      expect(obj.$attrs.transform.matrix).assertEqual('0.707107,0.707107,0.000000,0.000000,-0.707107,0.707107,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000,');

      console.info('rotateTest_0100 END');
      done();
    });
  })
}