/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils.ets'

export default function swiperMaskJsunit() {
  describe('swiperMaskTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiper6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("swiper6" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push swiper page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiper page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("swiperMask after each called");
    });

    /**
     * @tc.name   testswiperMask001
     * @tc.number SUB_ACE_BASIC_ETS_API_001
     * @tc.desc   testswiperMask001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testswiperMask001', Level.LEVEL1, async (done: Function) => {
      console.info('swiperMask testswiperMask001 START');
      await Utils.sleep(2000);
      let strJson: string = getInspectorByKey('maskSwiper');
      console.info("[testswiperMask001] component textAlign strJson:" + strJson);
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      console.info("[testswiperMask001] indicatorStyle value :" + JSON.parse(strJson).$attrs.indicator);
      expect(JSON.parse(strJson).$attrs.indicator).assertEqual('true');
      done();
    });
  })
}
