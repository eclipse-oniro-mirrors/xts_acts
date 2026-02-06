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
let avFd: media.AVFileDescriptor;
let movFd: media.AVFileDescriptor;
let mkvFd: media.AVFileDescriptor;
let mp3Fd: media.AVFileDescriptor;
let aacFd: media.AVFileDescriptor;
let wavFd: media.AVFileDescriptor;
const VIDEO_SOURCE_MP4 = 'H264_NONE.mp4';
const VIDEO_SOURCE_MOV = "No_Support_Format.mov";
const VIDEO_SOURCE_MKV = "H264_AAC.mkv";
const AUDIO_SOURCE_MP3 = "01.mp3";
const AUDIO_SOURCE_AAC = "AAC_48000_32_1.aac";
const AUDIO_SOURCE_WAV = "vorbis_48000_32_1.wav";

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

async function testSetPlaybackSpeed(fd: media.AVFileDescriptor | string, done: Function, callback: media.OnPlaybackRateDone,
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
    avPlayer.on('playbackRateDone', callback);
    if (errorCallback != undefined) {
        avPlayer.on('error', errorCallback);
    }

    setSource(avPlayer, fd);
}
function openFileFailed() {
    console.info('case file fail');
}
const createStepRates = (from: number,to: number,step: number = 1): Array<number> => {
    const steprates: number[] = []
    const judge1 = Boolean(from < 0 || to < 0) && `params [from] or [to] not allowed to be less than 0`
    const judge2 = Boolean(step == 0) && `params [step] cannot be 0`
    const judge3 = Boolean(!(from <= to && step > 0) && !(from > to && step < 0)) && `params [from] is ${step > 0 ? 'less' : 'greater'} than [to],[step] must ${step > 0 ? 'greater' : 'less'} than 0`
    const info = judge1 || judge2 || judge3
    if(info){
        console.warn(info)
        from = 0.125
        to = 4
        step = 0.125
        console.info(`The parameter has been reset to [ from: ${from}, to:${to}, step:${step} ]`)
    }
    const c_from = Math.round(from * 1000) / 1000
    const c_to = Math.round(to * 1000) / 1000
    const c_step = Math.round(step * 1000) / 1000
    if(c_from != from || c_to != to || c_step != step){
        console.info(`input values: [from] - ${from} [to] - ${to} [step] - ${step}`)
        console.info(`calculate values: [from] - ${c_from} [to] - ${c_to} [step] - ${c_step}`)
    }
    const steps = Array.from({length: Math.floor((c_to - c_from) / step) + 1},(_: undefined,index: number) => {
        return c_from + index * c_step
    })
    steprates.push(...steps)
    return steprates
}

export default function AVPlayerSetPlaybackRateTest() {
    describe('AVPlayerSetPlaybackRateTest', () => {
        beforeAll(async () => {
            console.info('beforeAll case');
            await mediaTestBase.getStageFileDescriptor(VIDEO_SOURCE_MP4).then((res) => {
                if (res != undefined) {
                    avFd = res
                }
            });
            await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE_MOV, openFileFailed).then((res) => {
                movFd = res;
            });
            await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE_MKV, openFileFailed).then((res) => {
                mkvFd = res;
            });
            await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE_MP3, openFileFailed).then((res) => {
                mp3Fd = res;
            });
            await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE_AAC, openFileFailed).then((res) => {
                aacFd = res;
            });
            await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE_WAV, openFileFailed).then((res) => {
                wavFd = res;
            });
        });
        afterEach(async () => {
            if (avPlayer != null) {
                try {
                    avPlayer.off('stateChange');
                    avPlayer.off('playbackRateDone');
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
                await mediaTestBase.closeFdNumber(movFd.fd)
                await mediaTestBase.closeFdNumber(mkvFd.fd)
                await mediaTestBase.closeFdNumber(mp3Fd.fd)
                await mediaTestBase.closeFdNumber(aacFd.fd)
                await mediaTestBase.closeFdNumber(wavFd.fd)
            } catch (e) {
                console.info(`afterAll error: ${JSON.stringify(e)}`)
            }

        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0100
         * @tc.name      : 001.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 0.125 in prepared state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 0.125
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
                console.info(`case operationRecord[PREPARED] call`)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(movFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0200
         * @tc.name      : 002.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 0.25 in prepared state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 0.25
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
                console.info(`case operationRecord[PREPARED] call setrate: ${setrate}`)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(mkvFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0300
         * @tc.name      : 003.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 0.5 in prepared state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 0.5
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
                console.info(`case operationRecord[PREPARED] call setrate: ${setrate}`)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0400
         * @tc.name      : 004.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 0.75 in prepared state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 0.75
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0500
         * @tc.name      : 005.test setPlaybackRate in playing state
         * @tc.desc      : test setPlaybackRate 1.0 in playing state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.0
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(setrate)
                console.info(`case operationRecord[PLAYING] call setrate: ${setrate}`)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(mp3Fd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0600
         * @tc.name      : 006.test setPlaybackRate in playing state
         * @tc.desc      : test setPlaybackRate 1.25 in playing state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.25
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(aacFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0700
         * @tc.name      : 007.test setPlaybackRate in playing state
         * @tc.desc      : test setPlaybackRate 1.75 in playing state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.75
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0800
         * @tc.name      : 008.test setPlaybackRate in playing state
         * @tc.desc      : test setPlaybackRate 2.0 in playing state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 2.0
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0900
         * @tc.name      : 009.test setPlaybackRate in paused state
         * @tc.desc      : test setPlaybackRate 2.25 in paused state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 2.25
            let operationRecord: Record<string, Function> = {}
            operationRecord[PAUSED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.pause().then(() => {
                    console.info('case pause AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                await sleep(1000)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(wavFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1000
         * @tc.name      : 010.test setPlaybackRate in paused state
         * @tc.desc      : test setPlaybackRate 2.5 in paused state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 2.5
            let operationRecord: Record<string, Function> = {}
            operationRecord[PAUSED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.pause().then(() => {
                    console.info('case pause AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                await sleep(1000)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1100
         * @tc.name      : 011.test setPlaybackRate in paused state
         * @tc.desc      : test setPlaybackRate 2.75 in paused state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 2.75
            let operationRecord: Record<string, Function> = {}
            operationRecord[PAUSED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.pause().then(() => {
                    console.info('case pause AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                await sleep(1000)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1200
         * @tc.name      : 012.test setPlaybackRate in paused state
         * @tc.desc      : test setPlaybackRate 3.0 in paused state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 3.0
            let operationRecord: Record<string, Function> = {}
            operationRecord[PAUSED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.pause().then(() => {
                    console.info('case pause AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                await sleep(1000)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1300
         * @tc.name      : 013.test setPlaybackRate in completed state
         * @tc.desc      : test setPlaybackRate 3.25 in completed state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 3.25
            let operationRecord: Record<string, Function> = {}
            operationRecord[COMPLETED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1400
         * @tc.name      : 014.test setPlaybackRate in completed state
         * @tc.desc      : test setPlaybackRate 3.5 in completed state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 3.5
            let operationRecord: Record<string, Function> = {}
            operationRecord[COMPLETED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1500
         * @tc.name      : 015.test setPlaybackRate in completed state
         * @tc.desc      : test setPlaybackRate 3.75 in completed state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 3.75
            let operationRecord: Record<string, Function> = {}
            operationRecord[COMPLETED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1600
         * @tc.name      : 016.test setPlaybackRate in completed state
         * @tc.desc      : test setPlaybackRate 4.0 in completed state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 4.0
            let operationRecord: Record<string, Function> = {}
            operationRecord[COMPLETED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1700
         * @tc.name      : 017.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 0.126 in prepared state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 0.126
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(Math.abs(setrate - rate) < 0.0000001).assertTrue()
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1800
         * @tc.name      : 018.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 3.999 in prepared state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 3.999
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(Math.abs(setrate - rate) < 0.0000001).assertTrue()
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1900
         * @tc.name      : 019.test setPlaybackRate in playing state
         * @tc.desc      : test setPlaybackRate switch from 1.0 to 2.0 in playing state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let rate1 = 1.0
            let rate2 = 2.0
            let isSwitchRate = false;
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(rate1)
                await sleep(1000)
                avPlayer.setPlaybackRate(rate2)
                isSwitchRate = true
                console.info(`case operationRecord[PLAYING] called`)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: rate: ${rate}`)
                if (isSwitchRate) {
                    expect(rate).assertEqual(rate2)
                    done()
                } else {
                    expect(rate).assertEqual(rate1)
                }
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2000
         * @tc.name      : 020.test setPlaybackRate in playing state
         * @tc.desc      : test setPlaybackRate switch from 2.0 to 0.5 in playing state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let rate1 = 2.0
            let rate2 = 0.5
            let isSwitchRate = false;
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(rate1)
                await sleep(1000)
                avPlayer.setPlaybackRate(rate2)
                isSwitchRate = true
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                if (isSwitchRate) {
                    expect(rate).assertEqual(rate2)
                    done()
                } else {
                    expect(rate).assertEqual(rate1)
                }
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2100
         * @tc.name      : 021.test setPlaybackRate in playing state
         * @tc.desc      : test setPlaybackRate switch from 0.125 to 4.0 in playing state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let rate1 = 0.125
            let rate2 = 4.0
            let isSwitchRate = false;
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(rate1)
                await sleep(1000)
                avPlayer.setPlaybackRate(rate2)
                isSwitchRate = true
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                if (isSwitchRate) {
                    expect(rate).assertEqual(rate2)
                    done()
                } else {
                    expect(rate).assertEqual(rate1)
                }
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2200
         * @tc.name      : 022.test setPlaybackRate in playing state
         * @tc.desc      : test setPlaybackRate switch from 4.0 to 0.125 in playing state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let rate1 = 4.0
            let rate2 = 0.125
            let isSwitchRate = false;
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(rate1)
                await sleep(1000)
                avPlayer.setPlaybackRate(rate2)
                isSwitchRate = true
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                if (isSwitchRate) {
                    expect(rate).assertEqual(rate2)
                    done()
                } else {
                    expect(rate).assertEqual(rate1)
                }
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2300
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2300
         * @tc.desc      : test setPlaybackRate 1.25 in playing state after pausing
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.25
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(setrate)
                await avPlayer.pause().then(() => {
                    console.info('case pause AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                await sleep(1000)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2400
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2400
         * @tc.desc      : test setPlaybackRate 1.25 in playing state after seeking
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.25
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.seek(2000)
                avPlayer.setPlaybackRate(setrate)
                await sleep(1000)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2500
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2500
         * @tc.desc      : test setPlaybackRate 1.25 in playing state before seeking
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.25
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(setrate)
                avPlayer.seek(2000)
                await sleep(1000)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(setrate).assertEqual(rate)
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2600
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2600
         * @tc.desc      : test setPlaybackRate 0.125001 in prepared state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 0.125001
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
                return false
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(Math.abs(setrate - rate) < 0.0000001).assertTrue()
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2700
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2700
         * @tc.desc      : test setPlaybackRate 3.999999 in prepared state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 3.999999
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
                return false
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect(Math.abs(setrate - rate) < 0.0000001).assertTrue()
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2800
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2800
         * @tc.desc      : test setPlaybackRate by step in prepared state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            const setrates = createStepRates(0.125,4,0.125)
            let setrate: number
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                setrate = setrates.shift() as number
                avPlayer.setPlaybackRate(setrate)
                console.info(`case operationRecord[PREPARED] call`)
                return false
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(setrate).assertEqual(rate)
                if(setrates.length){
                    setrate = setrates.shift() as number
                    avPlayer.setPlaybackRate(setrate)
                }else{
                    done()
                }
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2800 setPlaybackRate error: ' + JSON.stringify(error))
                expect().assertFail();
                done()
            }
            await testSetPlaybackSpeed(movFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2900
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2900
         * @tc.desc      : test setPlaybackRate by step in playing state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            const setrates = createStepRates(0.125,4,0.125).sort(() => Math.random() - 0.5)
            let setrate: number
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                setrate = setrates.shift() as number
                avPlayer.setPlaybackRate(setrate)
                console.info(`case operationRecord[PLAYING] call`)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(setrate).assertEqual(rate)
                if(setrates.length){
                    setrate = setrates.shift() as number
                    avPlayer.setPlaybackRate(setrate)
                }else{
                    done()
                }
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_2900 setPlaybackRate error: ' + JSON.stringify(error))
                expect().assertFail();
                done()
            }
            await testSetPlaybackSpeed(movFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3000
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3000
         * @tc.desc      : test setPlaybackRate by step in paused state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            const setrates = createStepRates(4,0.125,-0.125)
            let setrate: number
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.pause()
                console.info(`case operationRecord[PLAYING] call`)
            }
            operationRecord[PAUSED] = async () => {
                setrate = setrates.shift() as number
                avPlayer.setPlaybackRate(setrate)
                console.info(`case operationRecord[PAUSED] call`)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(setrate).assertEqual(rate)
                if(setrates.length){
                    setrate = setrates.shift() as number
                    avPlayer.setPlaybackRate(setrate)
                }else{
                    done()
                }
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3000 setPlaybackRate error: ' + JSON.stringify(error))
                expect().assertFail();
                done()
            }
            await testSetPlaybackSpeed(movFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3100
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3100
         * @tc.desc      : test setPlaybackRate by step in completed state
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            const setrates = createStepRates(0.2,4,0.1)
            let startloop = false
            let setrate: number = 2
            let operationRecord: Record<string, Function> = {}
            operationRecord[PLAYING] = async () => {
                avPlayer.setPlaybackRate(setrate)
                console.info(`case operationRecord[PLAYING] call`)
            }
            operationRecord[COMPLETED] = async () => {
                setrate = setrates.shift() as number
                avPlayer.setPlaybackRate(setrate)
                console.info(`case operationRecord[COMPLETED] call`)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(Math.abs(setrate - rate) < 0.0000001).assertTrue()
                if(!startloop){
                    startloop = true
                    return
                }
                if(setrates.length){
                    setrate = setrates.shift() as number
                    avPlayer.setPlaybackRate(setrate)
                }else{
                    done()
                }
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3100 setPlaybackRate error: ' + JSON.stringify(error))
                expect().assertFail();
                done()
            }
            await testSetPlaybackSpeed(movFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3200
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3200
         * @tc.desc      : test setPlaybackRate in executable state by normal
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            const setrates = createStepRates(1,3,0.5)
            let setrate: number = 2
            let firstPlaying: boolean = true
            let operationRecord: Record<string, Function> = {};
            [PREPARED,PLAYING,PAUSED,COMPLETED].forEach(state => {
                operationRecord[state] = async () => {
                    setrate = setrates.shift() as number
                    avPlayer.setPlaybackRate(setrate)
                    console.info(`case operationRecord[${state}] call`)
                    if(state == PREPARED) return false
                    else return true
                }
            })
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(setrate).assertEqual(rate)
                switch(avPlayer.state){
                    case PREPARED:
                        avPlayer.play();
                        break;
                    case PLAYING:
                        if(firstPlaying){
                            avPlayer.pause();
                            firstPlaying = false;
                        }
                        break;
                    case PAUSED:
                        avPlayer.play();
                        break;
                    case COMPLETED:
                        done();
                        break;
                    default:
                        break;
                }
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3200 setPlaybackRate error: ' + JSON.stringify(error))
                expect().assertFail();
                done();
            }
            await testSetPlaybackSpeed(movFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3300
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3300
         * @tc.desc      : test setPlaybackRate in executable state by random
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            const setrates = createStepRates(0.125,4,0.125).sort(() => Math.random() - 0.5)
            let setrate: number
            let operationRecord: Record<string, Function> = {};
            [PREPARED,PLAYING,PAUSED,COMPLETED].forEach(state => {
                operationRecord[state] = async () => {
                    let item = setrates.shift()
                    if(item){
                        setrate = setrates.shift() as number
                        avPlayer.setPlaybackRate(setrate)
                    }else{
                        done()
                    }
                    console.info(`case operationRecord[${state}] call`)
                    if(state == PREPARED) return false
                    else return true
                }
            })
            operationRecord[STOPPED] = async () => {
                avPlayer.prepare();
                console.info(`case operationRecord[STOPPED] call`)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
                expect(setrate).assertEqual(rate)
                let num: number
                switch(avPlayer.state){
                    case PREPARED:
                        avPlayer.play();
                        break;
                    case PLAYING:
                        [
                            avPlayer.pause,
                            avPlayer.stop,
                            () => {}
                        ][Math.floor(Math.random() * 3)].bind(avPlayer)()
                        break;
                    case PAUSED:
                        [
                            avPlayer.play,
                            avPlayer.stop
                        ][Math.floor(Math.random() * 2)].bind(avPlayer)()
                        break;
                    case COMPLETED:
                        [
                            avPlayer.play,
                            avPlayer.stop
                        ][Math.floor(Math.random() * 2)].bind(avPlayer)()
                        break;
                    default:
                        break;
                }
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_3300 setPlaybackRate error: ' + JSON.stringify(error))
                expect().assertFail();
                done();
            }
            await testSetPlaybackSpeed(movFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0100
         * @tc.name      : 027.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 0.124 in prepared state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 0.124
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0100 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400108);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0200
         * @tc.name      : 028.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 4.001 in prepared state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 4.001
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0200 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400108);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0300
         * @tc.name      : 029.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 0 in prepared state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 0
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0300 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400108);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0400
         * @tc.name      : 030.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate -1 in prepared state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = -1
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0400 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400108);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0500
         * @tc.name      : 031.test setPlaybackRate in prepared state
         * @tc.desc      : test setPlaybackRate 10000 in prepared state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 10000
            let operationRecord: Record<string, Function> = {}
            operationRecord[PREPARED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0500 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400108);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0600
         * @tc.name      : 032.test setPlaybackRate in idle state
         * @tc.desc      : test setPlaybackRate 1.5 in idle state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.5
            let operationRecord: Record<string, Function> = {}
            operationRecord[IDLE] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.reset()
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0600 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0700
         * @tc.name      : 033.test setPlaybackRate in initialized state
         * @tc.desc      : test setPlaybackRate 1.5 in initialized state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.5
            let operationRecord: Record<string, Function> = {}
            operationRecord[INITIALIZED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0700 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0800
         * @tc.name      : 034.test setPlaybackRate in stopped state
         * @tc.desc      : test setPlaybackRate 1.5 in stopped state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.5
            let operationRecord: Record<string, Function> = {}
            operationRecord[STOPPED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.stop().then(() => {
                    console.info('case stop AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0800 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0900
         * @tc.name      : 035.test setPlaybackRate in released state
         * @tc.desc      : test setPlaybackRate 1.5 in released state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.5
            let operationRecord: Record<string, Function> = {}
            operationRecord[RELEASED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.release().then(() => {
                    console.info('case release AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_0900 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_1000
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_1000
         * @tc.desc      : test setPlaybackRate 1.5 in stopped state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.5
            let operationRecord: Record<string, Function> = {}
            operationRecord[STOPPED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            operationRecord[PLAYING] = async () => {
                await avPlayer.stop().then(() => {
                    console.info('case stop AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_1000 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });

        /**
         * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_1100
         * @tc.name      : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_1100
         * @tc.desc      : test setPlaybackRate 1.5 in released state, expect error
         * @tc.size      : MediumTest
         * @tc.type      : Function test
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let setrate = 1.5
            let operationRecord: Record<string, Function> = {}
            operationRecord[RELEASED] = async () => {
                avPlayer.setPlaybackRate(setrate)
            }
            operationRecord[INITIALIZED] = async () => {
                await avPlayer.release().then(() => {
                    console.info('case release AVPlayer success');
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            let callback: media.OnPlaybackRateDone = (rate: number) => {
                expect().assertFail()
                done()
            }
            let errCallback: ErrorCallback = (error: BusinessError) => {
                console.info('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_ERROR_1100 setPlaybackRate error: ' + JSON.stringify(error))
                expect(error.code).assertEqual(5400102);
                done()
            }
            await testSetPlaybackSpeed(avFd, done, callback, operationRecord, errCallback)
        });
    })
}