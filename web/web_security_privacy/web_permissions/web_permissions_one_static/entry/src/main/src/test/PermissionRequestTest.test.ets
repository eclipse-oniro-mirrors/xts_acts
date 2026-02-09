/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';

import { expect, Level, Size, TestType, beforeAll, beforeEach, afterEach, describe, it } from '../../../hypium/index';
import router from '@ohos.router';
import { Utils, startAbility, stopApplication } from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import { ON, Driver } from '@ohos.UiTest'

let testAbilityContext:common.UIAbilityContext;
let bundleName: string = 'com.open.harmony.webpermissionsonetest.static';

export default function webOnPermissionRequest() {

  describe('WebOnPermissionRequestTest', () => {
    beforeAll(async (): Promise<void> => {
      await Utils.emitEvent('pages/PermissionRequestTest', 10)
      await Utils.msSleep(1000)
      console.info('Finish loadAndSetUpUiTest')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("web beforeEach start");
    })

    afterEach(async () => {
      console.info("WebOnPermissionRequestTest afterEach start");
      await Utils.msSleep(1000);
      console.info("WebOnPermissionRequestTest afterEach end");
    })

    /**
     * @tc.name   testPermissionRequestDenyGroupStatic001
     * @tc.number SUB_WEB_PERMISSIONREQUESTDENY_GROUP_0100
     * @tc.desc   test permissionRequest deny
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPermissionRequestDenyGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(1000);
      console.info('Finish startAbility')

      let denyBtn = await driver.findComponent(ON.id('Deny'));
      expect(denyBtn != null).assertTrue();
      if (denyBtn != null) {
        await denyBtn.click();
        console.info('Finish denyBtn.click')
        await Utils.msSleep(1000);
      }

      let openCameraBtn = await driver.findComponent(ON.text('开启摄像头'));
      if (openCameraBtn != null) {
        await openCameraBtn.click();
        console.info('Finish openCameraBtn.click')
        await Utils.msSleep(1000);
      } else {
        openCameraBtn = await driver.findComponent(ON.text('开启摄像头'));
        if (openCameraBtn != null) {
          await openCameraBtn.click();
          console.info('Finish openCameraBtn.click')
          await Utils.msSleep(1000);
        }
      }

      let denyText = await driver.findComponent(ON.id('deny_result'));

      if (denyText != null) {
        let text = await denyText.getText();
        expect(text == 'deny').assertTrue();
      }

      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testPermissionRequestGrantGroupStatic001
     * @tc.number SUB_WEB_PERMISSIONREQUESTGRANT_GROUP_0100
     * @tc.desc   test permissionRequest grant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestGrantGroupStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(1000);
      console.info('Finish startAbility')

      let grantBtn = await driver.findComponent(ON.id('Grant'));
      expect(grantBtn != null).assertTrue();
      if (grantBtn != null) {
        await grantBtn.click();
        console.info('Finish grantBtn.click')
        await Utils.msSleep(1000);
      }

      let openCameraBtn = await driver.findComponent(ON.text('开启摄像头'));
      if (openCameraBtn != null) {
        await openCameraBtn.click();
        console.info('Finish openCameraBtn.click')
        await Utils.msSleep(1000);
      } else {
        openCameraBtn = await driver.findComponent(ON.text('开启摄像头'));
        if (openCameraBtn != null) {
          await openCameraBtn.click();
          console.info('Finish openCameraBtn.click')
          await Utils.msSleep(1000);
        }
      }

      let grantText = await driver.findComponent(ON.id('grant_result'));

      if (grantText != null) {
        let text = await grantText.getText();
        expect(text == 'grant').assertTrue();
      }

      await Utils.msSleep(2000);
      done();
    })

  })
}
