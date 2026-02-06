/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import media from '@ohos.multimedia.media'
import fileio from '@ohos.fileio'
import { testAVPlayerDataSrcNoSeek, testAVPlayerFun } from '../../../../../../AVPlayerTestBase.js';
import * as mediaTestBase from '../../../../../../MediaTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function AVPlayerDataSrcNoSeekCompatibilityTest() {
    describe('AVPlayerDataSrcNoSeekCompatibilityTest', function () {
        const PLAY_TIME = 3000;
        let avPlayer = null;
        let avPlayTest = {
            width: 0,
            height: 0,
            duration: -1,
        }
        let pathDir = globalThis.abilityContext.filesDir;
        let filePath = pathDir + "/01.mp3";
        let stream = null;
        let fd = null;
        let srcNoSeek = {
            fileSize: -1,
            callback: readAtNoSeek
        }
        beforeAll(async function () {
            console.info('beforeAll case');
        })

        beforeEach(async function () {
            console.info('beforeEach case');
        })

        afterEach(async function () {
            console.info('afterEach case');
        })

        afterAll(async function () {
            console.info('afterAll case');
            if (avPlayer != null) {
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
        })

        function readAtNoSeek(buf, length) {
            console.info(' readAt length:' + length);
            let num = 0;
            if (buf == undefined || length == undefined) {
                expect().assertFail();
                return -1;
            }
            num = fileio.readSync(fd, buf, { offset: 0, length: length });
            console.info('case  readAt num:' + num);
            if (num == 0) {
                fileio.closeSync(fd);
                fd = fileio.openSync(filePath, 0o0);
            }
            if (num > 0) {
                return num;
            }
            return -1;
        }

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_MP3_0100
            * @tc.name      : 0100.mp3
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_MP3_0100', Level.LEVEL0,async function (done) {
            filePath = pathDir + "/01_15s.mp3";
            console.info(`case filePath is ${filePath}`);
            fd = fileio.openSync(filePath, 0o0);
            avPlayTest = { width: 0, height: 0, duration: 0 };
            await testAVPlayerDataSrcNoSeek(srcNoSeek, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_AAC_0100
            * @tc.name      : 0100.aac_48ksr_16kbr_1ch 
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_AAC_0100', Level.LEVEL0,async function (done) {
            filePath = pathDir + "/aac_48ksr_16kbr_1ch.aac";
            console.info(`case filePath is ${filePath}`);
            fd = fileio.openSync(filePath, 0o0);
            avPlayTest = { width: 0, height: 0, duration: 0 };
            await testAVPlayerDataSrcNoSeek(srcNoSeek, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_OGG_0100
            * @tc.name      : 0100.vorbis_48ksr_32kbr_1ch 
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_OGG_0100', Level.LEVEL0,async function (done) {
            filePath = pathDir + "/vorbis_48ksr_32kbr_1ch.ogg";
            console.info(`case filePath is ${filePath}`);
            fd = fileio.openSync(filePath, 0o0);
            avPlayTest = { width: 0, height: 0, duration: 0 };
            await testAVPlayerDataSrcNoSeek(srcNoSeek, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_WAV_0100
            * @tc.name      : 0100.pcm_96ksr_64kbr_2ch 
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_WAV_0100', Level.LEVEL0,async function (done) {
            filePath = pathDir + "/pcm_96ksr_64kbr_2ch.wav";
            console.info(`case filePath is ${filePath}`);
            fd = fileio.openSync(filePath, 0o0);
            avPlayTest = { width: 0, height: 0, duration: 0 };
            await testAVPlayerDataSrcNoSeek(srcNoSeek, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_FLAC_0100
            * @tc.name      : 0100.flac_48ksr_32kbr_2ch 
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_FLAC_0100', Level.LEVEL0,async function (done) {
            filePath = pathDir + "/flac_48ksr_32kbr_2ch.flac";
            console.info(`case filePath is ${filePath}`);
            fd = fileio.openSync(filePath, 0o0);
            avPlayTest = { width: 0, height: 0, duration: 0 };
            await testAVPlayerDataSrcNoSeek(srcNoSeek, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_MKV_0100
            * @tc.name      : 0100.mpeg4_aac_1080p_60r.mkv
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_MKV_0100', Level.LEVEL0,async function (done) {
            filePath = pathDir + "/mpeg4_aac_1080p_60r.mkv";
            console.info(`case filePath is ${filePath}`);
            fd = fileio.openSync(filePath, 0o0);
            avPlayTest = { width: 1920, height: 1080, duration: 0 };
            await testAVPlayerDataSrcNoSeek(srcNoSeek, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_WEBM_0100
            * @tc.name      : 0100.vp8_vorbis_270p_10r.webm
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_WEBM_0100', Level.LEVEL0,async function (done) {
            filePath = pathDir + "/vp8_vorbis_270p_10r.webm";
            console.info(`case filePath is ${filePath}`);
            fd = fileio.openSync(filePath, 0o0);
            avPlayTest = { width: 360, height: 270, duration: 0 };
            await testAVPlayerDataSrcNoSeek(srcNoSeek, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_TS_0100
            * @tc.name      : 0100.h264_aac_640x480_30r.ts
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_TS_0100', Level.LEVEL0,async function (done) {
            filePath = pathDir + "/h264_aac_640x480_30r.ts";
            console.info(`case filePath is ${filePath}`);
            fd = fileio.openSync(filePath, 0o0);
            avPlayTest = { width: 640, height: 480, duration: 0 };
            await testAVPlayerDataSrcNoSeek(srcNoSeek, avPlayer, avPlayTest, PLAY_TIME, done);
        })
    });
}