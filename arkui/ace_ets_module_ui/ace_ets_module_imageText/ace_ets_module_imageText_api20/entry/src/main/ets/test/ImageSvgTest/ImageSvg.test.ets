/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';

export default function ImageSupportSvg2Test() {
  describe('ImageSupportSvg2Test', () => {
    beforeEach(async (done: Function) => {
      await router.pushUrl({
        url:'MainAbility/pages/ImageSvg/ImageSupportSvg2'
      })
      done();
    });

    /**
     * @tc.name   ImageSupportSvg2Test0100
     * @tc.number Image_SupportSvg2_Test_0100
     * @tc.desc   To test the supportSvg2 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageSupportSvg2Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSupportSvg2Test0100 START');
      let strJson = getInspectorByKey('image1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSupportSvg2Test0100 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('true');
      done();
    });

    /**
     * @tc.name   ImageSupportSvg2Test0200
     * @tc.number Image_SupportSvg2_Test_0200
     * @tc.desc   To test the supportSvg2 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageSupportSvg2Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSupportSvg2Test0200 START');
      let strJson = getInspectorByKey('image2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSupportSvg2Test0200 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      done();
    });

    /**
     * @tc.name   ImageSupportSvg2Test0300
     * @tc.number Image_SupportSvg2_Test_0300
     * @tc.desc   To test the supportSvg2 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageSupportSvg2Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSupportSvg2Test0300 START');
      let strJson = getInspectorByKey('image3');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSupportSvg2Test0300 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      done();
    });

    /**
     * @tc.name   ImageSupportSvg2Test0400
     * @tc.number Image_SupportSvg2_Test_0400
     * @tc.desc   To test the supportSvg2 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageSupportSvg2Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSupportSvg2Test0400 START');
      let strJson = getInspectorByKey('image4');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSupportSvg2Test0400 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      done();
    });

    /**
     * @tc.name   ImageSupportSvg2Test0500
     * @tc.number Image_SupportSvg2_Test_0500
     * @tc.desc   To test the supportSvg2 default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageSupportSvg2Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('ImageSupportSvg2Test0500 START');
      let strJson = getInspectorByKey('image5');
      let obj: ESObject = JSON.parse(strJson);
      console.info('ImageSupportSvg2Test0500 component obj supportSvg2 is: ' + obj.$attrs.supportSvg2);
      expect(obj.$attrs.supportSvg2).assertEqual('false');
      done();
    });
  })
}