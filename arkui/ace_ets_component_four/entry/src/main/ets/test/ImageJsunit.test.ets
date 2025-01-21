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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import Utils from './Utils';

export default function imageJsunit() {
  describe('imageText', () => {
    beforeEach(async (done: Function) => {
      console.info("image beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get image state pages:" + JSON.stringify(pages));
        if (!("image" == pages.name)) {
          console.info("get image state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push image page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push image page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("image after each called");
    });

    it('imageTest_0100', 0, async (done: Function) => {
      console.info('imageTest_0100 START');
      await Utils.sleep(4000);
      let strJson: string = getInspectorByKey('text');
      console.info("imageTest_0100 component strJson:" + strJson);
      console.info("imageTest_0100 JSON.parse(strJson).$attrs.content is: " + JSON.parse(strJson).$attrs.content);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('string_hello');
      expect(JSON.parse(strJson).$attrs.fontSize).assertEqual('9.00fp');
      console.info('imageTest_0100 END');
      done();
    });

    it('imageTest_0200', 0, async (done: Function) => {
      console.info('imageTest_0200 START');
      await Utils.sleep(3000);
      let strJson: string = getInspectorByKey('image');
      console.info("imageTest_0200 component strJson:" + strJson);
      console.info("imageTest_0200 JSON.parse(strJson).$attrs.src is: " + JSON.parse(strJson).$attrs.src);
      expect(JSON.parse(strJson).$attrs.src).assertEqual('resource://rawfile/test.png');
      console.info('imageTest_0200 END');
      done();
    });
  })
}