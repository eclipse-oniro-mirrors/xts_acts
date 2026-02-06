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
import videoencoderndk from 'libvideoencoderndk.so'

export default function videoEnCoderNdkTest() {
  describe('AvcodecVideoEncoderTest', () => {

    /**
     * @tc.name   testOHVideoEncoderCreateByMime001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYMIME_0100
     * @tc.desc   test OH_VideoEncoder_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderCreateByMime001', Level.LEVEL0, async (done: Function) => {
        try { 
            let result: number = videoencoderndk.oHVideoEncoderCreateByMime();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderCreateByMime001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderCreateByMime002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYMIME_0200
     * @tc.desc   test OH_VideoEncoder_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderCreateByMime002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderCreateByMimeHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderCreateByMime002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderCreateByMime003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYMIME_0300
     * @tc.desc   test OH_VideoEncoder_CreateByMime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderCreateByMime003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderCreateByMimeAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderCreateByName001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYNAME_0100
     * @tc.desc   test OH_VideoEncoder_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderCreateByName001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderCreateByName();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderCreateByName001 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.name   testOHVideoEncoderCreateByName002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYNAME_0200
     * @tc.desc   test OH_VideoEncoder_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderCreateByName002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderCreateByNameHEVC();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderCreateByName002 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.name   testOHVideoEncoderCreateByName003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CREATEBYNAME_0300
     * @tc.desc   test OH_VideoEncoder_CreateByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderCreateByName003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderCreateByNameAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderDestroy001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_DESTROY_0100
     * @tc.desc   test OH_VideoEncoder_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderDestroy001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderDestroy();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderDestroy001 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.name   testOHVideoEncoderDestroy002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_DESTROY_0200
     * @tc.desc   test OH_VideoEncoder_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderDestroy002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderDestroyHEVC();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderDestroy002 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.name   testOHVideoEncoderDestroy003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_DESTROY_0300
     * @tc.desc   test OH_VideoEncoder_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderDestroy003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderDestroyAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderSetCallback001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_SETCALLBACK_0100
     * @tc.desc   test OH_VideoEncoder_SetCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderSetCallback001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderSetCallback();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderSetCallback001 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.name   testOHVideoEncoderSetCallback002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_SETCALLBACK_0200
     * @tc.desc   test OH_VideoEncoder_SetCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderSetCallback002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderSetCallbackHEVC();
            expect(result != null).assertTrue();
            done();
          } catch (err) {
            console.info('testOHVideoEncoderSetCallback002 failed, error is' + err.message);
            expect(false).assertTrue();
          }
    });

    /**
     * @tc.name   testOHVideoEncoderSetCallback003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_SETCALLBACK_0300
     * @tc.desc   test OH_VideoEncoder_SetCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderSetCallback003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderSetCallbackAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderRegisterCallback001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_REGISTERCALLBACK_0100
     * @tc.desc   test OH_VideoEncoder_RegisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderRegisterCallback001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderRegisterCallback();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderRegisterCallback001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderRegisterCallback002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_REGISTERCALLBACK_0200
     * @tc.desc   test OH_VideoEncoder_RegisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderRegisterCallback002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderRegisterCallbackHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderRegisterCallback002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderRegisterCallback003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_REGISTERCALLBACK_0300
     * @tc.desc   test OH_VideoEncoder_RegisterCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderRegisterCallback003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderRegisterCallbackAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderConfigure001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0100
     * @tc.desc   test OH_VideoEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderConfigure001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderConfigure();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderConfigure001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderConfigure002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0200
     * @tc.desc   test OH_VideoEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderConfigure002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderConfigureHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderConfigure002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderConfigure003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0300
     * @tc.desc   test OH_VideoEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderConfigure003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderConfigure004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0400
     * @tc.desc   test OH_VideoEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderConfigure004', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal2();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderConfigure005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0500
     * @tc.desc   test OH_VideoEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderConfigure005', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal3();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderConfigure006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0600
     * @tc.desc   test OH_VideoEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderConfigure006', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal4();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderConfigure007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0700
     * @tc.desc   test OH_VideoEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderConfigure007', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal5();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderConfigure008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0800
     * @tc.desc   test OH_VideoEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderConfigure008', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal6();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderConfigure009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_CONFIGURE_0900
     * @tc.desc   test OH_VideoEncoder_Configure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderConfigure009', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderConfigureAbnormal7();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0100
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepare();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0200
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepareHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare004', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal2();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare004 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare005', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal3();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare006', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal4();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare006 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare007', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal5();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare008', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal6();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderPrepare008 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare009', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal7();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare010
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare010', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal8();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare011
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare011', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal9();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare012
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare012', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal10();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare013
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare013', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal11();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare014
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare014', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal12();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare015
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare015', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal13();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare016
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare016', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal14();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPrepare017
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PREPARE_0300
     * @tc.desc   test OH_VideoEncoder_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPrepare017', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPrepareAbnormal15();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0100
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStart(1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStart001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderStart002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0200
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStart(2,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStart002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderStart003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0300
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0400
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart004', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStart(1,1,1,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStart004 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderStart005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0500
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart005', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0600
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart006', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0700
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart007', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0800
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart008', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_0900
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart009', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart010
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1000
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart010', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart011
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1100
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart011', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart012
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1200
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart012', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart013
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1300
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart013', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart014
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1400
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart014', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart015
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1500
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart015', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart016
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1600
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart016', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart017
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1700
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart017', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart018
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1800
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart018', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart019
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_1900
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart019', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart020
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2000
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart020', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart021
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2100
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart021', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart022
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2200
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart022', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart023
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2300
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart023', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart024
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2400
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart024', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart025
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2500
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart025', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart026
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2600
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart026', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart027
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2700
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart027', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart028
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2800
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart028', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart029
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_2900
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart029', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart030
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_3000
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart030', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart031
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_3100
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart031', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart032
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_3200
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart032', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStart033
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_START_3300
     * @tc.desc   test OH_VideoEncoder_Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStart033', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStart(0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0100
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop001', Level.LEVEL0, async (done: Function) => {
        try{
            let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderStop002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0200
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop002', Level.LEVEL0, async (done: Function) => {
        try{
            let result: number = videoencoderndk.oHVideoEncoderStop(2,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderStop003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0300
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0400
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop004', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,1,0,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop004 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderStop005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0500
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop005', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0600
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop006', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop006 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderStop007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0700
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop007', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0800
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop008', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,0,0,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderStop008 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderStop009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_0900
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop009', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop010
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1000
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop010', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop011
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1100
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop011', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop012
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1200
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop012', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop013
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1300
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop013', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop014
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1400
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop014', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop015
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1500
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop015', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop016
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1600
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop016', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop017
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1700
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop017', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop018
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1800
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop018', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop019
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_1900
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop019', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop020
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2000
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop020', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop021
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2100
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop021', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop022
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2200
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop022', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop023
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2300
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop023', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop024
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2400
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop024', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop025
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2500
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop025', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop026
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2600
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop026', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop027
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2700
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop027', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop028
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2800
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop028', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop029
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_2900
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop029', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop030
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3000
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop030', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop031
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3100
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop031', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop032
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3200
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop032', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop033
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3300
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop033', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(1,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop034
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3400
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop034', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop035
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3500
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop035', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop036
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3600
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop036', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop037
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3700
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop037', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop038
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3800
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop038', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop039
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_3900
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop039', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop040
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4000
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop040', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop041
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4100
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop041', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop042
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4200
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop042', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop043
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4300
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop043', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop044
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4400
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop044', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop045
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4500
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop045', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop046
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4600
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop046', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop047
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4700
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop047', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop048
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4800
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop048', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop049
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_4900
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop049', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop050
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5000
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop050', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop051
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5100
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop051', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop052
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5200
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop052', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop053
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5300
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop053', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop054
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5400
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop054', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop055
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5500
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop055', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop056
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5600
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop056', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop057
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5700
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop057', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop058
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5800
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop058', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop059
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5900
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop059', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop060
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6000
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop060', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop061
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6100
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop061', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop062
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6200
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop062', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop063
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6300
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop063', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop064
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6400
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop064', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderStop065
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6500
     * @tc.desc   test OH_VideoEncoder_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderStop065', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0100
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderFlush001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderFlush002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0200
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderFlush(2,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderFlush002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderFlush003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0300
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0400
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush004', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0500
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush005', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0600
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush006', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderFlush006 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderFlush007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0700
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush007', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0800
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush008', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0900
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush009', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush010
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1000
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush010', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush011
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1100
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush011', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush012
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1200
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush012', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush013
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1300
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush013', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush014
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1400
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush014', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush015
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1500
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush015', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush016
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1600
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush016', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush017
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1700
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush017', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush018
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1800
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush018', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush019
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1900
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush019', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush020
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2000
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush020', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush021
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2100
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush021', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush022
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2200
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush022', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush023
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2300
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush023', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush024
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2400
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush024', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush025
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2500
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush025', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush026
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2600
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush026', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush027
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2700
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush027', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush028
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2800
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush028', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush029
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2900
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush029', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush030
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3000
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush030', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush031
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3100
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush031', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush032
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3200
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush032', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush033
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3300
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush033', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush034
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3400
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush034', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush035
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3500
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush035', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush036
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3600
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush036', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush037
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3700
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush037', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush038
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3800
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush038', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush039
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3900
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush039', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush040
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4000
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush040', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush041
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4100
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush041', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush042
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4200
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush042', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush043
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4300
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush043', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush044
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4400
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush044', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush045
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4500
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush045', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush046
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4600
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush046', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush047
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4700
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush047', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush048
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4800
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush048', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush049
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4900
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush049', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush050
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5000
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush050', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush051
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5100
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush051', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush052
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5200
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush052', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush053
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5300
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush053', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush054
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5400
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush054', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush055
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5500
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush055', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush056
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5600
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush056', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush057
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5700
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush057', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush058
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5800
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush058', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush059
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5900
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush059', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush060
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6000
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush060', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush061
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6100
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush061', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush062
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6200
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush062', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush063
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6300
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush063', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush064
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6400
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush064', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFlush065
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6500
     * @tc.desc   test OH_VideoEncoder_Flush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFlush065', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0100
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderReset002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0200
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(2,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderReset003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0300
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0400
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset004', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,1,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset004 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderReset005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0500
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset005', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0600
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset006', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset006 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderReset007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0700
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset007', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0800
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset008', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,0,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset008 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderReset009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0900
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset009', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset010
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1000
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset010', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,1,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset010 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderReset011
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1100
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset011', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset012
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1200
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset012', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,1,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset012 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderReset013
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1300
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset013', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset014
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1400
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset014', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset014 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderReset015
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1500
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset015', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset016
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1600
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset016', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,0,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset016 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderReset017
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1700
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset017', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset018
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1800
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset018', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset019
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1900
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset019', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset020
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2000
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset020', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset021
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2100
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset021', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset022
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2200
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset022', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset023
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2300
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset023', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset024
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2400
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset024', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset025
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2500
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset025', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset026
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2600
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset026', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset027
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2700
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset027', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset028
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2800
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset028', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset029
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2900
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset029', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset030
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3000
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset030', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset031
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3100
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset031', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset032
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3200
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset032', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset033
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3300
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset033', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset034
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3400
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset034', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset035
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3500
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset035', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset036
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3600
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset036', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset037
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3700
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset037', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset038
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3800
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset038', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset039
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3900
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset039', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset040
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4000
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset040', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset041
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4100
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset041', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset042
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4200
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset042', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset043
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4300
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset043', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset044
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4400
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset044', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset045
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4500
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset045', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset046
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4600
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset046', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset047
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4700
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset047', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset048
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4800
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset048', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset049
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4900
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset049', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset050
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5000
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset050', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset051
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5100
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset051', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset052
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5200
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset052', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset053
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5300
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset053', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset054
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5400
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset054', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset055
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5500
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset055', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset056
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5600
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset056', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset057
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5700
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset057', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset058
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5800
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset058', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset059
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_5900
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset059', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset060
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_6000
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset060', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset061
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_6100
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset061', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset062
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_6200
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset062', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset063
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_6300
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset063', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset064
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_6400
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset064', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderReset065
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_6500
     * @tc.desc   test OH_VideoEncoder_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderReset065', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_0100
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription001', Level.LEVEL0, async (done: Function) => {
        try{
            let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetOutputDescription001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_0200
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(2,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetOutputDescription002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_0300
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription004
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_0400
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription004', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,1,1,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetOutputDescription004 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription005
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_0500
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription005', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription006
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_0600
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription006', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,1,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetOutputDescription006 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription007
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_0700
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription007', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription008
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_0800
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription008', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,1,0,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetOutputDescription008 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription009
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_0900
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription009', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription010
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1000
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription010', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,0,1,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetOutputDescription010 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription011
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1100
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription011', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription012
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1200
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription012', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,0,1,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetOutputDescription012 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription013
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1300
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription013', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription014
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1400
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription014', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,0,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetOutputDescription014 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription015
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1500
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription015', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription016
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1600
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription016', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,0,0,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetOutputDescription016 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription017
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1700
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription017', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription018
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1800
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription018', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription019
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_1900
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription019', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription020
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2000
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription020', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription021
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2100
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription021', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription022
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2200
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription022', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription023
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2300
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription023', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription024
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2400
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription024', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription025
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2500
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription025', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription026
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2600
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription026', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription027
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2700
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription027', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription028
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2800
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription028', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription029
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_2900
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription029', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription030
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3000
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription030', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription031
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3100
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription031', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription032
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3200
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription032', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription033
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3300
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription033', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(1,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription034
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3400
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription034', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription035
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3500
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription035', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription036
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3600
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription036', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription037
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3700
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription037', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription038
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3800
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription038', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription039
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_3900
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription039', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription040
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4000
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription040', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription041
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4100
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription041', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription042
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4200
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription042', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription043
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4300
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription043', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription044
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4400
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription044', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription045
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4500
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription045', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription046
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4600
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription046', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription047
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4700
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription047', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription048
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4800
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription048', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription049
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_4900
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription049', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription050
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5000
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription050', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription051
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5100
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription051', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription052
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5200
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription052', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription053
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5300
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription053', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription054
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5400
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription054', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription055
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5500
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription055', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription056
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5600
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription056', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription057
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5700
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription057', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription058
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5800
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription058', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription059
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_5900
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription059', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription060
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_6000
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription060', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription061
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_6100
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription061', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription062
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_6200
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription062', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription063
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_6300
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription063', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription064
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_6400
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription064', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetOutputDescription065
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETOUTPUTDESCRIPTION_6500
     * @tc.desc   test OH_VideoEncoder_GetOutputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetOutputDescription065', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetOutputDescription(0,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderSetParameter001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_SETPARAMETER_0100
     * @tc.desc   test OH_VideoEncoder_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderSetParameter001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderSetParameter();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderSetParameter001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderSetParameter002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_SETPARAMETER_0200
     * @tc.desc   test OH_VideoEncoder_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderSetParameter002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderSetParameterHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderSetParameter002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderSetParameter003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_SETPARAMETER_0300
     * @tc.desc   test OH_VideoEncoder_SetParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderSetParameter003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderSetParameterAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderGetInputDescription001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETINPUTDESCRIPTION_0100
     * @tc.desc   test OH_VideoEncoder_GetInputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetInputDescription001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetInputDescription();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetInputDescription001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetInputDescription002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETINPUTDESCRIPTION_0200
     * @tc.desc   test OH_VideoEncoder_GetInputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetInputDescription002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderGetInputDescriptionHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderGetInputDescription002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderGetInputDescription003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_GETINPUTDESCRIPTION_0300
     * @tc.desc   test OH_VideoEncoder_GetInputDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderGetInputDescription003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderGetInputDescriptionAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderIsValid001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_ISVALID_0100
     * @tc.desc   test OH_VideoEncoder_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderIsValid001', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderIsValid();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderIsValid001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderIsValid002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_ISVALID_0200
     * @tc.desc   test OH_VideoEncoder_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderIsValid002', Level.LEVEL0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderIsValidHEVC();
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderIsValid002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.name   testOHVideoEncoderIsValid003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_ISVALID_0300
     * @tc.desc   test OH_VideoEncoder_IsValid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderIsValid003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderIsValidAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPushInputBuffer001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PUSHINPUTBUFFER_0100
     * @tc.desc   test OH_VideoEncoder_PushInputBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPushInputBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPushInputBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPushInputBuffer002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PUSHINPUTBUFFER_0200
     * @tc.desc   test OH_VideoEncoder_PushInputBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPushInputBuffer002', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPushInputBufferHEVC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderPushInputBuffer003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_PUSHINPUTBUFFER_0300
     * @tc.desc   test OH_VideoEncoder_PushInputBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderPushInputBuffer003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderPushInputBufferAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFreeOutputBuffer001
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FREEOUTPUTBUFFER_0100
     * @tc.desc   test OH_VideoEncoder_FreeOutputBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFreeOutputBuffer001', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFreeOutputBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFreeOutputBuffer002
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FREEOUTPUTBUFFER_0200
     * @tc.desc   test OH_VideoEncoder_FreeOutputBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFreeOutputBuffer002', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFreeOutputBufferHEVC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHVideoEncoderFreeOutputBuffer003
     * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FREEOUTPUTBUFFER_0300
     * @tc.desc   test OH_VideoEncoder_FreeOutputBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHVideoEncoderFreeOutputBuffer003', Level.LEVEL0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFreeOutputBufferAbnormal();
      expect(result).assertEqual(0);
      done();
    });
  })
}