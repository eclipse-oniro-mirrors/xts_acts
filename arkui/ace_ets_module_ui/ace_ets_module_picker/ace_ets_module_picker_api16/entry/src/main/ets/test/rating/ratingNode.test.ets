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

export default function ratingNodeTest() {
  describe('ratingNodeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ratingNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/rating/ratingNode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ratingNode state pages: ' + JSON.stringify(pages));
        if (!('ratingNode' == pages.name)) {
          console.info('get ratingNode pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ratingNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('ratingNode beforeEach end');
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ratingNode after each called');
    })
   
    /**
     * @tc.name   ratingNode0100
     * @tc.number ratingNode0100
     * @tc.desc   frameNode: createNoderatingToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ratingNode0100', Level.LEVEL1, async (done: Function) => {

      let tagName = 'ratingNode0100';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = getInspectorByKey('key_Rating_001');
      console.info('[' + tagName + '] Search is: ' + JSON.stringify(JSON.parse(strJsonNew).$type));
      expect(JSON.parse(strJsonNew).$type).assertEqual('Rating');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
