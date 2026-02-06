/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import fileio from '@ohos.fileio'
import * as mediaTestBase from '../../../../../../MediaTestBase';
import * as AVPlayerTestBase from '../../../../../../AVPlayerTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function AVPlayerStabilityTest() {
    describe('AVPlayerStabilityTest', function () {

        const VIDEO_SOURCES = [
            'H264_AAC.mp4',
            'h264_mp3_128x96_30r.mp4',
            'h263_aac.mp4',
            'h263_mp3.mp4',
            'MPEG2_AAC.mp4',
            'MPEG2_MP3.mp4',
            'h264_1280x720_30.mp4',
            'H263.mp4',
            'MPEG2.mp4',
            'h264_aac_480p_25r.ts',
            'h264_mp3_480p_25r.ts',
            'H263_AAC.ts',
            'H263_MP3.ts',
            'mpeg2_aac_720p_30r.ts',
            'mpeg2_mp3_480p_25r.ts',
            'mpeg4_aac_720p_30r.ts',
            'mpeg4_mp3_480p_25r.ts',
            'h264_320x240_60.ts',
            'h263_1408x1152_30.ts',
            'MPEG2.ts',
            'mpeg4_320x240_60.ts',
            'vp8_vorbis_480p_25r.webm',
            'vp8_720x480_60.webm',
            'H264_AAC.mkv',
            'H264_MP3.mkv',
            'h263_aac_640x480_30r.mkv',
            'h263_mp3_176x144_25r.mkv',
            'MPEG2_AAC.mkv',
            'MPEG2_MP3.mkv',
            'mpeg4_aac_720p_30r.mkv',
            'MPEG4_MP3.mkv',
            'h264_320x240_30.mkv',
            'h263_1408x1152_60.mkv',
            'MPEG2.mkv',
            'mpeg4_320x240_60.mkv',
            'AAC_48000_32_1.aac',
            '01.mp3',
            '56.m4a',
            'OGG_48000_1.ogg',
            'vorbis_48000_32_1.wav',
            'flac_48ksr_16kbr_1ch.flac',
            'hevc_320x240_60.mp4',
            'H264_MP3_1s.mp4',
            'h264_aac_3840_2160.mp4'
        ]
        let videos = [];
        let TAG = "[AVPlayerStabilityTest] ";
        let callBackSet = 0;
        let avPlayer = null;
        let fileDescriptor = null;
        let fdHead = 'fd://';
        let fdPath = '';
        let fdNumber = 0;
        let fdNumbers = []
        const PLAY_TIME = 2;

        beforeAll(async function () {
            console.info('beforeAll case');
            for(var i = 0;i < VIDEO_SOURCES.length; i++){
                await getStageFdRead(VIDEO_SOURCES[i]).then((testNumber) => {
                    fdNumber = testNumber;
                    console.info(TAG + 'this fdNumber is :' + fdNumber)
                    fdPath = fdHead + '' + fdNumber;
                    fdNumbers.push(fdNumber)
                    videos.push(fdPath)
                })
            }
        })

        async function getStageFdRead(pathName) {
            let fdReturn;
            let contextStage = globalThis.context;
            let fileDir = contextStage.filesDir
            console.info("case file dir is" + JSON.stringify(fileDir));
            pathName = fileDir + '/' + pathName;
            console.info("case pathName is" + pathName);
            await fileio.open(pathName).then((fdNumber) => {
                fdReturn = fdNumber;
                console.info('[fileio]case open fd success, fd is ' + fdReturn);
            })
            return fdReturn;
        }


        beforeEach(async function() {
            console.info('beforeEach case');
            await AVPlayerTestBase.sleep(1000);
        })

        afterEach(async function() {
            if (avPlayer != null) {
                avPlayer.release().then(() => {
                    console.info(TAG + 'this testCase execution completed')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            console.info('afterEach case');
            await AVPlayerTestBase.sleep(1000);
        })

        afterAll(async function() {
            console.info('afterAll case');
            for(var i = 0;i < fdNumbers.length; i++){
                await mediaTestBase.closeFdNumber(fdNumbers[i]);
            }
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0100
            * @tc.name      : 001.test play pause loop 1000 (waiting for callback)
            * @tc.desc      : Local Video play to pause 1000 times (waiting for callback)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0100 start')
            AVPlayerTestBase.avPlayerWithCallBack(videos[0], avPlayer, PLAY_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0200
            * @tc.name      : 001.test play pause loop 1000 (do not wait for callback)
            * @tc.desc      : Local Video play to pause 1000 times (do not wait for callback)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0200 start')
            AVPlayerTestBase.avPlayerWithoutCallBack(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0100
            * @tc.name      : 001.test play source mp4(H264_AAC)
            * @tc.desc      : Local Video play source (H264_AAC)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0200
            * @tc.name      : 001.test play source (H264_MP3)
            * @tc.desc      : Local Video play source (H264_MP3)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0200 start')
            AVPlayerTestBase.avPlayerPlay(videos[1], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0300
            * @tc.name      : 001.test play source mp4 (H263_AAC)
            * @tc.desc      : Local Video play source (H263_AAC)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0300', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0300 start')
            AVPlayerTestBase.avPlayerPlay(videos[2], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0400
            * @tc.name      : 001.test play source (H263_MP3)
            * @tc.desc      : Local Video play source (H263_MP3)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0400', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0400 start')
            AVPlayerTestBase.avPlayerPlay(videos[3], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0500
            * @tc.name      : 001.test play source (MPEG2_AAC)
            * @tc.desc      : Local Video play source (MPEG2_AAC)
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0500', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0500 start')
            AVPlayerTestBase.avPlayerPlay(videos[4], avPlayer,done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0500 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0600
           * @tc.name      : 001.test play source (MPEG2_MP3)
           * @tc.desc      : Local Video play source (MPEG2_MP3)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0600', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0600 start')
            AVPlayerTestBase.avPlayerPlay(videos[5], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0600 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0700
           * @tc.name      : 001.test play source (MPEG2_MP3)
           * @tc.desc      : Local Video play source (MPEG2_MP3)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0700', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0700 start')
            AVPlayerTestBase.avPlayerPlay(videos[6], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0700 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0800
           * @tc.name      : 001.test play source (h263.mov)
           * @tc.desc      : Local Video play source (h263.mov)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0800', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0800 start')
            AVPlayerTestBase.avPlayerPlay(videos[7], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0800 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0900
           * @tc.name      : 001.test play source (mpeg2.mkv)
           * @tc.desc      : Local Video play source (mpeg2.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0900', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0900 start')
            AVPlayerTestBase.avPlayerPlay(videos[8], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP4_0900 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0100
           * @tc.name      : 001.test play source (h264_aac.ts)
           * @tc.desc      : Local Video play source (h264_aac.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[9], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0200
           * @tc.name      : 001.test play source (h264_mp3.ts)
           * @tc.desc      : Local Video play source (h264_mp3.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0200 start')
            AVPlayerTestBase.avPlayerPlay(videos[10], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0300
           * @tc.name      : 001.test play source (h263_aac.ts)
           * @tc.desc      : Local Video play source (h263_aac.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0300', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0300 start')
            AVPlayerTestBase.avPlayerPlay(videos[11], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0300 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0400
           * @tc.name      : 001.test play source (h263_mp3.ts)
           * @tc.desc      : Local Video play source (h263_mp3.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0400', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0400 start')
            AVPlayerTestBase.avPlayerPlay(videos[12], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0400 end')
        })


        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0500
           * @tc.name      : 001.test play source (mpeg2_aac.ts)
           * @tc.desc      : Local Video play source (mpeg2_aac.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0500', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0500 start')
            AVPlayerTestBase.avPlayerPlay(videos[13], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0500 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0600
           * @tc.name      : 001.test play source (mpeg2_mp3.ts)
           * @tc.desc      : Local Video play source (mpeg2_mp3.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0600', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0600 start')
            AVPlayerTestBase.avPlayerPlay(videos[14], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0600 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0700
           * @tc.name      : 001.test play source (mpeg4_aac.ts)
           * @tc.desc      : Local Video play source (mpeg4_aac.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0700', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0700 start')
            AVPlayerTestBase.avPlayerPlay(videos[15], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0700 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0800
           * @tc.name      : 001.test play source (mpeg4_mp3.ts)
           * @tc.desc      : Local Video play source (mpeg4_mp3.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0800', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0800 start')
            AVPlayerTestBase.avPlayerPlay(videos[16], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0800 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0900
           * @tc.name      : 001.test play source (h264.ts)
           * @tc.desc      : Local Video play source (h264.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0900', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0900 start')
            AVPlayerTestBase.avPlayerPlay(videos[17], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_0900 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1000
           * @tc.name      : 001.test play source (h263.ts)
           * @tc.desc      : Local Video play source (h263.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1000', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1000 start')
            AVPlayerTestBase.avPlayerPlay(videos[18], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1000 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1100
           * @tc.name      : 001.test play source (mpeg2.ts)
           * @tc.desc      : Local Video play source (mpeg2.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1100 start')
            AVPlayerTestBase.avPlayerPlay(videos[19], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1200
           * @tc.name      : 001.test play source (mpeg4.ts)
           * @tc.desc      : Local Video play source (mpeg4.ts)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1200 start')
            AVPlayerTestBase.avPlayerPlay(videos[20], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_TS_1200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WEBM_0100
           * @tc.name      : 001.test play source (vp8_vorbis.webm)
           * @tc.desc      : Local Video play source (vp8_vorbis.webm)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WEBM_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WEBM_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[21], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WEBM_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WEBM_0200
           * @tc.name      : 001.test play source (vp8.webm)
           * @tc.desc      : Local Video play source (vp8.webm)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WEBM_0200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WEBM_0200 start')
            AVPlayerTestBase.avPlayerPlay(videos[22], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WEBM_0200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0100
           * @tc.name      : 001.test play source (H264_AAC.mkv)
           * @tc.desc      : Local Video play source (H264_AAC.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[23], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0200
           * @tc.name      : 001.test play source (H264_MP3.mkv)
           * @tc.desc      : Local Video play source (H264_MP3.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0200 start')
            AVPlayerTestBase.avPlayerPlay(videos[24], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0300
           * @tc.name      : 001.test play source (H263_AAC.mkv)
           * @tc.desc      : Local Video play source (H263_AAC.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0300', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0300 start')
            AVPlayerTestBase.avPlayerPlay(videos[25], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0300 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0400
           * @tc.name      : 001.test play source (H263_MP3.mkv)
           * @tc.desc      : Local Video play source (H263_MP3.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0400', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0400 start')
            AVPlayerTestBase.avPlayerPlay(videos[26], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0400 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0500
           * @tc.name      : 001.test play source (MPEG2_AAC.mkv)
           * @tc.desc      : Local Video play source (MPEG2_AAC.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0500', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0500 start')
            AVPlayerTestBase.avPlayerPlay(videos[27], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0500 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0600
           * @tc.name      : 001.test play source (mpeg2_mp3.mkv)
           * @tc.desc      : Local Video play source (mpeg2_mp3.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0600', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0600 start')
            AVPlayerTestBase.avPlayerPlay(videos[28], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0600 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0700
           * @tc.name      : 001.test play source (mpeg4_aac.mkv)
           * @tc.desc      : Local Video play source (mpeg4_aac.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0700', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0700 start')
            AVPlayerTestBase.avPlayerPlay(videos[29], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0700 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0800
           * @tc.name      : 001.test play source (MPEG4_MP3.mkv)
           * @tc.desc      : Local Video play source (MPEG4_MP3.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0800', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0800 start')
            AVPlayerTestBase.avPlayerPlay(videos[30], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0800 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0900
           * @tc.name      : 001.test play source (h264.mkv)
           * @tc.desc      : Local Video play source (h264.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0900', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0900 start')
            AVPlayerTestBase.avPlayerPlay(videos[31], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_0900 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1000
           * @tc.name      : 001.test play source (h263.mkv)
           * @tc.desc      : Local Video play source (h263.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1000', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1000 start')
            AVPlayerTestBase.avPlayerPlay(videos[32], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1000 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1100
           * @tc.name      : 001.test play source (MPEG2.mkv)
           * @tc.desc      : Local Video play source (MPEG2.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1100 start')
            AVPlayerTestBase.avPlayerPlay(videos[33], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1200
           * @tc.name      : 001.test play source (mpeg4.mkv)
           * @tc.desc      : Local Video play source (mpeg4.mkv)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1200 start')
            AVPlayerTestBase.avPlayerPlay(videos[34], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MKV_1200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_AAC_0100
           * @tc.name      : 001.test play source (aac_audio.aac)
           * @tc.desc      : Local Video play source (aac_audio.aac)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_AAC_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_AAC_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[35], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_AAC_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP3_0100
           * @tc.name      : 001.test play source (MP3_AUDIO.mp3)
           * @tc.desc      : Local Video play source (MP3_AUDIO.mp3)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP3_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP3_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[36], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_MP3_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_M4A_0100
           * @tc.name      : 001.test play source (m4a_audio.m4a)
           * @tc.desc      : Local Video play source (m4a_audio.m4a)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_M4A_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_M4A_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[37], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_M4A_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_OGG_0100
           * @tc.name      : 001.test play source (ogg_audio.ogg)
           * @tc.desc      : Local Video play source (ogg_audio.ogg)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_OGG_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_OGG_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[38], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_OGG_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WAV_0100
           * @tc.name      : 001.test play source (wav_audio.wav)
           * @tc.desc      : Local Video play source (wav_audio.wav)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WAV_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WAV_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[39], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_WAV_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_FLAC_0100
           * @tc.name      : 001.test play source (flac_audio.flac)
           * @tc.desc      : Local Video play source (flac_audio.flac)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_FLAC_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_FLAC_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[40], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_FLAC_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0100
           * @tc.name      : 001.test play source 60fps
           * @tc.desc      : Local Video play source
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0100 start')
            AVPlayerTestBase.avPlayerPlay(videos[41], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0100 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0200
           * @tc.name      : 001.test play short source 1s
           * @tc.desc      : Local Video play short source
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0200 start')
            AVPlayerTestBase.avPlayerPlay(videos[42], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0200 end')
        })


        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0300
           * @tc.name      : 001.test play source 4k
           * @tc.desc      : Local Video play source
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0300', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0300 start')
            AVPlayerTestBase.avPlayerPlay(videos[43], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_FORMAT_SOURCE_0300 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0100
           * @tc.name      : 001.test create->release (1000 times)
           * @tc.desc      : Local Video play create->release (1000 times)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0100 start')
            AVPlayerTestBase.createToRelease(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0200
            * @tc.name      : 001.test play pause loop 1000
            * @tc.desc      : Local Video play to pause 1000 times
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0200 start')
            AVPlayerTestBase.avPlayerWithCallBack(videos[0], avPlayer, PLAY_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0400
           * @tc.name      : 001.test play->seek (1000 times wait callBack)
           * @tc.desc      : Local Video play->seek (1000 times)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0400', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0400 start')
            AVPlayerTestBase.seekLoop(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0400 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0500
           * @tc.name      : 001.test play->seek (1000 times do not wait callBack)
           * @tc.desc      : Local Video play->seek (1000 times)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0500', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0500 start')
            AVPlayerTestBase.seekLoopWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0500 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0600
           * @tc.name      : 001.test stop -> prepare (1000 times)
           * @tc.desc      : Local Video test stop -> prepare (1000 times)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0600', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0600 start')
            AVPlayerTestBase.prepareToStop(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0600 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0700
           * @tc.name      : 001.test reset -> url -> preapre -> play -> reset (1000 times)
           * @tc.desc      : Local Video test reset -> url -> preapre -> play -> reset (1000 times)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0700', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0700 start')
            AVPlayerTestBase.prepareToReset(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0700 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0800
           * @tc.name      : 001.test release -> create-> url -> prepare -> play -> release (1000 times)
           * @tc.desc      : Local Video test release -> create-> url -> prepare -> play -> release (1000 times)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0800', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0800 start')
            AVPlayerTestBase.createToRelease2(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_STABILITY_01_0800 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0110
           * @tc.name      : 001.test create time (not wait callback)
           * @tc.desc      : Local Video test create time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0110', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0110 start')
            AVPlayerTestBase.createTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0110 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0200
           * @tc.name      : 001.test prepare time (not wait callback)
           * @tc.desc      : Local Video test prepare time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0200 start')
            AVPlayerTestBase.prepareTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0210
           * @tc.name      : 001.test prepare time (not wait callback)
           * @tc.desc      : Local Video test prepare time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0210', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0210 start')
            AVPlayerTestBase.prepareTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0210 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0300
           * @tc.name      : 001.test play time (wait callback)
           * @tc.desc      : Local Video test play time (wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0300', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0300 start')
            AVPlayerTestBase.playTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0300 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0310
           * @tc.name      : 001.test play time (not wait callback)
           * @tc.desc      : Local Video play prepare time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0310', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0310 start')
            AVPlayerTestBase.playTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0310 end')
        })


        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0300
           * @tc.name      : 001.test pause time (wait callback)
           * @tc.desc      : Local Video test pause time (wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0400', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0400 start')
            AVPlayerTestBase.pauseTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0400 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0410
           * @tc.name      : 001.test pause time (not wait callback)
           * @tc.desc      : Local Video pause prepare time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0410', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0410 start')
            AVPlayerTestBase.pauseTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0410 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0500
           * @tc.name      : 001.test stop time (wait callback)
           * @tc.desc      : Local Video test stop time (wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0500', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0500 start')
            AVPlayerTestBase.stopTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0500 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0510
           * @tc.name      : 001.test stop time (not wait callback)
           * @tc.desc      : Local Video stop prepare time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0510', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0510 start')
            AVPlayerTestBase.stopTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0510 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0600
           * @tc.name      : 001.test reset time (wait callback)
           * @tc.desc      : Local Video test reset time (wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0600', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0600 start')
            AVPlayerTestBase.resetTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0600 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0610
           * @tc.name      : 001.test reset time (not wait callback)
           * @tc.desc      : Local Video reset prepare time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0610', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0610 start')
            AVPlayerTestBase.resetTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0610 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0700
           * @tc.name      : 001.test release time (wait callback)
           * @tc.desc      : Local Video test release time (wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0700', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0700 start')
            AVPlayerTestBase.releaseTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0700 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0710
           * @tc.name      : 001.test release time (not wait callback)
           * @tc.desc      : Local Video release prepare time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0710', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0710 start')
            AVPlayerTestBase.releaseTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0710 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0800
           * @tc.name      : 001.test seek time (wait callback)
           * @tc.desc      : Local Video test seek time (wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0800', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0800 start')
            AVPlayerTestBase.seekTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0800 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0810
           * @tc.name      : 001.test seek time (not wait callback)
           * @tc.desc      : Local Video seek prepare time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0810', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0810 start')
            AVPlayerTestBase.seekTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0810 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0900
           * @tc.name      : 001.test getTrackDescription time (wait callback)
           * @tc.desc      : Local Video test getTrackDescription time (wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0900', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0900 start')
            AVPlayerTestBase.getTrackDescriptionTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0900 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0910
           * @tc.name      : 001.test getTrackDescription time (not wait callback)
           * @tc.desc      : Local Video test getTrackDescription time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0910', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0910 start')
            AVPlayerTestBase.getTrackDescriptionTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_0910 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1000
           * @tc.name      : 001.test setSpeed time (wait callback)
           * @tc.desc      : Local Video test setSpeed time (wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1000', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1000 start')
            AVPlayerTestBase.setSpeedTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1000 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1010
           * @tc.name      : 001.test setSpeed time (not wait callback)
           * @tc.desc      : Local Video test setSpeed time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1010', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1010 start')
            AVPlayerTestBase.setSpeedTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1010 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1110
           * @tc.name      : 001.test setBitrate time (not wait callback)
           * @tc.desc      : Local Video test setBitrate time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1110', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1110 start')
            AVPlayerTestBase.setBitrateTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1110 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1200
           * @tc.name      : 001.test setVolume time (wait callback)
           * @tc.desc      : Local Video test setVolume time (wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1200', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1200 start')
            AVPlayerTestBase.setVolumeTimeWithCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1210
           * @tc.name      : 001.test setVolume time (not wait callback)
           * @tc.desc      : Local Video test setVolume time (not wait callback)
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1210', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1210 start')
            AVPlayerTestBase.setVolumeTimeWithoutCallback(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_01_1210 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_02_0100
           * @tc.name      : 001.test firstFrame time
           * @tc.desc      : Local Video test firstFrame time
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level3
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_02_0100', Level.LEVEL0,async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_02_0100 start')
            AVPlayerTestBase.firstFrameTime(videos[0], avPlayer, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVPLAYER_PERFORMANCE_02_0100 end')
        })
    })
}