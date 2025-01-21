/**
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
import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'



export default function ImageApi() {
  describe('ImageApi', function () {
    beforeEach(async function (done) {
      console.info("ImageApi beforeEach start");
      let options = {
        url: 'MainAbility/pages/ImageApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageApi state success " + JSON.stringify(pages));
        if (!("ImageApi" == pages.name)) {
          console.info("get ImageApi state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ImageApi page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageApi page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("ImageApi after each called");
    });

    /**
     * @tc.number      ImageApi_001
     * @tc.name        ImageApi_001
     * @tc.desc        Image test
     * @tc.level       Level 2
     * @tc.type
     * @tc.size
     */
    it('ImageApi_001', 0, async function (done) {
      console.info('[ImageApi_001] START');
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('ImageApi_Image');
      let obj = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info("[ImageApi_001] obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('Image');

      console.info('[ImageApi_001] END');
      done();

    });
  })
}


