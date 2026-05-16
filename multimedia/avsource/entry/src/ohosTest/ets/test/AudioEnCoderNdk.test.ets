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
import audioencoderxdlndk from 'libaudioencoderxdlndk.so'

export default function audioEnCoderNdkTest() {
  describe('MuslAudioEnCoderXdlTest', () => {

    /**
     * @tc.name   testOhAudioEncoderCreateByMime001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_CREATEBYMINE_0100
     * @tc.desc   test OH_AudioEncoder_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderCreateByMime001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_CreateByMime()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderCreateByName001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_CREATEBYNAME_0100
     * @tc.desc   test OH_AudioEncoder_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderCreateByName001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_CreateByName()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_DESTROY_0100
     * @tc.desc   test OH_AudioEncoder_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderDestroy001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_Destroy()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderSetCallback001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_SETCALLBACK_0100
     * @tc.desc   test OH_AudioEncoder_SetCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderSetCallback001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_SetCallback()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderConfigure001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_CONFIGURE_0100
     * @tc.desc   test OH_AudioEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderConfigure001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_Configure()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderPrepare001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_PREPARE_0100
     * @tc.desc   test OH_AudioEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderPrepare001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_Prepare()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderStart001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_START_0100
     * @tc.desc   test OH_AudioEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderStart001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_Start()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderStop001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_STOP_0100
     * @tc.desc   test OH_AudioEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderStop001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_Stop()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderFlush001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_FLUSH_0100
     * @tc.desc   test OH_AudioEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderFlush001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_Flush()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderReset001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_RESET_0100
     * @tc.desc   test OH_AudioEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderReset001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_Reset()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderGetOutputDescription001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_GETOUTPUTDESCRIPTION_0100
     * @tc.desc   test OH_AudioEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderGetOutputDescription001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_GetOutputDescription()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderSetParameter001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_SETPARAMETER_0100
     * @tc.desc   test OH_AudioEncoder_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderSetParameter001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_SetParameter()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAudioEncoderIsValid001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AUDIOENCODER_OH_AUDIOENCODER_ISVALID_0100
     * @tc.desc   test OH_AudioEncoder_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAudioEncoderIsValid001', Level.LEVEL0, async (done: Function) => {
      expect(audioencoderxdlndk.OH_AudioEncoder_IsValid()).assertEqual(0);
      done();
    });
  })
}
