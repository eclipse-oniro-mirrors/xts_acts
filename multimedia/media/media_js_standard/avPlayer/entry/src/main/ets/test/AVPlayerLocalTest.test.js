/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import * as mediaTestBase from '../../../../../../MediaTestBase';
import media from '@ohos.multimedia.media'
import audio from '@ohos.multimedia.audio';
import { testAVPlayerFun, AV_PLAYER_STATE, setSource, setSubtitle } from '../../../../../../AVPlayerTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function AVPlayerLocalTest() {
    describe('AVPlayerLocalTest', function () {
        const VIDEO_SOURCE = 'H264_AAC.mp4';
        const AUDIO_SOURCE = '01.mp3';
        const VIDEO_NOAUDIO = 'H264_NONE.mp4'
        const SUBTITLE = 'srt_2800.srt'
        const PLAY_TIME = 3000;
        const TAG = 'AVPlayerLocalTest:';
        let fileDescriptor = null;
        let fileDescriptor2 = null;
        let fileDescriptor3 = null;
        let avPlayer = null;
        let avPlayTest = {
            width: 0,
            height: 0,
            duration: -1,
        }
        let fdPath = '';
        let fdNumber = 0;
        let subtitleFdSrc = null;

        beforeAll(async function () {
            console.info('beforeAll case');
            await mediaTestBase.getStageFileDescriptor(VIDEO_SOURCE).then((res) => {
                fileDescriptor = res;
            });
            await mediaTestBase.getStageFileDescriptor(AUDIO_SOURCE).then((res) => {
                fileDescriptor2 = res;
            });
            await mediaTestBase.getStageFileDescriptor(VIDEO_NOAUDIO).then((res) => {
                fileDescriptor3 = res;
            });
            await mediaTestBase.getStageFileDescriptor(SUBTITLE).then((res) => {
                subtitleFdSrc = res;
            });
        })

        beforeEach(async function () {
            console.info('beforeEach case');
        })

        afterEach(async function () {
            if (avPlayer != null) {
                avPlayer.release().then(() => {
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            console.info('afterEach case');
        })

        afterAll(async function () {
            console.info('afterAll case');
            await mediaTestBase.closeFileDescriptor(VIDEO_SOURCE);
            await mediaTestBase.closeFileDescriptor(AUDIO_SOURCE);
            await mediaTestBase.closeFileDescriptor(VIDEO_NOAUDIO);
            await mediaTestBase.closeFileDescriptor(SUBTITLE);
        })

        function setAVPlayerTrackCb(avPlayer, descriptionKey, descriptionValue, done) {
            let arrayDescription;
            let surfaceID = globalThis.value;
            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        console.info(`case AV_PLAYER_STATE.INITIALIZED`);
                        avPlayer.surfaceId = surfaceID;
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.INITIALIZED);
                        avPlayer.prepare((err) => {
                            console.info('case prepare called' + err);
                            if (err != null) {
                                console.error(`case prepare error, errMessage is ${err.message}`);
                                expect().assertFail();
                                done();
                            } else {
                                console.info('case avPlayer.duration: ' + avPlayer.duration);
                            }
                        });
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        await avPlayer.getTrackDescription().then((arrayList) => {
                            console.info('case getTrackDescription called!!');
                            if (typeof (arrayList) != 'undefined') {
                                arrayDescription = arrayList;
                            } else {
                                console.info('case getTrackDescription is failed');
                                expect().assertFail();
                            }
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        expect(descriptionKey.length).assertEqual(arrayDescription.length);
                        for (let i = 0; i < arrayDescription.length; i++) {
                            mediaTestBase.checkDescription(arrayDescription[i], descriptionKey[i], descriptionValue[i]);
                        }
                        avPlayer.getTrackDescription((error, arrayList) => {
                            if (error == null) {
                                for (let i = 0; i < arrayList.length; i++) {
                                    mediaTestBase.checkDescription(arrayList[i], descriptionKey[i], descriptionValue[i]);
                                }
                            } else {
                                console.info('getTrackDescription failed, message is:' + error.message);
                            }
                            avPlayer.release();
                        })
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    case AV_PLAYER_STATE.ERROR:
                        expect().assertFail();
                        avPlayer.release().then(() => {
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        avPlayer = null;
                        break;
                    default:
                        break;
                }
            })
        }

        async function testCheckTrackDescription(src, avPlayer, descriptionKey, descriptionValue, done) {
            console.info(`case media source: ${src}`)
            media.createAVPlayer((err, video) => {
                console.info(`case media err: ${err}`)
                if (typeof (video) != 'undefined') {
                    console.info('case createAVPlayer success');
                    avPlayer = video;
                    setAVPlayerTrackCb(avPlayer, descriptionKey, descriptionValue, done)
                    setSource(avPlayer, src);
                }
                if (err != null) {
                    console.error(`case createAVPlayer error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        }

        function setPlaybackInfoCb(avPlayer, descriptionKey, descriptionValue, done) {
            let arrayDescription;
            let surfaceID = globalThis.value;
            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        console.info(`case AV_PLAYER_STATE.INITIALIZED`);
                        avPlayer.surfaceId = surfaceID;
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.INITIALIZED);
                        avPlayer.prepare((err) => {
                            console.info('case prepare called' + err);
                            if (err != null) {
                                console.error(`case prepare error, errMessage is ${err.message}`);
                                expect().assertFail();
                                done();
                            } else {
                                console.info('case avPlayer.duration: ' + avPlayer.duration);
                            }
                        });
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        await avPlayer.getPlaybackInfo().then(res => {
                            console.info('case getPlaybackInfo called!!');
                            if (typeof (res) != 'undefined') {
                                arrayDescription = res;
                            } else {
                                console.info('case getPlaybackInfo is failed');
                                expect().assertFail();
                            }
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        mediaTestBase.checkPlaybackInfo(arrayDescription, descriptionKey, descriptionValue);
                        avPlayer.release();
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    case AV_PLAYER_STATE.ERROR:
                        expect().assertFail();
                        avPlayer.release().then(() => {
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        avPlayer = null;
                        break;
                    default:
                        break;
                }
            })
        }

        async function testCheckPlaybackInfo(src, avPlayer, descriptionKey, descriptionValue, done) {
            console.info(`case media source: ${src}`)
            media.createAVPlayer((err, video) => {
                if (err != null) {
                    console.error(`case createAVPlayer error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                } else {
                    console.info(`case media err: ${err}`)
                    if (typeof (video) != 'undefined') {
                        console.info('case createAVPlayer success');
                        avPlayer = video;
                        setPlaybackInfoCb(avPlayer, descriptionKey, descriptionValue, done)
                        setSource(avPlayer, src);
                    } else {
                        console.info('case createAVPlayer failed');
                        expect().assertFail();
                        done();
                    }
                }
            });
        }

        async function setAVPlayerScaleCb(avPlayer, done) {
            let surfaceID = globalThis.value;
            let count = 0;
            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        console.info(`case AV_PLAYER_STATE.INITIALIZED`);
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.INITIALIZED);
                        avPlayer.surfaceId = surfaceID;
                        avPlayer.prepare((err) => {
                            console.info('case prepare called' + err);
                            avPlayer.loop = true;
                            if (err != null) {
                                console.error(`case prepare error, errMessage is ${err.message}`);
                                expect().assertFail();
                                done();
                            } else {
                                console.info('case avPlayer.duration: ' + avPlayer.duration);
                            }
                        });
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        console.info('case prepare called');
                        avPlayer.play((err) => {
                            console.info('case play called' + err);
                            if (err != null) {
                                console.error(`case play error, errMessage is ${err.message}`);
                                expect().assertFail();
                                done();
                            } else {
                                console.info('case avPlayer.duration: ' + avPlayer.duration);
                            }
                        });
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        console.info('case playing called');
                        for (let i = 0; i < 20; i++) {
                            if (count == 0) {
                                console.info('case set  videoScaleType : 1');
                                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
                                count = 1;
                            } else {
                                console.info('case set  videoScaleType : 0');
                                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
                                count = 0;
                            }
                            await mediaTestBase.msleepAsync(500);
                        }
                        avPlayer.loop = false;
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.COMPLETED);
                        expect(avPlayer.currentTime).assertEqual(avPlayer.duration);
                        avPlayer.release();
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    case AV_PLAYER_STATE.ERROR:
                        expect().assertFail();
                        avPlayer.release().then(() => {
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        avPlayer = null;
                        break;
                    default:
                        break;
                }
            })
        }

        async function testVideoScaleType(src, avPlayer, done) {
            console.info(`case media source: ${src}`)
            media.createAVPlayer((err, video) => {
                console.info(`case media err: ${err}`)
                if (typeof (video) != 'undefined') {
                    console.info('case createAVPlayer success');
                    avPlayer = video;
                    setAVPlayerScaleCb(avPlayer, done)
                    setSource(avPlayer, src);
                }
                if (err != null) {
                    console.error(`case createAVPlayer error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        }

        async function setOnCallback(avPlayer, done) {
            let surfaceID = globalThis.value;
            let count = 0;
            let playCount = 0;
            avPlayer.on('endOfStream', () => {
                count++;
                console.info(TAG + 'endOfStream success')
                avPlayer.off('endOfStream')
            })
            avPlayer.on('stateChange', async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        console.info(`case AV_PLAYER_STATE.INITIALIZED`);
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.INITIALIZED);
                        avPlayer.surfaceId = surfaceID;
                        avPlayer.prepare((err) => {
                            console.info('case prepare called' + err);
                            if (err != null) {
                                console.error(`case prepare error, errMessage is ${err.message}`);
                                expect().assertFail();
                                done();
                            } else {
                                console.info('case avPlayer.duration: ' + avPlayer.duration);
                            }
                        });
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        console.info('case prepare called');
                        avPlayer.play().then(() => {
                            console.info('play called success')
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        if (playCount == 0) {
                            playCount++;
                            avPlayer.pause().then(() => {
                                console.info('play called success')
                            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        }
                        console.info('case playing called');
                        break;
                    case AV_PLAYER_STATE.PAUSED:
                        avPlayer.play((err) => {
                            console.info('case play called');
                            if (err != null) {
                                console.error(`case play error, errMessage is ${err.message}`);
                                expect().assertFail();
                                done();
                            } else {
                                console.info('case avPlayer.duration: ' + avPlayer.duration);
                            }
                        });
                        console.info('case pause called');
                        break;
                    case AV_PLAYER_STATE.STOPPED:
                        expect(count).assertEqual(1);
                        console.info('case stop called');
                        avPlayer.release().then(() => {
                            console.info('play stop success')
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        expect(avPlayer.state).assertEqual(AV_PLAYER_STATE.COMPLETED);
                        expect(avPlayer.currentTime).assertEqual(avPlayer.duration);
                        if (playCount == 1) {
                            playCount++
                            avPlayer.play().then(() => {
                                console.info('play called success')
                            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        } else {
                            avPlayer.stop().then(() => {
                                console.info('play stop success')
                            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        }
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    case AV_PLAYER_STATE.ERROR:
                        expect().assertFail();
                        avPlayer.release().then(() => {
                        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        avPlayer = null;
                        break;
                    default:
                        break;
                }
            })
        }

        function setPlayerPlaybackStrategy(avPlayer, playbackStrategy) {
            avPlayer.setPlaybackStrategy(playbackStrategy).catch((error) => {
                console.error(`setPlaybackStrategy failed, err code ${error.code} msg ${error.message}`)
                expect().assertFail();
            })
        }
        async function setPlaybackStrategyDASH(avPlayer, done) {
            let surfaceID = globalThis.value;
            let playbackStrategy = { mutedMediaType: media.MediaType.MEDIA_TYPE_AUD,preferredAudioLanguage:"und", preferredSubtitleLanguage:"eng" }
            let pauseCount = 0
            let stateChangeCallback = async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        avPlayer.surfaceId = surfaceID;
                        setPlayerPlaybackStrategy(avPlayer, playbackStrategy)
                        avPlayer.prepare()
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        avPlayer.play()
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        if (pauseCount++ == 0) {
                            avPlayer.pause()
                        }
                        break;
                    case AV_PLAYER_STATE.PAUSED:
                        avPlayer.play()
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        avPlayer.release()
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    case AV_PLAYER_STATE.ERROR:
                        avPlayer.release().then(() => {},
                            mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        avPlayer = null;
                        expect().assertFail();
                        break;
                    default:
                        break;
                }
            }
            avPlayer.on('stateChange', stateChangeCallback)
        }

        async function setPlaybackStrategy(avPlayer, done) {
            let surfaceID = globalThis.value;
            let playbackStrategy = { mutedMediaType: media.MediaType.MEDIA_TYPE_AUD }
            let pauseCount = 0
            let stateChangeCallback = async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        avPlayer.surfaceId = surfaceID;
                        setPlayerPlaybackStrategy(avPlayer, playbackStrategy)
                        avPlayer.prepare()
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        avPlayer.play()
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        if (pauseCount++ == 0) {
                            avPlayer.pause()
                        }
                        break;
                    case AV_PLAYER_STATE.PAUSED:
                        avPlayer.play()
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        avPlayer.release()
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    case AV_PLAYER_STATE.ERROR:
                        avPlayer.release().then(() => {},
                            mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        avPlayer = null;
                        expect().assertFail();
                        break;
                    default:
                        break;
                }
            }
            avPlayer.on('stateChange', stateChangeCallback)
        }

        function setPlayerMediaMuted(avPlayer, expectedSuccess) {
            avPlayer.setMediaMuted(audio, true).catch((error) => {
                console.error(`setMediaMuted failed, err code ${error.code} msg ${error.message}`)
                expect().assertFail();
            })
        }

        async function setMediaMuted(avPlayer, done) {
            let surfaceID = globalThis.value;
            let audio = media.MediaType.MEDIA_TYPE_AUD
            let pauseCount = 0
            let stateChangeCallback = async (state, reason) => {
                switch (state) {
                    case AV_PLAYER_STATE.INITIALIZED:
                        avPlayer.surfaceId = surfaceID;
                        avPlayer.prepare()
                        break;
                    case AV_PLAYER_STATE.PREPARED:
                        setPlayerMediaMuted(avPlayer)
                        avPlayer.play()
                        break;
                    case AV_PLAYER_STATE.PLAYING:
                        setPlayerMediaMuted(avPlayer)
                        if (pauseCount++ > 0) {
                            break
                        }
                        avPlayer.pause()
                        break;
                    case AV_PLAYER_STATE.PAUSED:
                        setPlayerMediaMuted(avPlayer)
                        avPlayer.play()
                        break;
                    case AV_PLAYER_STATE.COMPLETED:
                        setPlayerMediaMuted(avPlayer)
                        avPlayer.release()
                        break;
                    case AV_PLAYER_STATE.RELEASED:
                        avPlayer = null;
                        done();
                        break;
                    case AV_PLAYER_STATE.ERROR:
                        expect().assertFail();
                        avPlayer.release().then(() => {},
                            mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                        avPlayer = null;
                        break;
                    default:
                        break;
                }
            }
            avPlayer.on('stateChange', stateChangeCallback)
        }

        async function testOffCallback(src, avPlayer, done) {
            console.info(`case media source: ${src}`)
            media.createAVPlayer((err, video) => {
                console.info(`case media err: ${err}`)
                if (typeof (video) != 'undefined') {
                    console.info('case createAVPlayer success');
                    avPlayer = video;
                    setOnCallback(avPlayer, done)
                    setSource(avPlayer, src);
                }
                if (err != null) {
                    console.error(`case createAVPlayer error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        }

        async function testSubtitle(src, subtitleSrc, avPlayer, done) {
            console.info(`case media source: ${src}`)
            media.createAVPlayer((err, video) => {
                console.info(`case media err: ${err}`)
                if (typeof (video) !== 'undefined') {
                    console.info('case createAVPlayer success');
                    avPlayer = video;
                    setOnCallback(avPlayer, done)
                    setSource(avPlayer, src);
                    setSubtitle(avPlayer, subtitleSrc)
                }
                if (err != null) {
                    console.error(`case createAVPlayer error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        }
        async function testSetPlaybackStrategyDASH(src, avPlayer, done) {
            console.info(`case media source: ${src}`)
            media.createAVPlayer((err, video) => {
                console.info(`case media err: ${err}`)
                if (typeof (video) !== 'undefined') {
                    console.info('case createAVPlayer success');
                    avPlayer = video;
                    setPlaybackStrategyDASH(avPlayer, done)
                    setSource(avPlayer, src);
                }
                if (err != null) {
                    console.error(`case createAVPlayer error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        }

        async function testSetPlaybackStrategy(src, avPlayer, done) {
            console.info(`case media source: ${src}`)
            media.createAVPlayer((err, video) => {
                console.info(`case media err: ${err}`)
                if (typeof (video) !== 'undefined') {
                    console.info('case createAVPlayer success');
                    avPlayer = video;
                    setPlaybackStrategy(avPlayer, done)
                    setSource(avPlayer, src);
                }
                if (err != null) {
                    console.error(`case createAVPlayer error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        }

        async function testSetMediaMuted(src, avPlayer, done) {
            console.info(`case media source: ${src}`)
            media.createAVPlayer((err, video) => {
                console.info(`case media err: ${err}`)
                if (typeof (video) !== 'undefined') {
                    console.info('case createAVPlayer success');
                    avPlayer = video;
                    setMediaMuted(avPlayer, done)
                    setSource(avPlayer, src);
                }
                if (err != null) {
                    console.error(`case createAVPlayer error, errMessage is ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        }

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FDSRC_0100
            * @tc.name      : 001.test fdsrc
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FDSRC_0100', 0, async function (done) {
            avPlayTest = { width: 720, height: 480, duration: 10100 };
            testAVPlayerFun(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0100
            * @tc.name      : 001.test getTrackDescription
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0100', 0, async function (done) {
            let videoTrackKey = new Array('bitrate', 'codec_mime', 'frame_rate', 'height',
                'track_index', 'track_type', 'width');
            let audioTrackKey = new Array('bitrate', 'channel_count', 'codec_mime', 'sample_rate',
                'track_index', 'track_type');
            let videoTrackValue = new Array(1366541, 0, 6000, 480, 0, 1, 720);
            let audioTrackValue = new Array(129207, 2, 1, 44100, 1, 0);
            let descriptionKey = new Array(videoTrackKey, audioTrackKey);
            let descriptionValue = new Array(videoTrackValue, audioTrackValue);
            testCheckTrackDescription(fileDescriptor, avPlayer, descriptionKey, descriptionValue, done)
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0200
            * @tc.name      : 002.test getTrackDescription
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0200', 0, async function (done) {
            let audioTrackKey = new Array('channel_count', 'codec_mime', 'sample_rate', 'track_index',
                'track_type');
            let audioTrackValue = new Array(1, 2, 48000, 0, 0);
            let descriptionKey = new Array(audioTrackKey);
            let descriptionValue = new Array(audioTrackValue);
            testCheckTrackDescription(fileDescriptor2, avPlayer, descriptionKey, descriptionValue, done)
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0300
            * @tc.name      : 003.test getTrackDescription
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0300', 0, async function (done) {
            let videoTrackKey = new Array('bitrate', 'codec_mime', 'frame_rate', 'height',
                'track_index', 'track_type', 'width');
            let videoTrackValue = new Array(1506121, 0, 6000, 480, 0, 1, 720);
            let descriptionKey = new Array(videoTrackKey);
            let descriptionValue = new Array(videoTrackValue);
            testCheckTrackDescription(fileDescriptor3, avPlayer, descriptionKey, descriptionValue, done)
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETPLAYBACKINFO_0100
            * @tc.name      : 003.test getPlaybackInfo
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETPLAYBACKINFO_0100', 0, async function (done) {
            let descriptionKey = new Array('server_ip_address', 'average_download_rate', 'download_rate',
                'is_downloading', 'buffer_duration');
            let descriptionValue = new Array("", 0, 0, 0, 0);
            testCheckPlaybackInfo(fileDescriptor, avPlayer, descriptionKey, descriptionValue, done)
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_VIDEOSCALETYPE_0100
            * @tc.name      : 001.test video player videoScaleTpe
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_VIDEOSCALETYPE_0100', 0, async function (done) {
            testVideoScaleType(fileDescriptor, avPlayer, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_OFF_CALLBACK_0100
            * @tc.name      : 001.test off callback Function
            * @tc.desc      : Local Video playback control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_OFF_CALLBACK_0100', 0, async function (done) {
            testOffCallback(fileDescriptor, avPlayer, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_0100
            * @tc.name      : 001.test subtitle Function
            * @tc.desc      : Local Video subtitle control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_0100', 0, async function (done) {
            testSubtitle(fileDescriptor, subtitleFdSrc, avPlayer, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_0200
            * @tc.name      : 002.test subtitle Function
            * @tc.desc      : Local Video subtitle control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_0200', 0, async function (done) {
            testSubtitle(fileDescriptor, `fd://${subtitleFdSrc.fd}`, avPlayer, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0100
            * @tc.name      : 001.test setPlaybackStrategy Function
            * @tc.desc      : Local Video subtitle control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0100', 0, async function (done) {
            testSetPlaybackStrategy(fileDescriptor, avPlayer, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0100
            * @tc.name      : 001.test setMediaMuted Function
            * @tc.desc      : Local Video subtitle control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0100', 0, async function (done) {
            testSetMediaMuted(fileDescriptor, avPlayer, done);
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_DASH_0100
            * @tc.name      : 001.test setPlaybackStrategy Function
            * @tc.desc      : Local Video preferred audio language control test
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_DASH_0100', 0, async function (done) {
            testSetPlaybackStrategyDASH(fileDescriptor, avPlayer, done);
        })
    })
}
