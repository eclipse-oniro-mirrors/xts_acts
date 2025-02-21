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

import myScreenCaptureNdk from 'libnativeAVScreenCapturendk.so'
import hilog from '@ohos.hilog';
import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import display from '@ohos.display'
import Utils from './Utils'
import {Component, Driver, ON } from '@ohos.UiTest';
import abilityAccessCtrl,{ Context, PermissionRequestResult, Permissions} from '@ohos.abilityAccessCtrl';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const Tag = 'screen_capture_ndk_test:'

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const permissions: Array<Permissions> = ['ohos.permission.MICROPHONE',
  'ohos.permission.READ_MEDIA',
  'ohos.permission.WRITE_MEDIA'];

function reqPermissionsFromUser(permissions: Array<Permissions>, context:common.UIAbilityContext, done: Function) {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
  atManager.requestPermissionsFromUser(context, permissions).then((data) => {
    let grantStatus: Array<number> = data.authResults;
    let length: number = grantStatus.length;
    for (let i = 0; i < length; i++) {
      if (grantStatus[i] === 0) {
        // 用户授权，可以继续访问目标操作
      } else {
        // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
        return;
      }
    }
    // 授权成功
  }).catch((err: BusinessError) => {
    console.error(`Failed to request permissions from user. Code is ${err.code}, message is ${err.message}`);
  }).finally(() => {
    done()
  })
}

export default function nativeAVScreenCaptureNdkTest() {
  describe('NativeAVScreenCaptureNdkTest', () => {
    beforeAll(async (done: Function) => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      let context2: UIAbility = await delegator.getCurrentTopAbility();
      reqPermissionsFromUser(permissions, context2.context, done);
      console.info('beforeAll case');
	  Utils.allowScreenCapture();
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });


    /**
     * @tc.number       SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100
     * @tc.name         OH_AVScreenCapture_StartScreenCapture
     * @tc.desc         OH_AVScreenCapture_StartScreenCapture
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100', 0, async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureTest();
      console.info(Tag + "normalAVScreenCaptureTest-------------result:" + result);
      expect(result).assertEqual(0);
      await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureTestStop();
      console.info(Tag + "normalAVScreenCaptureTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });

    /**
     * @tc.number       SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200
     * @tc.name         OH_AVScreenCapture_StartScreenRecording
     * @tc.desc         OH_AVScreenCapture_StartScreenRecording
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200', 0, async (done: Function) => {
      console.info(Tag + "normalAVScreenRecordTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenRecordTest();
      console.info(Tag + "normalAVScreenRecordTest-------------result:" + result);
      expect(result).assertEqual(0);
      await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenRecordTestStop();
      console.info(Tag + "normalAVScreenRecordTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });

    /**
     * @tc.number       SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0300
     * @tc.name         OH_AVScreenCapture_StartScreenCaptureWithSurface
     * @tc.desc         OH_AVScreenCapture_StartScreenCaptureWithSurface
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0300', 0, async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureSurfaceTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureSurfaceTest();
      console.info(Tag + "normalAVScreenCaptureSurfaceTest-------------result:" + result);
      expect(result).assertEqual(0);
      await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureSurfaceTestStop();
      console.info(Tag + "normalAVScreenCaptureSurfaceTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });

    /**
     * @tc.number       SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0400
     * @tc.name         OH_AVScreenCapture_StartScreenCaptureOrigin
     * @tc.desc         OH_AVScreenCapture_StartScreenCaptureOrigin
     * @tc.size         MediumTest
     * @tc.type         Function
     * @tc.level        Level 1
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0400', 0, async (done: Function) => {
      console.info(Tag + "originAVScreenCaptureTest-------------before click:");
      let result: number = myScreenCaptureNdk.originAVScreenCaptureTest();
      console.info(Tag + "originAVScreenCaptureTest-------------res:" + result);
      expect(result).assertEqual(0);
      done();
    });
  })
}