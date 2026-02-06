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
import audioDecoderAvBuffer from 'libaudioDecoderAvBuffer.so'

export default function audioDeCoderNdkTest() {
  describe('audioDecoderAvBufferTest', () => {

    /**
     * @tc.name   testOhAudioDecoderCreateByMime001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0100
     * @tc.desc   test OH_AudioCodec_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderCreateByMime001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_CreateByMime()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderCreateByMime002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0200
     * @tc.desc   test OH_AudioCodec_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderCreateByMime002', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderAmrnb()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderCreateByMime003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0300
     * @tc.desc   test OH_AudioCodec_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderCreateByMime003', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderAmrwb()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderCreateByMime004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0400
     * @tc.desc   test OH_AudioCodec_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderCreateByMime004', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderOpus()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderCreateByMime005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0500
     * @tc.desc   test OH_AudioCodec_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderCreateByMime005', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderG711Mu()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderCreateByMime006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0600
     * @tc.desc   test OH_AudioCodec_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderCreateByMime006', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderViVid()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderCreateByName001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYNAME_0100
     * @tc.desc   test OH_AudioCodec_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderCreateByName001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_CreateByName()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_DESTROY_0100
     * @tc.desc   test OH_AudioCodec_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderDestroy001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Destroy()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderSetCallback001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_REGISTERCALLBACK_0100
     * @tc.desc   test OH_AudioCodec_RegisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderSetCallback001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_RegisterCallback()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderConfigure001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CONFIGURE_0100
     * @tc.desc   test OH_AudioCodec_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderConfigure001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Configure()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderPrepare001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_PREPARE_0100
     * @tc.desc   test OH_AudioCodec_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderPrepare001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Prepare()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderStart001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_START_0100
     * @tc.desc   test OH_AudioCodec_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderStart001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Start()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderStop001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_STOP_0100
     * @tc.desc   test OH_AudioCodec_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderStop001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Stop()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderFlush001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FLUSH_0100
     * @tc.desc   test OH_AudioCodec_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderFlush001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Flush()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderReset001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_RESET_0100
     * @tc.desc   test OH_AudioCodec_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderReset001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Reset()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderGetOutputDescription001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_GETOUTPUTDESCRIPTION_0100
     * @tc.desc   test OH_AudioCodec_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderGetOutputDescription001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_GetOutputDescription()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderSetParameter001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_SETPARAMETER_0100
     * @tc.desc   test OH_AudioCodec_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderSetParameter001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_SetParameter()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderIsValid001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_ISVALID_0100
     * @tc.desc   test OH_AudioCodec_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderIsValid001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_IsValid()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderCreateByName002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYNAME_0200
     * @tc.desc   test OH_AudioCodec_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderCreateByName002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderCreateByNameAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderCreateByName003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYNAME_0300
     * @tc.desc   test OH_AudioCodec_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderCreateByName003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderCreateByNameBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderCreateByName004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYNAME_0400
     * @tc.desc   test OH_AudioCodec_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderCreateByName004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderCreateByNameCnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderDestroy002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_DESTROY_0200
     * @tc.desc   test OH_AudioCodec_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderDestroy002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderDestroyAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderDestroy003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_DESTROY_0300
     * @tc.desc   test OH_AudioCodec_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderDestroy003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderDestroyBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderDestroy004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_DESTROY_0400
     * @tc.desc   test OH_AudioCodec_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderDestroy004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderDestroyCnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStart002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_START_0200
     * @tc.desc   test OH_AudioCodec_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStart002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStartAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStart003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_START_0300
     * @tc.desc   test OH_AudioCodec_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStart003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStartBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStart004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_START_0400
     * @tc.desc   test OH_AudioCodec_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStart004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStartCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStop002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_STOP_0200
     * @tc.desc   test OH_AudioCodec_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStop002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStopAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStop003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_STOP_0300
     * @tc.desc   test OH_AudioCodec_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStop003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStopBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStop004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_STOP_0400
     * @tc.desc   test OH_AudioCodec_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStop004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStopCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderFlush002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FLUSH_0200
     * @tc.desc   test OH_AudioCodec_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderFlush002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderFlushAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderFlush003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FLUSH_0300
     * @tc.desc   test OH_AudioCodec_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderFlush003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderFlushBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderFlush004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FLUSH_0400
     * @tc.desc   test OH_AudioCodec_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderFlush004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderFlushCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderReset002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_RESET_0200
     * @tc.desc   test OH_AudioCodec_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderReset002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderResetAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderReset003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_RESET_0300
     * @tc.desc   test OH_AudioCodec_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderReset003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderResetBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderReset004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_RESET_0400
     * @tc.desc   test OH_AudioCodec_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderReset004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderResetCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderGetOutputDescription002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_GETOUTPUTDESCRIPTION_0200
     * @tc.desc   test OH_AudioCodec_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderGetOutputDescription002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderGetOutputDescriptionAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderGetOutputDescription003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_GETOUTPUTDESCRIPTION_0300
     * @tc.desc   test OH_AudioCodec_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderGetOutputDescription003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderGetOutputDescriptionBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderGetOutputDescription004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_GETOUTPUTDESCRIPTION_0400
     * @tc.desc   test OH_AudioCodec_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderGetOutputDescription004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderGetOutputDescriptionCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderSetParameter002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_SETPARAMETER_0200
     * @tc.desc   test OH_AudioCodec_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderSetParameter002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderSetParameterAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderSetParameter003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_SETPARAMETER_0300
     * @tc.desc   test OH_AudioCodec_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderSetParameter003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderSetParameterBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderSetParameter004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_SETPARAMETER_0400
     * @tc.desc   test OH_AudioCodec_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderSetParameter004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderSetParameterCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderIsValid002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_ISVALID_0200
     * @tc.desc   test OH_AudioCodec_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderIsValid002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderIsValidAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderIsValid003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_ISVALID_0300
     * @tc.desc   test OH_AudioCodec_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderIsValid003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderIsValidBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderIsValid004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_ISVALID_0400
     * @tc.desc   test OH_AudioCodec_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderIsValid004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderIsValidCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderPushInputBuffer001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_PUSHINPUTBUFFER_0100
     * @tc.desc   test OH_AudioCodec_PushInputBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderPushInputBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderPushInputBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderFreeOutputBuffer001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FREEOUTPUTBUFFER_0100
     * @tc.desc   test OH_AudioCodec_FreeOutputBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderFreeOutputBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderFreeOutputBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderOutputFormatChange0100
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OHAudioDecoderOutputFormatChange_0100
     * @tc.desc   test AudioDecoderOutputFormatChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderOutputFormatChange0100', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderOutputFormatChange()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderOutputFormatChangeSync0100
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OHAudioDecoderOutputFormatChangeSync_0100
     * @tc.desc   test AudioDecoderOutputFormatChange Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderOutputFormatChangeSync0100', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderOutputFormatChangeSync()).assertEqual(0);
      done();
    });
  })
}
