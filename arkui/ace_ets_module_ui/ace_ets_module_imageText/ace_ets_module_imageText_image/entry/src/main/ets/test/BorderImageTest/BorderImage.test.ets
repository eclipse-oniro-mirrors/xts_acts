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

export default function BorderImageTest() {
  describe('BorderImageTest', () => {
    beforeEach(async (done: Function) => {
      console.info('BorderImageTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BorderImage/BorderImage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get BorderImageTest state success ' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!('BorderImage' == pages.name)) {
          console.info('get BorderImageTest state success ' + JSON.stringify(pages.name));
          await CommonFunc.sleep(SLEEP_TIME);
          console.info('push BorderImageTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BorderImageTest page error: ' + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('BorderImageTest after each called');
    });

    /**
     * @tc.name   BorderImageTest_010
     * @tc.number BorderImageTest_010
     * @tc.desc   Test the alt interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BorderImageTest_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('BorderImageTest_010 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('borderImage');
      let obj: ESObject = JSON.parse(strJson);
      console.info('borderImage Component attrs is: ' + JSON.stringify(obj.$attrs));
      console.info('borderImage Component attrs is: ' + JSON.stringify(obj.$attrs.borderImage));
      expect(obj.$attrs.borderImage).assertContain('RepeatMode.Round');
      await CommonFunc.sleep(SLEEP_TIME);
      console.info('BorderImageTest_010 END');
      done();
    });
  })
}