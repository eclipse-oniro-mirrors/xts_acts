/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import router from '@ohos.router';
import Utils from './Utils';

export default function RatingJsunit() {
  describe('ratingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RatingJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/rating',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RatingJsunit state pages: " + JSON.stringify(pages));
        if (!("rating" == pages.name)) {
          console.info("get RatingJsunit state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push RatingJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number RatingJsunit_0100
     * @tc.name Test the properties of components
     * @tc.desc Set stars values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('RatingJsunit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[RatingJsunit_0100] START');
      let strJson = getInspectorByKey('rating1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RatingJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.stars).assertEqual('5');
      console.info('[RatingJsunit_0100] END');
      done();
    });

    /**
     * @tc.number RatingJsunit_0200
     * @tc.name Test the properties of components
     * @tc.desc Set stepSize values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('RatingJsunit_0200', Level.LEVEL0, async (done: Function) => {

      console.info('[RatingJsunit_0200] START');
      let strJson = getInspectorByKey('rating1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RatingJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.stepSize).assertEqual('0.500000');
      console.info('[RatingJsunit_0200] END');
      done();
    });

    /**
     * @tc.number RatingJsunit_0300
     * @tc.name Test the properties of components
     * @tc.desc Set starStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('RatingJsunit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[RatingJsunit_0300] START');
      let strJson = getInspectorByKey('rating1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RatingJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(JSON.parse(obj.$attrs.starStyle).backgroundUri).assertEqual("resources/base/media/star_1.png");
      expect(JSON.parse(obj.$attrs.starStyle).foregroundUri).assertEqual("resources/base/media/star_2.png");
      expect(JSON.parse(obj.$attrs.starStyle).secondaryUri).assertEqual("resources/base/media/star_3.png");
      console.info('[RatingJsunit_0300] END');
      done();
    });

    /**
     * @tc.number RatingJsunit_0400
     * @tc.name Test the properties of components
     * @tc.desc Set starStyle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('RatingJsunit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[RatingJsunit_0400] START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJson = getInspectorByKey('rating1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RatingJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.stepSize).assertEqual('0.400000');
      console.info('[RatingJsunit_0400] END');
      done();
    });

  })
}
