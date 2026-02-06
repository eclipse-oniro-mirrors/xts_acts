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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'


export default function ImageApi() {
  describe('ImageApi', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ImageApi state success " + JSON.stringify(pages));
        if (!("ImageApi" == pages.name)) {
          console.info("get ImageApi state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ImageApi page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ImageApi page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ImageApi after each called");
    });

    /**
     * @tc.number ImageApi_001
     * @tc.name ImageApi_001
     * @tc.desc Image test
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('ImageApi_001', Level.LEVEL2, async (done: Function) => {
      console.info('[ImageApi_001] START');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('ImageApi_Image');
      await CommonFunc.sleep(1000);
      console.info("[ImageApi_001] obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('Image');
      console.info('[ImageApi_001] END');
      done();
    });
  })
}


