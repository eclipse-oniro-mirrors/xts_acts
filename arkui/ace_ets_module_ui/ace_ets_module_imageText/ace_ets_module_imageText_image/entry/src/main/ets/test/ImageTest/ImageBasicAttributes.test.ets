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

import { afterEach, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
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

export default function ImageBasicAttributesTest() {
  describe('ImageBasicAttributesTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Image/ImageBasicAttributes',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageBasicAttributesTest state success " + JSON.stringify(pages));
        if (!("ImageBasicAttributes" == pages.name)) {
          console.info("get ImageBasicAttributesTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push ImageBasicAttributesTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageBasicAttributesTest page error " + JSON.stringify(err));
      }
      await sleep(1);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("ImageBasicAttributesTest after each called");
    });

    /**
     * @tc.name   ImageBasicAttributesTest_010
     * @tc.number ImageBasicAttributesTest_010
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageBasicAttributesTest_010', Level.LEVEL1, async (done: Function) => {
      console.info('ImageBasicAttributesTest_010 START');
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image1 matchTextDirection" + JSON.stringify(obj.$attrs.matchTextDirection));
      console.log("image1 objectFit" + JSON.stringify(obj.$attrs.objectFit));
      console.log("image1 fitOriginalSize" + JSON.stringify(obj.$attrs.fitOriginalSize));
      console.log("image1 fillColor" + JSON.stringify(obj.$attrs.fillColor));
      console.log("image1 autoResize" + JSON.stringify(obj.$attrs.autoResize));
      console.log("image1 syncLoad" + JSON.stringify(obj.$attrs.syncLoad));
      console.log("image1 objectRepeat" + JSON.stringify(obj.$attrs.objectRepeat));
      console.log("image1 interpolation" + JSON.stringify(obj.$attrs.interpolation));
      console.log("image1 renderMode" + JSON.stringify(obj.$attrs.renderMode));
      console.log("image1 sourceSize" + JSON.stringify(obj.$attrs.sourceSize));
      console.log("image1 alt" + JSON.stringify(obj.$attrs.alt));
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Cover');
      expect(obj.$attrs.syncLoad).assertEqual('false');
      expect(obj.$attrs.objectRepeat).assertEqual('ImageRepeat.NoRepeat');
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.None');
      expect(obj.$attrs.renderMode).assertEqual('ImageRenderMode.Original');
      expect(obj.$attrs.sourceSize).assertEqual("[200.00 x 100.00]");
      expect(obj.$attrs.alt).assertEqual('/resources/rawfile/person.png');
      console.info('ImageBasicAttributesTest_010 END');
      done();
    });

    /**
     * @tc.name   ImageBasicAttributesTest_020
     * @tc.number ImageBasicAttributesTest_020
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageBasicAttributesTest_020', Level.LEVEL1, async (done: Function) => {
      console.info('ImageBasicAttributesTest_020 START');
      let strJson = getInspectorByKey('image2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image2 objectFit" + JSON.stringify(obj.$attrs.objectFit));
      console.log("image2 objectRepeat" + JSON.stringify(obj.$attrs.objectRepeat));
      console.log("image2 interpolation" + JSON.stringify(obj.$attrs.interpolation));
      console.log("image2 renderMode" + JSON.stringify(obj.$attrs.renderMode));
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Contain');
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.High');
      expect(obj.$attrs.renderMode).assertEqual('ImageRenderMode.Template');
      console.info('ImageBasicAttributesTest_020 END');
      done();
    });

    /**
     * @tc.name   ImageBasicAttributesTest_030
     * @tc.number ImageBasicAttributesTest_030
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageBasicAttributesTest_030', Level.LEVEL1, async (done: Function) => {
      console.info('ImageBasicAttributesTest_030 START');
      let strJson = getInspectorByKey('image3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image3 objectFit" + JSON.stringify(obj.$attrs.objectFit));
      console.log("image3 objectRepeat" + JSON.stringify(obj.$attrs.objectRepeat));
      console.log("image3 interpolation" + JSON.stringify(obj.$attrs.interpolation));
      expect(obj.$attrs.objectRepeat).assertEqual('ImageRepeat.Y');
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Low');
      console.info('ImageBasicAttributesTest_030 END');
      done();
    });

    /**
     * @tc.name   ImageBasicAttributesTest_040
     * @tc.number ImageBasicAttributesTest_040
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageBasicAttributesTest_040', Level.LEVEL1, async (done: Function) => {
      console.info('ImageBasicAttributesTest_040 START');
      let strJson = getInspectorByKey('image4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image4 objectFit" + JSON.stringify(obj.$attrs.objectFit));
      console.log("image4 objectRepeat" + JSON.stringify(obj.$attrs.objectRepeat));
      console.log("image4 interpolation" + JSON.stringify(obj.$attrs.interpolation));
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.None');
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Medium');
      console.info('ImageBasicAttributesTest_040 END');
      done();
    });

    /**
     * @tc.name   ImageBasicAttributesTest_050
     * @tc.number ImageBasicAttributesTest_050
     * @tc.desc   aceEtsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageBasicAttributesTest_050', Level.LEVEL1, async (done: Function) => {
      console.info('ImageBasicAttributesTest_050 START');
      let strJson = getInspectorByKey('image5');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image5 objectFit" + JSON.stringify(obj.$attrs.objectFit));
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.ScaleDown');
      console.info('ImageBasicAttributesTest_050 END');
      done();
    });
  })
}
