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
        if (!("WebControllerZoom" == pages.name)) {
          console.info("get WebControllerZoom state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push WebControllerZoom page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebControllerZoom page error: " + err);
      }
      await waitForComponent("WebControllerZoom");
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

    /**
     * @tc.name   testWebControllerZoom001
     * @tc.number SUB_WEB_WEBCONTROLLERZOOM_0100
     * @tc.desc   test WebControllerZoom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebControllerZoom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebControllerZoom001", 153040)
      Utils.registerEvent("testWebControllerZoom001", true, 153050, done);
      sendEventByKey('WebControllerZoom', 10, '');
    })

    /**
     * @tc.name   testWebControllerZoomMax001
     * @tc.number SUB_WEB_WEBCONTROLLERZOOMMAX_0100
     * @tc.desc   test WebControllerZoomMax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebControllerZoomMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebControllerZoomMax001", 153040)
      Utils.registerEvent("testWebControllerZoomMax001", true, 153060, done);
      sendEventByKey('WebControllerZoom', 10, '');
    })

    /**
     * @tc.name   testWebControllerZoomMin001
     * @tc.number SUB_WEB_WEBCONTROLLERZOOMMIN_0100
     * @tc.desc   test WebControllerZoomMin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebControllerZoomMin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebControllerZoomMin001", 153040)
      Utils.registerEvent("testWebControllerZoomMin001", true, 153070, done);
      sendEventByKey('WebControllerZoom', 10, '');
    })
  })
}
