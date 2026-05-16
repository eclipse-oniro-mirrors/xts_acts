/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

 import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
 import { media } from "@kit.MediaKit";
 import { LOG_TAG } from '../common';
 import { sleep, getFd, closeFd } from '../common';

 const TAG = LOG_TAG + 'MediaVideoPlayerAPITest';

 const VIDEO_SOURCE = 'H264_AAC.mp4';
 const SURFACE_ID = 'test_surface_id';
 const SEEK_TIME = 5000;
 const DURATION_TIME = 10034;
 const WIDTH_VALUE = 720;
 const HEIGHT_VALUE = 480;

 export default function MediaVideoPlayerAPITest() {
    describe('MediaVideoPlayerAPITest', () => {
        let videoPlayer: media.VideoPlayer | null = null;
        let fdNumber: number | null = null;
        let fileDescriptor: media.AVFileDescriptor | null = null;

        beforeAll(async () => {
            console.info(TAG, 'beforeAll case');
            fdNumber = await getFd(VIDEO_SOURCE);
            if (fdNumber) {
                fileDescriptor = {
                    fd: fdNumber,
                    offset: 0,
                    length: -1
                };
            }
        });

        beforeEach(async () => {
            console.info(TAG, 'beforeEach case');
        });

        afterEach(async () => {
            console.info(TAG, 'afterEach case');
            if (videoPlayer) {
                try {
                    await videoPlayer.release();
                    videoPlayer = null;
                } catch (error) {
                    console.error(TAG, `release error: ${error}`);
                }
            }
        });

        afterAll(async () => {
            console.info(TAG, 'afterAll case');
            if(fdNumber){
                await closeFd(fdNumber);
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_CALLBACK_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_CALLBACK_0100
         * @tc.desc   Test createVideoPlayer with valid callback
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_CALLBACK_0100';
            try {
                media.createVideoPlayer((error, player) => {
                    if (error) {
                        console.error(TAG, `${testName} error: ${error.message}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    expect(player).not().assertNull();
                    videoPlayer = player;
                    expect(videoPlayer.state).assertEqual('idle');
                    console.info(TAG, `${testName} success`);
                    done();
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_PROMISE_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_PROMISE_0100
         * @tc.desc   Test createVideoPlayer returning Promise<VideoPlayer>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_PROMISE_0100';
            try {
                const player = await media.createVideoPlayer();
                expect(player).not().assertNull();
                videoPlayer = player;
                expect(videoPlayer.state).assertEqual('idle');
                console.info(TAG, `${testName} success`);
                done();
            } catch (error) {
                console.error(TAG, `${testName} error: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0100
         * @tc.desc   Test seek with valid timeMs and callback
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0100';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                videoPlayer.seek(SEEK_TIME, (error, result) => {
                    if (error) {
                        console.error(TAG, `${testName} error: ${error.message}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    expect(result).assertLarger(0);
                    console.info(TAG, `${testName} success, seekDoneTime: ${result}`);
                    done();
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0200
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0200
         * @tc.desc   Test seek with timeMs, SeekMode and callback
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0200', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0200';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                const seekMode = media.SeekMode.SEEK_NEXT_SYNC;
                videoPlayer.seek(SEEK_TIME, seekMode, (error, result) => {
                    if (error) {
                        console.error(TAG, `${testName} error: ${error.message}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    expect(result).assertLarger(0);
                    console.info(TAG, `${testName} success, seekDoneTime: ${result}`);
                    done();
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0300
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0300
         * @tc.desc   Test seek with all SeekMode values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0300', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0300';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                let seekModes : media.SeekMode[] = [
                    media.SeekMode.SEEK_NEXT_SYNC
                ];

                let completedCount = 0;
                seekModes.forEach((mode, index) => {
                    videoPlayer?.seek(SEEK_TIME, mode, (error,result) => {
                        if (error) {
                            console.error(TAG, `${testName} error for mode ${mode}: ${error.message}`);
                        } else {
                            expect(result).assertLarger(0);
                        }
                        completedCount++;
                        if (completedCount === seekModes.length) {
                            console.info(TAG, `${testName} success`);
                            done();
                        }
                    });
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0400
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0400
         * @tc.desc   Test seek with all SeekMode values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0400', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0400';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                let seekModes : media.SeekMode[] = [
                    media.SeekMode.SEEK_PREV_SYNC
                ];

                let completedCount = 0;
                seekModes.forEach((mode, index) => {
                    videoPlayer?.seek(SEEK_TIME, mode, (error,result) => {
                        if (error) {
                            console.error(TAG, `${testName} error for mode ${mode}: ${error.message}`);
                        } else {
                            expect(result).assertLarger(0);
                        }
                        completedCount++;
                        if (completedCount === seekModes.length) {
                            console.info(TAG, `${testName} success`);
                            done();
                        }
                    });
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0500
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0500
         * @tc.desc   Test seek with all SeekMode values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0500', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0500';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                let seekModes : media.SeekMode[] = [
                    media.SeekMode.SEEK_CLOSEST
                ];

                let completedCount = 0;
                seekModes.forEach((mode, index) => {
                    videoPlayer?.seek(SEEK_TIME, mode, (error,result) => {
                        if (error) {
                            console.error(TAG, `${testName} error for mode ${mode}: ${error.message}`);
                        } else {
                            expect(result).assertLarger(0);
                        }
                        completedCount++;
                        if (completedCount === seekModes.length) {
                            console.info(TAG, `${testName} success`);
                            done();
                        }
                    });
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0600
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0600
         * @tc.desc   Test seek with all SeekMode values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0600', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0600';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                let seekModes : media.SeekMode[] = [
                    media.SeekMode.SEEK_CONTINUOUS
                ];

                let completedCount = 0;
                seekModes.forEach((mode, index) => {
                    videoPlayer?.seek(SEEK_TIME, mode, (error,result) => {
                        if (error) {
                            console.error(TAG, `${testName} error for mode ${mode}: ${error.message}`);
                        } else {
                            expect(result).assertLarger(0);
                        }
                        completedCount++;
                        if (completedCount === seekModes.length) {
                            console.info(TAG, `${testName} success`);
                            done();
                        }
                    });
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

       /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_0100
         * @tc.desc   Test seek with vaild timeMs returning Promise<number>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_0100';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                const result = await videoPlayer.seek(SEEK_TIME);
                expect(result).assertLarger(0);
                console.info(TAG, `${testName} success, seekDoneTime: ${result}`);
                done();
            } catch (error) {
                console.error(TAG, `${testName} error: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_0200
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_0200
         * @tc.desc   Test seek with timeMs,SeekMode returning Promise<number>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_0200', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_0200';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                const seekMode = media.SeekMode.SEEK_NEXT_SYNC;
                const result:number = await (videoPlayer as media.VideoPlayer).seek(SEEK_TIME, seekMode);
                expect(result).assertLarger(0);
                console.info(TAG, `${testName} success, seekDoneTime: ${result}`);
                done();
            } catch (error) {
                console.error(TAG, `${testName} error: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0100
         * @tc.desc   Test setVolume with valid volume and callback
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0100';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                const volume = 0.5;
                videoPlayer.setVolume(volume, (error) => {
                    if (error) {
                        console.error(TAG, `${testName} error: ${error.message}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.info(TAG, `${testName} success`);
                    done();
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0200
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0200
         * @tc.desc   Test setVolume with 0.0 and 1.0
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0200', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0200';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                let completedCount = 0;
                const volumes = [0.0, 1.0];

                volumes.forEach((volume) => {
                    videoPlayer?.setVolume(volume, (error) => {
                        if (error) {
                        console.error(TAG, `${testName} error for volume ${volume}: ${error.message}`);
                        expect().assertFail();
                    }
                    completedCount++;
                    if (completedCount === volumes.length) {
                        console.info(TAG, `${testName} success`);
                        done();
                    }
                  });
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0300
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0300
         * @tc.desc   Test setVolume with invalid volume values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0300', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0300';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                let completedCount = 0;
                const invalidVolumes = [-0.5, 1.5, 2.0];

                invalidVolumes.forEach((volume) => {
                    videoPlayer?.setVolume(volume, (error) => {
                        expect(error).not().assertNull();
                        completedCount++;
                        if (completedCount === invalidVolumes.length) {
                        console.info(TAG, `${testName} success`);
                        done();
                    }
                  });
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0400
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0400
         * @tc.desc   Test setVolume with invalid volume values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0400', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_CALLBACK_0400';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                let completedCount = 0;
                const invalidVolumes = [null, undefined];

                invalidVolumes.forEach((volume) => {
                    videoPlayer?.setVolume(volume, (error) => {
                        expect(error).not().assertNull();
                        completedCount++;
                        if (completedCount === invalidVolumes.length) {
                        console.info(TAG, `${testName} success`);
                        done();
                    }
                  });
                });
            } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0100
         * @tc.desc   Test setVolume with valid volume returning Promise<void>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0100';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                const volume = 0.7;
                await videoPlayer.setVolume(volume);
                console.info(TAG, `${testName} success`);
                done();
            } catch (error) {
                console.error(TAG, `${testName} error: ${error}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0200
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0200
         * @tc.desc   Test setVolume with invalid volume returning Promise<void>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0200', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0200';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                try {
                    await videoPlayer.setVolume(2.0);
                    expect().assertFail();
                } catch (error) {
                    console.info(TAG, `${testName} success, expected error caught`);
            }
            done();
          } catch (error) {
            console.error(TAG, `${testName} error: ${error}`);
            expect().assertFail();
            done();
          }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0300
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0300
         * @tc.desc   Test setVolume with invalid volume returning Promise<void>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0300', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0300';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                try {
                    await videoPlayer.setVolume(null);
                    expect().assertFail();
                } catch (error) {
                    console.info(TAG, `${testName} success, expected error caught`);
            }
            done();
          } catch (error) {
            console.error(TAG, `${testName} error: ${error}`);
            expect().assertFail();
            done();
          }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0400
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0400
         * @tc.desc   Test setVolume with invalid volume returning Promise<void>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0400', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_VOLUME_PROMISE_0400';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                try {
                    await videoPlayer.setVolume(undefined);
                    expect().assertFail();
                } catch (error) {
                    console.info(TAG, `${testName} success, expected error caught`);
            }
            done();
          } catch (error) {
            console.error(TAG, `${testName} error: ${error}`);
            expect().assertFail();
            done();
          }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0100
         * @tc.desc   Test setSpeed with valid speed and callback
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0100';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                
                const speed = 1.0;
                videoPlayer.setSpeed(speed, (error, result) => {
                    if (error) {
                            console.error(TAG, `${testName} error: ${error.message}`);
                            expect().assertFail();
                            done();
                            return;
                        }
                        expect(result).assertEqual(speed);
                        console.info(TAG, `${testName} success, speed: ${result}`);
                        done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0200
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0200
         * @tc.desc   Test setSpeed with invalid speed values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0200', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0200';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                
                const speed = 10.0;
                videoPlayer.setSpeed(speed, (error, result) => {
                    expect(error).not().assertNull();
                    console.info(TAG, `${testName} success`);
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0300
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0300
         * @tc.desc   Test setSpeed with invalid speed values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0300', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0300';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                
                const speed = 10.0;
                videoPlayer.setSpeed(null, (error, result) => {
                    expect(error).not().assertNull();
                    console.info(TAG, `${testName} success`);
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0400
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0400
         * @tc.desc   Test setSpeed with invalid speed values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0400', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_CALLBACK_0400';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                
                const speed = 10.0;
                videoPlayer.setSpeed(undefined, (error, result) => {
                    expect(error).not().assertNull();
                    console.info(TAG, `${testName} success`);
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0100
         * @tc.desc   Test setSpeed with valid speed and returning Promise<number>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0100';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                
                const speed = 1.0;
                const result = await videoPlayer.setSpeed(speed);
                expect(result).assertEqual(speed);
                console.info(TAG, `${testName} success, speed: ${result}`);
                done();
            } catch (error) {
              console.error(TAG, `${testName} error: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0200
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0200
         * @tc.desc   Test setSpeed with invalid speed and returning Promise<number>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0200', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0200';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                try {
                    await videoPlayer.setSpeed(10.0);
                    expect().assertFail();
                } catch (error) {
                    console.info(TAG, `${testName} success, expected error caught`);
                }
                done();
            } catch (error) {
              console.error(TAG, `${testName} error: ${error}`);
              expect().assertFail();
              done();
            }
        });

       /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0300
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0300
         * @tc.desc   Test setSpeed with invalid speed and returning Promise<number>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0300', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0300';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                try {
                    await videoPlayer.setSpeed(null);
                    expect().assertFail();
                } catch (error) {
                    console.info(TAG, `${testName} success, expected error caught`);
                }
                done();
            } catch (error) {
              console.error(TAG, `${testName} error: ${error}`);
              expect().assertFail();
              done();
            }
        }); 

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0400
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0400
         * @tc.desc   Test setSpeed with invalid speed and returning Promise<number>
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0400', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SET_SPEED_PROMISE_0400';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();

                try {
                    await videoPlayer.setSpeed(undefined);
                    expect().assertFail();
                } catch (error) {
                    console.info(TAG, `${testName} success, expected error caught`);
                }
                done();
            } catch (error) {
              console.error(TAG, `${testName} error: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_PROPERTIES_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_PROPERTIES_0100
         * @tc.desc   Test createVideoPlayer with url, fdSrc, loop, currentTime properties
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_PROPERTIES_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_CREATE_VIDEO_PLAYER_PROPERTIES_0100';
            try {
                videoPlayer = await media.createVideoPlayer();

                // Test url property
                videoPlayer.url = 'file://test.mp4';
                expect(videoPlayer.url).assertEqual('file://test.mp4');

                // Test fdSrc property 
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                    expect(videoPlayer.fdSrc).not().assertNull();
                }

                // Test loop property
                videoPlayer.loop = true;
                expect(videoPlayer.loop).assertEqual(true);

                videoPlayer.loop = false;
                expect(videoPlayer.loop).assertEqual(false);

                // Test currentTime property
                videoPlayer.setDisplaySurface(SURFACE_ID);
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                await videoPlayer.prepare();
                await videoPlayer.play();

                const currentTime = videoPlayer.currentTime;
                expect(currentTime).assertLargerOrEqual(0);

                console.info(TAG, `${testName} success`);
                done();
              } catch (error) {
                console.error(TAG, `${testName} exception: ${error}`);
                expect().assertFail();
                done();
              }
        });

        //个人新增16913
        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0700
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0700
         * @tc.desc   Test seek with null timeMs parameter
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0700', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0700';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                videoPlayer.seek(null, (error, result) => {
                    if (error) {
                        console.info(TAG, `${testName} expected error: ${error.message}`);
                    } else {
                        console.error(TAG, `${testName} should have thrown error`);
                    }
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0800
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0800
         * @tc.desc   Test seek with undefined timeMs parameter
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0800', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_0800';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                videoPlayer.seek(undefined, (error, result) => {
                    if (error) {
                        console.info(TAG, `${testName} expected error: ${error.message}`);
                    } else {
                        console.error(TAG, `${testName} should have thrown error`);
                    }
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_NULL_UNDEFINED_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_NULL_UNDEFINED_0100
         * @tc.desc   Test seek with null timeMs parameter with SeekMode
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_NULL_UNDEFINED_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_NULL_UNDEFINED_0100';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                videoPlayer.seek(null, media.SeekMode.SEEK_PREV_SYNC, (error, result) => {
                    if (error) {
                        console.info(TAG, `${testName} expected error: ${error.message}`);
                    } else {
                        console.error(TAG, `${testName} should have thrown error`);
                    }
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_NULL_UNDEFINED_0200
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_NULL_UNDEFINED_0200
         * @tc.desc   Test seek with undefined timeMs parameter with SeekMode
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_NULL_UNDEFINED_0200', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_NULL_UNDEFINED_0200';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                videoPlayer.seek(undefined, media.SeekMode.SEEK_PREV_SYNC, (error, result) => {
                    if (error) {
                        console.info(TAG, `${testName} expected error: ${error.message}`);
                    } else {
                        console.error(TAG, `${testName} should have thrown error`);
                    }
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0100
         * @tc.desc   Test seek with SEEK_PREV_SYNC parameter with SeekMode
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0100';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_PREV_SYNC, (error, result) => {
                    if (error) {
                        console.info(TAG, `${testName} expected error: ${error.message}`);
                    } else {
                        console.error(TAG, `${testName} should have thrown error`);
                    }
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0200
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0200
         * @tc.desc   Test seek with SEEK_CLOSEST parameter with SeekMode
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0200', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0200';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_CLOSEST, (error, result) => {
                    if (error) {
                        console.info(TAG, `${testName} expected error: ${error.message}`);
                    } else {
                        console.error(TAG, `${testName} should have thrown error`);
                    }
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0300
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0300
         * @tc.desc   Test seek with SEEK_CONTINUOUS parameter with SeekMode
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0300', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_CALLBACK_SEEKMODE_0300';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_CONTINUOUS, (error, result) => {
                    if (error) {
                        console.info(TAG, `${testName} expected error: ${error.message}`);
                    } else {
                        console.error(TAG, `${testName} should have thrown error`);
                    }
                    done();
                });
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0100
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0100
         * @tc.desc   Test seek with SEEK_CLOSEST and SEEK_CONTINUOUS SeekMode values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0100', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0100';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                const result = await videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_CLOSEST);
                expect(result).assertLarger(0);
                console.info(TAG, `${testName} success for mode SEEK_CLOSEST, seekDoneTime: ${result}`);
                console.info(TAG, `${testName} success`);
                done();
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0200
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0200
         * @tc.desc   Test seek with SEEK_CLOSEST and SEEK_CONTINUOUS SeekMode values
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0200', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0200';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                const result = await videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_CONTINUOUS);
                expect(result).assertLarger(0);
                console.info(TAG, `${testName} success for mode SEEK_CONTINUOUS, seekDoneTime: ${result}`);
                console.info(TAG, `${testName} success`);
                done();
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0300
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0300
         * @tc.desc   Test seek with null
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0300', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0300';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                try {
                    await videoPlayer.seek(null, media.SeekMode.SEEK_CONTINUOUS);
                    console.error(TAG, `${testName} should have thrown error`);
                } catch (e) {
                    console.info(TAG, `${testName} expected exception`);
                }
                console.info(TAG, `${testName} success`);
                done();
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });

        /**
         * @tc.number SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0400
         * @tc.name   SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0400
         * @tc.desc   Test seek with undefined
         * @tc.size   MEDIUM
         * @tc.type   Function
         * @tc.level  Level 1
         */
        it('SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0400', Level.LEVEL1, async (done: Function) => {
            const testName = 'SUB_MEDIA_VIDEO_PLAYER_SEEK_PROMISE_SEEK_MODE_0400';
            try {
                videoPlayer = await media.createVideoPlayer();
                if (fileDescriptor) {
                    videoPlayer.fdSrc = fileDescriptor;
                }
                videoPlayer.setDisplaySurface(SURFACE_ID);
                await videoPlayer.prepare();
                await videoPlayer.play();

                try {
                    await videoPlayer.seek(undefined, media.SeekMode.SEEK_CONTINUOUS);
                    console.error(TAG, `${testName} should have thrown error`);
                } catch (e) {
                    console.info(TAG, `${testName} expected exception`);
                }
                console.info(TAG, `${testName} success`);
                done();
            } catch (error) {
              console.error(TAG, `${testName} exception: ${error}`);
              expect().assertFail();
              done();
            }
        });
    });
 }
