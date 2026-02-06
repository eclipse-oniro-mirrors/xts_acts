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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avscreencapture from 'libavscreencapturendk.so'
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils';
import { router } from '@kit.ArkUI';
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';

export default function AVScreenCaptureNdkTest() {
  describe('AVScreenCaptureNdkTest', () => {

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_Init0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_Init0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenCapture0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenCapture0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCapture0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StopScreenCapture0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StopScreenCapture0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenCapture0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenRecording0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenRecording0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenRecording0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StopScreenRecording0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StopScreenRecording0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StopScreenRecording0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_AcquireAudioBuffer0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_AcquireAudioBuffer0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AcquireAudioBuffer0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseAudioBuffer0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseAudioBuffer0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseAudioBuffer0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseVideoBuffer0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseVideoBuffer0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseVideoBuffer0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetMicrophoneEnabled0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetMicrophoneEnabled0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetStateCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetStateCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetStateCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetDataCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDataCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetErrorCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetErrorCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetErrorCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenCaptureWithSurface0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StartScreenCaptureWithSurface0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StartScreenCaptureWithSurface0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCanvasRotation0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCanvasRotation0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCanvasRotation0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseContentFilter0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseContentFilter0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseContentFilter0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ContentFilter_AddAudioContent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ContentFilter_AddAudioContent0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_AddAudioContent0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ExcludeContent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ExcludeContent0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ExcludeContent0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ContentFilter_AddWindowContent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ContentFilter_AddWindowContent0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ContentFilter_AddWindowContent0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ResizeCanvas0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ResizeCanvas0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ResizeCanvas0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SkipPrivacyMode0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SkipPrivacyMode0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetMaxVideoFrameRate0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetMaxVideoFrameRate0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ShowCursor0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ShowCursor0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetDisplayCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetDisplayCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetDisplayCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_ReleaseCaptureStrategy0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_ReleaseCaptureStrategy0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureStrategy0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureStrategy0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureStrategy0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForKeepCaptureDuringCall0100 catch err: " +
            err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureContentChangedCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0100 catch err: " +
            err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureContentChangedCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureContentChangedCallback0101 catch err: " +
            err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_SetCaptureArea0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_SetCaptureArea0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForPrivacyMaskMode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForPrivacyMaskMode0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPrivacyMaskMode0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForCanvasFollowRotation0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForCanvasFollowRotation0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForCanvasFollowRotation0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_GetCaptureTypeSelected0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_GetCaptureTypeSelected0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetCaptureTypeSelected0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_GetDisplayIdSelected0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_GetDisplayIdSelected0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_GetDisplayIdSelected0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForBFramesEncoding0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForBFramesEncoding0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForPickerPopUp0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForPickerPopUp0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100 start====");
          let result: number = avscreencapture.OH_AVScreenCapture_StrategyForFillMode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCapture_StrategyForFillMode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_CaptureMode0100
     * @tc.name       : SUB_MULTIMEIDA_OH_CaptureMode0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_CaptureMode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_CaptureMode0100 start====");
          let result: number = avscreencapture.OH_CaptureMode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_CaptureMode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_CaptureMode0101
     * @tc.name       : SUB_MULTIMEIDA_OH_CaptureMode0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_CaptureMode0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_CaptureMode0101 start====");
          let result: number = avscreencapture.OH_CaptureMode0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_CaptureMode0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_CaptureMode0102
     * @tc.name       : SUB_MULTIMEIDA_OH_CaptureMode0102
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_CaptureMode0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_CaptureMode0102 start====");
          let result: number = avscreencapture.OH_CaptureMode0102();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_CaptureMode0102 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AudioCodecFormat0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AudioCodecFormat0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AudioCodecFormat0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AudioCodecFormat0100 start====");
          let result: number = avscreencapture.OH_AudioCodecFormat0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AudioCodecFormat0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AudioCodecFormat0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AudioCodecFormat0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AudioCodecFormat0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AudioCodecFormat0101 start====");
          let result: number = avscreencapture.OH_AudioCodecFormat0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AudioCodecFormat0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoCodecFormat0100
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoCodecFormat0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoCodecFormat0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0100 start====");
          let result: number = avscreencapture.OH_VideoCodecFormat0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoCodecFormat0101
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoCodecFormat0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoCodecFormat0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0101 start====");
          let result: number = avscreencapture.OH_VideoCodecFormat0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoCodecFormat0102
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoCodecFormat0102
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoCodecFormat0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0102 start====");
          let result: number = avscreencapture.OH_VideoCodecFormat0102();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0102 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoCodecFormat0103
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoCodecFormat0103
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoCodecFormat0103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0103 start====");
          let result: number = avscreencapture.OH_VideoCodecFormat0103();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0103 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoCodecFormat0104
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoCodecFormat0104
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoCodecFormat0104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0104 start====");
          let result: number = avscreencapture.OH_VideoCodecFormat0104();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0104 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoCodecFormat0105
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoCodecFormat0105
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoCodecFormat0105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0105 start====");
          let result: number = avscreencapture.OH_VideoCodecFormat0105();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoCodecFormat0105 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_DataType0100
     * @tc.name       : SUB_MULTIMEIDA_OH_DataType0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_DataType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_DataType0100 start====");
          let result: number = avscreencapture.OH_DataType0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_DataType0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_DataType0101
     * @tc.name       : SUB_MULTIMEIDA_OH_DataType0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_DataType0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_DataType0101 start====");
          let result: number = avscreencapture.OH_DataType0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_DataType0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_ContainerFormatType0100
     * @tc.name       : SUB_MULTIMEIDA_OH_ContainerFormatType0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_ContainerFormatType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_ContainerFormatType0100 start====");
          let result: number = avscreencapture.OH_ContainerFormatType0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_ContainerFormatType0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_RecorderInfo0100
     * @tc.name       : SUB_MULTIMEIDA_OH_RecorderInfo0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_RecorderInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_RecorderInfo0100 start====");
          let result: number = avscreencapture.OH_RecorderInfo0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_RecorderInfo0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AudioCaptureSourceType0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AudioCaptureSourceType0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('OH_AudioCaptureSourceType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>OH_AudioCaptureSourceType0100 start====");
          let result: number = avscreencapture.OH_AudioCaptureSourceType0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>OH_AudioCaptureSourceType0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AudioCaptureSourceType0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AudioCaptureSourceType0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AudioCaptureSourceType0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AudioCaptureSourceType0101 start====");
          let result: number = avscreencapture.OH_AudioCaptureSourceType0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AudioCaptureSourceType0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0100 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0101 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0102
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0102
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0102 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0102();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0102 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0103
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0103
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0103',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0103 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0103();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0103 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0104
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0104
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0104',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0104 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0104();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0104 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0105
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0105
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0105',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0105 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0105();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0105 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0106
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0106
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0106',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0106 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0106();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0106 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0107
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0107
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0107',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0107 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0107();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0107 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0108
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0108
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0108',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0108 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0108();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0108 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0109
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0109
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0109',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0109 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0109();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0109 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0110
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0110
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0110',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0110 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureStateCode0110();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureStateCode0110 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0100 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureBufferType0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0101 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureBufferType0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureBufferType0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureFilterableAudioContent0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureFilterableAudioContent0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureFilterableAudioContent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureFilterableAudioContent0100 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureFilterableAudioContent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureFilterableAudioContent0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0100 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureContentChangedEvent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0101
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0101 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureContentChangedEvent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0102
     * @tc.name       : SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0102
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0102 start====");
          let result: number = avscreencapture.OH_AVScreenCaptureContentChangedEvent0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVScreenCaptureContentChangedEvent0102 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVSCREEN_CAPTURE_ErrCode0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVSCREEN_CAPTURE_ErrCode0100
     * @tc.desc       : test OH_AVScreenCapture
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVSCREEN_CAPTURE_ErrCode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVSCREEN_CAPTURE_ErrCode0100 start====");
          let result: number = avscreencapture.OH_AVSCREEN_CAPTURE_ErrCode0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVSCREEN_CAPTURE_ErrCode0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })


  })
}
