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
import {testAVPlayerDataSrcNoSeek, testAVPlayerFun, AV_PLAYER_STATE} from '../../../../../../AVPlayerTestBase.js';
import * as mediaTestBase from '../../../../../../MediaTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

export default function AVPlayerDataSrcNoSeekReliabilityTest() {
    describe('AVPlayerDataSrcNoSeekReliabilityTest', function () {
        let avPlayer = null;
        let pathDir = globalThis.abilityContext.filesDir;
        let filePath =  pathDir + "/01_15s.mp3";
        let src = null;
        let stream = null;
        let fd = null;
        let readAtCnt = 0;
        let expectErr = 0;
        beforeAll(async function() {
            console.info('beforeAll case');
        })

        beforeEach(async function() {
            console.info('beforeEach case');
            stream = null;
            fd = null;
            readAtCnt = 0;
            expectErr = 0;
        })

        afterEach(async function() {
            console.info('afterEach case');
        })

        afterAll(async function() {
            console.info('afterAll case');
            if (avPlayer != null) {
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
        })
        async function testDataSrcNoSeek(done) {
            await media.createAVPlayer().then((video) => {
                if (typeof(video) != 'undefined') {
                    console.info('case createAVPlayer success');
                    avPlayer = video;
                    setCallback(done);
                    avPlayer.dataSrc = src;
                } else {
                    console.error('case createAVPlayer failed');
                    expect().assertFail();
                    done();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        function setCallback(done) {
            avPlayer.on('stateChange', async (state, reason) => {
                console.info(`case state is ${state}`);
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        console.info(`case AVPlayerTestBase.AV_PLAYER_STATE.INITIALIZED`);
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.INITIALIZED);
                        avPlayer.surfaceId = globalThis.value;
                        console.info(`case toPreparePromise`);
                        await avPlayer.prepare().then(() => {
                            console.info('case prepare success');
                            avPlayer.play();
                        }, mediaTestBase.expectFailureCallback).catch(mediaTestBase.catchCallback);
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        avPlayer.release().then(() => {
                            avPlayer = null;
                            done();
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                    case AV_PLAYER_STATE.ERROR:
                        avPlayer.release().then(() => {
                            avPlayer = null;
                            done();
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        break;
                    default:
                        break; 
                }
            })
            avPlayer.on('seekDone', async (seekDoneTime) => {
                console.info(`case seekDone called, seekDoneCnt is ${seekDoneCnt}, seekDoneTime is ${seekDoneTime}`);
            })
            avPlayer.on('error', async (err) => {
                console.error(`case error called, errCode is ${err.code}, errMessage is ${err.message}`);
                expect(err.code).assertEqual(expectErr);
            });
        }
        function readErr(buf, length) {
            let num = fileio.readSync(fd, buf, {offset: 0, length: 1000});
            return num;
        }
        function readAt(buf, length, pos) {
            console.info(' readAtCnt:' + readAtCnt + ' readAt:' + length + ' pos: ' + pos);
            readAtCnt++;
            let num = 0;
            if (buf == undefined || length == undefined) {
                console.info(' buf == undefined || length == undefined' );
                expect().assertFail();
                return -1;
            }
            num = readErr(buf, length);
            if (num != -1) {
                console.info('case  readAt num:' + num);
                return num;
            } else if (pos == undefined) {
                num = fileio.readSync(fd, buf, {offset: 0, length: length});
                if (num == 0) {
                    fileio.closeSync(fd);
                    fd = fileio.openSync(filePath, 0o0);
                    readAtCnt = 0;
                    return -1;
                }
            } else {
                num = stream.readSync(buf, {offset: 0, length: length, position: pos});
            }
            console.info('case  readAt num:' + num);
            if (num >= 0) {
                return num;
            }
            return -1;
        }

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0100
            * @tc.name      : 0100.readAt buffer data is not enough
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level3
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0100', 0, async function (done) {
            filePath =  pathDir + "/01_15s.mp3";
            console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0100 filePath is '+JSON.stringify(filePath));
            let size = fileio.statSync(filePath).size;
            console.info('case file size:' + size);
            fd = fileio.openSync(filePath, 0o0);
            readErr = (buf, length) => {
                if (readAtCnt >= 2 && readAtCnt <= 10) {
                    let num = fileio.readSync(fd, buf, {offset: 0, length: (readAtCnt ) * 1000});
                    return num;
                } else {
                    return -1;
                }
            }
            src = {
                fileSize: -1,
                callback: readAt
            }
            testDataSrcNoSeek(done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0200
            * @tc.name      : 0200.readAt buffer offset is wrong
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level3
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0200', 0, async function (done) {
            filePath =  pathDir + "/01_15s.mp3";
            fd = fileio.openSync(filePath, 0o0);
            readErr = (buf, length) => {
                if (readAtCnt >= 2 && readAtCnt <= 10) {
                    console.info('case buf length:' + length + 'readAtCnt:' + readAtCnt);
                    let num = fileio.readSync(fd, buf, {offset: 1000, length: readAtCnt * 1000});
                    return num;
                } else {
                    return -1;
                }
            }
            src = {
                fileSize: -1,
                callback: readAt
            }
            testDataSrcNoSeek(done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0300
            * @tc.name      : 0200.readAt media file position is wrong 
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level3
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0300', 0, async function (done) {
            filePath =  pathDir + "/01_15s.mp3";
            fd = fileio.openSync(filePath, 0o0);
            readErr = (buf, length) => {
                if (readAtCnt >= 2 && readAtCnt <= 10) {
                    let num = fileio.readSync(fd, buf, {offset: 0, length: 1000, position: readAtCnt});
                    return num;
                } else {
                    return -1;
                }
            }
            src = {
                fileSize: -1,
                callback: readAt
            }
            testDataSrcNoSeek(done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0400
            * @tc.name      : 0200.readAt num is wrong
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level3
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0400', 0, async function (done) {
            filePath =  pathDir + "/01_15s.mp3";
            fd = fileio.openSync(filePath, 0o0);
            readErr = (buf, length) => {
                if (readAtCnt >= 2 && readAtCnt <= 10) {
                    let num = fileio.readSync(fd, buf, {offset: 0, length: (readAtCnt ) * 1000});
                    return num + readAtCnt;
                } else {
                    return -1;
                }
            }
            src = {
                fileSize: -1,
                callback: readAt
            }
            testDataSrcNoSeek(done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0500
            * @tc.name      : 0200.readAt num is wrong
            * @tc.desc      : data source compatibility test
            * @tc.size      : MediumTest
            * @tc.type      : compatibility test
            * @tc.level     : Level3
        */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_DATASRC_NOSEEK_RELI_MP3_0500', 0, async function (done) {
            filePath =  pathDir + "/01_15s.mp3";
            fd = fileio.openSync(filePath, 0o0);
            readErr = (buf, length) => {
                if (readAtCnt >= 2 && readAtCnt <= 10) {
                    let num = fileio.readSync(fd, buf, {offset: 0, length: (readAtCnt ) * 1000});
                    return num - readAtCnt;
                } else {
                    return -1;
                }
            }
            src = {
                fileSize: -1,
                callback: readAt
            }
            testDataSrcNoSeek(done);
        })
    });
}