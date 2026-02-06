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
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0100
     * @tc.name       : testOhAudioDecoderCreateByMime001
     * @tc.desc       : test OH_AudioCodec_CreateByMime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderCreateByMime001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_CreateByMime()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0200
     * @tc.name       : testOhAudioDecoderCreateByMime002
     * @tc.desc       : test OH_AudioCodec_CreateByMime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderCreateByMime002', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderAmrnb()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0300
     * @tc.name       : testOhAudioDecoderCreateByMime003
     * @tc.desc       : test OH_AudioCodec_CreateByMime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderCreateByMime003', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderAmrwb()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0400
     * @tc.name       : testOhAudioDecoderCreateByMime004
     * @tc.desc       : test OH_AudioCodec_CreateByMime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderCreateByMime004', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderOpus()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0500
     * @tc.name       : testOhAudioDecoderCreateByMime005
     * @tc.desc       : test OH_AudioCodec_CreateByMime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderCreateByMime005', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderG711Mu()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYMime_0600
     * @tc.name       : testOhAudioDecoderCreateByMime006
     * @tc.desc       : test OH_AudioCodec_CreateByMime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderCreateByMime006', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderViVid()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYNAME_0100
     * @tc.name       : testOhAudioDecoderCreateByName001
     * @tc.desc       : test OH_AudioCodec_CreateByName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderCreateByName001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_CreateByName()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_DESTROY_0100
     * @tc.name       : testOhAudioDecoderDestroy001
     * @tc.desc       : test OH_AudioCodec_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderDestroy001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Destroy()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_REGISTERCALLBACK_0100
     * @tc.name       : testOhAudioDecoderRegisterCallback001
     * @tc.desc       : test OH_AudioCodec_RegisterCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderSetCallback001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_RegisterCallback()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CONFIGURE_0100
     * @tc.name       : testOhAudioDecoderConfigure001
     * @tc.desc       : test OH_AudioCodec_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderConfigure001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Configure()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_PREPARE_0100
     * @tc.name       : testOhAudioDecoderPrepare001
     * @tc.desc       : test OH_AudioCodec_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderPrepare001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Prepare()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_START_0100
     * @tc.name       : testOhAudioDecoderStart001
     * @tc.desc       : test OH_AudioCodec_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderStart001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Start()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_STOP_0100
     * @tc.name       : testOhAudioDecoderStop001
     * @tc.desc       : test OH_AudioCodec_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderStop001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Stop()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FLUSH_0100
     * @tc.name       : testOhAudioDecoderFlush001
     * @tc.desc       : test OH_AudioCodec_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderFlush001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Flush()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_RESET_0100
     * @tc.name       : testOhAudioDecoderReset001
     * @tc.desc       : test OH_AudioCodec_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderReset001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_Reset()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_GETOUTPUTDESCRIPTION_0100
     * @tc.name       : testOhAudioDecoderGetOutputDescription001
     * @tc.desc       : test OH_AudioCodec_GetOutputDescription
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderGetOutputDescription001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_GetOutputDescription()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_SETPARAMETER_0100
     * @tc.name       : testOhAudioDecoderSetParameter001
     * @tc.desc       : test OH_AudioCodec_SetParameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderSetParameter001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_SetParameter()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_ISVALID_0100
     * @tc.name       : testOhAudioDecoderIsValid001
     * @tc.desc       : test OH_AudioCodec_IsValid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAudioDecoderIsValid001', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OH_AudioCodec_IsValid()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYNAME_0200
     * @tc.name       : testOHAudioDecoderCreateByName002
     * @tc.desc       : test OH_AudioCodec_CreateByName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderCreateByName002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderCreateByNameAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYNAME_0300
     * @tc.name       : testOHAudioDecoderCreateByName003
     * @tc.desc       : test OH_AudioCodec_CreateByName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderCreateByName003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderCreateByNameBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_CREATEBYNAME_0400
     * @tc.name       : testOHAudioDecoderCreateByName004
     * @tc.desc       : test OH_AudioCodec_CreateByName
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderCreateByName004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderCreateByNameCnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_DESTROY_0200
     * @tc.name       : testOHAudioDecoderDestroy002
     * @tc.desc       : test OH_AudioCodec_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderDestroy002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderDestroyAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_DESTROY_0300
     * @tc.name       : testOHAudioDecoderDestroy003
     * @tc.desc       : test OH_AudioCodec_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderDestroy003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderDestroyBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_DESTROY_0400
     * @tc.name       : testOHAudioDecoderDestroy004
     * @tc.desc       : test OH_AudioCodec_Destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderDestroy004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderDestroyCnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_START_0200
     * @tc.name       : testOHAudioDecoderStart002
     * @tc.desc       : test OH_AudioCodec_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderStart002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStartAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_START_0300
     * @tc.name       : testOHAudioDecoderStart003
     * @tc.desc       : test OH_AudioCodec_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderStart003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStartBnormal();
      expect(result).assertEqual(0);
      done();
    });

     /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_START_0400
     * @tc.name       : testOHAudioDecoderStart004
     * @tc.desc       : test OH_AudioCodec_Start
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderStart004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStartCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_STOP_0200
     * @tc.name       : testOHAudioDecoderStop002
     * @tc.desc       : test OH_AudioCodec_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderStop002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStopAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_STOP_0300
     * @tc.name       : testOHAudioDecoderStop003
     * @tc.desc       : test OH_AudioCodec_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderStop003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStopBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_STOP_0400
     * @tc.name       : testOHAudioDecoderStop004
     * @tc.desc       : test OH_AudioCodec_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderStop004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderStopCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FLUSH_0200
     * @tc.name       : testOHAudioDecoderFlush002
     * @tc.desc       : test OH_AudioCodec_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderFlush002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderFlushAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FLUSH_0300
     * @tc.name       : testOHAudioDecoderFlush003
     * @tc.desc       : test OH_AudioCodec_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderFlush003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderFlushBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FLUSH_0400
     * @tc.name       : testOHAudioDecoderFlush004
     * @tc.desc       : test OH_AudioCodec_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderFlush004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderFlushCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_RESET_0200
     * @tc.name       : testOHAudioDecoderReset002
     * @tc.desc       : test OH_AudioCodec_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderReset002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderResetAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_RESET_0300
     * @tc.name       : testOHAudioDecoderReset003
     * @tc.desc       : test OH_AudioCodec_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderReset003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderResetBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_RESET_0400
     * @tc.name       : testOHAudioDecoderReset004
     * @tc.desc       : test OH_AudioCodec_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderReset004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderResetCnormal();
      expect(result).assertEqual(-1);
      done();
    });

     /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_GETOUTPUTDESCRIPTION_0200
     * @tc.name       : testOHAudioDecoderGetOutputDescription002
     * @tc.desc       : test OH_AudioCodec_GetOutputDescription
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderGetOutputDescription002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderGetOutputDescriptionAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_GETOUTPUTDESCRIPTION_0300
     * @tc.name       : testOHAudioDecoderGetOutputDescription003
     * @tc.desc       : test OH_AudioCodec_GetOutputDescription
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderGetOutputDescription003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderGetOutputDescriptionBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_GETOUTPUTDESCRIPTION_0400
     * @tc.name       : testOHAudioDecoderGetOutputDescription004
     * @tc.desc       : test OH_AudioCodec_GetOutputDescription
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderGetOutputDescription004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderGetOutputDescriptionCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_SETPARAMETER_0200
     * @tc.name       : testOHAudioDecoderSetParameter002
     * @tc.desc       : test OH_AudioCodec_SetParameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderSetParameter002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderSetParameterAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_SETPARAMETER_0300
     * @tc.name       : testOHAudioDecoderSetParameter003
     * @tc.desc       : test OH_AudioCodec_SetParameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderSetParameter003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderSetParameterBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_SETPARAMETER_0400
     * @tc.name       : testOHAudioDecoderSetParameter004
     * @tc.desc       : test OH_AudioCodec_SetParameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderSetParameter004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderSetParameterCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_ISVALID_0200
     * @tc.name       : testOHAudioDecoderIsValid002
     * @tc.desc       : test OH_AudioCodec_IsValid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderIsValid002', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderIsValidAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_ISVALID_0300
     * @tc.name       : testOHAudioDecoderIsValid003
     * @tc.desc       : test OH_AudioCodec_IsValid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderIsValid003', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderIsValidBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_ISVALID_0400
     * @tc.name       : testOHAudioDecoderIsValid004
     * @tc.desc       : test OH_AudioCodec_IsValid
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderIsValid004', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderIsValidCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_PUSHINPUTBUFFER_0100
     * @tc.name       : testOHAudioDecoderPushInputBuffer001
     * @tc.desc       : test OH_AudioCodec_PushInputBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderPushInputBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderPushInputBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OH_AUDIOCODEC_FREEOUTPUTBUFFER_0100
     * @tc.name       : testOHAudioDecoderFreeOutputBuffer001
     * @tc.desc       : test OH_AudioCodec_FreeOutputBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderFreeOutputBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = audioDecoderAvBuffer.OHAudioDecoderFreeOutputBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AUDIODECODER_OHAudioDecoderOutputFormatChange_0100
     * @tc.name       : testOHAudioDecoderOutputFormatChange0100
     * @tc.desc       : test AudioDecoderOutputFormatChange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAudioDecoderOutputFormatChange0100', Level.LEVEL0, async (done: Function) => {
      expect(audioDecoderAvBuffer.OHAudioDecoderOutputFormatChange()).assertEqual(0);
      done();
    });

  })
}
