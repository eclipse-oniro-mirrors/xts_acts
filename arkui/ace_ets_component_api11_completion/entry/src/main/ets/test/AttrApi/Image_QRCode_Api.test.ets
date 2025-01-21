/**
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
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from '../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';

export default function Image_QRCode_Api() {
  describe('Image_QRCode_Api', function () {
    beforeEach(async function (done) {
      console.info("Image_QRCode_Api beforeEach start");
      let options = {
        uri: 'MainAbility/pages/AttrApi/Image_QRCode_Api',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Image_QRCode_Api state success " + JSON.stringify(pages));
        if (!("Image_QRCode_Api" == pages.name)) {
          console.info("get Image_QRCode_Api state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push Image_QRCode_Api page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Image_QRCode_Api page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("Image_QRCode_Api after each called");
    });

    /**
     * @tc.number      Image_QRCode_Api_001
     * @tc.name        Image_QRCode_Api_001
     * @tc.desc        QRCode test
     * @tc.level       Level 2
     */
    it('Image_QRCode_Api_001', 0, async function (done) {
      console.info('[Image_QRCode_Api_001] START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('Image_QRCode_Api_QRCode1');
      let obj = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[Image_QRCode_Api_001] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.opacity).assertEqual(0.5);

      console.info('[Image_QRCode_Api_001] END');
      done();
    });

    /**
     * @tc.number      Image_QRCode_Api_002
     * @tc.name        Image_QRCode_Api_002
     * @tc.desc        Image test
     * @tc.level       Level 2
     */
    it('Image_QRCode_Api_002', 0, async function (done) {
      console.info('[Image_QRCode_Api_002] START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('Image_QRCode_Api_Image');
      let obj = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[Image_QRCode_Api_002] obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.enableAnalyzer).assertEqual('true');

      console.info('[Image_QRCode_Api_002] END');
      done();
    });



  })
}


