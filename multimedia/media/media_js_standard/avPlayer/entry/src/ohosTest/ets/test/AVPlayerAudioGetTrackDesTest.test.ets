import MediaTestBase from './MediaTestBase';
import media from '@ohos.multimedia.media'
import { setSource } from './AVPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

// #region - public params
const AUDIO_SOURCE = '01.mp3';
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
let fileDescriptor: media.AVFileDescriptor;
let avPlayer: media.AVPlayer | null = null;
let mediaTestBase = new MediaTestBase()
// #endregion

// #region - public function
function openFileFailed() {
    console.info('case file fail');
}

function avPlayerGetTrackDescriptionByCallback(done:Function,except_value:boolean){
    avPlayer?.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
        if ((arrList) != null && arrList.length) {
            console.info('Succeeded in getting TrackDescription');
            expect(except_value).assertEqual(true)
        } else {
            console.error(`Failed to get TrackDescription, error:${error}`);
            expect(except_value).assertEqual(false)
        }
        done()
    })
}

async function avPlayerGetTrackDescriptionByPromise(done:Function,except_value:boolean){
    avPlayer?.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
        console.info('Succeeded in getting TrackDescription');
        if(arrList.length){
            expect(except_value).assertEqual(true)
        }else{
            expect().assertFail()
        }
        done()
    }).catch((error: BusinessError) => {
        console.error(`Failed to get TrackDescription, error:${error}`);
        expect(except_value).assertEqual(false)
        done()
    });
}
// #endregion

export default function AVPlayerAudioGetTrackDesTest() {
    describe('AVPlayerAudioGetTrackDesTest', () => {
        // #region - node function
        beforeAll(async () => {
            console.info('beforeAll case');
            await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed).then((res) => {
                fileDescriptor = res;
            });
        })
        beforeEach(async () => {
            console.info('beforeEach case');
            await media.createAVPlayer().then((video) => {
                if (typeof (video) != 'undefined') {
                    avPlayer = video;
                } else {
                    expect().assertFail();
                }
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        })
        afterEach(async () => {
            console.info('afterEach case');
            if (avPlayer != null) {
                await avPlayer.release().then(() => {
                    avPlayer = null
                    console.log("avPlayer has been to null")
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
        })
        afterAll(async () => {
            console.info('afterAll case');
            await mediaTestBase.closeFdNumber(fileDescriptor.fd);
        })
        // #endregion

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0100
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`)
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayerGetTrackDescriptionByCallback(done,true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
            
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0100
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0100', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayerGetTrackDescriptionByPromise(done,true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0200
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0200
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0200', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayerGetTrackDescriptionByCallback(done,true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0200
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0200', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayerGetTrackDescriptionByPromise(done,true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0300
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0300
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0300', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayer.pause()
                                break;
                            case PAUSED:
                                avPlayerGetTrackDescriptionByCallback(done,true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0300
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0300
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0300', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayer.pause()
                                break;
                            case PAUSED:
                                avPlayerGetTrackDescriptionByPromise(done,true);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0400
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0400
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0400', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            default:
                                break;
                        }
                    });
                    avPlayerGetTrackDescriptionByCallback(done,false);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0400
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0400
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0400', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            default:
                                break;
                        }
                    });
                    avPlayerGetTrackDescriptionByPromise(done,false);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0500
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0500
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0500', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayer.stop();
                                break;
                            case STOPPED:
                                avPlayerGetTrackDescriptionByCallback(done,false);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0500
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0500
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0500
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0500', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                avPlayer.stop()
                                break;
                            case STOPPED:
                                avPlayerGetTrackDescriptionByPromise(done,false);
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0600
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0600
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_CALLBACK_0600', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.release();
                                break;
                            case RELEASED:
                                const time = setTimeout(() => {
                                    done()
                                },3000)
                                avPlayerGetTrackDescriptionByCallback(done,false);
                                avPlayer?.getTrackDescription((error: BusinessError, arrList: Array<media.MediaDescription>) => {
                                    clearTimeout(time)
                                    if ((arrList) != null) expect().assertFail()
                                    done()
                                })
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        // #endregion
        /**
         * @tc.name   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0600
         * @tc.number SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0600
         * @tc.desc   SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0600
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_MEDIA_GET_AUDIODEPTH_PROMISE_0600', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.release();
                                break;
                            case RELEASED:
                                const time = setTimeout(() => {
                                    done()
                                },3000)
                                avPlayer?.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
                                    clearTimeout(time)
                                    expect().assertFail()
                                    done()
                                }).catch((error: BusinessError) => {
                                    clearTimeout(time)
                                    done()
                                });
                                break;
                            default:
                                break;
                        }
                    });
                    setSource(avPlayer, fileDescriptor);
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })
    })
}