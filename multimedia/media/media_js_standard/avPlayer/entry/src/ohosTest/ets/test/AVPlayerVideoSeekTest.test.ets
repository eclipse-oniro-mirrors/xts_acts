import MediaTestBase from './MediaTestBase';
import media from '@ohos.multimedia.media'
import { setSource } from './AVPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

// #region - public params
const VIDEO_SOURCE = 'H264_AAC.mp4';
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
let isSeek = false
// #endregion

// #region - public function
function openFileFailed() {
    console.info('case file fail');
}

function waitForSeekDone(doAfterSeekDone:Function = () => {}): Promise<void>{
    return new Promise<void>(res => {
        const time_handle = setInterval(() => {
            if(!isSeek){
                doAfterSeekDone()
                res()
                console.log(`-----清除setInterval，handle[${time_handle}]-----`)
                clearInterval(time_handle)
            }
        },100)
        console.log(`-----创建定时器，handle[${time_handle}]-----`)
    })
}

interface RunSeekInfo {
    seekSucceed: number;
    seekFailed: number;
    allDone: Promise<void[]>;
    printPassCount: Function
}
function runSeekInSeries(TimePoints:Array<number>): RunSeekInfo{
    const runSeekInfo: RunSeekInfo = {
        seekSucceed:0,
        seekFailed:0,
        allDone:Promise.all([]),
        printPassCount:() => {
            console.log(`runSeekInfo: succeed - ${runSeekInfo.seekSucceed} failed - ${runSeekInfo.seekFailed}}`)
        }
    }
    if(!TimePoints.length){
        console.log("TimePoints is empty")
        return runSeekInfo
    }
    let promises = TimePoints.map(timePoint => {
        return waitForSeekDone(() => {
            isSeek = true
            console.log("-----开始执行视频跳转，跳转时间点为：" + timePoint + "ms-----")
            avPlayer?.seek(timePoint,media.SeekMode.SEEK_CLOSEST)
        })
    })
    runSeekInfo.allDone = Promise.all(promises)
    return runSeekInfo
}

function getVideoStagePoints(shuffle:boolean = false,Interval:number = 100): Array<number>{
    const duration: number = avPlayer?.duration || 0
    let video_time_points: Array<number>
    if(duration == -1){
        video_time_points = [-1]
    }else{
        video_time_points = new Array(Math.ceil(duration / Interval)).fill("").map((item:string,index:number,self:Array<string>) => {
            if(index == self.length - 1) return duration
            return (index + 1) * Interval
        })
    }
    if(shuffle) video_time_points = video_time_points.sort(() => Math.random() - 0.5)
    return video_time_points
}
// #endregion

export default function AVPlayerVideoSeekTest() {
    describe('AVPlayerVideoSeekTest', () => {
        // #region - node function
        beforeAll(async () => {
            console.info('beforeAll case');
            await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
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
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
        })
        afterAll(async () => {
            console.info('afterAll case');
            await mediaTestBase.closeFdNumber(fileDescriptor.fd);
        })
        // #endregion

        // #region
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0100
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0100
            * @tc.desc      : Sequential loop call seek in prepared state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0100', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    const time_points = getVideoStagePoints()
                    avPlayer?.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer?.prepare();
                                break;
                            case PREPARED:
                                const time_points = getVideoStagePoints()
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(runSeekInfo.seekSucceed).assertEqual(time_points.length)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer?.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer?.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0200
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0200
            * @tc.desc      : Randomized loop call seek in prepared state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0200', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail()
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                const time_points = getVideoStagePoints(true)
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(runSeekInfo.seekSucceed).assertEqual(time_points.length)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0300
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0300
            * @tc.desc      : Sequential loop call seek in playing state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0300', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
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
                                const time_points = getVideoStagePoints()
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(runSeekInfo.seekSucceed).assertEqual(time_points.length)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0400
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0400
            * @tc.desc      : Randomized loop call seek in playing state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0400', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return;
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case PLAYING:
                                const time_points = getVideoStagePoints(true)
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(runSeekInfo.seekSucceed).assertEqual(time_points.length)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0500
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0500
            * @tc.desc      : Sequential loop call seek in pause state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0500', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return;
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
                                const time_points = getVideoStagePoints()
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(runSeekInfo.seekSucceed).assertEqual(time_points.length)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0600
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0600
            * @tc.desc      : Randomized loop call seek in pause state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0600', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return;
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
                                const time_points = getVideoStagePoints(true)
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(runSeekInfo.seekSucceed).assertEqual(time_points.length)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0700
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0700
            * @tc.desc      : Sequential loop call seek in initialized state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0700', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer?.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.play();
                                break;
                            case COMPLETED:
                                const time_points = getVideoStagePoints()
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(runSeekInfo.seekSucceed).assertEqual(time_points.length)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0800
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0800
            * @tc.desc      : Randomized loop call seek in completed state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0800', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
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
                            case COMPLETED:
                                const time_points = getVideoStagePoints(true)
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(runSeekInfo.seekSucceed).assertEqual(time_points.length)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0900
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0900
            * @tc.desc      : Set values outside the range and run in prepared state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_0900', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                const outsideTimePoints = [-1,avPlayer.duration + 100];
                                runSeekInfo = runSeekInSeries(outsideTimePoints)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1000
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1000
            * @tc.desc      : Set values outside the range and run in playing state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1000', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
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
                                const outsideTimePoints = [-1,avPlayer.duration + 100];
                                runSeekInfo = runSeekInSeries(outsideTimePoints)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1100
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1100
            * @tc.desc      : Set values outside the range and run in paused state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1100', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
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
                                break
                            case PAUSED:
                                const outsideTimePoints = [-1,avPlayer.duration + 100];
                                runSeekInfo = runSeekInSeries(outsideTimePoints)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1200
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1200
            * @tc.desc      : Set values outside the range and run in completed state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1200', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
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
                            case COMPLETED:
                                const outsideTimePoints = [-1,avPlayer.duration + 100];
                                runSeekInfo = runSeekInSeries(outsideTimePoints)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1300
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1300
            * @tc.desc      : Sequential loop call seek in idle state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1300', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
                    });
                    const time_points = getVideoStagePoints()
                    runSeekInfo = runSeekInSeries(time_points)
                    await runSeekInfo.allDone
                    await waitForSeekDone()
                    runSeekInfo.printPassCount()
                    expect(!runSeekInfo.seekFailed).assertEqual(false)
                    done()
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1400
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1400
            * @tc.desc      : Randomized loop call seek in idle state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1400', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
                    });
                    const time_points = getVideoStagePoints(true)
                    runSeekInfo = runSeekInSeries(time_points)
                    await runSeekInfo.allDone
                    await waitForSeekDone()
                    runSeekInfo.printPassCount()
                    expect(!runSeekInfo.seekFailed).assertEqual(false)
                    done()
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1500
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1500
            * @tc.desc      : Sequential loop call seek in initialized state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1500', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                const time_points = getVideoStagePoints()
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1600
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1600
            * @tc.desc      : Randomized loop call seek in initialized state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1600', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                const time_points = getVideoStagePoints(true)
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1700
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1700
            * @tc.desc      : Sequential loop call seek in stopped state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1700', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.stop();
                                break;
                            case STOPPED:
                                const time_points = getVideoStagePoints()
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1800
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1800
            * @tc.desc      : Randomized loop call seek in stopped state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1800', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case INITIALIZED:
                                avPlayer.prepare();
                                break;
                            case PREPARED:
                                avPlayer.stop();
                                break;
                            case STOPPED:
                                const time_points = getVideoStagePoints(true)
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
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
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1900
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1900
            * @tc.desc      : Sequential loop call seek in released state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_1900', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case RELEASED:
                                const time_points = getVideoStagePoints()
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
                    });
                    avPlayer.release()
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })

        // #region
        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_2000
            * @tc.name      : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_2000
            * @tc.desc      : Randomized loop call seek in released state
            * @tc.size      : MediumTest
            * @tc.type      : Reliability test
            * @tc.level     : Level1
        */
        // #endregion
        it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKTSINTERFACE_2000', Level.LEVEL0,async (done: Function) => {
            if(!avPlayer){
                console.info(`avPlayer is null`);
                expect().assertFail();
                done();
            }else{
                try {
                    let runSeekInfo:RunSeekInfo
                    avPlayer.on('stateChange', async (state:string, reason:media.StateChangeReason) => {
                        if(!avPlayer) return
                        console.info('case current state is: ' + state)
                        switch (state) {
                            case RELEASED:
                                const time_points = getVideoStagePoints(true)
                                runSeekInfo = runSeekInSeries(time_points)
                                await runSeekInfo.allDone
                                await waitForSeekDone()
                                runSeekInfo.printPassCount()
                                expect(!runSeekInfo.seekFailed).assertEqual(false)
                                done()
                                break;
                            default:
                                break;
                        }
                    });
                    avPlayer.on('seekDone',(seekDoneTime:number) => {
                        console.info('seekDone called,and seek time is:' + seekDoneTime);
                        isSeek = false;
                        runSeekInfo.seekSucceed++;
                    })
                    avPlayer.on('error', (err) => {
                        console.error(`error occurred, message is ${err.message}`);
                        isSeek = false;
                        runSeekInfo.seekFailed++;
                    });
                    avPlayer.release()
                } catch (error) {
                    console.error(`Test exception: ${JSON.stringify(error)}`);
                    expect().assertFail()
                    done()
                }
            }
        })
    })
}