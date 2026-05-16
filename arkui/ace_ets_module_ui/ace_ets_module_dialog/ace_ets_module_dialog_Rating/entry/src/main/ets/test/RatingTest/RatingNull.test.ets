/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../MainAbility/common/Utils';

export default function RatingNullTest() {
  describe('RatingNullTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/RatingNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get RatingNullTest state success ' + JSON.stringify(pages));
        if (!('RatingNull' == pages.name)) {
          console.info('get RatingNullTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push RatingNullTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push RatingNullTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   ratingnull_001
     * @tc.number ratingnull_001
     * @tc.desc   createRatingToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ratingnull_001', Level.LEVEL0, async (done:Function) =>{
      let tagName = 'ratingunllundefined';
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let resource = getInspectorByKey('ratingnull');
      expect(JSON.parse(resource).$attrs.stepSize).assertEqual('0.500000')
      expect(JSON.parse(resource).$attrs.stars).assertEqual('5')
      expect(JSON.parse(resource).$attrs.starStyle.backgroundUri).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.starStyle.contentModifier).assertEqual(undefined)
      // expect(JSON.parse(resource).$attrs.radioStyle.checkedBackgroundColor).assertEqual(undefined)
      await Utils.sleep(2000);
      console.info('[' + tagName + '] END ===========================');
      done();
    })

    /**
     * @tc.name   ratingundefined_001
     * @tc.number ratingundefined_001
     * @tc.desc   createRatingToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ratingundefined_001', Level.LEVEL0, async (done:Function) =>{
      let tagName = 'ratingundefined_001';
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let resource = getInspectorByKey('ratingnull');
      expect(JSON.parse(resource).$attrs.stepSize).assertEqual('0.500000')
      expect(JSON.parse(resource).$attrs.stars).assertEqual('5')
      expect(JSON.parse(resource).$attrs.starStyle.backgroundUri).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.starStyle.contentModifier).assertEqual(undefined)
      await Utils.sleep(2000);
      console.info('[' + tagName + '] END ===========================');
      done();
    })
  })
}