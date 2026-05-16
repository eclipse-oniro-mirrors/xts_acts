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
import nativeavmuxer from 'libnativeavmuxerndk.so'

export default function nativeavmuxerNdkTest() {
  describe('MuslNativeAvmuxerNdkTest', () => {

    /**
     * @tc.name   testOHAVMuxerCreate001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVMUXER_OH_AVMUXER_CREATE_0100
     * @tc.desc   test OH_AVMuxer_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerCreate001', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerSetRotation001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVMUXER_OH_AVMUXER_SETROTATION_0100
     * @tc.desc   test OH_AVMuxer_SetRotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerSetRotation001', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerSetRotation();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerSetFormat001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVMUXER_OH_AVMUXER_SETFORMAT_0100
     * @tc.desc   test OH_AVMuxer_SetFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerSetFormat001', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerSetFormat();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerStart001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVMUXER_OH_AVMUXER_START_0100
     * @tc.desc   test OH_AVMuxer_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerStart001', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerStart();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerStop001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVMUXER_OH_AVMUXER_STOP_0100
     * @tc.desc   test OH_AVMuxer_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerStop001', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerStop();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerWriteSample001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVMUXER_OH_AVMUXER_WRITESAMPLE_0100
     * @tc.desc   test OH_AVMuxer_WriteSample
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerWriteSample001', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerWriteSample();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerWriteSampleBuffer001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVMUXER_OH_AVMUXER_WRITESAMPLEBUFFER_0100
     * @tc.desc   test OH_AVMuxer_WriteSampleBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerWriteSampleBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.OHAVMuxerWriteSampleBuffer();
      expect(result).assertEqual(0);
      done();
    });
    
    /**
     * @tc.name   testOHAVMuxerAddTrack001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVMUXER_OH_AVMUXER_ADDTRACK_0100
     * @tc.desc   test OH_AVMuxer_AddTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerAddTrack001', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerAddTrack();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVMUXER_OH_AVMUXER_DESTROY_0100
     * @tc.desc   test OH_AVMuxer_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerDestroy001', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerCreate002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AVMUXER_OH_AVMUXER_CREATE_0200
     * @tc.desc   test OH_AVMuxer_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerCreate002', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerCreateAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerSetRotation002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AVMUXER_OH_AVMUXER_SETROTATION_0200
     * @tc.desc   test OH_AVMuxer_SetRotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerSetRotation002', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerSetRotationAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerSetFormat002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AVMUXER_OH_AVMUXER_SETFORMAT_0200
     * @tc.desc   test OH_AVMuxer_SetFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerSetFormat002', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerSetFormatAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerStart002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AVMUXER_OH_AVMUXER_START_0200
     * @tc.desc   test OH_AVMuxer_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerStart002', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerStartAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerStop002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AVMUXER_OH_AVMUXER_STOP_0200
     * @tc.desc   test OH_AVMuxer_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerStop002', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerStopAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerWriteSample002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AVMUXER_OH_AVMUXER_WRITESAMPLE_0200
     * @tc.desc   test OH_AVMuxer_WriteSample
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerWriteSample002', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerWriteSampleAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerAddTrack002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AVMUXER_OH_AVMUXER_ADDTRACK_0200
     * @tc.desc   test OH_AVMuxer_AddTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerAddTrack002', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerAddTrackAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHAVMuxerDestroy002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_AVMUXER_OH_AVMUXER_DESTROY_0200
     * @tc.desc   test OH_AVMuxer_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHAVMuxerDestroy002', Level.LEVEL0, async (done: Function) => {
      let result: number = nativeavmuxer.oHAVMuxerDestroyAbnormal();
      expect(result).assertEqual(0);
      done();
    });
  })
}
