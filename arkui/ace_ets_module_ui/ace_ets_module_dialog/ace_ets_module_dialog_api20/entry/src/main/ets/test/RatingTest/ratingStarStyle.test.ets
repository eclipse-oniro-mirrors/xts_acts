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
import Utils from '../../MainAbility/common/Utils';

export default function ratingStarStyle() {
  describe('ratingStarStyle', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/ratingStarStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get rating state success ' + JSON.stringify(pages));
        if (!('ratingStarStyle' == pages.name)) {
          console.info('get rating state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push rating page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push rating page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   RatingStarStyle_0100
     * @tc.number RatingStarStyle_0100
     * @tc.desc   createRatingToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RatingStarStyle_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'RatingStarStyle_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('rating_001');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RatingStarStyle_0100] component obj is: " + JSON.stringify(obj.$attrs.starStyle));
      expect(JSON.parse(obj.$attrs.starStyle).backgroundUri).assertEqual('resource://RAWFILE/image1.png');
      expect(JSON.parse(obj.$attrs.starStyle).foregroundUri).assertEqual('resource://RAWFILE/image2.png');
      expect(JSON.parse(obj.$attrs.starStyle).secondaryUri).assertEqual('resource://RAWFILE/image3.png');
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   RatingStarStyle_0200
     * @tc.number RatingStarStyle_0200
     * @tc.desc   createRatingToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RatingStarStyle_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'RatingStarStyle_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('rating_002');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RatingStarStyle_0200] component obj is: " + JSON.stringify(obj.$attrs.starStyle));
      expect(JSON.parse(obj.$attrs.starStyle).backgroundUri).assertEqual("resources/rawfile/image1.png");
      expect(JSON.parse(obj.$attrs.starStyle).foregroundUri).assertEqual("resources/rawfile/image2.png");
      expect(JSON.parse(obj.$attrs.starStyle).secondaryUri).assertEqual("resources/rawfile/image3.png");
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   RatingStarStyle_0300
     * @tc.number RatingStarStyle_0300
     * @tc.desc   createRatingToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RatingStarStyle_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'RatingStarStyle_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('rating_003');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RatingStarStyle_0300] component obj is: " + JSON.stringify(obj.$attrs.starStyle));
      expect(JSON.parse(obj.$attrs.starStyle).backgroundUri).assertEqual("");
      expect(JSON.parse(obj.$attrs.starStyle).foregroundUri).assertEqual("");
      expect(JSON.parse(obj.$attrs.starStyle).secondaryUri).assertEqual("");
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   RatingStarStyle_0400
     * @tc.number RatingStarStyle_0400
     * @tc.desc   createRatingToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RatingStarStyle_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tagName = 'RatingStarStyle_0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('rating_004');
      let obj: ESObject = JSON.parse(strJson);
      expect(JSON.parse(obj.$attrs.starStyle).backgroundUri).assertEqual("");
      expect(JSON.parse(obj.$attrs.starStyle).foregroundUri).assertEqual("");
      expect(JSON.parse(obj.$attrs.starStyle).secondaryUri).assertEqual("");
      console.info('[' + tagName + '] END============================');
      await Utils.sleep(1000);
      done();
    });
  })
}
