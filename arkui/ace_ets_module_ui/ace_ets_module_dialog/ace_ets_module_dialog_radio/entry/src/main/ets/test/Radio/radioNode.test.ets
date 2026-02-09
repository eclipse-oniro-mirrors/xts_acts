/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function radioNodeTest() {
  describe('radioNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('radioNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/radioNode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get radioNode state pages: ' + JSON.stringify(pages));
        if (!('radioNode' == pages.name)) {
          console.info('get radioNode pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push radioNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('radioNode beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('radioNode after each called');
    })
   
    /**
     * @tc.name   radioNode0100
     * @tc.number SUB_ARKUI_API_radioNode0100
     * @tc.desc   RadioAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('radioNode0100', Level.LEVEL1, async (done: Function) => {

      let tagName = 'radioNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_Radio_001');
      console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parse(strJsonNew).$type));
      expect(JSON.parse(strJsonNew).$type).assertEqual('Radio');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
