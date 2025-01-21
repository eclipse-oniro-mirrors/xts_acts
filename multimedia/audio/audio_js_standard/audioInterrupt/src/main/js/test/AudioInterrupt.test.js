/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import audio from '@ohos.multimedia.audio';
import ability from '@ohos.ability.featureAbility'
import fileio from '@ohos.fileio';
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';
export default function audioInterrupt() {
describe('audioInterrupt', function () {
    console.info('audioRenderInterrupt: Create AudioManger Object JS Framework');
    let fdRead;
    let readPath;
    console.info('AudioFrameworkRenderLog: Create AudioManger Object JS Framework');
    let fdPath;
    let filePath;

    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    async function getcreateAVSession() {
        let tag = "createNewSession";
        let type = "audio";
        let context1 = featureAbility.getContext();
        let av = await avSession.createAVSession(context1, tag, type);
        console.info('av is ' + JSON.stringify(av));
    }
    async function getFdRead(pathName, done) {
        let context = await featureAbility.getContext();
        console.info("case0 context is  " + context);
        await context.getFilesDir().then((data) => {
            console.info("case1 getFilesDir is path " + data);
            filePath = data + '/' + pathName;
            console.info('case4 filePath is ' + filePath);

        })
        fdPath = 'fd://';
        await fileio.open(filePath).then((fdNumber) => {
            fdPath = fdPath + '' + fdNumber;
            fdRead = fdNumber;
            console.info('[fileIO]case open fd success,fdPath is ' + fdPath);
            console.info('[fileIO]case open fd success,fdRead is ' + fdRead);

        }, (err) => {
            console.info('[fileIO]case open fd failed');
        }).catch((err) => {
            console.info('[fileIO]case catch open fd failed');
        });
    }


    beforeAll(function () {
        console.info('audioRenderInterrupt: beforeAll: Prerequisites at the test suite level');
        getcreateAVSession();
    })

    beforeEach(async function () {
        console.info('audioRenderInterrupt: beforeEach: Prerequisites at the test case level');
        await sleep(100);
    })

    afterEach(async function () {
        console.info('audioRenderInterrupt: afterEach: Test case-level clearance conditions');
        await sleep(100);
    })

    afterAll(function () {
        console.info('audioRenderInterrupt: afterAll: Test suite-level cleanup condition');
    })



    it('SUB_AUDIO_INTERRUPT_001', 0, async function (done) {
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        var AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav';
        await getFdRead(readPath, done);

        var audioRen;
        await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
            audioRen = data;
            console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);

        });


        console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);
        let activated = false;
        let InterruptHint = 0;
        await sleep(7000);
        let audioManager = audio.getAudioManager();
        let interAudioInterrupt = {
            streamUsage: 1,
            contentType: 0,
            pauseWhenDucked: true
        };
        audioManager.on('interrupt', interAudioInterrupt, (InterruptAction) => {
            console.info('come in MasterHap interrupt');
            if (InterruptAction.actionType != undefined && InterruptAction.actionType != null) {
                console.info('An event to gain the audio focus starts.');
                console.info(`Focus gain event: ${InterruptAction} `);
                activated = InterruptAction.activated;
                InterruptHint = InterruptAction.hint
                console.info('activated is :' + activated);
                console.info('InterruptHint is :' + InterruptHint);
                console.info('InterruptAction.actionType  is :' + InterruptAction.actionType);
            }
        });
        await audioRen.start().then(() => {
            console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err) => {
            console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });

        console.info('AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);
        var bufferSize;
        await audioRen.getBufferSize().then(async function (data) {
            console.info('AudioFrameworkRenderLog: getBufferSize :SUCCESS ' + data);
            bufferSize = data;
        }).catch((err) => {
            console.info('AudioFrameworkRenderLog: getBufferSize :ERROR : ' + err.message);
        });

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info('AudioFrameworkRenderLog:case 2:AudioFrameworkRenderLog: File Path: ' + ss);
        let discardHeader = new ArrayBuffer(44);
        console.info('AudioFrameworkRenderLog:case 2-1:AudioFrameworkRenderLog: File Path: ');
        ss.readSync(discardHeader);
        console.info('AudioFrameworkRenderLog:case 2-2:AudioFrameworkRenderLog: File Path: ');
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info('AudioFrameworkRenderLog:case 3 : AudioFrameworkRenderLog: File totalSize size: ' + totalSize);
        totalSize = totalSize - 44;
        console.info('AudioFrameworkRenderLog: File size : Removing header: ' + totalSize);
        let rlen = 0;
        let count = 0;
        while (rlen < totalSize) {
            if (activated == false && InterruptHint == 3) {
                console.info('audio was interrupt')
                
                break;
            }
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info('MasterHap:BufferAudioFramework: bytes read from =================== file: ' + rlen);

            if (rlen >= totalSize / 3 && count == 0) {
                count++;
                await ability.startAbilityForResult(
                    {
                        want:
                        {
                            bundleName: "com.example.audiorenderinterrupt",
                            abilityName: "com.example.entry.MainAbility",
                        },
                    }
                ).then((data) => {
                    console.info("==========================>startAbility Success=======================>" + JSON.stringify(data));

                })
                    .catch((err) => {
                        console.info("==========================>startAbility Fail=======================>" + JSON.stringify(err));
                    });
            }
            await audioRen.write(buf);
        }

        console.info('AudioFrameworkRenderLog: Renderer after read');


        await audioRen.drain().then(async function () {
            console.info('AudioFrameworkRenderLog: Renderer drained : SUCCESS');
        }).catch((err) => {
            console.error('AudioFrameworkRenderLog: Renderer drain: ERROR : ' + err.message);
        });
        await audioRen.release().then(async function () {
            console.info('AudioFrameworkRenderLog: Renderer release : SUCCESS');
        }).catch((err) => {
            console.info('AudioFrameworkRenderLog: Renderer release :ERROR : ' + err.message);
        });
        expect(activated == false && InterruptHint == 3).assertTrue();
        done();
     
    })

})
}