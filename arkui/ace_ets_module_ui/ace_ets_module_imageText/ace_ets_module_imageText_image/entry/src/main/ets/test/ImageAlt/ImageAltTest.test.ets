/*
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

import router from '@ohos.router';
import { describe, Size, beforeEach, afterEach, TestType, it, expect, Level } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common'

const SLEEP_TIME = 1000;

export default function ImageAltTest() {
  describe('ImageAltTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ImageAltTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageAlt/ImageAltTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ImageAltTest state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('ImageAltTest' == pages.name)) {
          console.info('get ImageAltTest state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push ImageAltTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ImageAltTest page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ImageAltTest after each called');
    });

    /**
     * @tc.name   image_altTest_0101
     * @tc.number image_altTest_0101
     * @tc.desc   Test the alt interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('image_altTest_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('image_altTest_0101 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('image001');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[image_altTest_0101]:' + JSON.stringify(obj.$attrs));
      console.info('[image_altTest_0101]:' + JSON.stringify(obj.$attrs.altPlaceholder));
      console.info('[image_altTest_0101]:' + JSON.stringify(obj.$attrs.altError));
      expect(obj.$attrs.altPlaceholder).assertEqual('images/test1.jpg');
      expect(obj.$attrs.altError).assertEqual('images/test1.jpg');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('image_altTest_0101 END');
      done();
    });

    /**
     * @tc.name   image_altTest_0102
     * @tc.number image_altTest_0102
     * @tc.desc   Test the alt interface to set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('image_altTest_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('image_altTest_0102 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('image002');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[image_altTest_0102]:' + JSON.stringify(obj.$attrs));
      console.info('[image_altTest_0102]:' + JSON.stringify(obj.$attrs.altPlaceholder));
      console.info('[image_altTest_0102]:' + JSON.stringify(obj.$attrs.altError));
      expect(obj.$attrs.altPlaceholder).assertEqual('');
      expect(obj.$attrs.altError).assertEqual('');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('image_altTest_0102 END');
      done();
    });

    /**
     * @tc.name   image_altTest_0103
     * @tc.number image_altTest_0103
     * @tc.desc   Test the alt interface to set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('image_altTest_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('image_altTest_0103 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('image003');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[image_altTest_0103]:' + JSON.stringify(obj.$attrs));
      console.info('[image_altTest_0103]:' + JSON.stringify(obj.$attrs.altPlaceholder));
      console.info('[image_altTest_0103]:' + JSON.stringify(obj.$attrs.altError));
      expect(obj.$attrs.altPlaceholder).assertEqual('');
      expect(obj.$attrs.altError).assertEqual('');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('image_altTest_0103 END');
      done();
    });
  })
}