/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import * as AVPlayerTestBase from '../../../../../../AVPlayerTestBase.js';
import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import fs from '@ohos.file.fs';


export default function AVTransCoderTest() {
    describe('AVTransCoderTest', function () {
        let avTranscoder = null;
        let fileDescriptor = null;
        let outputFdObject = null;
        let inputName = '';
        let outputName = '';
        let pauseProgress = 101;
        let times = 0;
        const PAUSE_TIME = 1000;

        let events = require('events');
        let eventEmitter = new events.EventEmitter();

        const CREATEAVTRANSCODER_PROMISE_EVENT = 'createPromise';
        const PREPAREAVTRANSCODER_PROMISE_EVENT = 'preparePromise';
        const STARTAVTRANSCODER_PROMISE_EVENT = 'startPromise';
        const PAUSEAVTRANSCODER_PROMISE_EVENT = 'pausePromise';
        const RESUMEAVTRANSCODER_PROMISE_EVENT = 'resumePromise';
        const CANCELAVTRANSCODER_PROMISE_EVENT = 'cancelPromise';
        const RELEASEAVTRANSCODER_PROMISE_EVENT = 'releasePromise';
        const ERROR_EVENT = 'error';
        const END_EVENT = 'end';

        const SETONCALLBACK_EVENT = 'setAVTransCoderCallback';
        const SET_SRC_AND_DST = 'setSrcAndDst';

        let avTranscoderConfig = {
            audioBitrate : 200000,
            audioCodec : media.CodecMimeType.AUDIO_AAC,
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate : 3000000,
            videoCodec : media.CodecMimeType.VIDEO_AVC,
            videoFrameWidth : 720,
            videoFrameHeight : 480,
        }

        async function closeRawFd(fileName) {
            globalThis.context.resourceManager.closeRawFd(fileName).then(()=> {
                console.log('case closeRawFd ' + fileName);
            }).catch(error => {
                console.log('case closeRawFd err: ' + error);
            })
        }

        beforeAll(async function () {
            console.info('beforeAll case');
        })

        beforeEach(async function () {
            console.info('beforeEach case');
            await AVPlayerTestBase.sleep(1000);
            avTranscoder = null;
            outputFdObject = null;
            outputName = '';
            inputName = '';
            pauseProgress = 101;
            times = 0;
        })

        afterEach(async function () {
            console.info('afterEach case');
            if (avTranscoder != null) {
                await avTranscoder.release().then(() => {
                console.info('this testCase execution completed')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            await mediaTestBase.closeFd(outputFdObject?.fdNumber);
            try {
                await closeRawFd(inputName);
            } catch (error) {
                console.info('closeRawFd' + error)
            }
            await AVPlayerTestBase.sleep(1000);
        })

        afterAll(async function () {
            console.info('afterAll case');
        })

        eventEmitter.on(CREATEAVTRANSCODER_PROMISE_EVENT, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            media.createAVTranscoder().then((transcoder) => {
                if (transcoder != null) {
                    avTranscoder = transcoder;
                    console.info('Succeeded in creating AVTranscoder');
                    toNextStep(avTranscoder, config, pauseTime, steps, done);
                } else {
                    console.error('Failed to create AVTranscoder');
                }
            }).catch((error) => {
                console.error(`Failed to create AVTranscoder, error message:${error}`);
                expect(steps[0]).assertEqual(ERROR_EVENT);
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            });
        });

        eventEmitter.on(PREPAREAVTRANSCODER_PROMISE_EVENT, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            avTranscoder.prepare(config).then(() => {
                console.info('prepare success');
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            }).catch((err) => {
                console.info('prepare failed and catch error is ' + err.message);
                expect(steps[0]).assertEqual(ERROR_EVENT);
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            });
        });

        eventEmitter.on(STARTAVTRANSCODER_PROMISE_EVENT, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            avTranscoder.start().then(() => {
                console.info('start success');
            }).catch((err) => {
                console.info('start failed and catch error is ' + err.message);
                expect(steps[0]).assertEqual(ERROR_EVENT);
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            });
        });

        eventEmitter.on(PAUSEAVTRANSCODER_PROMISE_EVENT, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            avTranscoder.pause().then(() => {
                console.info('pause AVTranscoder success');
                setTimeout(() => {
                    console.info('PAUSEAVTRANSCODER_PROMISE_EVENT setTimeout success');
                    toNextStep(avTranscoder, config, pauseTime, steps, done);
                }, pauseTime);
            }).catch((err) => {
                console.info('pause AVTranscoder failed and catch error is ' + err.message);
                expect(steps[0]).assertEqual(ERROR_EVENT);
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            });
        });

        eventEmitter.on(RESUMEAVTRANSCODER_PROMISE_EVENT, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            avTranscoder.resume().then(() => {
                console.info('resume AVTranscoder success');
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            }).catch((err) => {
                console.info('resume AVTranscoder failed and catch error is ' + err.message);
                expect(steps[0]).assertEqual(ERROR_EVENT);
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            });
        });

        eventEmitter.on(CANCELAVTRANSCODER_PROMISE_EVENT, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            avTranscoder.cancel().then(() => {
                console.info('cancel AVTranscoder success');
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            }).catch((err) => {
                console.info('cancel AVTranscoder failed and catch error is ' + err.message);
                expect(steps[0]).assertEqual(ERROR_EVENT);
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            });
        });

        eventEmitter.on(RELEASEAVTRANSCODER_PROMISE_EVENT, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            avTranscoder.release().then(() => {
                console.info('release AVTranscoder success');
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            }).catch((err) => {
                console.info('release AVTranscoder failed and catch error is ' + err.message);
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            });
        });

        eventEmitter.on(ERROR_EVENT, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            console.info('Error event occurred');
            toNextStep(avTranscoder, config, pauseTime, steps, done);
        });

        eventEmitter.on(SETONCALLBACK_EVENT, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            try{
                setCallback(avTranscoder, config, pauseTime, steps, done);
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            }catch(error){
                console.info('setAVTranscoderCallback failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(SET_SRC_AND_DST, (avTranscoder, config, pauseTime, steps, done) => {
            steps.shift();
            try{
                console.info('case SET_SRC_AND_DST in');
                avTranscoder.fdSrc = fileDescriptor;
                avTranscoder.fdDst = outputFdObject.fdNumber;
                expect(steps[0]).assertEqual(PREPAREAVTRANSCODER_PROMISE_EVENT);
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            }catch(error){
                console.info('SET_SRC_AND_DST failed and catch error is ' + error.message);
            }
        });
    
        function toNextStep(avTranscoder, config, pauseTime, steps, done) {
        if (steps[0] == END_EVENT) {
            console.info('case success!!');
            done();
        } else {
            eventEmitter.emit(steps[0], avTranscoder, config, pauseTime, steps, done);
        }
        }

        function setCallback(avTranscoder, config, pauseTime, steps, done) {
            // 转码进度
            avTranscoder.on('progressUpdate', (progress) => {
                console.info('avTranscoder progressUpdate = ' + progress);
                // to pause
                if (progress > 100) {
                    console.info('avTranscoder progressUpdate');
                    expect(steps[0]).assertEqual(ERROR_EVENT);
                    toNextStep(avTranscoder, config, pauseTime, steps, done);
                }
                if (progress >= pauseProgress && times == 0) {
                    console.info('avTranscoder progressUpdate');
                    times++;
                    expect(steps[0]).assertEqual(PAUSEAVTRANSCODER_PROMISE_EVENT);
                    toNextStep(avTranscoder, config, pauseTime, steps, done);
                }
            })
            // 错误上报回调函数
            avTranscoder.on('error', async (err) => {
                try {
                    console.error('error ocConstantSourceNode, error message is ' + err);
                    toNextStep(avTranscoder, config, pauseTime, steps, done);
                } catch (error) {
                    // 处理错误
                    console.error('when error on execute releaseRecorderPromise error message is ' + error);
                }
            });
            // 转码完成事件
            avTranscoder.on('complete', async () => {
                onsole.info('avTranscoder complete');
                toNextStep(avTranscoder, config, pauseTime, steps, done);
            });
        }

        function resourceName() {
            let timestamp = Date.now();
            let filename = `TransCoder_${timestamp}.mp4`;
            return filename;
        }

        function getDSt(outputName) {
            let contextStage = globalThis.context;
            outputName = contextStage.filesDir + "/" + outputName;
            console.info("case outputName is" + outputName);
            let fdObject = {
                fileAsset : null,
                fdNumber : null
            }
            let file;
            try {
                file = fs.openSync(outputName, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            } catch (err) {
                console.info('case getDSt err: ' + err);
            }
            fdObject.fileAsset = file;
            fdObject.fdNumber = file.fd;
            console.info('case getDSt number is: ' + fdObject.fdNumber);
            return fdObject;
        }

        async function getfdScrAndfdDst() {
            console.info('case getfdScrAndfdDst start');
            await mediaTestBase.getStageFileDescriptor(inputName).then((res) => {
                fileDescriptor = res;
            });
            outputFdObject = getDSt(outputName);
            console.info('case getfdScrAndfdDst end');
        }

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVTANSCODER_0100
        * @tc.name      : 001.test start-pause-resume-stop-release
        * @tc.desc      : Transcoder start-pause-resume-stop-release
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVTANSCODER_0100', 0, async function (done) {
        console.info('SUB_MULTIMEDIA_AVTANSCODER_0100 start')
        outputName = resourceName();
        pauseProgress = 30;
        inputName = "H264_AAC.mp4";
        await getfdScrAndfdDst();

        let mySteps = new Array(
            // create
            CREATEAVTRANSCODER_PROMISE_EVENT, SETONCALLBACK_EVENT, SET_SRC_AND_DST,
            // prepare 
            PREPAREAVTRANSCODER_PROMISE_EVENT,
            // start Transcoder
            STARTAVTRANSCODER_PROMISE_EVENT,
            // pause Transcoder
            PAUSEAVTRANSCODER_PROMISE_EVENT,
            // resume Transcoder
            RESUMEAVTRANSCODER_PROMISE_EVENT,
            // release Transcoder
            RELEASEAVTRANSCODER_PROMISE_EVENT,
            // end
            END_EVENT
        );
        eventEmitter.emit(mySteps[0], avTranscoder, avTranscoderConfig, PAUSE_TIME, mySteps, done);
        console.info('SUB_MULTIMEDIA_AVTANSCODER_0100 end')
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVTANSCODER_0200
        * @tc.name      : 001.test start-pause-resume-cancel-release
        * @tc.desc      : Transcoder start-pause-resume-cancel-release
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVTANSCODER_0200', 0, async function (done) {
            console.info('SUB_MULTIMEDIA_AVTANSCODER_0200 start')
            outputName = resourceName();
            pauseProgress = 30;
            inputName = "H264_AAC.mp4";
            await getfdScrAndfdDst();
    
            let mySteps = new Array(
            // create
            CREATEAVTRANSCODER_PROMISE_EVENT, SETONCALLBACK_EVENT, SET_SRC_AND_DST,
            // prepare 
            PREPAREAVTRANSCODER_PROMISE_EVENT,
            // start Transcoder
            STARTAVTRANSCODER_PROMISE_EVENT,
            // pause Transcoder
            PAUSEAVTRANSCODER_PROMISE_EVENT,
            // resume Transcoder
            RESUMEAVTRANSCODER_PROMISE_EVENT,
            // cancel Transcoder
            CANCELAVTRANSCODER_PROMISE_EVENT,
            // release Transcoder
            RELEASEAVTRANSCODER_PROMISE_EVENT,
            // end
            END_EVENT
            );
            eventEmitter.emit(mySteps[0], avTranscoder, avTranscoderConfig, PAUSE_TIME, mySteps, done);
            console.info('SUB_MULTIMEDIA_AVTANSCODER_0200 end')
        })
  })
}