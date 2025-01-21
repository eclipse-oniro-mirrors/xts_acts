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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

//返回首页
async function backToIndex() {
  let backToIndexPromise = new Promise((resolve: (value: string) => void) => {
    console.info('afterEach backToIndexPromise ...');
    setTimeout(() => {
      router.back({
        url: 'MainAbility/pages/index'
      });
      resolve("ok")
    }, 500);
  });

  let clearPromise = new Promise((resolve: (value: string) => void) => {
    console.info('afterEach clearPromise ...');
    setTimeout(() => {
      router.clear();
      resolve("ok")
    }, 500);
  });
  await backToIndexPromise.then(() => {
    return clearPromise;
  });
}

export default function swiperJsunit() {


  describe('swiperTest', () => {

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Swiper state success " + JSON.stringify(pages));
        if (!("Swiper" == pages.name)) {
          console.info("get Swiper state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Swiper page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Swiper page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async () => {
      await sleep(1)
      console.info("Swiper after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0500
     * @tc.name swiperTest001
     * @tc.desc aceEtsTest
     */
    it('swiperTest001', 0, async () => {
      console.info('++++++++++++++++ Swiper TestCase 1 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('swiper');
      let obj: Record<string, Object> = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Swiper')
      console.log('Swiper‘s index is ' + JSON.stringify(JSON.parse(strJson).$attrs.index))
      console.log('Swiper‘s autoPlay is ' + JSON.stringify(JSON.parse(strJson).$attrs.autoPlay))
      console.log('Swiper‘s interval is ' + JSON.stringify(JSON.parse(strJson).$attrs.interval))
      console.log('Swiper‘s indicator is ' + JSON.stringify(JSON.parse(strJson).$attrs.indicator))
      console.log('Swiper‘s loop is ' + JSON.stringify(JSON.parse(strJson).$attrs.loop))
      console.log('Swiper‘s duration is ' + JSON.stringify(JSON.parse(strJson).$attrs.duration))
      console.log('Swiper‘s vertical is ' + JSON.stringify(JSON.parse(strJson).$attrs.vertical))
      console.log('Swiper‘s itemSpace is ' + JSON.stringify(JSON.parse(strJson).$attrs.itemSpace))
      console.log('Swiper‘s disableSwipe is ' + JSON.stringify(JSON.parse(strJson).$attrs.disableSwipe))
      expect(JSON.parse(strJson).$attrs.index).assertEqual('1')
      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('true')
      expect(JSON.parse(strJson).$attrs.interval).assertEqual('4000')
      expect(JSON.parse(strJson).$attrs.indicator).assertEqual('true')
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('false')
      expect(JSON.parse(strJson).$attrs.vertical).assertEqual('false')
      expect(JSON.parse(strJson).$attrs.duration).assertEqual("1000")
      console.info('++++++++++++++++ Swiper TestCase 1 End +++++++++++++++++');
    });
  })
}
