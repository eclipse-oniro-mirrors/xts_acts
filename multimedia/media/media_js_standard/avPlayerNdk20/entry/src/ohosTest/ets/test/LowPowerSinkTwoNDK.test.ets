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
import lowpoweraudiosinkndk from 'liblowpoweraudiosinktwondk.so'
import { fileIo as fs } from '@kit.CoreFileKit';

export default function LowPowerSinkNdk2Test() {
  describe('LowPowerSinkNdk2Test', () => {

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Start0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Start0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Resume0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Resume0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Flush0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Flush0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Stop0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Stop0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerAudioSink_Destroy0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerAudioSink_Destroy0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetParameter0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetParameter0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetVideoSurface0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0102
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetVideoSurface0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetVideoSurface0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Prepare0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0102
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Prepare0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Prepare0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartDecoder0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0102
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartDecoder0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartDecoder0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0102
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_RenderFirstFrame0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_RenderFirstFrame0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartRenderer0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0102
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_StartRenderer0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_StartRenderer0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Pause0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0102
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Pause0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Pause0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Resume0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0102
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Resume0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Resume0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Flush0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0102
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Flush0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Flush0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Stop0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0102
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0102',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0102 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Stop0102();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Stop0102 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Reset0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Reset0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_Destroy0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_Destroy0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetSyncAudioSink0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetSyncAudioSink0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSink_SetPlaybackSpeed0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSink_SetPlaybackSpeed0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0101
     * @tc.name       : SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_LowPowerVideoSinkCallback_Destroy0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_LowPowerVideoSinkCallback_Destroy0101 catch err: " + err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_SetDataNeededListener0101
     * @tc.name       : SUB_MULTIMEIDA_OH_SetDataNeededListener0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_SetDataNeededListener0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_SetDataNeededListener0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_SetDataNeededListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_SetDataNeededListener0101 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_SetStreamChangedListener0101
     * @tc.name       : SUB_MULTIMEIDA_OH_SetStreamChangedListener0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_SetStreamChangedListener0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_SetStreamChangedListener0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_SetStreamChangedListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_SetStreamChangedListener0101 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener0101
     * @tc.name       : SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        if (canIUse("SystemCapability.Multimedia.Media.LowPowerAVSink")) {
          try {
            console.info("====>SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener0101 start====");
            let result: number = lowpoweraudiosinkndk.OH_SetFirstFrameDecodedListener0101();
            expect(0).assertEqual(result);
            done()
          } catch (err) {
            console.error("====>SUB_MULTIMEIDA_OH_SetFirstFrameDecodedListener0101 catch err: " +
              err);
            expect(false).assertEqual(true);
            done()
          }
        } else {
          done()
        }
      })


  })
}
