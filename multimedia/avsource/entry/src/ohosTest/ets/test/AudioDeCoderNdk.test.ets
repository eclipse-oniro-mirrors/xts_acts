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
import audiodecoderxdlndk from 'libaudiodecoderxdlndk.so'

export default function audioDeCoderNdkTest() {
  describe('AvcodecAudioDecoderTest', () => {

    /**
     * @tc.name   testOhAudioDecoderCreateByMine001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_CREATEBYMINE_0100
     * @tc.desc   test OH_AudioDecoder_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderCreateByMine001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_CreateByMime()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderCreateByName001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_CREATEBYNAME_0100
     * @tc.desc   test OH_AudioDecoder_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderCreateByName001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_CreateByName()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_DESTROY_0100
     * @tc.desc   test OH_AudioDecoder_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderDestroy001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_Destroy()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderSetCallback001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_SETCALLBACK_0100
     * @tc.desc   test OH_AudioDecoder_SetCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderSetCallback001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_SetCallback()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderConfigure001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_CONFIGURE_0100
     * @tc.desc   test OH_AudioDecoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderConfigure001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_Configure()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderPrepare001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_PREPARE_0100
     * @tc.desc   test OH_AudioDecoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderPrepare001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_Prepare()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderStart001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_START_0100
     * @tc.desc   test OH_AudioDecoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderStart001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_Start()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderStop001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_STOP_0100
     * @tc.desc   test OH_AudioDecoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderStop001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_Stop()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderFlush001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_FLUSH_0100
     * @tc.desc   test OH_AudioDecoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderFlush001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_Flush()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderReset001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_RESET_0100
     * @tc.desc   test OH_AudioDecoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderReset001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_Reset()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderGetOutputDescription001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_GETOUTPUTDESCRIPTION_0100
     * @tc.desc   test OH_AudioDecoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderGetOutputDescription001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_GetOutputDescription()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderSetParameter001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_SETPARAMETER_0100
     * @tc.desc   test OH_AudioDecoder_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderSetParameter001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_SetParameter()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioDecoderIsValid001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_ISVALID_0100
     * @tc.desc   test OH_AudioDecoder_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioDecoderIsValid001', Level.LEVEL0, async (done: Function) => {
      expect(audiodecoderxdlndk.OH_AudioDecoder_IsValid()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderCreateByName002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_CREATEBYNAME_0200
     * @tc.desc   test OH_AudioDecoder_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderCreateByName002', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderCreateByNameAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderCreateByName003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_CREATEBYNAME_0300
     * @tc.desc   test OH_AudioDecoder_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderCreateByName003', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderCreateByNameBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderCreateByName004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_CREATEBYNAME_0400
     * @tc.desc   test OH_AudioDecoder_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderCreateByName004', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderCreateByNameCnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderDestroy002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_DESTROY_0200
     * @tc.desc   test OH_AudioDecoder_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderDestroy002', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderDestroyAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderDestroy003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_DESTROY_0300
     * @tc.desc   test OH_AudioDecoder_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderDestroy003', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderDestroyBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderDestroy004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_DESTROY_0400
     * @tc.desc   test OH_AudioDecoder_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderDestroy004', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderDestroyCnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStart002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_START_0200
     * @tc.desc   test OH_AudioDecoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStart002', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderStartAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStart003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_START_0300
     * @tc.desc   test OH_AudioDecoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStart003', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderStartBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStart004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_START_0400
     * @tc.desc   test OH_AudioDecoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStart004', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderStartCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStop002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_STOP_0200
     * @tc.desc   test OH_AudioDecoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStop002', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderStopAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStop003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_STOP_0300
     * @tc.desc   test OH_AudioDecoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStop003', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderStopBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderStop004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_STOP_0400
     * @tc.desc   test OH_AudioDecoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderStop004', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderStopCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderFlush002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_FLUSH_0200
     * @tc.desc   test OH_AudioDecoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderFlush002', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderFlushAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderFlush003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_FLUSH_0300
     * @tc.desc   test OH_AudioDecoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderFlush003', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderFlushBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderFlush004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_FLUSH_0400
     * @tc.desc   test OH_AudioDecoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderFlush004', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderFlushCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderReset002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_RESET_0200
     * @tc.desc   test OH_AudioDecoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderReset002', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderResetAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderReset003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_RESET_0300
     * @tc.desc   test OH_AudioDecoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderReset003', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderResetBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderReset004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_RESET_0400
     * @tc.desc   test OH_AudioDecoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderReset004', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderResetCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderGetOutputDescription002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_GETOUTPUTDESCRIPTION_0200
     * @tc.desc   test OH_AudioDecoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderGetOutputDescription002', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderGetOutputDescriptionAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderGetOutputDescription003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_GETOUTPUTDESCRIPTION_0300
     * @tc.desc   test OH_AudioDecoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderGetOutputDescription003', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderGetOutputDescriptionBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderGetOutputDescription004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_GETOUTPUTDESCRIPTION_0400
     * @tc.desc   test OH_AudioDecoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderGetOutputDescription004', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderGetOutputDescriptionCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderSetParameter002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_SETPARAMETER_0200
     * @tc.desc   test OH_AudioDecoder_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderSetParameter002', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderSetParameterAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderSetParameter003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_SETPARAMETER_0300
     * @tc.desc   test OH_AudioDecoder_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderSetParameter003', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderSetParameterBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderSetParameter004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_SETPARAMETER_0400
     * @tc.desc   test OH_AudioDecoder_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderSetParameter004', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderSetParameterCnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderIsValid002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_ISVALID_0200
     * @tc.desc   test OH_AudioDecoder_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderIsValid002', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderIsValidAnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderIsValid003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_ISVALID_0300
     * @tc.desc   test OH_AudioDecoder_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderIsValid003', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderIsValidBnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAudioDecoderIsValid004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIODECODER_OH_AUDIODECODER_ISVALID_0400
     * @tc.desc   test OH_AudioDecoder_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAudioDecoderIsValid004', Level.LEVEL0, async (done: Function) => {
      let result: number = audiodecoderxdlndk.OHAudioDecoderIsValidCnormal();
      expect(result).assertEqual(-1);
      done();
    });
  })
}
