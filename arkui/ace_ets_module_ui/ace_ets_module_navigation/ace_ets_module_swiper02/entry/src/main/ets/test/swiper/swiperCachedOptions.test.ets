/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function swiperCachedOptions() {
  describe('swiperCachedOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperCachedOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/swiper/swiperCachedOptions",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperCachedOptions state pages:" + JSON.stringify(pages));
        if (!("swiperCachedOptions" == pages.name)) {
          console.info("get swiperCachedOptions pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperCachedOptions page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperCachedOptions page error:" + err);
      }
      console.info("swiperCachedOptions beforeEach end");
      done();
    });

    /**
     * @tc.name   swiperCachedOptions_0100
     * @tc.number SUB_ARKUI_SWIPER_CACHEDCOUNTOPTIONS_0100
     * @tc.desc   Test CachedCountOptions of the SwiperAttribute cachedCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperCachedOptions_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperCachedOptions_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('cachedCount_isIn_true');
      let obj: ESObject = JSON.parse(strJson);
      console.log('swiperCachedOptions_0100 cachedCount: ', obj?.$attrs?.cachedCount);
      expect(obj.$attrs?.cachedCount).assertEqual(1);
      console.info('[swiperCachedOptions_0100] END');
      done();
    });

    /**
     * @tc.name   swiperCachedOptions_0200
     * @tc.number SUB_ARKUI_SWIPER_CACHEDCOUNTOPTIONS_0200
     * @tc.desc   Test CachedCountOptions of the SwiperAttribute cachedCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperCachedOptions_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperCachedOptions_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('cachedCount_isIn_false');
      let obj: ESObject = JSON.parse(strJson);
      console.log('swiperCachedOptions_0200 cachedCount: ', obj?.$attrs?.cachedCount);
      expect(obj.$attrs?.cachedCount).assertEqual(1);
      console.info('[swiperCachedOptions_0200] END');
      done();
    });

    /**
     * @tc.name   swiperCachedOptions_0300
     * @tc.number SUB_ARKUI_SWIPER_CACHEDCOUNTOPTIONS_0300
     * @tc.desc   Test CachedCountOptions of the SwiperAttribute cachedCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperCachedOptions_0300', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperCachedOptions_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('cachedCount_isIn_tf');
      let obj: ESObject = JSON.parse(strJson);
      console.log('swiperCachedOptions_0300 cachedCount: ', obj?.$attrs?.cachedCount);
      expect(obj.$attrs?.cachedCount).assertEqual(1);
      console.info('[swiperCachedOptions_0300] END');
      done();
    });

    /**
     * @tc.name   swiperCachedOptions_0400
     * @tc.number SUB_ARKUI_SWIPER_CACHEDCOUNTOPTIONS_0400
     * @tc.desc   Test CachedCountOptions of the SwiperAttribute cachedCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperCachedOptions_0400', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperCachedOptions_0400] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('cachedCount_options_null');
      let obj: ESObject = JSON.parse(strJson);
      console.log('swiperCachedOptions_0400 cachedCount: ', obj?.$attrs?.cachedCount);
      expect(obj.$attrs?.cachedCount).assertEqual(1);
      console.info('[swiperCachedOptions_0400] END');
      done();
    });

    /**
     * @tc.name   swiperCachedOptions_0500
     * @tc.number SUB_ARKUI_SWIPER_CACHEDCOUNTOPTIONS_0500
     * @tc.desc   Test CachedCountOptions of the SwiperAttribute cachedCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperCachedOptions_0500', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperCachedOptions_0500] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('cachedCount_options_undefined');
      let obj: ESObject = JSON.parse(strJson);
      console.log('swiperCachedOptions_0500 cachedCount: ', obj?.$attrs?.cachedCount);
      expect(obj.$attrs?.cachedCount).assertEqual(1);
      console.info('[swiperCachedOptions_0500] END');
      done();
    });
  })
}
