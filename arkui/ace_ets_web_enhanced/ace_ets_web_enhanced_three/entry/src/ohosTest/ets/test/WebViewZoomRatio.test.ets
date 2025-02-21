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
import { beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webViewZoomRatio() {

  describe('WebViewZoomRatio', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewZoomRatio',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewZoomRatio state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebViewZoomRatio state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewZoomRatio page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewZoomRatio page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ZOOMRATIO_0100
    * @tc.name       : textZoomRatio001
    * @tc.desc       : test ZoomRatio
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('textZoomRatio001', 0, async (done: Function) => {
      Utils.emitEvent("emitZoomRatio", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("textZoomRatio001", true, 3701, done);
      sendEventByKey('WebViewZoomRatioTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ZOOMATIO_0100
    * @tc.name       : testZoomAtio001
    * @tc.desc       : test ZoomAtio
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testZoomAtio001', 0, async (done: Function) => {
      Utils.emitEvent("emitZoomAtio", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomAtio001", true, 3702, done);
      sendEventByKey('WebViewZoomRatioTestButton', 10, '');
    })
  })
}
