/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import audio from '@ohos.multimedia.audio';
import fileio from '@ohos.fileio';
import featureAbility from '@ohos.ability.featureAbility'
let fdRead;
let readPath;
let fdPath;
let filePath;
let TAG = 'InterruptHap:';
var TAG1 = "Fa:SupportFunctionThree:MainAbility:";
var listPush1 = "Fa_SupportFunctionThree_MainAbility_";
var lifeList = [];
export default {
    async onCreate() {
        console.log(TAG1 + '=============================================================================>               onCreate');
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        async function getFdRead(pathName) {
            let context = await featureAbility.getContext();
            console.info(TAG + "case0 context is  " + context);
            await context.getFilesDir().then((data) => {
                console.info(TAG + "case1 getFilesDir is path " + data);
                filePath = data + '/' + pathName;
                console.info(TAG + 'case4 filePath is ' + filePath);

            })
            fdPath = 'fd://';
            await fileio.open(filePath).then((fdNumber) => {
                fdPath = fdPath + '' + fdNumber;
                fdRead = fdNumber;
                console.info(TAG + '[fileIO]case open fd success,fdPath is ' + fdPath);
                console.info(TAG + '[fileIO]case open fd success,fdRead is ' + fdRead);

            }, (err) => {
                console.info(TAG + '[fileIO]case open fd failed');
            }).catch((err) => {
                console.info(TAG + '[fileIO]case catch open fd failed');
            });
        }
        var AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        var AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        var AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav';
        getFdRead(readPath);

        var audioRen;
        await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
            audioRen = data;
            console.info(TAG + 'AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS' + audioRen);
        }).catch((err) => {
            console.info(TAG + 'AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });

        console.info(TAG + 'AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);

        await audioRen.start().then(async function () {
            console.info(TAG + 'AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
        }).catch((err) => {
            console.info(TAG + 'AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
        });

        console.info(TAG + 'AudioFrameworkRenderLog: AudioRenderer : STATE : ' + audioRen.state);
        var bufferSize;
        await audioRen.getBufferSize().then(async function (data) {
            console.info(TAG + 'AudioFrameworkRenderLog: getBufferSize :SUCCESS ' + data);
            bufferSize = data;
        }).catch((err) => {
            console.info(TAG + 'AudioFrameworkRenderLog: getBufferSize :ERROR : ' + err.message);
        });

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(TAG + 'AudioFrameworkRenderLog:case 2:AudioFrameworkRenderLog: File Path: ' + ss);
        let discardHeader = new ArrayBuffer(44);
        console.info(TAG + 'AudioFrameworkRenderLog:case 2-1:AudioFrameworkRenderLog: File Path: ');
        ss.readSync(discardHeader);
        console.info(TAG + 'AudioFrameworkRenderLog:case 2-2:AudioFrameworkRenderLog: File Path: ');
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(TAG + 'AudioFrameworkRenderLog:case 3 : AudioFrameworkRenderLog: File totalSize size: ' + totalSize);
        totalSize = totalSize - 44;
        console.info(TAG + 'AudioFrameworkRenderLog: File size : Removing header: ' + totalSize);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(TAG + 'InterruptHap:BufferAudioFramework: bytes read from file: ' + rlen);
            await audioRen.write(buf);
        }
        let activated = false;
        let InterruptHint = 0;
        let audioManager = audio.getAudioManager();
        let interAudioInterrupt = {
            streamUsage: 1,
            contentType: 0,
            pauseWhenDucked: true
        };
        audioManager.on('interrupt', interAudioInterrupt, (InterruptAction) => {
            console.info(TAG + 'come in FuZhuHap interrupt');
            if (InterruptAction.actionType != undefined && InterruptAction.actionType != null) {
                console.info(TAG + 'InterruptHap An event to gain the audio focus ========================= starts.');
                console.info(TAG + `Focus gain event: ${InterruptAction} `);
                activated = InterruptAction.activated;
                InterruptHint = InterruptAction.hint
                console.info(TAG + 'activated ============ is :' + activated);
                console.info(TAG + 'InterruptHint ================ is :' + InterruptHint);
                console.info(TAG + 'InterruptAction.actionType ============ is :' + InterruptAction.actionType);
            }

        });
        console.info(TAG + 'AudioFrameworkRenderLog: Renderer after read');
        await sleep(3000);
        await audioRen.drain().then(async function () {
            console.info(TAG + 'AudioFrameworkRenderLog: Renderer drained : SUCCESS');
            let wantInfo = {
                want:
                {
                    bundleName: "com.example.audiorenderinterrupt",
                    abilityName: "com.example.entry.MainAbility"
                },
                resultCode: 1111
            }
            featureAbility.terminateSelfWithResult(wantInfo).then(() => {
                console.info(TAG + 'terminateSelf ==================================   success')
            })
                .catch(() => {
                    console.info(TAG + 'terminateSelf ====================================   fail')
                })

        }).catch((err) => {
            console.error(TAG + 'AudioFrameworkRenderLog: Renderer drain: ERROR : ' + err.message);
        });
    },
    onDestroy() {
        console.log(TAG1 + 'onDestroy');
    },
    async onActive() {
        console.log(TAG1 + 'onActive');
    },
    onInactive() {
        console.log(TAG1 + 'onInactive');
    },
    onShow() {
        console.log(TAG1 + 'onShow');
    },
    onHide() {
        console.log(TAG1 + 'onHide');
    }
}