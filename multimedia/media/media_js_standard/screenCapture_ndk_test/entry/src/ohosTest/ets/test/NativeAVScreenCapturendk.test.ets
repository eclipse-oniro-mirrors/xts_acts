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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import display from '@ohos.display'
import Utils from './Utils'
import {Component, Driver, ON } from '@ohos.UiTest';
import abilityAccessCtrl,{ Context, PermissionRequestResult, Permissions} from '@ohos.abilityAccessCtrl';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import deviceinfo from '@ohos.deviceInfo'

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
    let currentDeviceIsPc: boolean = false;
    beforeAll(async (done: Function) => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      let context2: UIAbility = await delegator.getCurrentTopAbility();
      reqPermissionsFromUser(permissions, context2.context, done);
      currentDeviceIsPc = deviceinfo.deviceType === '2in1';
      console.info('the value of the deviceType is: ' + deviceinfo.deviceType);
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
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100
     * @tc.desc   OH_AVScreenCapture_StartScreenCapture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0100', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureTest();
      console.info(Tag + "normalAVScreenCaptureTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureTestStop();
      console.info(Tag + "normalAVScreenCaptureTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200
     * @tc.desc   OH_AVScreenCapture_StartScreenRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0200', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenRecordTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenRecordTest();
      console.info(Tag + "normalAVScreenRecordTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenRecordTestStop();
      console.info(Tag + "normalAVScreenRecordTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0210
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0210
     * @tc.desc   OH_AVScreenCapture_StartScreenRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0210', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenRecordTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenRecordTest();
      console.info(Tag + "normalAVScreenRecordTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      expect(isShowDialog).assertEqual(0);

      await Utils.sleep(2000);
      result = myScreenCaptureNdk.normalAVScreenRecordingTest();
      expect(result).assertEqual(0);
      isShowDialog = await Utils.btnTextScreenCapture();
      await Utils.sleep(2000);
      let resultStop: number = myScreenCaptureNdk.normalAVScreenRecordTestStoping();
      expect(resultStop).assertEqual(0);

      resultStop = myScreenCaptureNdk.normalAVScreenRecordTestStop();
      console.info(Tag + "normalAVScreenRecordTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0220
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0220
     * @tc.desc   OH_AVScreenCapture_StartScreenRecording
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0220', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenRecordTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenRecordTest();
      console.info(Tag + "normalAVScreenRecordTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      expect(isShowDialog).assertEqual(0);

      await Utils.sleep(2000);
      result = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTest();
      expect(result).assertEqual(0);
      isShowDialog = await Utils.btnTextScreenCapture();
      expect(isShowDialog).assertEqual(0);
      await Utils.sleep(2000);
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTestStop();
      expect(resultStop).assertEqual(0);

      resultStop = myScreenCaptureNdk.normalAVScreenRecordTestStop();
      console.info(Tag + "normalAVScreenRecordTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0110
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0110
     * @tc.desc   OH_AVScreenCapture_StartScreenCaptureOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0110', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTest();
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------res:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      expect(isShowDialog).assertEqual(0);

      await Utils.sleep(2000);
      result = myScreenCaptureNdk.normalAVScreenRecordingTest();
      expect(result).assertEqual(0);
      isShowDialog = await Utils.btnTextScreenCapture();
      await Utils.sleep(2000);
      let resultStop: number = myScreenCaptureNdk.normalAVScreenRecordTestStoping();
      expect(resultStop).assertEqual(0);

      resultStop = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTestStop();
      console.info(Tag + "normalAVScreenCaptureShowCursorTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0120
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0120
     * @tc.desc   OH_AVScreenCapture_StartScreenCaptureOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0120', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTest();
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------res:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      expect(isShowDialog).assertEqual(0);

      await Utils.sleep(2000);
      result = myScreenCaptureNdk.normalAVScreenCaptureSurfaceTest();
      expect(result).assertEqual(0);
      isShowDialog = await Utils.btnTextScreenCapture();
      expect(isShowDialog).assertEqual(0);
      await Utils.sleep(2000);
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureSurfaceTestStop();
      expect(resultStop).assertEqual(0);

      resultStop = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTestStop();
      console.info(Tag + "normalAVScreenCaptureShowCursorTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0300
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0300
     * @tc.desc   OH_AVScreenCapture_StartScreenCaptureWithSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0300', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureSurfaceTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureSurfaceTest();
      console.info(Tag + "normalAVScreenCaptureSurfaceTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureSurfaceTestStop();
      console.info(Tag + "normalAVScreenCaptureSurfaceTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0400
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0400
     * @tc.desc   OH_AVScreenCapture_StartScreenCaptureOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONFIGURE_0400', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "originAVScreenCaptureTest-------------before click:");
      let result: number = myScreenCaptureNdk.originAVScreenCaptureTest();
      console.info(Tag + "originAVScreenCaptureTest-------------res:" + result);
      expect(result).assertEqual(0);
      await Utils.btnTextScreenCapture();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0100
     * @tc.desc   OH_AVScreenCapture_StartScreenCapture_SetDisplayCallback_Success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0100', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureDisplayCallbackSuccess-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureDisplayCallbackSuccess();
      console.info(Tag + "normalAVScreenCaptureDisplayCallbackSuccess-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureTestStop();
      console.info(Tag + "normalAVScreenCaptureDisplayCallbackSuccess-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0200
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0200
     * @tc.desc   OH_AVScreenCapture_StartScreenCapture_SetDisplayCallback_Fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetDisplayCallback_0200', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureSetDisplayCallbackFalse-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureSetDisplayCallbackFail();
      console.info(Tag + "normalAVScreenCaptureSetDisplayCallbackFail-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureTestStop();
      console.info(Tag + "normalAVScreenCaptureDisplayCallbackSuccess-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0100
     * @tc.desc   OH_AVScreenCapture_StartScreenCaptureOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0100', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTest();
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTestStop();
      console.info(Tag + "normalAVScreenCaptureShowCursorTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0200
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0200
     * @tc.desc   OH_AVScreenCapture_StartScreenCaptureOrigin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0200', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTest();
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorBeforeTestStop();
      console.info(Tag + "normalAVScreenCaptureShowCursorBeforeTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0300
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0300
     * @tc.desc   OH_AVScreenCapture_StartScreenCaptureOrigin-With-InvalidVal-Null-False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0300', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureShowCursorWithParaNullFalse-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorWithParaNullFalse();
      console.info(Tag + "normalAVScreenCaptureShowCursorWithParaNullFalse-------------res:" + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0400
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0400
     * @tc.desc   OH_AVScreenCapture_StartScreenCaptureOrigin-With-InvalidVal-Null-True
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SHOW_CURSOR_0400', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureShowCursorWithParaNullTrue-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorWithParaNullTrue();
      console.info(Tag + "normalAVScreenCaptureShowCursorWithParaNullTrue-------------res:" + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetSelectionCallback_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetSelectionCallback_0100
     * @tc.desc   OH_AVScreenCapture_StartScreenCapture_SetSelectionCallback_Success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SetSelectionCallback_0100', Level.LEVEL0, async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureSelectionCallbackSuccess-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureSelectionCallbackSuccess();
      console.info(Tag + "normalAVScreenCaptureSelectionCallbackSuccess-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureSelectionCallbackStop();
      console.info(Tag + "normalAVScreenCaptureSelectionCallbackSuccess-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_KEEP_DURING_CALL_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_KEEP_DURING_CALL_0100
     * @tc.desc   OH_AVScreenCapture_StrategyForKeepCaptureDuringCall-False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_KEEP_DURING_CALL_0100', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForKeepCaptureDuringCallFalse();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_KEEP_DURING_CALL_0200
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_KEEP_DURING_CALL_0200
     * @tc.desc   OH_AVScreenCapture_StrategyForKeepCaptureDuringCall-True
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_KEEP_DURING_CALL_0200', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForKeepCaptureDuringCallTrue();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONTENT_CHANGED_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONTENT_CHANGED_0100
     * @tc.desc   OH_AVScreenCapture_SetCaptureContentChangedCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONTENT_CHANGED_0100', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureContentChangedCallback-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureContentChangedCallback();
      console.info(Tag + "normalAVScreenCaptureContentChangedCallback-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureContentChangedTestStop();
      console.info(Tag + "normalAVScreenCaptureContentChangedTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_CAPTURE_AREA_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_CAPTURE_AREA_0100
     * @tc.desc   OH_AVScreenCapture_StartScreenCapture_SetCaptureArea_True
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_CAPTURE_AREA_0100', Level.LEVEL0, async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureSetCaptureAreaTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureSetCaptureAreaTest();
      console.info(Tag + "normalAVScreenCaptureSetCaptureAreaTest-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureSetCaptureAreaTestStop();
      console.info(Tag + "normalAVScreenCaptureSetCaptureAreaTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE_0100
     * @tc.desc   OH_AVScreenCapture_StrategyForPrivacyMaskMode 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE_0100', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeScreen-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPrivacyMaskModeScreen();
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeScreen-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop();
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop-------------resultStop:" +
        resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE_0101
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE_0101
     * @tc.desc   OH_AVScreenCapture_StrategyForPrivacyMaskMode 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE_0101', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeDisplay-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPrivacyMaskModeDisplay();
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeDisplay-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop();
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop-------------resultStop:" +
        resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE_0401
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE_0401
     * @tc.desc   OH_AVScreenCapture_StrategyForPrivacyMaskMode 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_STRATEGY_FOR_PRIVACY_MASKMODE_0401', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "multiAVScreenCaptureCreate-------------start :");
      let sdkApiVersionInfo = deviceinfo.sdkApiVersion;
      console.info(Tag + "sdkApiVersionInfo-------------res:" + sdkApiVersionInfo);
      if (sdkApiVersionInfo > 17 ) {
        let result: number = myScreenCaptureNdk.multiAVScreenCaptureCreate();
        console.info(Tag + "multiAVScreenCaptureCreate-------------res:" + result);
        expect(result).assertEqual(3);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0400
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0400
     * @tc.desc   normalAVScreenCaptureErrorTest 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0400', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAVScreenCaptureErrorTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureErrorTest();
      console.info(Tag + "normalAVScreenCaptureErrorTest-------------res:" + result);
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0500
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0500
     * @tc.desc   normalAreaTest 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0500', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalAreaTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalAreaTest();
      console.info(Tag + "normalAreaTest-------------res:" + result);
      expect(result).assertEqual(3);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0600
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0600
     * @tc.desc   normalStrategyTest 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0600', Level.LEVEL0,async (done: Function) => {
      console.info(Tag + "normalStrategyTest-------------before click:");
      let result: number = myScreenCaptureNdk.normalStrategyTest();
      console.info(Tag + "normalStrategyTest-------------res:" + result);
      expect(result).assertEqual(3);
      await Utils.btnTextScreenCapture();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0700
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0700
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_VIDEO_CONFIGURE_0700', Level.LEVEL0, async (done: Function) => {
      console.info(Tag + "normalSelectionCallback-------------before click:");
      let result: number = myScreenCaptureNdk.normalSelectionCallback();
      console.info(Tag + "normalSelectionCallback-------------result:" + result);
      expect(result).assertEqual(0);
      await Utils.btnTextScreenCapture();
      let resultStop: number = myScreenCaptureNdk.normalSelectionCallbackStop();
      console.info(Tag + "normalSelectionCallbackStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_ENABLE_B_FRAME_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_ENABLE_B_FRAME_0100
     * @tc.desc   OH_AVScreenCapture_StrategyForBFramesEncoding-False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_ENABLE_B_FRAME_0100', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForBFramesEncodingFalse();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_ENABLE_B_FRAME_0200
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_ENABLE_B_FRAME_0200
     * @tc.desc   OH_AVScreenCapture_StrategyForBFramesEncoding-True
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_ENABLE_B_FRAME_0200', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForBFramesEncodingTrue();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_PICKER_POPUP_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_PICKER_POPUP_0100
     * @tc.desc   OH_AVScreenCapture_StrategyForPickerPopUp-False
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_PICKER_POPUP_0100', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPickerPopUpFalse();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_PICKER_POPUP_0200
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_PICKER_POPUP_0200
     * @tc.desc   OH_AVScreenCapture_StrategyForPickerPopUp-True
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_PICKER_POPUP_0200', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPickerPopUpTrue();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0100
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0100', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenCaptureTest();
      console.info(Tag + "normalAVScreenCaptureTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      expect(isShowDialog).assertEqual(0);
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureTestStop();
      console.info(Tag + "normalAVScreenCaptureTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0200
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0200', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenRecordTest();
      console.info(Tag + "normalAVScreenRecordTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenRecordTestStop();
      console.info(Tag + "normalAVScreenRecordTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0300
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0300', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenRecordTest();
      console.info(Tag + "normalAVScreenRecordTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      expect(isShowDialog).assertEqual(0);

      await Utils.sleep(2000);
      result = myScreenCaptureNdk.normalAVScreenRecordingTest();
      expect(result).assertEqual(0);
      isShowDialog = await Utils.btnTextScreenCapture();
      await Utils.sleep(2000);
      let resultStop: number = myScreenCaptureNdk.normalAVScreenRecordTestStoping();
      expect(resultStop).assertEqual(0);

      resultStop = myScreenCaptureNdk.normalAVScreenRecordTestStop();
      console.info(Tag + "normalAVScreenRecordTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0400
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0400', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenRecordTest();
      console.info(Tag + "normalAVScreenRecordTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      expect(isShowDialog).assertEqual(0);

      await Utils.sleep(2000);
      result = myScreenCaptureNdk.normalAVScreenRecordingTest();
      expect(result).assertEqual(0);
      isShowDialog = await Utils.btnTextScreenCaptureCancel();
      await Utils.sleep(2000);
      let resultStop: number = myScreenCaptureNdk.normalAVScreenRecordTestStoping();
      expect(resultStop).assertEqual(0);

      resultStop = myScreenCaptureNdk.normalAVScreenRecordTestStop();
      console.info(Tag + "normalAVScreenRecordTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0500
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0500', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenRecordTest();
      console.info(Tag + "normalAVScreenRecordTest-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      expect(isShowDialog).assertEqual(0);

      await Utils.sleep(2000);
      result = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTest();
      expect(result).assertEqual(0);
      isShowDialog = await Utils.btnTextScreenCapture();
      expect(isShowDialog).assertEqual(0);
      await Utils.sleep(2000);
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTestStop();
      expect(resultStop).assertEqual(0);

      resultStop = myScreenCaptureNdk.normalAVScreenRecordTestStop();
      console.info(Tag + "normalAVScreenRecordTest-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0600
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0600', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTest();
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------res:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCapture();
      expect(isShowDialog).assertEqual(0);

      await Utils.sleep(2000);
      result = myScreenCaptureNdk.normalAVScreenRecordingTest();
      expect(result).assertEqual(0);
      isShowDialog = await Utils.btnTextScreenCaptureCancel();
      await Utils.sleep(2000);
      let resultStop: number = myScreenCaptureNdk.normalAVScreenRecordTestStoping();
      expect(resultStop).assertEqual(0);

      resultStop = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTestStop();
      console.info(Tag + "normalAVScreenCaptureShowCursorTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0700
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_PROVIDNDKINTERFACES_0700', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureDisplayCallbackSuccess();
      console.info(Tag + "normalAVScreenCaptureDisplayCallbackSuccess-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureTestStop();
      console.info(Tag + "normalAVScreenCaptureDisplayCallbackSuccess-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0100
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0100', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureSetDisplayCallbackFail();
      console.info(Tag + "normalAVScreenCaptureSetDisplayCallbackFail-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureTestStop();
      console.info(Tag + "normalAVScreenCaptureDisplayCallbackSuccess-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0200
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0200', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTest();
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTestStop();
      console.info(Tag + "normalAVScreenCaptureShowCursorTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0300
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0300', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorTest();
      console.info(Tag + "normalAVScreenCaptureShowCursorTest-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureShowCursorBeforeTestStop();
      console.info(Tag + "normalAVScreenCaptureShowCursorBeforeTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0400
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0400', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenCaptureSelectionCallbackSuccess();
      console.info(Tag + "normalAVScreenCaptureSelectionCallbackSuccess-------------result:" + result);
      expect(result).assertEqual(0);
      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureSelectionCallbackStop();
      console.info(Tag + "normalAVScreenCaptureSelectionCallbackSuccess-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0500
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0500', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenCaptureContentChangedCallback();
      console.info(Tag + "normalAVScreenCaptureContentChangedCallback-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureContentChangedTestStop();
      console.info(Tag + "normalAVScreenCaptureContentChangedTestStop-------------resultStop:" + resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0700
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_INTERFACE_SUPPORTSURFACE_0700', Level.LEVEL0, async (done: Function) => {

      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPrivacyMaskModeScreen();
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeScreen-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop();
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop-------------resultStop:" +
        resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_CANVASROTATION_0001
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_CANVASROTATION_0001
     * @tc.desc   normalSelectionCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_CANVASROTATION_0001', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPrivacyMaskModeDisplay();
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeDisplay-------------res:" + result);
      expect(result).assertEqual(0);

      let isShowDialog: number = await Utils.btnTextScreenCaptureCancel();
      let resultStop: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop();
      console.info(Tag + "normalAVScreenCaptureStrategyForPrivacyMaskModeTestStop-------------resultStop:" +
        resultStop);
      expect(resultStop).assertEqual(0);
      expect(isShowDialog).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_FILL_MODE_0001
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_FILL_MODE_0001
     * @tc.desc   OH_AVScreenCapture_StrategyForFillMode-Aspect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_FILL_MODE_0001', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForFillModeAspect();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_FILL_MODE_0002
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_FILL_MODE_0002
     * @tc.desc   OH_AVScreenCapture_StrategyForFillMode-Scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_FILL_MODE_0002', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForFillModeScale();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SET_HIGHLIGHT_0001
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SET_HIGHLIGHT_0001
     * @tc.desc   OH_AVScreenCapture_StrategyForFillMode-Scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SET_HIGHLIGHT_0001', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForCornerWrapMode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SET_HIGHLIGHT_0002
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SET_HIGHLIGHT_0002
     * @tc.desc   OH_AVScreenCapture_StrategyForFillMode-Scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SET_HIGHLIGHT_0002', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForClosedMode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_PICKER_MODE_0001
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_PICKER_MODE_0001
     * @tc.desc   OH_AVScreenCapture_SetPickerMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_PICKER_MODE_0001', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureSetPickerModeWindowOnly();
      let expectedResult: number;
      if (deviceinfo.deviceType === '2in1' || deviceinfo.deviceType === 'phone' || deviceinfo.deviceType === 'tablet') {
          expectedResult = 0;
      } else {
          expectedResult = 1;
      }
      expect(result).assertEqual(expectedResult);
      result = myScreenCaptureNdk.normalAVScreenCaptureSetPickerModeScreenOnly();
      expect(result).assertEqual(expectedResult);
      result = myScreenCaptureNdk.normalAVScreenCaptureSetPickerModeScreenAndWindow();
      expect(result).assertEqual(expectedResult);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_EXCLUDE_PICKER_WINDOWS_0001
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_EXCLUDE_PICKER_WINDOWS_0001
     * @tc.desc   OH_AVScreenCapture_ExcludePickerWindows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_EXCLUDE_PICKER_WINDOWS_0001', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureExcludePickerWindows();
      let expectedResult: number;
      if (deviceinfo.deviceType === '2in1' || deviceinfo.deviceType === 'phone' || deviceinfo.deviceType === 'tablet') {
          expectedResult = 0;
      } else {
          expectedResult = 1;
      }
      expect(result).assertEqual(expectedResult);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_Fresent_picker_0001
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_Fresent_picker_0001
     * @tc.desc   OH_AVScreenCapture_presentPicker not surport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_Fresent_picker_0001', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPresenPicker1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_PICKER_MODE_0002
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_PICKER_MODE_0002
     * @tc.desc   OH_AVScreenCapture_ExcludePickerWindows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_PICKER_MODE_0002', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalScreenAndWindow1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_EXCLUDE_PICKER_WINDOWS_0002
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_EXCLUDE_PICKER_WINDOWS_0002
     * @tc.desc   OH_AVScreenCapture_SetPickerMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_EXCLUDE_PICKER_WINDOWS_0002', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureWindows1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SET_HIGHLIGHT_0003
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SET_HIGHLIGHT_0003
     * @tc.desc   OH_AVScreenCapture_StrategyForFillMode-Scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_SET_HIGHLIGHT_0003', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForCornerWrapMode1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_PICKER_MODE_0003
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_PICKER_MODE_0003
     * @tc.desc   OH_AVScreenCapture_ExcludePickerWindows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_SET_PICKER_MODE_0003', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalScreenAndWindow2();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_Fresent_picker_0002
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_Fresent_picker_0002
     * @tc.desc   OH_AVScreenCapture_presentPicker not surport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_Fresent_picker_0002', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategyForPresenPicker2();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CREATE_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CREATE_0100
     * @tc.desc   OH_AVScreenCapture_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CREATE_0100', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONTENT_FILTER_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONTENT_FILTER_0100
     * @tc.desc   OH_AVScreenCapture_ContentFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_NORMAL_CONTENT_FILTER_0100', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureCreateContentFilter();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_ACQUIRE_VIDEO_BUFFER_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_ACQUIRE_VIDEO_BUFFER_0100
     * @tc.desc   OH_AVScreenCapture_AcquireVideoBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_ACQUIRE_VIDEO_BUFFER_0100', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureAcquireVideoBuffer1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_SCREEN_CAPTURE_STRATEGY_0100
     * @tc.number SUB_MULTIMEDIA_SCREEN_CAPTURE_STRATEGY_0100
     * @tc.desc   OH_AVScreenCapture_Strategy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_SCREEN_CAPTURE_STRATEGY_0100', Level.LEVEL0, async (done: Function) => {
      let result: number = myScreenCaptureNdk.normalAVScreenCaptureStrategy1();
      expect(result).assertEqual(0);
      done();
    });
  })
}