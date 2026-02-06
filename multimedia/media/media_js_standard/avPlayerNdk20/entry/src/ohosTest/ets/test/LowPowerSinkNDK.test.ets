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
import lowpoweraudiosinkndk from 'liblowpoweraudiosinkndk.so'
import { fileIo as fs } from '@kit.CoreFileKit';

export default function LowPowerSinkNdkTest() {
  describe('LowPowerSinkNdkTest', () => {

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Configure0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Configure0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Configure0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetParameter0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetParameter0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetParameter0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0102
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0102
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Prepare0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Prepare0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Prepare0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Prepare0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Start0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Pause0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Pause0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Resume0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Flush0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Stop0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Reset0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Reset0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Destroy0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetVolume0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetVolume0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetPlaybackSpeed0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPlaybackSpeed0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_ReturnSamples0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_ReturnSamples0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_RegisterCallback0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_RegisterCallback0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_Destroy0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_Destroy0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Destroy0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetPositionUpdateListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetPositionUpdateListener0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetDataNeededListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetDataNeededListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDataNeededListener0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetErrorListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetErrorListener0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetInterruptListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetInterruptListener0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetDeviceChangeListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetDeviceChangeListener0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_SetEosListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetEosListener0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure0101
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure0101
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Configure0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Configure0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetParameter0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetVideoSurface0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Prepare0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartDecoder0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_RenderFirstFrame0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartRenderer0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Pause0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Resume0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Flush0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Stop0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Reset0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Destroy0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetSyncAudioSink0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetTargetStartFrame0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetTargetStartFrame0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetPlaybackSpeed0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_ReturnSamples0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_ReturnSamples0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_RegisterCallback0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RegisterCallback0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_Destroy0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetDataNeededListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetDataNeededListener0100 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetErrorListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetErrorListener0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetRenderStartListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetRenderStartListener0100 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetStreamChangedListener0100 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetFirstFrameDecodedListener0100 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_SetEosListener0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_SetEosListener0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })
    /**
     * @tc.name   SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer0100
     * @tc.number SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_AVSamplesBuffer_AppendOneBuffer0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_AVSamplesBuffer_AppendOneBuffer0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_SetLoudnessGain0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_SetLoudnessGain0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSinkCallback_Create0100();
            expect(1).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSinkCallback_Create0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_GetLatestPts0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_GetLatestPts0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAVSink_GetCapability0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAVSink_GetCapability0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_CreateByMime0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_CreateByMime0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_Create0100();
            expect(1).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Create0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.name   SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime0100
     * @tc.number SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime0100
     * @tc.desc   test OH_LowPowerAudioSink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime0100 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_CreateByMime0100();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_CreateByMime0100 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })
  })
}
