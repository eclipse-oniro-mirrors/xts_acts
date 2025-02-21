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

export default function webViewControllerZoom() {

  describe('WebViewControllerZoom', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerZoom',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerZoom state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebViewControllerZoom state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerZoom page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerZoom page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBZOOM_0100
    * @tc.name       : testWebZoom001
    * @tc.desc       : test WebViewControllerZoom
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebZoom001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebZoom001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebZoom001", true, 7701, done);
      sendEventByKey('WebViewControllerZoom', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBZOOMMAX_0100
    * @tc.name       : testWebZoomMax001
    * @tc.desc       : test WebZoomMax
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebZoomMax001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebZoomMax001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebZoomMax001", true, 7702, done);
      sendEventByKey('WebViewControllerZoom', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBZOOMMIN_0100
    * @tc.name       : testWebZoomMin001
    * @tc.desc       : test WebZoomMin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebZoomMin001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebZoomMin001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebZoomMin001", true, 7708, done);
      sendEventByKey('WebViewControllerZoom', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ZOOMINMAX_0100
    * @tc.name       : testZoomInMax001
    * @tc.desc       : test ZoomInMax
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testZoomInMax001', 0, async (done: Function) => {
      Utils.emitEvent("emitZoomInMax001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomInMax001", true, 7706, done);
      sendEventByKey('WebViewControllerZoom', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ZOOMOUT_0100
    * @tc.name       : testZoomOut001
    * @tc.desc       : test ZoomOut
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testZoomOut001', 0, async (done: Function) => {
      Utils.emitEvent("emitZoomOut001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomOut001", true, 7704, done);
      sendEventByKey('WebViewControllerZoom', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_ZOOMOUTMIN_0100
    * @tc.name       : testZoomOutMin001
    * @tc.desc       : test ZoomOut
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testZoomOutMin001', 0, async (done: Function) => {
      Utils.emitEvent("emitZoomOutMin001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomOutMin001", true, 7707, done);
      sendEventByKey('WebViewControllerZoom', 10, '');
    })

    /*
        * @tc.number     : SUB_WEB_ZOOMIN_0100
        * @tc.name       : testZoomIn001
        * @tc.desc       : test ZoomIn
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testZoomIn001', 0, async (done: Function) => {
      Utils.emitEvent("emitZoomIn001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testZoomIn001", true, 7703, done);
      sendEventByKey('WebViewControllerZoom', 10, '');
    })
  })
}
