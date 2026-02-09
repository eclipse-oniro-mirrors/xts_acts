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
import { Driver } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 152500;
let driver = Driver.create();
let emitKey = ""
let tcName = ""
export default function screenCapture() {

  describe('ScreenCapture', () => {
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
     * @tc.name   testScreenCaptureConfigGetOrigin001
     * @tc.number SUB_WEB_SCREENCAPTURECONFIGGETORIGIN_0100
     * @tc.desc   test ScreenCaptureConfigGetOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScreenCaptureConfigGetOrigin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScreenCaptureConfigGetOrigin001';
      tcName = 'testScreenCaptureConfigGetOrigin001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 152510, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScreenCaptureConfig", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScreenCaptureConfigGrant001
     * @tc.number SUB_WEB_SCREENCAPTURECONFIGGRANT_0100
     * @tc.desc   test ScreenCaptureConfigGrant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCaptureConfigGrant001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitScreenCaptureConfigGrant001';
      tcName = 'testScreenCaptureConfigGrant001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 152520, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScreenCaptureConfig", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScreenCaptureConfigDeny001
     * @tc.number SUB_WEB_SCREENCAPTURECONFIGDENY_0100
     * @tc.desc   test ScreenCaptureConfigDeny
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCaptureConfigDeny001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitScreenCaptureConfigDeny001';
      tcName = 'testScreenCaptureConfigDeny001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 152530, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScreenCaptureConfig", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
