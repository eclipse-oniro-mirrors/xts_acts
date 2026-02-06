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
import videodecoderndk from 'libvideodecoderndk.so'

export default function videoDeCoderNdkTest() {
    describe('AvcodecVideoDecoderTest', () => {

        /**
         * @tc.name   testOHVideoDecoderCreateByMime001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_CREATEBYMIME_0100
         * @tc.desc   test OH_VideoDecoder_CreateByMime
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderCreateByMime001', Level.LEVEL0, async (done: Function) => {
            try { 
                let result: number = videodecoderndk.oHVideoDecoderCreateByMime();
                expect(result != null).assertTrue();
                done();
            } catch (err) {
                console.info('testOHVideoDecoderCreateByMime001 failed, error is' + err.message);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.name   testOHVideoDecoderCreateByName001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_CREATEBYNAME_0100
         * @tc.desc   test OH_VideoDecoder_CreateByName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderCreateByName001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderCreateByName();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderDestroy001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_DESTROY_0100
         * @tc.desc   test OH_VideoDecoder_Destroy
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderDestroy001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderDestroy();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderSetCallback001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_SETCALLBACK_0100
         * @tc.desc   test OH_VideoDecoder_SetCallback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderSetCallback001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderSetCallback();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderRegisterCallback001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_REGISTERCALLBACK_0100
         * @tc.desc   test OH_VideoDecoder_RegisterCallback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderRegisterCallback001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderRegisterCallback();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderConfigure001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_CONFIGURE_0100
         * @tc.desc   test OH_VideoDecoder_Configure
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderConfigure001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderConfigure();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderPrepare001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_PREPARE_0100
         * @tc.desc   test OH_VideoDecoder_Prepare
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderPrepare001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderPrepare();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0100
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 1, 1, 1, 1);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart002
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0200
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart002', Level.LEVEL0, async (done: Function) => {
            try {
                let result: number = videodecoderndk.oHVideoDecoderStart(2, 1, 1, 1, 1, 1);
                expect(result != null).assertTrue();
                done();
            } catch (err) {
                console.info('testOHVideoDecoderStart002 failed, error is' + err.message);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.name   testOHVideoDecoderStart003
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0300
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart003', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart004
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0400
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart004', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 1, 0, 1, 0);
            expect(result).assertEqual(-1);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart005
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0500
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart005', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart006
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0600
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart006', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart007
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0700
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart007', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart008
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0800
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart008', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart009
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_0900
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart009', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart010
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1000
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart010', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart011
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1100
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart011', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart012
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1200
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart012', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart013
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1300
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart013', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart014
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1400
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart014', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart015
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1500
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart015', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart016
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1600
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart016', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart017
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1700
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart017', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart018
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1800
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart018', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart019
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_1900
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart019', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart020
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2000
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart020', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart021
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2100
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart021', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart022
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2200
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart022', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart023
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2300
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart023', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart024
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2400
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart024', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart025
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2500
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart025', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart026
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2600
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart026', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart027
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2700
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart027', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart028
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2800
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart028', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart029
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_2900
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart029', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart030
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_3000
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart030', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart031
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_3100
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart031', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart032
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_3200
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart032', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStart033
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_START_3300
         * @tc.desc   test OH_VideoDecoder_Start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStart033', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStart(0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0100
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 1, 1, 1, 1);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop002
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0200
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop002', Level.LEVEL0, async (done: Function) => {
            try { 
                let result: number = videodecoderndk.oHVideoDecoderStop(2, 1, 1, 1, 1, 1, 1);
                expect(result != null).assertTrue();
                done();
            } catch (err) {
                console.info('testOHVideoDecoderStop002 failed, error is' + err.message);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.name   testOHVideoDecoderStop003
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0300
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop003', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop004
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0400
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop004', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 1, 0, 1, 1);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop005
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0500
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop005', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop006
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0600
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop006', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(-1);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop007
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0700
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop007', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop008
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0800
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop008', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 0, 0, 1, 1);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop009
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_0900
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop009', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop010
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1000
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop010', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop011
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1100
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop011', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop012
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1200
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop012', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop013
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1300
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop013', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop014
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1400
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop014', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop015
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1500
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop015', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop016
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1600
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop016', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop017
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1700
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop017', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop018
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1800
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop018', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop019
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_1900
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop019', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop020
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2000
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop020', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop021
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2100
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop021', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop022
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2200
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop022', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop023
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2300
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop023', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop024
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2400
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop024', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop025
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2500
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop025', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop026
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2600
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop026', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop027
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2700
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop027', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop028
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2800
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop028', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop029
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_2900
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop029', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop030
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3000
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop030', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop031
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3100
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop031', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop032
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3200
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop032', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop033
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3300
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop033', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(1, 0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop034
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3400
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop034', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop035
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3500
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop035', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop036
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3600
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop036', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop037
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3700
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop037', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop038
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3800
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop038', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop039
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_3900
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop039', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop040
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4000
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop040', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop041
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4100
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop041', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop042
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4200
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop042', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop043
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4300
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop043', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop044
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4400
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop044', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop045
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4500
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop045', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop046
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4600
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop046', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop047
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4700
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop047', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop048
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4800
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop048', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop049
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_4900
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop049', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop050
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5000
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop050', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop051
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5100
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop051', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop052
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5200
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop052', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop053
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5300
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop053', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop054
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5400
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop054', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop055
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5500
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop055', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop056
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5600
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop056', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop057
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5700
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop057', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop058
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5800
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop058', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop059
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_5900
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop059', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop060
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6000
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop060', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop061
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6100
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop061', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop062
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6200
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop062', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop063
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6300
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop063', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop064
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6400
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop064', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderStop065
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_STOP_6500
         * @tc.desc   test OH_VideoDecoder_Stop
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderStop065', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderStop(0, 0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0100
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 1, 1, 1, 1);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush002
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0200
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush002', Level.LEVEL0, async (done: Function) => {
            try { 
                let result: number = videodecoderndk.oHVideoDecoderFlush(2, 1, 1, 1, 1, 1, 1);
                expect(result != null).assertTrue();
                done();
            } catch (err) {
                console.info('testOHVideoDecoderFlush002 failed, error is' + err.message);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.name   testOHVideoDecoderFlush003
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0300
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush003', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush004
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0400
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush004', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush005
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0500
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush005', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush006
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0600
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush006', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(-1);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush007
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0700
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush007', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush008
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0800
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush008', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush009
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0900
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush009', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush010
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1000
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush010', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush011
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1100
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush011', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush012
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1200
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush012', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush013
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1300
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush013', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush014
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1400
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush014', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush015
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1500
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush015', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush016
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1600
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush016', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush017
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1700
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush017', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush018
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1800
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush018', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush019
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1900
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush019', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush020
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2000
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush020', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush021
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2100
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush021', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush022
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2200
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush022', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush023
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2300
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush023', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush024
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2400
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush024', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush025
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2500
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush025', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush026
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2600
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush026', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush027
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2700
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush027', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush028
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2800
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush028', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush029
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2900
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush029', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush030
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3000
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush030', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush031
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3100
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush031', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush032
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3200
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush032', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush033
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3300
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush033', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush034
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3400
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush034', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush035
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3500
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush035', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush036
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3600
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush036', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush037
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3700
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush037', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush038
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3800
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush038', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush039
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3900
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush039', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush040
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4000
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush040', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush041
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4100
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush041', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush042
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4200
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush042', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush043
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4300
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush043', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush044
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4400
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush044', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush045
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4500
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush045', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush046
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4600
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush046', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush047
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4700
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush047', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush048
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4800
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush048', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush049
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4900
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush049', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush050
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5000
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush050', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush051
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5100
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush051', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush052
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5200
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush052', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush053
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5300
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush053', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush054
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5400
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush054', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush055
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5500
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush055', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush056
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5600
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush056', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush057
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5700
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush057', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush058
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5800
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush058', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush059
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5900
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush059', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush060
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6000
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush060', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush061
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6100
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush061', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush062
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6200
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush062', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush063
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6300
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush063', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush064
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6400
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush064', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFlush065
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6500
         * @tc.desc   test OH_VideoDecoder_Flush
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFlush065', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderReset001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_RESET_0100
         * @tc.desc   test OH_VideoDecoder_Reset
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderReset001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderReset();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderGetOutputDescription001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_GETOUTPUTDESCRIPTION_0100
         * @tc.desc   test OH_VideoDecoder_GetOutputDescription
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderGetOutputDescription001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderGetOutputDescription();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderSetParameter001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_SETPARAMETER_0100
         * @tc.desc   test OH_VideoDecoder_SetParameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderSetParameter001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderSetParameter();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderIsValid001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_ISVALID_0100
         * @tc.desc   test OH_VideoDecoder_IsValid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderIsValid001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderIsValid();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderPushInputBuffer001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_PUSHINPUTBUFFER_0100
         * @tc.desc   test OH_VideoDecoder_PushInputBuffer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderPushInputBuffer001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderPushInputBuffer();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderFreeOutputBuffer001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FREEOUTPUTBUFFER_0100
         * @tc.desc   test OH_VideoDecoder_FreeOutputBuffer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderFreeOutputBuffer001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFreeOutputBuffer();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.name   testOHVideoDecoderRenderOutputBuffer001
         * @tc.number SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_RENDEROUTPUTBUFFER_0100
         * @tc.desc   test OH_VideoDecoder_RenderOutputBuffer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOHVideoDecoderRenderOutputBuffer001', Level.LEVEL0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderRenderOutputBuffer();
            expect(result).assertEqual(0);
            done();
        });
    })
}