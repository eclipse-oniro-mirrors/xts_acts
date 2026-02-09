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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function SwiperParamExample() {
  describe('SwiperParamExample', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperParamExample beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/swiper/SwiperParamExample",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperParamExample state pages:" + JSON.stringify(pages));
        if (!("SwiperParamExample" == pages.name)) {
          console.info("get SwiperParamExample pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SwiperParamExample page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperParamExample page error:" + err);
      }
      console.info("SwiperParamExample beforeEach end");
      done();
    });

    /**
     * @tc.name   SwiperParamExample_0100
     * @tc.number SwiperParamExample_001
     * @tc.desc   Display 1 column when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwiperParamExample_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[SwiperParamExample_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson1 = getInspectorByKey('maxDisplayCountMax1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.log('SwiperParamExample_0010 obj1 interval ', obj1?.$attrs?.interval);
      console.log('SwiperParamExample_0010 obj1 duration ', obj1?.$attrs?.duration);
      console.log('SwiperParamExample_0010 obj1 itemSpace ', obj1?.$attrs?.itemSpace);
      console.log('SwiperParamExample_0010 obj1 cachedCount ', obj1?.$attrs?.cachedCount);
      expect(obj1.$attrs?.interval).assertEqual('0');
      expect(obj1.$attrs?.duration).assertEqual('0');
      expect(obj1.$attrs?.itemSpace).assertEqual('0.00vp');
      expect(obj1.$attrs?.cachedCount).assertEqual(0);
      let strJson2 = getInspectorByKey('maxDisplayCountMin');
      let obj2: ESObject = JSON.parse(strJson2);
      console.log('SwiperParamExample_0010 obj2 interval ', obj2.$attrs?.interval);
      console.log('SwiperParamExample_0010 obj2 duration ', obj2?.$attrs?.duration);
      console.log('SwiperParamExample_0010 obj2 itemSpace ', obj2?.$attrs?.itemSpace);
      console.log('SwiperParamExample_0010 obj2 cachedCount ', obj2?.$attrs?.cachedCount);
      expect(obj2.$attrs?.interval).assertEqual('3000');
      expect(obj2.$attrs?.duration).assertEqual('400');
      expect(obj2.$attrs?.itemSpace).assertEqual('0.00vp');
      expect(obj2.$attrs?.cachedCount).assertEqual(1);
      console.info('[SwiperParamExample_0100] END');
      done();
    });
 })
}
