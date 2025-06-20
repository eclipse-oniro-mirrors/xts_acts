/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


import { afterEach, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}


export default function ratingJsunit() {


  describe('ratingTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/Rating'
      };
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get Rating state success " + JSON.stringify(pages));
        if (!("Rating" == pages.name)) {
          console.info("get Rating state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Rating page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Rating page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Rating after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0990
     * @tc.name testGetRatingAttr010
     * @tc.desc aceEtsTest
     */
    it('testGetRatingAttr010', Level.LEVEL1, async (done: Function) => {
      console.info('testGetRatingAttr1 START');
      let strJson = getInspectorByKey('rating1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info("rating1 rating" + JSON.stringify(obj.$attrs.rating));
      console.info("rating1 indicator" + JSON.stringify(obj.$attrs.indicator));
      console.info("rating1 stepSize" + JSON.stringify(obj.$attrs.stepSize));
      console.info("rating1 stars" + JSON.stringify(obj.$attrs.stars));
      console.info("rating1 starStyle" + JSON.stringify(obj.$attrs.starStyle));
      expect(obj.$attrs.rating).assertEqual("2.000000");
      expect(obj.$attrs.indicator).assertEqual("false");
      expect(obj.$attrs.stepSize).assertEqual("0.500000");
      expect(obj.$attrs.stars).assertEqual("5");
      expect(obj.$attrs.starStyle)
        .assertEqual('{"backgroundUri":"/resources/rawfile/star-1-1.png","foregroundUri":"/resources/rawfile/star-1-3.png","secondaryUri":"/resources/rawfile/star-1-2.png"}');
      console.info('testGetRatingAttr1 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1000
     * @tc.name testGetRatingAttr020
     * @tc.desc aceEtsTest
     */
    it('testGetRatingAttr020', Level.LEVEL1, async (done: Function) => {
      console.info('testGetRatingAttr2 START');
      let strJson = getInspectorByKey('rating2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.info("rating2 indicator" + JSON.stringify(obj.$attrs.indicator));
      expect(obj.$attrs.indicator).assertEqual("true");
      console.info('testGetRatingAttr2 END');
      done();
    });
  })
}
