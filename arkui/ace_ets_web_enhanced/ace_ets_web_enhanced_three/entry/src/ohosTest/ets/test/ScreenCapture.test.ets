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

export default function screenCapture() {

  describe('ScreenCapture', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ScreenCapture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScreenCapture state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get ScreenCapture state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push ScreenCapture page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScreenCapture page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_SCREENCAPTURECONFIGGETORIGIN_0100
    * @tc.name       : testScreenCaptureConfigGetOrigin001
    * @tc.desc       : test ScreenCaptureConfigGetOrigin
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScreenCaptureConfigGetOrigin001', 0, async (done: Function) => {
      Utils.emitEvent("emitScreenCaptureConfigGetOrigin001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScreenCaptureConfigGetOrigin001", true, 4202, done);
      sendEventByKey('ScreenCaptureConfig', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SCREENCAPTURECONFIGGRANT_0100
    * @tc.name       : testScreenCaptureConfigGrant001
    * @tc.desc       : test ScreenCaptureConfigGrant
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScreenCaptureConfigGrant001', 0, async (done: Function) => {
      Utils.emitEvent("emitScreenCaptureConfigGrant001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScreenCaptureConfigGrant001", true, 4203, done);
      sendEventByKey('ScreenCaptureConfig', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_SCREENCAPTURECONFIGDENY_0100
    * @tc.name       : testScreenCaptureConfigDeny001
    * @tc.desc       : test ScreenCaptureConfigDeny
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testScreenCaptureConfigDeny001', 0, async (done: Function) => {
      Utils.emitEvent("emitScreenCaptureConfigDeny001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScreenCaptureConfigDeny001", true, 4201, done);
      sendEventByKey('ScreenCaptureConfig', 10, '');
    })
  })
}
