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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewControllerZoom() {

  describe('WebViewControllerZoom', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerZoom',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerZoom state success " + JSON.stringify(pages));
        if (!("WebViewControllerZoom" == pages.name)) {
          console.info("get WebViewControllerZoom state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push WebViewControllerZoom page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerZoom page error: " + err);
      }
      await waitForComponent("WebViewControllerZoom");
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
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
    it('testWebZoom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebZoom001", 153150)
      Utils.registerEvent("testWebZoom001", true, 153160, done);
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
    it('testWebZoomMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebZoomMax001", 153150)
      Utils.registerEvent("testWebZoomMax001", true, 153170, done);
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
    it('testWebZoomMin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebZoomMin001", 153150)
      Utils.registerEvent("testWebZoomMin001", true, 153180, done);
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
    it('testZoomInMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitZoomInMax001", 153150)
      Utils.registerEvent("testZoomInMax001", true, 153190, done);
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
    it('testZoomOut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitZoomOut001", 153150)
      Utils.registerEvent("testZoomOut001", true, 153200, done);
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
    it('testZoomOutMin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitZoomOutMin001", 153150)
      Utils.registerEvent("testZoomOutMin001", true, 153210, done);
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
    it('testZoomIn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitZoomIn001", 153150)
      Utils.registerEvent("testZoomIn001", true, 153220, done);
      sendEventByKey('WebViewControllerZoom', 10, '');
    })
  })
}
