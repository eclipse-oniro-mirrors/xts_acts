/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from "@ohos/hypium"
import audioEncoderAvBuffer from 'libaudioEncoderAvBuffer.so'

export default function audioEnCoderNdkTest() {
  describe('audioEncoderAvBuffer', () => {

    /**
     * @tc.name   testOhAudioEncoderCreateByMime001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_CREATEBYMime_0100
     * @tc.desc   test OH_AudioCodec_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderCreateByMime001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_CreateByMime()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderCreateByName001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_CREATEBYNAME_0100
     * @tc.desc   test OH_AudioCodec_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderCreateByName001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_CreateByName()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_DESTROY_0100
     * @tc.desc   test OH_AudioCodec_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderDestroy001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_Destroy()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderRegisterCallback001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_REGISTERCALLBACK_0100
     * @tc.desc   test OH_AudioCodec_RegisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderRegisterCallback001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_RegisterCallback()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderConfigure001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_CONFIGURE_0100
     * @tc.desc   test OH_AudioCodec_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderConfigure001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_Configure()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderPrepare001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_PREPARE_0100
     * @tc.desc   test OH_AudioCodec_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderPrepare001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_Prepare()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderStart001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_START_0100
     * @tc.desc   test OH_AudioCodec_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderStart001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_Start()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderStop001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_STOP_0100
     * @tc.desc   test OH_AudioCodec_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderStop001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_Stop()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderFlush001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_FLUSH_0100
     * @tc.desc   test OH_AudioCodec_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderFlush001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_Flush()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderReset001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_RESET_0100
     * @tc.desc   test OH_AudioCodec_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderReset001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_Reset()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderGetOutputDescription001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_GETOUTPUTDESCRIPTION_0100
     * @tc.desc   test OH_AudioCodec_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderGetOutputDescription001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_GetOutputDescription()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderSetParameter001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_SETPARAMETER_0100
     * @tc.desc   test OH_AudioCodec_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderSetParameter001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_SetParameter()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderIsValid001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIOENCODER_OH_AUDIOCODEC_ISVALID_0100
     * @tc.desc   test OH_AudioCodec_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderIsValid001', Level.LEVEL0, async (done: Function) => {
      expect(audioEncoderAvBuffer.OH_AudioCodec_IsValid()).assertEqual(0);
      done();
    });
  })
}
