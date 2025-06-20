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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function screenCapture() {

  describe('ScreenCapture', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
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
    * @tc.level      : Level 0
    */
    it('testScreenCaptureConfigGetOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
    it('testScreenCaptureConfigGrant001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
    it('testScreenCaptureConfigDeny001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitScreenCaptureConfigDeny001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScreenCaptureConfigDeny001", true, 4201, done);
      sendEventByKey('ScreenCaptureConfig', 10, '');
    })
  })
}
