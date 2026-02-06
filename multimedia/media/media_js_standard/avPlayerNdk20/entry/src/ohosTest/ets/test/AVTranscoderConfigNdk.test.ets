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
import avtranscoderconfig from 'libavtranscoderconfigndk.so'

export default function AVTranscoderConfigNdkTest() {
  describe('AVTranscoderConfigNdkTest', () => {

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoderConfig_Release0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoderConfig_Release0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoderConfig_Release0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_Release0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoderConfig_Release0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_Release0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetSrcFD0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetSrcFD0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetSrcFD0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetSrcFD0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoderConfig_SetSrcFD0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetSrcFD0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstFD0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstFD0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstFD0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstFD0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoderConfig_SetDstFD0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstFD0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoderConfig_SetDstAudioType0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0101
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0101 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoderConfig_SetDstAudioType0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstAudioType0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstVideoResolution0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstVideoResolution0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstVideoResolution0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstVideoResolution0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoderConfig_SetDstVideoResolution0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoderConfig_SetDstVideoResolution0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_Pause0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_Pause0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_Pause0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_Pause0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_Pause0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_Pause0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_Pause0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_Pause0101
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_Pause0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_Pause0101 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_Pause0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_Pause0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_Resume0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_Resume0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_Resume0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_Resume0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_Resume0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_Resume0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_Resume0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_Resume0101
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_Resume0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_Resume0101 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_Resume0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_Resume0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_Cancel0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_Cancel0101
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_Cancel0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_Cancel0101 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_Cancel0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_Cancel0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_Release0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_Release0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_Release0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_Release0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_Release0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_Release0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_SetStateCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0101
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0101 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_SetStateCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetStateCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_SetErrorCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0101
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0101 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_SetErrorCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetErrorCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_SetProgressUpdateCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0101
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0101 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoder_SetProgressUpdateCallback0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_SetProgressUpdateCallback0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVTranscoder_EnableBFrame0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVTranscoder_EnableBFrame0100
     * @tc.desc       : test OH_AVTranscoder
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVTranscoder_EnableBFrame0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVTranscoder_EnableBFrame0100 start====");
          let result: number = avtranscoderconfig.OH_AVTranscoderConfig_EnableBFrame0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVTranscoder_EnableBFrame0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })


  })
}
