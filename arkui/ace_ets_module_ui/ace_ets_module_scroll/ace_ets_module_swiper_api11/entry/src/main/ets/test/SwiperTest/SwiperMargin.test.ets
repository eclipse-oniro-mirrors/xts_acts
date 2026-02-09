/*
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router'
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';

export default function SwiperMarginTest() {

  const SUITE: string = 'SwiperMargin'
  const waitUiReadyMs = 500;
  describe('SwiperMarginTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/SwiperMargin",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("SwiperMargin" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((error: BusinessError) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${error.code}, message is ${error.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   ArkUI_Swiper_0100
     * @tc.number ArkUI_Swiper_0100
     * @tc.desc   Set Swiper's nextMargin and prevMargin with negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Swiper_0100', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUI_Swiper_0100'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      let baseKey = 'SwiperMargin_Swiper1'
      let strJson = getInspectorByKey(baseKey);
      expect(JSON.parse(strJson).$attrs.prevMargin).assertEqual('0.00vp')
      expect(JSON.parse(strJson).$attrs.nextMargin).assertEqual('0.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /**
     * @tc.name   ArkUI_Swiper_0200
     * @tc.number ArkUI_Swiper_0200
     * @tc.desc   Set Swiper's nextMargin and prevMargin with positive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Swiper_0200', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUI_Swiper_0200'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      let baseKey = 'SwiperMargin_Swiper2'
      let strJson = getInspectorByKey(baseKey);
      expect(JSON.parse(strJson).$attrs.prevMargin).assertEqual('10.00vp')
      expect(JSON.parse(strJson).$attrs.nextMargin).assertEqual('10.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /**
     * @tc.name   ArkUI_Swiper_0300
     * @tc.number ArkUI_Swiper_0300
     * @tc.desc   Set Swiper's nextMargin and prevMargin with string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Swiper_0300', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUI_Swiper_0300'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      let baseKey = 'SwiperMargin_Swiper3'
      let strJson = getInspectorByKey(baseKey);
      expect(JSON.parse(strJson).$attrs.prevMargin).assertEqual('11.00vp')
      expect(JSON.parse(strJson).$attrs.nextMargin).assertEqual('11.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /**
     * @tc.name   ArkUI_Swiper_0400
     * @tc.number ArkUI_Swiper_0400
     * @tc.desc   Set Swiper's nextMargin and prevMargin with Resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_Swiper_0400', Level.LEVEL1, async (done: Function) => {
      let CASE = 'ArkUI_Swiper_0400'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      let baseKey = 'SwiperMargin_Swiper4'
      let strJson = getInspectorByKey(baseKey);
      expect(JSON.parse(strJson).$attrs.prevMargin).assertEqual('12.00vp')
      expect(JSON.parse(strJson).$attrs.nextMargin).assertEqual('12.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  })
}
