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

export default function webControllerZoom() {

  describe('WebControllerZoom', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebControllerZoom',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebControllerZoom state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get WebControllerZoom state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebControllerZoom page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebControllerZoom page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTROLLERZOOM_0100
    * @tc.name       : testWebControllerZoom001
    * @tc.desc       : test WebControllerZoom
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebControllerZoom001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebControllerZoom001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebControllerZoom001", true, 7705, done);
      sendEventByKey('WebControllerZoom', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTROLLERZOOMMAX_0100
    * @tc.name       : testWebControllerZoomMax001
    * @tc.desc       : test WebControllerZoomMax
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebControllerZoomMax001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebControllerZoomMax001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebControllerZoomMax001", true, 7801, done);
      sendEventByKey('WebControllerZoom', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTROLLERZOOMMIN_0100
    * @tc.name       : testWebControllerZoomMin001
    * @tc.desc       : test WebControllerZoomMin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebControllerZoomMin001', 0, async (done: Function) => {
      Utils.emitEvent("emitWebControllerZoomMin001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebControllerZoomMin001", true, 7802, done);
      sendEventByKey('WebControllerZoom', 10, '');
    })
  })
}
