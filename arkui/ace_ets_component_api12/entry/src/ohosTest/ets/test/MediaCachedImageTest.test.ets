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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@system.router';
import CommonFunc from '../MainAbility/utils/Common';

interface optionsObj {
  uri: string
}

export default function mediaCachedImageJsunit() {

  describe('MediaCachedImageTest', () => {
    beforeEach(async (done: Function) => {
      let options: optionsObj = {
        uri: 'MainAbility/pages/MediaCachedImage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MediaCachedImage state pages: " + JSON.stringify(pages));
        if (!("MediaCachedImage" == pages.name)) {
          console.info("get MediaCachedImage state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push MediaCachedImage success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MediaCachedImage page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MediaCachedImage after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0100
     * @tc.name      testGetImageAttr010
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testGetImageAttr010', 0, async (done: Function) => {
      console.info('testGetImageAttr1 START');
      let strJson = getInspectorByKey('image1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
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
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Cover')
      expect(obj.$attrs.syncLoad).assertEqual('false')
      expect(obj.$attrs.objectRepeat).assertEqual('ImageRepeat.NoRepeat')
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.None')
      expect(obj.$attrs.renderMode).assertEqual('ImageRenderMode.Original')
      expect(obj.$attrs.sourceSize).assertEqual("[200.00 x 100.00]")
      expect(obj.$attrs.alt).assertEqual('/resources/rawfile/person.png')
      console.info('testGetImageAttr1 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0120
     * @tc.name      testGetImageAttr020
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testGetImageAttr020', 0, async (done: Function) => {
      console.info('testGetImageAttr2 START');
      let strJson = getInspectorByKey('image2');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image2 objectFit" + JSON.stringify(obj.$attrs.objectFit));
      console.log("image2 objectRepeat" + JSON.stringify(obj.$attrs.objectRepeat));
      console.log("image2 interpolation" + JSON.stringify(obj.$attrs.interpolation));
      console.log("image2 renderMode" + JSON.stringify(obj.$attrs.renderMode));
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Contain')
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.High')
      expect(obj.$attrs.renderMode).assertEqual('ImageRenderMode.Template')
      console.info('testGetImageAttr2 END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0130
     * @tc.name      testGetImageAttr030
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testGetImageAttr030', 0, async (done: Function) => {
      console.info('testGetImageAttr3 START');
      let strJson = getInspectorByKey('image3');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image3 objectFit" + JSON.stringify(obj.$attrs.objectFit));
      console.log("image3 objectRepeat" + JSON.stringify(obj.$attrs.objectRepeat));
      console.log("image3 interpolation" + JSON.stringify(obj.$attrs.interpolation));
      expect(obj.$attrs.objectRepeat).assertEqual('ImageRepeat.Y')
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Low')
      console.info('testGetImageAttr3 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0140
     * @tc.name      testGetImageAttr040
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testGetImageAttr040', 0, async (done: Function) => {
      console.info('testGetImageAttr4 START');
      let strJson = getInspectorByKey('image4');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image4 objectFit" + JSON.stringify(obj.$attrs.objectFit));
      console.log("image4 objectRepeat" + JSON.stringify(obj.$attrs.objectRepeat));
      console.log("image4 interpolation" + JSON.stringify(obj.$attrs.interpolation));
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.None')
      expect(obj.$attrs.interpolation).assertEqual('ImageInterpolation.Medium')
      console.info('testGetImageAttr4 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0150
     * @tc.name      testGetImageAttr050
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testGetImageAttr050', 0, async (done: Function) => {
      console.info('testGetImageAttr5 START');
      let strJson = getInspectorByKey('image5');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image5 objectFit" + JSON.stringify(obj.$attrs.objectFit));
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.ScaleDown')
      console.info('testGetImageAttr5 END');
      done();
    });
  })
}
