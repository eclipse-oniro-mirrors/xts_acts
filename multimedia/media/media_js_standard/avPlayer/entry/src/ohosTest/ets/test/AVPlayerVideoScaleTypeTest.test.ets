/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import MediaTestBase from './MediaTestBase';
import { setSource } from './AVPlayerTestBase';
import { BusinessError, ErrorCallback } from '@kit.BasicServicesKit';

let mediaTestBase = new MediaTestBase()
let avPlayer: media.AVPlayer;
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';
const VIDEO_SOURCE_MP4 = 'H264_NONE.mp4';
let avFd: media.AVFileDescriptor;

async function sleep(delay: number): Promise<void> {
    return new Promise((resolve, _) => {
        setTimeout(async () => {
            resolve();
        }, delay);
    });
};
async function handleState(state: string, operationRecord: Record<string, Function>) {
    switch (state) {
        case IDLE:
            await operationRecord[IDLE]?.()
            break;
        case INITIALIZED:
            let surfaceID: string = globalThis.value;
            avPlayer.surfaceId = surfaceID;
            console.info(`case avPlayer.surfaceId is ${avPlayer.surfaceId}`);
            await operationRecord[INITIALIZED]?.()
            await avPlayer.prepare().then(() => {
                console.info('case prepare called');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            break;
        case PREPARED:
            expect(avPlayer.currentTime).assertEqual(0);
            await operationRecord[PREPARED]?.()
            console.info('case to play AVPlayer');
            await avPlayer.play().then(() => {
                console.info('case play AVPlayer success');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            break;
        case PLAYING:
            await operationRecord[PLAYING]?.()
            break;
        case PAUSED:
            await operationRecord[PAUSED]?.()
            break;
        case COMPLETED:
            await operationRecord[COMPLETED]?.()
            break;
        case STOPPED:
            await operationRecord[STOPPED]?.()
            break;
        case RELEASED:
            await operationRecord[RELEASED]?.()
            break;
        case ERROR:
            await operationRecord[ERROR]?.()
            break;
        default:
            break;
    }
}

async function testVideoScaleType(fd: media.AVFileDescriptor | string, done: Function,
    operationRecord: Record<string, Function>, errorCallback?: ErrorCallback) {
    await media.createAVPlayer().then((video) => {
        if (typeof (video) != 'undefined') {
            console.info('case createAVPlayer success');
            avPlayer = video;
        } else {
            console.error('case createAVPlayer failed');
            expect().assertFail();
            done();
        }
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    avPlayer.on('stateChange', async (state, reason) => {
        console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
        await handleState(state, operationRecord);
    });
    if (errorCallback != undefined) {
        avPlayer.on('error', errorCallback);
    }

    setSource(avPlayer, fd);
}

export default function AVPlayerVideoScaleTypeTest() {
    describe('AVPlayerVideoScaleTypeTest', () => {
        beforeAll(async () => {
            console.info('beforeAll case');
            await mediaTestBase.getStageFileDescriptor(VIDEO_SOURCE_MP4).then((res) => {
                if (res != undefined) {
                    avFd = res
                }
            });
        });

        afterEach(async () => {
            if (avPlayer != null) {
                try {
                    avPlayer.off('stateChange');
                    avPlayer.off('error');
                    console.info('case now stopped, to release');
                    await avPlayer.release().then(() => {
                        console.info('case release AVPlayer success');
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                } catch (e) {
                    console.info(`afterEach error: ${JSON.stringify(e)}`)
                }
            }
            console.info('afterEach case');
        });
        afterAll(async () => {
            console.info('afterAll case');
            try {
                await mediaTestBase.closeFileDescriptor(VIDEO_SOURCE_MP4)
            } catch (e) {
                console.info(`afterAll error: ${JSON.stringify(e)}`)
            }
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_0100
         * @tc.name      : 001.test videoScaleType in prepared state
         * @tc.desc      : Verify that videoScaleType can be set and retrieved in the prepared state.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT;
                console.info('case videoScaleType is ' + avPlayer.videoScaleType);
                expect(avPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT);
                done();
            }
            await testVideoScaleType(avFd, done, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_0200
         * @tc.name      : 002.test videoScaleType in playing state
         * @tc.desc      : Verify that videoScaleType can be set and retrieved in the playing state.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT;
                console.info('case videoScaleType is ' + avPlayer.videoScaleType);
                expect(avPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT);
                done();
            }
            await testVideoScaleType(avFd, done, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_0300
         * @tc.name      : 003.test videoScaleType in paused state
         * @tc.desc      : Verify that videoScaleType can be set and retrieved in the paused state.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                await avPlayer.pause().then(() => {
                    console.info('case pause AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            operationRecord[PAUSED] = async () => {
                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT;
                console.info('case videoScaleType is ' + avPlayer.videoScaleType);
                expect(avPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT);
                done();
            }
            await testVideoScaleType(avFd, done, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_0400
         * @tc.name      : 004.test videoScaleType in completed state
         * @tc.desc      : Verify that videoScaleType can be set and retrieved in the completed state.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let operationRecord: Record<string, Function> = {}
            operationRecord[COMPLETED] = async () => {
                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT;
                console.info('case videoScaleType is ' + avPlayer.videoScaleType);
                expect(avPlayer.videoScaleType).assertEqual(media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT);
                done();
            }
            await testVideoScaleType(avFd, done, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0100
         * @tc.name      : 005.test videoScaleType in idle state
         * @tc.desc      : Verify that setting videoScaleType in the idle state triggers an error.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let operationRecord: Record<string, Function> = {}
            operationRecord[IDLE] = async () => {
                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT;
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.reset()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0100 error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testVideoScaleType(avFd, done, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0200
         * @tc.name      : 006.test videoScaleType in initialized state
         * @tc.desc      : Verify that setting videoScaleType in the initialized state triggers an error.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let operationRecord: Record<string, Function> = {}
            operationRecord[INITIALIZED] = async () => {
                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT;
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0200 error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testVideoScaleType(avFd, done, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0300
         * @tc.name      : 007.test videoScaleType in stopped state
         * @tc.desc      : Verify that setting videoScaleType in the stopped state triggers an error.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let operationRecord: Record<string, Function> = {}
            operationRecord[STOPPED] = async () => {
                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT;
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.stop()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0300 error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testVideoScaleType(avFd, done, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0400
         * @tc.name      : 008.test videoScaleType in released state
         * @tc.desc      : Verify that setting videoScaleType in the released state triggers an error.
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let operationRecord: Record<string, Function> = {}
            operationRecord[RELEASED] = async () => {
                avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_SCALED_ASPECT;
            }
            operationRecord[INITIALIZED] = async () => {
                await avPlayer.release()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_VIDEOSCALETYPE_ERROR_0400 error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testVideoScaleType(avFd, done, operationRecord, errCallback)
        });
    })
}