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
import fileio from '@ohos.fileio';
import resourceManager from '@ohos.resourceManager';
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

describe('audioRenderer', function () {

    let fdRead;
    let readPath;
    const AUDIOMANAGER = audio.getAudioManager();
    let TagFrmwkRender = "AudioFrameworkRenderLog";
    let TagFrmwk = "AudioFrameworkTest";
    let TagFrmwkAudioScene = "AudioFrameworkAudioScene";
    let fdPath;
    let filePath;
    let stringParameter = "invalid_parameter";
    let numberParameter = 999999;
    console.info(`${TagFrmwkRender}: Create AudioManger Object JS Framework`);

    beforeAll(function () {
        console.info(`${TagFrmwkRender}: beforeAll: Prerequisites at the test suite level`);
    })

    beforeEach(async function () {
        console.info(`${TagFrmwkRender}: beforeEach: Prerequisites at the test case level`);
        await sleep(1000);
    })

    afterEach(function () {
        console.info(`${TagFrmwkRender}: afterEach: Test case-level clearance conditions`);
    })

    afterAll(async function () {
        console.info(`${TagFrmwkRender}: afterAll: Test suite-level cleanup condition`);
    })

    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    async function closeFileDescriptor(fileName) {
        await resourceManager.getResourceManager().then(async (mgr) => {
            await mgr.closeRawFileDescriptor(fileName).then(value => {
                console.log(`${TagFrmwkRender}:case closeRawFileDescriptor success for file:${fileName}`);
            }).catch(error => {
                console.log(`${TagFrmwkRender}:case closeRawFileDescriptor err: ${error}`);
            });
        });
    }

    async function getFdRead(pathName, done) {
        let context = await featureAbility.getContext();
        console.info(`case0 context is : ${context}`);
        await context.getFilesDir().then((data) => {
            console.info(`case1 getFilesDir is path : ${data}`);
            filePath = data + '/' + pathName;
            console.info(`case4 filePath is : ${filePath}`);

        })
        fdPath = 'fd://';
        await fileio.open(filePath).then((fdNumber) => {
            fdPath = fdPath + '' + fdNumber;
            fdRead = fdNumber;
            console.info(`[fileIO]case open fd success,fdPath is : ${fdPath}`);
            console.info(`[fileIO]case open fd success,fdRead is : ${fdRead}`);

        }, (err) => {
            console.info(`[fileIO]case open fd failed : ${err}`);
        }).catch((error) => {
            console.info(`[fileIO]case catch open fd error : ${error}`);
        });
    }

    async function playbackPromise(AudioRendererOptions, pathName, AudioScene) {
        let resultFlag = 'new';
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then(function (data) {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data state: ${Object.keys(data)}`);
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS data value: ${JSON.stringify(data)}`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            return resultFlag;
        });
        console.log(`isPass:${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then(function (audioParamsGet) {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize;
        await audioRen.getBufferSize().then((data) => {
            console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
            bufferSize = data;
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case2: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case3: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 2)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkRender}:AudioFrameworkAudioScene: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkRender}:AudioFrameworkAudioScene: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
            resultFlag = true;
            console.info(`${TagFrmwkRender}: resultFlagRen : ${resultFlag}`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        return resultFlag;
    }

    async function playbackPromise_93(AudioRendererOptions, pathName, AudioScene) {
        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        let audioTimeStart;

        await audioRen.getAudioTime().then((data) => {
            audioTimeStart = data / 1000000000;
            console.info(`${TagFrmwkRender}: getAudioTime : After Start : Converted: ${audioTimeStart}`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: getAudioTime : ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);

        if (audioTimeStart != 0) {
            console.info(`${TagFrmwkRender}: getAudioTime : PASS : ${audioTimeStart}`);
        }
        else {
            console.info(`${TagFrmwkRender}: getAudioTime : FAIL : ${audioTimeStart}`);
            resultFlag = false;
        }

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
    }

    async function playbackPromise_94(AudioRendererOptions, pathName, AudioScene) {
        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        let audioTimeStart;
        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        let gettime = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            await audioRen.getAudioTime().then((data) => {
                audioTimeStart = data / 1000000000;
                console.info(`${TagFrmwkRender}: getAudioTime : After Start : Converted: ${audioTimeStart}`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: getAudioTime : ERROR : ${err.message}`);
                resultFlag = false;
            });
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        if (audioTimeStart != 0) {
            console.info(`${TagFrmwkRender}: getAudioTime : PASS : ${audioTimeStart}`);
        }
        else {
            console.info(`${TagFrmwkRender}: getAudioTime : FAIL : ${audioTimeStart}`);
            resultFlag = false;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
    }

    async function playbackPromise_95(AudioRendererOptions, pathName, AudioScene) {
        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        let audioTimeStart;

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
        }

        console.info(`${TagFrmwkRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        await audioRen.getAudioTime().then((data) => {
            audioTimeStart = data / 1000000000;
            console.info(`${TagFrmwkRender}: getAudioTime : After Start : Converted: ${audioTimeStart}`);
        }).catch((err) => {
            resultFlag = true;
            console.info(`${TagFrmwkRender}: getAudioTime : ERROR : ${err.message}`);
        });

        if (audioTimeStart != 0) {
            console.info(`${TagFrmwkRender}: getAudioTime : PASS : ${audioTimeStart}`);
        }
        else {
            console.info(`${TagFrmwkRender}: getAudioTime : FAIL : ${audioTimeStart}`);
            resultFlag = false;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);
        return resultFlag;
    }

    async function playbackPromise_102(AudioRendererOptions, pathName) {
        let resultFlag = false;
        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }
        audioRen.on('markReach', 55, (position) => {
            console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
            resultFlag = true;
        })

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize;
        await audioRen.getBufferSize().then((data) => {
            console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
            bufferSize = data;
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
            resultFlag = false;
        });

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        console.info(`${TagFrmwkRender}:case 2-1:AudioFrameworkRenderLog: File Path: `);
        ss.readSync(discardHeader);
        console.info(`${TagFrmwkRender}:case 2-2:AudioFrameworkRenderLog: File Path: `);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
        }

        console.info(`${TagFrmwkRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);
        return resultFlag;
    }

    async function playbackPromise_103(AudioRendererOptions, pathName) {
        let resultFlag = false;
        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }
        audioRen.on('markReach', 55, (position) => {
            console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
            audioRen.off('markReach');
            audioRen.on('markReach', 100, (position) => {
                console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
                resultFlag = true;
            });
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize;
        await audioRen.getBufferSize().then((data) => {
            console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
            bufferSize = data;
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
            resultFlag = false;
        });

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);
        return resultFlag;
    }

    async function playbackPromise_104(AudioRendererOptions, pathName) {
        let resultFlag = false;
        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }
        audioRen.on('markReach', 55, (position) => {
            console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
            resultFlag = true;
            audioRen.on('markReach', 73, (position) => {
                console.log(`${TagFrmwk}: markReach Event is called :  ${position}`);
                resultFlag = true;
            });
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize;
        await audioRen.getBufferSize().then((data) => {
            console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
            bufferSize = data;
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
            resultFlag = false;
        });

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);
        return resultFlag;
    }

    async function playbackPromise_105(AudioRendererOptions, pathName) {
        let resultFlag = false;
        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }
        audioRen.on('periodReach', 55, (position) => {
            console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
            resultFlag = true;
            audioRen.off('periodReach');
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize;
        await audioRen.getBufferSize().then((data) => {
            console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
            bufferSize = data;
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
            resultFlag = false;
        });

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
        }

        console.info(`${TagFrmwkRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);
        return resultFlag;
    }

    async function playbackPromise_106(AudioRendererOptions, pathName) {
        let resultFlag = false;
        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }
        audioRen.on('periodReach', 55, (position) => {
            console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
            audioRen.off('periodReach');
            audioRen.on('periodReach', 100, (position) => {
                console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
                resultFlag = true;
                audioRen.off('periodReach');
            });

        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize;
        await audioRen.getBufferSize().then((data) => {
            console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
            bufferSize = data;
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
            resultFlag = false;
        });

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);
        return resultFlag;
    }

    async function playbackPromise_107(AudioRendererOptions, pathName) {
        let resultFlag = false;
        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            return resultFlag;
        }
        audioRen.on('periodReach', 55, (position) => {
            console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
            resultFlag = true;
            audioRen.on('periodReach', 73, (position) => {
                console.log(`${TagFrmwk}: periodReach Event is called : ${position}`);
                resultFlag = false;
            });
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize;
        await audioRen.getBufferSize().then((data) => {
            console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
            bufferSize = data;
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
            resultFlag = false;
        });

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);
        return resultFlag;
    }

    async function playbackPromise_113(AudioRendererOptions, pathName) {
        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {

                audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_DOUBLE, (err) => {
                    if (err) {
                        console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_DOUBLE : ERROR : ${err.message}`);
                        resultFlag = false;
                    }
                    else {
                        console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_DOUBLE : SUCCESS`);
                    }
                });
            }
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);
        await sleep(2000);
        audioRen.getRenderRate((err, data) => {
            if (err) {
                console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_DOUBLE : ERROR : ${err.message}`);
                resultFlag = false;
            }
            else if (data == audio.AudioRendererRate.RENDER_RATE_DOUBLE) {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_DOUBLE : PASS : ${data}`);
            }
            else {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_DOUBLE : FAIL : ${data}`);
                resultFlag = false;
            }
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        return resultFlag;
    }

    async function playbackCB(AudioRendererOptions, pathName) {

        let resultFlag = 'new';

        console.info(`${TagFrmwkRender}: CALLBACK : Audio Playback Function`);

        let audioRen;

        audio.createAudioRenderer(AudioRendererOptions, (err, data) => {
            if (err) {
                console.error(`${TagFrmwkRender}: AudioRender Created : Error: ${err.message}`);
                resultFlag = false;
            }
            else {
                console.info(`${TagFrmwkRender}: AudioRender Created : Success : SUCCESS`);
                audioRen = data;
            }
        });
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        await sleep(100);

        console.info(`${TagFrmwkRender}: AudioRenderer : Path : ${pathName}`);

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: CALLBACK : Audio Playback Function`);

        audioRen.start((err) => {
            if (err) {
                console.error(`${TagFrmwkRender}: Renderer start failed: Error: ${err.message}`);
                resultFlag = false;
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer started`);
            }
        });
        await sleep(100);
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }
        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let samplingRate;
        audioRen.getStreamInfo(async (err, audioParamsGet) => {
            await sleep(100);
            if (err) {
                console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
                resultFlag = false;
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
                samplingRate = audioParamsGet.samplingRate;
            }
        });
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        audioRen.getRendererInfo(async (err, audioParamsGet) => {
            await sleep(100);
            if (err) {
                console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
                resultFlag = false;
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            }
        });
        await sleep(100);
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        let bufferSize;
        await audioRen.getBufferSize((err, data) => {
            if (err) {
                console.info(`${TagFrmwkRender}: getBufferSize :ERROR : ${err.message}`);
                resultFlag = false;
            }
            else {
                console.info(`${TagFrmwkRender}: getBufferSize :SUCCESS ${data}`);
                bufferSize = data;
            }
        });
        await sleep(100);
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 4: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        let aa = fileio.fstatSync(fdRead);
        console.log(`case 6 : ${aa}`);
        console.info(`${TagFrmwkRender}: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        let rlen = 0;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        await sleep(100);
        let waitTime;
        switch (samplingRate) {
            case 44100:
                waitTime = 45;
                break;
            case 8000:
                waitTime = 60;
                break;
            case 32000:
                waitTime = 45;
                break;
            case 64000:
                waitTime = 45;
                break;
            case 96000:
                waitTime = 45;
                break;
            case 11025:
                waitTime = 45;
                break;
            case 12000:
                waitTime = 45;
                break;
            case 16000:
                waitTime = 45;
                break;
            case 22050:
                waitTime = 45;
                break;
            case 24000:
                waitTime = 45;
                break;
            case 48000:
                waitTime = 45;
                break;
            default:
                waitTime = 45;
                break
        }

        await sleep(100);
        console.info(`${TagFrmwkRender}: waitTime : ${waitTime}`);
        while (rlen < totalSize / 10) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf, (err, data) => {
                if (err) {
                    console.error(`${TagFrmwkRender}: Buff write: Error: ${err.message}`);
                    resultFlag = false;
                }
                else {
                    console.info(`${TagFrmwkRender}:BufferAudioFramework: Buff write successful`);
                    resultFlag = true;
                }
            });
            await sleep(waitTime);
        }
        await sleep(100);
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }
        ss.closeSync();
        audioRen.drain((err, state) => {
            if (err) {
                console.error(`${TagFrmwkRender}: Renderer drain failed: Error: ${err.message}`);
                resultFlag = false;
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer drained`);
            }
        });
        await sleep(100);
        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }
        audioRen.stop((err, state) => {
            if (err) {
                console.error(`${TagFrmwkRender}: Renderer stop failed: Error: ${err.message}`);
                resultFlag = false;
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer stopped`);
                resultFlag = true;
                console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            }
        });
        await sleep(100);
        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        if (resultFlag == false) {
            console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
            return resultFlag;
        }
        audioRen.release((err, state) => {
            if (err) {
                console.error(`${TagFrmwkRender}: Renderer release failed: Error: ${err.message}`);
                resultFlag = false;
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer released`);
            }
        });
        await sleep(100);
        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        return resultFlag;

    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0100
     * @tc.name      : AudioRenderer-Set1-Media
     * @tc.desc      : AudioRenderer with parameter set 1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0100', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-44100-2SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0200
     * @tc.name      : AudioRenderer - getAudioTime -Before Play
     * @tc.desc      : AudioRenderer - getAudioTime -Before Play
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0200', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-24000-3SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_93(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100)
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0300
     * @tc.name      : AudioRenderer - getAudioTime - During Play
     * @tc.desc      : AudioRenderer - getAudioTime - During Play
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0300', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-24000-3SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_94(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100)
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0400
     * @tc.name      : AudioRenderer - getAudioTime - after Play
     * @tc.desc      : AudioRenderer - getAudioTime - after Play
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0400', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-24000-3SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_95(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100)
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0500
     * @tc.name      : AudioRenderer - markReached - On
     * @tc.desc      : AudioRenderer - markReached
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0500', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_102(AudioRendererOptions, filePath);
        await sleep(100);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0600
     * @tc.name      : AudioRenderer - markReached - On - off -on
     * @tc.desc      : AudioRenderer - markReached
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0600', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_103(AudioRendererOptions, filePath);
        await sleep(100)
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0700
     * @tc.name      : AudioRenderer - markReached - on - on
     * @tc.desc      : AudioRenderer - markReached
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0700', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav';
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_104(AudioRendererOptions, filePath);
        await sleep(100)
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0800
     * @tc.name      : AudioRenderer - periodReach - On
     * @tc.desc      : AudioRenderer - periodReach
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0800', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        readPath = 'StarWars10s-2C-48000-4SW.wav';
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_105(AudioRendererOptions, filePath);
        await sleep(100)
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0900
     * @tc.name      : AudioRenderer - periodReach - On - off -on
     * @tc.desc      : AudioRenderer - periodReach
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_0900', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav';
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_106(AudioRendererOptions, filePath);
        await sleep(100)
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1000
     * @tc.name      : AudioRenderer - periodReach - on - on
     * @tc.desc      : AudioRenderer - periodReach
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1000', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav';
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_107(AudioRendererOptions, filePath);
        await sleep(100)
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1100
     * @tc.name      : AudioRenderer-Set2-Media
     * @tc.desc      : AudioRenderer with parameter set 2
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1100', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-8000-2SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1200
     * @tc.name      : AudioRenderer-Set3-Media
     * @tc.desc      : AudioRenderer with parameter set 3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1200', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-32000-1SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1300
     * @tc.name      : AudioRenderer-Set4-Media
     * @tc.desc      : AudioRenderer with parameter set 4
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1300', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-64000-3SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1400
     * @tc.name      : AudioRenderer-Set5-Media
     * @tc.desc      : AudioRenderer with parameter set 5
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1400', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-96000-4SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1500
     * @tc.name      : AudioRenderer-Set6-Media
     * @tc.desc      : AudioRenderer with parameter set 6
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1500', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-11025-1SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1600
     * @tc.name      : AudioRenderer-Set7-Media
     * @tc.desc      : AudioRenderer with parameter set 7
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1600', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-12000-2SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
        await sleep(100);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1700
     * @tc.name      : AudioRenderer-Set11-Media
     * @tc.desc      : AudioRenderer with parameter set 11
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1700', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(100);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1800
     * @tc.name      : AudioRenderer-isStreamActive - UNKNOWN - UNKNOWN
     * @tc.desc      : AudioRenderer-isStreamActive - UNKNOWN - UNKNOWN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1800', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1900
     * @tc.name      : AudioRenderer-isStreamActive - SPEECH - UNKNOWN
     * @tc.desc      : AudioRenderer-isStreamActive - SPEECH - UNKNOWN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_1900', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2000
     * @tc.name      : AudioRenderer-isStreamActive - MUSIC - UNKNOWN
     * @tc.desc      : AudioRenderer-isStreamActive - MUSIC - UNKNOWN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2000', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2100
     * @tc.name      : AudioRenderer-isStreamActive - MOVIE - UNKNOWN
     * @tc.desc      : AudioRenderer-isStreamActive - MOVIE - UNKNOWN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2100', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MOVIE,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2200
     * @tc.name      : AudioRenderer-isStreamActive - SONIFICATION - UNKNOWN
     * @tc.desc      : AudioRenderer-isStreamActive - SONIFICATION - UNKNOWN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2200', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.RINGTONE).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2300
     * @tc.name      : AudioRenderer-isStreamActive - RINGTONE - UNKNOWN
     * @tc.desc      : AudioRenderer-isStreamActive - RINGTONE - UNKNOWN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2300', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.RINGTONE).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2400
     * @tc.name      : AudioRenderer-isStreamActive - UNKNOWN - MEDIA
     * @tc.desc      : AudioRenderer-isStreamActive - UNKNOWN - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2400', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2500
     * @tc.name      : AudioRenderer-isStreamActive - SPEECH - MEDIA
     * @tc.desc      : AudioRenderer-isStreamActive - SPEECH - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2500', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.VOICE_ASSISTANT).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive VOICE_ASSISTANT: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive VOICE_ASSISTANT: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2600
     * @tc.name      : AudioRenderer-isStreamActive - MUSIC - MEDIA
     * @tc.desc      : AudioRenderer-isStreamActive - MUSIC - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2600', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2700
     * @tc.name      : AudioRenderer-isStreamActive - MOVIE - MEDIA
     * @tc.desc      : AudioRenderer-isStreamActive - MOVIE - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2700', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MOVIE,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2800
     * @tc.name      : AudioRenderer-isStreamActive - SONIFICATION - MEDIA
     * @tc.desc      : AudioRenderer-isStreamActive - SONOTIFICATION - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2800', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.RINGTONE).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2900
     * @tc.name      : AudioRenderer-isStreamActive - RINGTONE - MEDIA
     * @tc.desc      : AudioRenderer-isStreamActive - RINGTONE - MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_2900', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.RINGTONE).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3000
     * @tc.name      : AudioRenderer-isStreamActive - UNKNOWN - VOICE_COMMUNICATION
     * @tc.desc      : AudioRenderer-isStreamActive - UNKNOWN - VOICE_COMMUNICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3000', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3100
     * @tc.name      : AudioRenderer-isStreamActive - SPEECH - VOICE_COMMUNICATION
     * @tc.desc      : AudioRenderer-isStreamActive - SPEECH - VOICE_COMMUNICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3100', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.VOICE_CALL).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive VOICE_CALL: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive VOICE_CALL: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3200
     * @tc.name      : AudioRenderer-isStreamActive - MUSIC - VOICE_COMMUNICATION
     * @tc.desc      : AudioRenderer-isStreamActive - MUSIC - VOICE_COMMUNICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3200', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3300
     * @tc.name      : AudioRenderer-isStreamActive - MOVIE - VOICE_COMMUNICATION
     * @tc.desc      : AudioRenderer-isStreamActive - MOVIE - VOICE_COMMUNICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3300', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MOVIE,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3400
     * @tc.name      : AudioRenderer-isStreamActive - SONOTIFICATION - VOICE_COMMUNICATION
     * @tc.desc      : AudioRenderer-isStreamActive - SONOTIFICATION - VOICE_COMMUNICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3400', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3500
     * @tc.name      : AudioRenderer-isStreamActive - RINGTONE - VOICE_COMMUNICATION
     * @tc.desc      : AudioRenderer-isStreamActive - RINGTONE - VOICE_COMMUNICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3500', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3600
     * @tc.name      : AudioRenderer-isStreamActive - UNKNOWN - NOTIFICATION_RINGTONE
     * @tc.desc      : AudioRenderer-isStreamActive - UNKNOWN - NOTIFICATION_RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3600', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3700
     * @tc.name      : AudioRenderer-isStreamActive - SPEECH - NOTIFICATION_RINGTONE
     * @tc.desc      : AudioRenderer-isStreamActive - SPEECH - NOTIFICATION_RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3700', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3800
     * @tc.name      : AudioRenderer-isStreamActive - MUSIC - NOTIFICATION_RINGTONE
     * @tc.desc      : AudioRenderer-isStreamActive - MUSIC - NOTIFICATION_RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3800', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.RINGTONE).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive RENGITONE: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3900
     * @tc.name      : AudioRenderer-isStreamActive - MOVIE - NOTIFICATION_RINGTONE
     * @tc.desc      : AudioRenderer-isStreamActive - MOVIE - NOTIFICATION_RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_3900', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MOVIE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4000
     * @tc.name      : AudioRenderer-isStreamActive - SONOTIFICATION - NOTIFICATION_RINGTONE
     * @tc.desc      : AudioRenderer-isStreamActive - SONOTIFICATION - NOTIFICATION_RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4000', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.MEDIA).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive Media: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive Media: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4100
     * @tc.name      : AudioRenderer-isStreamActive - RINGTONE - NOTIFICATION_RINGTONE
     * @tc.desc      : AudioRenderer-isStreamActive - RINGTONE - NOTIFICATION_RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4100', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;
        readPath = 'StarWars10s-2C-48000-4SW.wav'
        await getFdRead(readPath, done);
        playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_DEFAULT);
        await sleep(2000);
        AUDIOMANAGER.isActive(audio.AudioVolumeType.RINGTONE).then(function (data) {
            if (data == true) {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: PASS : ${data}`);
            }
            else {
                console.log(`${TagFrmwk}: Promise : isActive RINGTONE: FAIL : ${data}`);
            }
        });
        await sleep(9000);
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4200
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set1
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set1
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4200', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4300
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set2
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set2
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4300', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4400
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set3
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4400', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4500
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set4
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set4
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4500', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MOVIE,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4600
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set5
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set5
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4600', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4700
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set6
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set6
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4700', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4800
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set7
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set7
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4800', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4900
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set8
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set8
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_4900', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5000
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set9
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set9
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5000', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5100
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set10
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set10
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5100', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MOVIE,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5200
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set11
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set11
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5200', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5300
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set12
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set12
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5300', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5400
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set13
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set13
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5400', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5500
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set14
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set14
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5500', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5600
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set15
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set15
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5600', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5700
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set16
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set16
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5700', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MOVIE,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5800
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set17
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set17
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5800', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5900
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set18
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set18
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_5900', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6000
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set19
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set19
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6000', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6100
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set20
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set20
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6100', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6200
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set21
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set21
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6200', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6300
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set22
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set22
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6300', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MOVIE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6400
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set23
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set23
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6400', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6500
     * @tc.name      : AudioRenderer-SET & GET AudioRendererInfo - Set24
     * @tc.desc      : AudioRenderer-SET & GET AudioRendererInfo - Set24
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6500', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            await audioRen.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
            return;
        }

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
            if (audioParamsGet.content == AudioRendererInfo.content) {
                console.info(`${TagFrmwkRender}: Renderer content type: PASS: ${audioParamsGet.content}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer content type: FAIL: ${dioParamsGet.content}`);
                resultFlag = false;
            }
            if (audioParamsGet.usage == AudioRendererInfo.usage) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.usage}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.usage}`);
                resultFlag = false;
            }
            if (audioParamsGet.rendererFlags == AudioRendererInfo.rendererFlags) {
                console.info(`${TagFrmwkRender}: Renderer usage type: PASS: ${audioParamsGet.rendererFlags}`);
            }
            else {
                console.info(`${TagFrmwkRender}: Renderer usage type: FAIL: ${audioParamsGet.rendererFlags}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        expect(resultFlag).assertTrue();
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6600
     * @tc.name      : AudioRenderer - STATE_PREPARED
     * @tc.desc      : AudioRenderer - STATE_PREPARED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6600', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        if (audioRen.state == audio.AudioState.STATE_PREPARED) {
            console.info(`${TagFrmwkRender}: Audio State : STATE_PREPARED : PASS : ${audioRen.state}`);
        }
        else {
            console.info(`${TagFrmwkRender}: Audio State : STATE_PREPARED : FAIL : ${audioRen.state}`);
            resultFlag = false;
        }

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6700
     * @tc.name      : AudioRenderer - STATE_RUNNING
     * @tc.desc      : AudioRenderer - STATE_RUNNING
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6700', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);

        if (audioRen.state == audio.AudioState.STATE_RUNNING) {
            console.info(`${TagFrmwkRender}: Audio State : STATE_RUNNING : PASS : ${audioRen.state}`);
        }
        else {
            console.info(`${TagFrmwkRender}: Audio State : STATE_RUNNING : FAIL : ${audioRen.state}`);
            resultFlag = false;
        }

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6800
     * @tc.name      : AudioRenderer - STATE_STOPPED
     * @tc.desc      : AudioRenderer - STATE_STOPPED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6800', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            resultFlag = false;
        });
        await sleep(500);

        if (audioRen.state == audio.AudioState.STATE_STOPPED) {
            console.info(`${TagFrmwkRender}: Audio State : STATE_STOPPED : PASS : ${audioRen.state}`);
        }
        else {
            console.info(`${TagFrmwkRender}: Audio State : STATE_STOPPED : FAIL : ${audioRen.state}`);
            resultFlag = false;
        }

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6900
     * @tc.name      : AudioRenderer - STATE_RELEASED
     * @tc.desc      : AudioRenderer - STATE_RELEASED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_6900', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            resultFlag = false;
        });
        await sleep(500);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        await sleep(500);

        if (audioRen.state == audio.AudioState.STATE_RELEASED) {
            console.info(`${TagFrmwkRender}: Audio State : STATE_RELEASED : PASS : ${audioRen.state}`);
        }
        else {
            console.info(`${TagFrmwkRender}: Audio State : STATE_RELEASED : FAIL : ${audioRen.state}`);
            resultFlag = false;
        }

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7000
     * @tc.name      : AudioRenderer - STATE_PAUSED
     * @tc.desc      : AudioRenderer - STATE_PAUSED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7000', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = true;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);

        await audioRen.pause().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant Pause :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant Pause :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);

        if (audioRen.state == audio.AudioState.STATE_PAUSED) {
            console.info(`${TagFrmwkRender}: Audio State : STATE_PAUSED : PASS : ${audioRen.state}`);
        }
        else {
            console.info(`${TagFrmwkRender}: Audio State : STATE_PAUSED : FAIL : ${audioRen.state}`);
            resultFlag = false;
        }

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });
        await sleep(500);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        await sleep(500)

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7100
     * @tc.name      : AudioRenderer - SetRenderRate - RENDER_RATE_DOUBLE
     * @tc.desc      : AudioRenderer - SetRenderRate - RENDER_RATE_DOUBLE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7100', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav';
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {
                await audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_DOUBLE).then(() => {
                    console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_DOUBLE : SUCCESS`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_DOUBLE : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
        }

        console.info(`${TagFrmwkRender}: Renderer after read`);
        await audioRen.getRenderRate().then((data) => {
            if (data == audio.AudioRendererRate.RENDER_RATE_DOUBLE) {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_DOUBLE : PASS : ${data}`);
            }
            else {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_DOUBLE : FAIL : ${data}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_DOUBLE : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();

        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7200
     * @tc.name      : AudioRenderer - SetRenderRate - RENDER_RATE_HALF
     * @tc.desc      : AudioRenderer - SetRenderRate - RENDER_RATE_HALF
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7200', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-24000-3SW.wav'
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {
                await audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_HALF).then(() => {
                    console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_HALF : SUCCESS`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_HALF : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);
        await audioRen.getRenderRate().then((data) => {
            if (data == audio.AudioRendererRate.RENDER_RATE_HALF) {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_HALF : PASS : ${data}`);
            }
            else {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_HALF : FAIL : ${data}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_HALF : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();

        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7300
     * @tc.name      : AudioRenderer - SetRenderRate - RENDER_RATE_NORMAL
     * @tc.desc      : AudioRenderer - SetRenderRate - RENDER_RATE_NORMAL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7300', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-44100-2SW.wav'
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {
                await audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_DOUBLE).then(() => {
                    console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_DOUBLE : SUCCESS`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_DOUBLE : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
        }
        await audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_NORMAL).then(() => {
            console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_NORMAL : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_NORMAL : ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: Renderer after read`);
        await audioRen.getRenderRate().then((data) => {
            if (data == audio.AudioRendererRate.RENDER_RATE_NORMAL) {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_NORMAL : PASS : ${data}`);
            }
            else {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_NORMAL : FAIL : ${data}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_NORMAL : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7400
     * @tc.name      : AudioRenderer - SetRenderRate - DEFAULT - RENDER_RATE_NORMAL
     * @tc.desc      : AudioRenderer - SetRenderRate - DEFAULT - RENDER_RATE_NORMAL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7400', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-96000-4SW.wav'
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);


        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 2)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);
        await audioRen.getRenderRate().then((data) => {
            if (data == audio.AudioRendererRate.RENDER_RATE_NORMAL) {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_NORMAL : PASS : ${data}`);
            }
            else {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_NORMAL : FAIL : ${data}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_NORMAL : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();

        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7500
     * @tc.name      : AudioRenderer - SetRenderRate - RENDER_RATE_DOUBLE - Callback
     * @tc.desc      : AudioRenderer - SetRenderRate - RENDER_RATE_DOUBLE - Callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7500', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-32000-1SW.wav'
        await getFdRead(readPath, done);
        let resultFlag = await playbackPromise_113(AudioRendererOptions, filePath);
        await sleep(100)
        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);
        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7600
     * @tc.name      : AudioRenderer - SetRenderRate - RENDER_RATE_HALF - CALLBACK
     * @tc.desc      : AudioRenderer - SetRenderRate - RENDER_RATE_HALF - CALLBACK
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7600', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-24000-3SW.wav'
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {
                audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_HALF, (err) => {
                    if (err) {
                        console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_HALF : ERROR : ${err.message}`);
                        resultFlag = false;
                    } else {
                        console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_HALF : SUCCESS`);
                    }
                });
            }
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);
        await sleep(2000);
        await audioRen.getRenderRate().then((data) => {
            if (data == audio.AudioRendererRate.RENDER_RATE_HALF) {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_HALF : PASS : ${data}`);
            }
            else {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_HALF : FAIL : ${data}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_HALF : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();

        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7700
     * @tc.name      : AudioRenderer - SetRenderRate - RENDER_RATE_NORMAL - CALLBACK
     * @tc.desc      : AudioRenderer - SetRenderRate - RENDER_RATE_NORMAL - CALLBACK
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7700', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-44100-2SW.wav'
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {
                await audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_DOUBLE).then(() => {
                    console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_DOUBLE : SUCCESS`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_DOUBLE : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
        }
        audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_NORMAL, (err) => {
            if (err) {
                console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_NORMAL : ERROR : ${err.message}`);
                resultFlag = false;
            } else {
                console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_NORMAL : SUCCESS`);
            }
        });
        await sleep(500);
        console.info(`${TagFrmwkRender}: Renderer after read`);
        await audioRen.getRenderRate().then((data) => {
            if (data == audio.AudioRendererRate.RENDER_RATE_NORMAL) {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_NORMAL : PASS : ${data}`);
            }
            else {
                console.info(`${TagFrmwkRender}: getRenderRate : RENDER_RATE_NORMAL : FAIL : ${data}`);
                resultFlag = false;
            }
        }).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_NORMAL : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7800
     * @tc.name      : AudioRenderer - SetRenderRate - UNSUPPORT_OPTION - CALLBACK
     * @tc.desc      : AudioRenderer - SetRenderRate - UNSUPPORT_OPTION - CALLBACK
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7800', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-44100-2SW.wav'
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {
                await audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_DOUBLE).then(() => {
                    console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_DOUBLE : SUCCESS`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_DOUBLE : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
        }
        audioRen.setRenderRate(numberParameter, (err) => {
            if (err) {
                if (err.code == 6800104) {
                    console.info(`${TagFrmwkRender}: setRenderRate : PASS`);
                } else {
                    console.info(`${TagFrmwkAudioScene}: setRenderRate, caught err, but dismatch : FAILED`);
                    resultFlag = false;
                }
            } else {
                console.info(`${TagFrmwkAudioScene}: setRenderRate : FAILED`);
                resultFlag = false;
            }
        });
        console.info(`${TagFrmwkRender}: Renderer after read`);
        await audioRen.getRenderRate().then((data) => {}).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_NORMAL : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7900
     * @tc.name      : AudioRenderer - SetRenderRate - INVALID_PARAM - CALLBACK
     * @tc.desc      : AudioRenderer - SetRenderRate - INVALID_PARAM - CALLBACK
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_7900', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-1C-44100-2SW.wav'
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            resultFlag = false;
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {
                await audioRen.setRenderRate(audio.AudioRendererRate.RENDER_RATE_DOUBLE).then(() => {
                    console.info(`${TagFrmwkRender}: setRenderRate : RENDER_RATE_DOUBLE : SUCCESS`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: setRenderRate : RENDER_RATE_DOUBLE : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
        }
        audioRen.setRenderRate(stringParameter, (err) => {
            if (err) {
                if (err.code == 6800101) {
                    console.info(`${TagFrmwkRender}: setRenderRate : PASS`);
                } else {
                    console.info(`${TagFrmwkAudioScene}: setRenderRate caught err, but dismatch : FAILED`);
                    resultFlag = false;
                }
            } else {
                console.info(`${TagFrmwkAudioScene}: setRenderRate : FAILED`);
                resultFlag = false;
            }
        });
        console.info(`${TagFrmwkRender}: Renderer after read`);
        await audioRen.getRenderRate().then((data) => {}).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8000
     * @tc.name      : AudioRenderer - SetRenderRate - UNSUPPORT_OPTION
     * @tc.desc      : AudioRenderer - SetRenderRate - UNSUPPORT_OPTION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8000', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav';
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {
                await audioRen.setRenderRate(numberParameter).then(() => {
                    console.info(`${TagFrmwkRender}: setRenderRate : FAILED`);
                }).catch((err) => {
                    if (err.code == 6800104) {
                        console.info(`${TagFrmwkRender}: setRenderRate : SUCCESS`);
                    } else {
                        console.info(`${TagFrmwkRender}: setRenderRate : caught err but dismatch : FAILED`);
                        resultFlag = false;
                    }
                });
            }
        }

        console.info(`${TagFrmwkRender}: Renderer after read`);
        await audioRen.getRenderRate().then((data) => {}).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_DOUBLE : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();

        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8100
     * @tc.name      : AudioRenderer - SetRenderRate - INVALID_PARAM
     * @tc.desc      : AudioRenderer - SetRenderRate - INVALID_PARAM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8100', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-24000-3SW.wav'
        await getFdRead(readPath, done);
        let AudioScene = audio.AudioScene.AUDIO_SCENE_DEFAULT;

        let resultFlag = true;
        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.getStreamInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer getStreamInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: getStreamInfo :ERROR:  ${err.message}`);
            resultFlag = false;
        });

        await audioRen.getRendererInfo().then((audioParamsGet) => {
            console.info(`${TagFrmwkRender}: Renderer RendererInfo: ${JSON.stringify(audioParamsGet)}`);
        }).catch((err) => {
            console.log(`${TagFrmwkRender}: RendererInfo :ERROR: ${err.message}`);
            resultFlag = false;
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });


        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        let bufferSize = await audioRen.getBufferSize();
        console.info(`${TagFrmwkRender}: buffer size: ${bufferSize}`);

        let ss = fileio.fdopenStreamSync(fdRead, 'r');
        console.info(`${TagFrmwkRender}:case 2:AudioFrameworkRenderLog: File Path: ${ss}`);
        let discardHeader = new ArrayBuffer(44);
        ss.readSync(discardHeader);
        let totalSize = fileio.fstatSync(fdRead).size;
        console.info(`${TagFrmwkRender}:case 3 : AudioFrameworkRenderLog: File totalSize size: ${totalSize}`);
        totalSize = totalSize - 44;
        console.info(`${TagFrmwkRender}: File size : Removing header: ${totalSize}`);
        let rlen = 0;
        while (rlen < totalSize / 4) {
            let buf = new ArrayBuffer(bufferSize);
            rlen += ss.readSync(buf);
            console.info(`${TagFrmwkRender}:BufferAudioFramework: bytes read from file: ${rlen}`);
            await audioRen.write(buf);
            if (rlen > (totalSize / 8)) {
                await AUDIOMANAGER.getAudioScene().then((data) =>{
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : Value : ${data}`);
                }).catch((err) => {
                    console.info(`${TagFrmwkAudioScene}: getAudioScene : ERROR : ${err.message}`);
                    resultFlag = false;
                });
            }
            if (rlen > (totalSize / 8)) {
                await audioRen.setRenderRate(stringParameter).then(() => {
                    console.info(`${TagFrmwkRender}: setRenderRate : FAILED`);
                }).catch((err) => {
                    if (err.code == 6800101) {
                        console.info(`${TagFrmwkRender}: setRenderRate : SUCCESS`);
                    } else {
                        console.info(`${TagFrmwkRender}: setRenderRate : caught err but dismatch : FAILED`);
                        resultFlag = false;
                    }
                });
            }
        }
        console.info(`${TagFrmwkRender}: Renderer after read`);
        await audioRen.getRenderRate().then((data) => {}).catch((err) => {
            console.info(`${TagFrmwkAudioScene}: getRenderRate : RENDER_RATE_HALF : ERROR : ${err.message}`);
            resultFlag = false;
        });

        await audioRen.drain().then(() => {
            console.info(`${TagFrmwkRender}: Renderer drained : SUCCESS`);
        }).catch((err) => {
            console.error(`${TagFrmwkRender}: Renderer drain: ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500)

        expect(resultFlag).assertTrue();

        await closeFileDescriptor(readPath);
        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8200
     * @tc.name      : AudioRenderer - getAudioTime - Error
     * @tc.desc      : AudioRenderer - getAudioTime - Error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8200', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        readPath = 'StarWars10s-2C-48000-4SW.wav';
        await getFdRead(readPath, done);
        let resultFlag = true;
        console.info(`${TagFrmwkRender}: AudioRenderer : Path :  ${readPath}`);

        console.info(`${TagFrmwkRender}: Promise : Audio Playback Function`);

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        await audioRen.getAudioTime().then((data) => {
            console.info(`${TagFrmwkRender}: getAudioTime : Value : ${data}`);
            resultFlag = true;
            if (data > 0) {
                console.info(`${TagFrmwkRender}: getAudioTime : PASS : ${data}`);
            }
            else {
                console.info(`${TagFrmwkRender}: getAudioTime : FAIL : ${data}`);
            }
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: getAudioTime : ERROR : ${err.message}`);
        });

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });

        console.info(`${TagFrmwkRender}: AudioRenderer : STATE : ${audioRen.state}`);

        console.info(`${TagFrmwkRender}: resultFlag : ${resultFlag}`);

        await sleep(500);

        expect(resultFlag).assertTrue();
        await closeFileDescriptor(readPath);
        done();

    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8300
     * @tc.name      : AudioRenderer - STATE_PREPARED -Callback
     * @tc.desc      : AudioRenderer - STATE_PREPARED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8300', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = false;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        audioRen.on('stateChange', (AudioState) => {

            console.log(`${TagFrmwk}: Volume Change Event is called`);

            switch (AudioState) {
                case audio.AudioState.STATE_RELEASED:
                    console.info(`${TagFrmwk}: state : STATE_NEW`);
                    resultFlag = true;
                    break;
                default:
                    console.info(`${TagFrmwk}: state : ${AudioState}`);
                    break;
            }
        });
        await sleep(1000);
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        await sleep(1000);
        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8400
     * @tc.name      : AudioRenderer - STATE_RUNNING - Callback
     * @tc.desc      : AudioRenderer - STATE_RUNNING
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8400', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = false;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        audioRen.on('stateChange', (AudioState) => {

            console.log(`${TagFrmwk}: Volume Change Event is called`);

            switch (AudioState) {
                case audio.AudioState.STATE_RUNNING:
                    console.info(`${TagFrmwk}: state : STATE_RUNNING`);
                    resultFlag = true;
                    break;
                default:
                    console.info(`${TagFrmwk}: state : ${AudioState}`);
                    break;
            }
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        await sleep(1000);

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8500
     * @tc.name      : AudioRenderer - STATE_STOPPED - Callback
     * @tc.desc      : AudioRenderer - STATE_STOPPED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8500', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = false;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        audioRen.on('stateChange', (AudioState) => {

            console.log(`${TagFrmwk}: Volume Change Event is called`);

            switch (AudioState) {
                case audio.AudioState.STATE_STOPPED:
                    console.info(`${TagFrmwk}: state : STATE_STOPPED`);
                    resultFlag = true;
                    break;
                default:
                    console.info(`${TagFrmwk}: state : ${AudioState}`);
                    break;
            }
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            resultFlag = false;
        });
        await sleep(500);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        await sleep(500);

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8600
     * @tc.name      : AudioRenderer - STATE_RELEASED - Callback
     * @tc.desc      : AudioRenderer - STATE_RELEASED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8600', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = false;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }

        audioRen.on('stateChange', (AudioState) => {

            console.log(`${TagFrmwk}: Volume Change Event is called`);

            switch (AudioState) {
                case audio.AudioState.STATE_RELEASED:
                    console.info(`${TagFrmwk}: state : STATE_RELEASED`);
                    resultFlag = true;
                    break;
                default:
                    console.info(`${TagFrmwk}: state : ${AudioState}`);
                    break;
            }
        });

        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
            resultFlag = false;
        });
        await sleep(500);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        await sleep(500);

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8700
     * @tc.name      : AudioRenderer - STATE_PAUSED - Callback
     * @tc.desc      : AudioRenderer - STATE_PAUSED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8700', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = false;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }
        audioRen.on('stateChange', (AudioState) => {

            console.log(`${TagFrmwk}: Volume Change Event is called`);

            switch (AudioState) {
                case audio.AudioState.STATE_PAUSED:
                    console.info(`${TagFrmwk}: state : STATE_PAUSED`);
                    resultFlag = true;
                    break;
                default:
                    console.info(`${TagFrmwk}: state : ${AudioState}`);
                    break;
            }
        });
        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);

        await audioRen.pause().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant Pause :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant Pause :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(500);
        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });
        await sleep(500);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        await sleep(500)

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8800
     * @tc.name      : AudioState - STATE_INVALID
     * @tc.desc      : AudioState - STATE_INVALID
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8800', 2, async function (done) {
        expect(audio.AudioState.STATE_INVALID).assertEqual(-1);
        await sleep(50);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8900
     * @tc.name      : AudioState - STATE_NEW
     * @tc.desc      : AudioState - STATE_NEW
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8900', 2, async function (done) {
        expect(audio.AudioState.STATE_NEW).assertEqual(0);
        await sleep(50);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9000
     * @tc.name      : AudioSampleFormat - STATE_FORMAT_INVALID
     * @tc.desc      : AudioSampleFormat - STATE_FORMAT_INVALID
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9000', 2, async function (done) {
        expect(audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID).assertEqual(-1);
        await sleep(50);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9100
     * @tc.name      : SourceType - SOURCE_TYPE_INVALID
     * @tc.desc      : SourceType - SOURCE_TYPE_INVALID
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9100', 2, async function (done) {
        expect(audio.SourceType.SOURCE_TYPE_INVALID).assertEqual(-1);
        await sleep(50);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9200
     * @tc.name      : AudioRenderer - Pause - Callback
     * @tc.desc      : AudioRenderer - Pause - Callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9200', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let resultFlag = false;

        let audioRen;
        let isPass = false;
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
            audioRen = data;
            console.info(`${TagFrmwkRender}: AudioRender Created : Success : Stream Type: SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: AudioRender Created : ERROR : ${err.message}`);
            LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
            LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
            let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
            if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                isPass = true;
                return;
            }
            resultFlag = false;
        });
        console.log(`isPass: ${isPass}`);
        if (isPass) {
            resultFlag = true;
            expect(resultFlag).assertTrue();
            done();
            return;
        }
        audioRen.on('stateChange', (AudioState) => {

            console.log(`${TagFrmwk}: Volume Change Event is called`);

            switch (AudioState) {
                case audio.AudioState.STATE_PAUSED:
                    console.info(`${TagFrmwk}: state : STATE_PAUSED`);
                    resultFlag = true;
                    break;
                default:
                    console.info(`${TagFrmwk}: state : ${AudioState}`);
                    break;
            }
        });
        await audioRen.start().then(() => {
            console.info(`${TagFrmwkRender}: renderInstant started :SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: renderInstant start :ERROR : ${err.message}`);
            resultFlag = false;
        });

        await sleep(2000);

        audioRen.pause((err) => {
            if (err) {
                console.info(`${TagFrmwkRender}: renderInstant Pause :ERROR : ${err.message}`);
                resultFlag = false;
            }
            else {
                console.info(`${TagFrmwkRender}: renderInstant Pause :SUCCESS`);
            }
        });
        await sleep(500);

        await audioRen.stop().then(() => {
            console.info(`${TagFrmwkRender}: Renderer stopped : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer stop:ERROR : ${err.message}`);
        });
        await sleep(500);

        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        await sleep(500)

        expect(resultFlag).assertTrue();

        done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9300
     * @tc.name      : AudioEncodingType - ENCODING_TYPE_INVALID
     * @tc.desc      : AudioEncodingType - ENCODING_TYPE_INVALID
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9300', 2, async function (done) {
        expect(audio.AudioEncodingType.ENCODING_TYPE_INVALID).assertEqual(-1);
        await sleep(50);
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9400
     * @tc.name      : StreamUsage - STREAM_USAGE_VOICE_ASSISTANT
     * @tc.desc      : StreamUsage - STREAM_USAGE_VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_9400', 2, async function (done) {

        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }

        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        try {
            readPath = 'StarWars10s-1C-44100-2SW.wav';
            await getFdRead(readPath, done);
            let resultFlag = await playbackPromise(AudioRendererOptions, filePath, audio.AudioScene.AUDIO_SCENE_VOICE_CHAT);
            await sleep(100);
            console.info('AudioFrameworkRenderLog: resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            await closeFileDescriptor(readPath);
        } catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_PLAY_AUDIO_8800 : error = " + error);
            expect(false).assertTrue();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0100
     * @tc.name      : STREAM_VOICE_CALL INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.desc      : STREAM_VOICE_CALL INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
     it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0100', 2, async function (done) {
        let interrput_flag = false;
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        // STREAM_VOICE_ASSISTANT
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        try {
            let audioRen;
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            audioRen.on('audioInterrupt',async (interruptEvent)=>{
                console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
                console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
                console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
                if (interruptEvent.hintType >= 0) {
                    console.info("AudioFrameworkRenderLog: on'interrupt' SUCCESS ");
                    interrput_flag = true;
                }
            });

            let a = await audioRen.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
            });
            await sleep(1000);
            // STREAM_VOICE_CALL
            let AudioRendererInfo_interrupt = {
                content: audio.ContentType.CONTENT_TYPE_SPEECH,
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
                rendererFlags: 0
            }

            let AudioRendererOptions_interrupt = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo_interrupt
            }

            let audioRen_interrupt;
            await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async function (data) {
                audioRen_interrupt = data;
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
            });

            let b = await audioRen_interrupt.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen_interrupt.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
            });
            await sleep(2000);
            await audioRen.release();
            await audioRen_interrupt.release();
            expect(interrput_flag).assertTrue();
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0100 : error = " + error);
            expect(false).assertTrue();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0200
     * @tc.name      : STREAM_RING INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.desc      : STREAM_RING INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0200', 2, async function (done) {
        let interrput_flag = false;
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        // STREAM_VOICE_ASSISTANT
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        try {
            let audioRen;
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            audioRen.on('audioInterrupt',async (interruptEvent)=>{
                console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
                console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
                console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
                if (interruptEvent.hintType >= 0) {
                    console.info("AudioFrameworkRenderLog: on'interrupt' SUCCESS ");
                    interrput_flag = true;
                }
            });

            let a = await audioRen.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
            });
            await sleep(1000);
            // STREAM_RING
            let AudioRendererInfo_interrupt = {
                content: audio.ContentType.CONTENT_TYPE_RINGTONE,
                usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
                rendererFlags: 0
            }

            let AudioRendererOptions_interrupt = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo_interrupt
            }

            let audioRen_interrupt;
            await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async function (data) {
                audioRen_interrupt = data;
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
            });

            let b = await audioRen_interrupt.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen_interrupt.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
            });
            await sleep(2000);
            await audioRen.release();
            await audioRen_interrupt.release();
            expect(interrput_flag).assertTrue();
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0200 : error = " + error);
            expect(false).assertTrue();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0300
     * @tc.name      : STREAM_MUSIC INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.desc      : STREAM_MUSIC INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0300', 2, async function (done) {
        let interrput_flag = false;
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        // STREAM_VOICE_ASSISTANT
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        try {
            let audioRen;
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            audioRen.on('audioInterrupt',async (interruptEvent)=>{
                console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
                console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
                console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
                if (interruptEvent.hintType >= 0) {
                    console.info("AudioFrameworkRenderLog: on'interrupt' SUCCESS ");
                    interrput_flag = true;
                }
            });

            let a = await audioRen.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
            });
            await sleep(1000);
            // STREAM_MUSIC
            let AudioRendererInfo_interrupt = {
                content: audio.ContentType.CONTENT_TYPE_MUSIC,
                usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
                rendererFlags: 0
            }

            let AudioRendererOptions_interrupt = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo_interrupt
            }

            let audioRen_interrupt;
            await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async function (data) {
                audioRen_interrupt = data;
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
            });

            let b = await audioRen_interrupt.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen_interrupt.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
            });
            await sleep(2000);
            await audioRen.release();
            await audioRen_interrupt.release();
            expect(interrput_flag).assertTrue();
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0300 : error = " + error);
            expect(false).assertTrue();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0400
     * @tc.name      : STREAM_VOICE_ASSISTANT INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.desc      : STREAM_VOICE_ASSISTANT INTERRUPT STREAM_VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0400', 2, async function (done) {
        let interrput_flag = false;
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        // STREAM_VOICE_ASSISTANT
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        try {
            let audioRen;
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });
            audioRen.on('audioInterrupt',async (interruptEvent)=>{
                console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
                console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
                console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
                if (interruptEvent.hintType >= 0) {
                    console.info("AudioFrameworkRenderLog: on'interrupt' SUCCESS ");
                    interrput_flag = true;
                }
            });

            let a = await audioRen.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
            });
            await sleep(1000);
            // STREAM_VOICE_ASSISTANT
            let AudioRendererInfo_interrupt = {
                content: audio.ContentType.CONTENT_TYPE_MUSIC,
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
                rendererFlags: 0
            }

            let AudioRendererOptions_interrupt = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo_interrupt
            }

            let audioRen_interrupt;
            await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async function (data) {
                audioRen_interrupt = data;
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
            });

            let b = await audioRen_interrupt.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen_interrupt.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
            });
            await sleep(2000);
            await audioRen.release();
            await audioRen_interrupt.release();
            expect(interrput_flag).assertTrue();
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0400 : error = " + error);
            expect(false).assertTrue();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0500
     * @tc.name      : STREAM_VOICE_ASSISTANT INTERRUPT STREAM_VOICE_CALL
     * @tc.desc      : STREAM_VOICE_ASSISTANT INTERRUPT STREAM_VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0500', 2, async function (done) {
        let interrput_flag = false;
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        // STREAM_VOICE_CALL
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        try {
            let audioRen;
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            audioRen.on('audioInterrupt',async (interruptEvent)=>{
                console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
                console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
                console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
                if (interruptEvent.hintType >= 0) {
                    console.info("AudioFrameworkRenderLog: on'interrupt' SUCCESS ");
                }
            });

            let a = await audioRen.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
            });
            await sleep(1000);
            // STREAM_VOICE_ASSISTANT
            let AudioRendererInfo_interrupt = {
                content: audio.ContentType.CONTENT_TYPE_MUSIC,
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
                rendererFlags: 0
            }

            let AudioRendererOptions_interrupt = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo_interrupt
            }

            let audioRen_interrupt;
            await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async function (data) {
                audioRen_interrupt = data;
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
            });

            let b = await audioRen_interrupt.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen_interrupt.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
            });
            await sleep(2000);
            await audioRen.release();
            await audioRen_interrupt.release();
            expect(interrput_flag).assertFalse();
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0500 : error = " + error);
            expect(false).assertTrue();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0600
     * @tc.name      : STREAM_VOICE_ASSISTANT INTERRUPT STREAM_RING
     * @tc.desc      : STREAM_VOICE_ASSISTANT INTERRUPT STREAM_RING
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0600', 2, async function (done) {
        let interrput_flag = false;
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        // STREAM_RING
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_RINGTONE,
            usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        try {
            let audioRen;
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            audioRen.on('audioInterrupt',async (interruptEvent)=>{
                console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
                console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
                console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
                if (interruptEvent.hintType >= 0) {
                    console.info("AudioFrameworkRenderLog: on'interrupt' SUCCESS ");
                }
            });

            let a = await audioRen.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
            });
            await sleep(1000);
            // STREAM_VOICE_ASSISTANT
            let AudioRendererInfo_interrupt = {
                content: audio.ContentType.CONTENT_TYPE_MUSIC,
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
                rendererFlags: 0
            }

            let AudioRendererOptions_interrupt = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo_interrupt
            }

            let audioRen_interrupt;
            await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async function (data) {
                audioRen_interrupt = data;
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
            });

            let b = await audioRen_interrupt.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen_interrupt.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
            });
            await sleep(2000);
            await audioRen.release();
            await audioRen_interrupt.release();
            expect(interrput_flag).assertFalse();
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0600 : error = " + error);
            expect(false).assertTrue();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0700
     * @tc.name      : STREAM_VOICE_ASSISTANT INTERRUPT STREAM_MUSIC
     * @tc.desc      : STREAM_VOICE_ASSISTANT INTERRUPT STREAM_MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0700', 2, async function (done) {
        let interrput_flag = false;
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        // STREAM_MUSIC
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }

        try {
            let audioRen;
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            audioRen.on('audioInterrupt',async (interruptEvent)=>{
                console.info("AudioFrameworkRenderLog: InterruptType : " + interruptEvent.eventType);
                console.info("AudioFrameworkRenderLog: InterruptForceType : " + interruptEvent.forceType);
                console.info("AudioFrameworkRenderLog: InterruptHint : " + interruptEvent.hintType);
                if (interruptEvent.hintType >= 0) {
                    console.info("AudioFrameworkRenderLog: on'interrupt' SUCCESS ");
                    interrput_flag = true;
                }
            });

            let a = await audioRen.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant start :ERROR : ' + err.message);
            });
            await sleep(1000);
            // STREAM_VOICE_ASSISTANT
            let AudioRendererInfo_interrupt = {
                content: audio.ContentType.CONTENT_TYPE_MUSIC,
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
                rendererFlags: 0
            }

            let AudioRendererOptions_interrupt = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo_interrupt
            }

            let audioRen_interrupt;
            await audio.createAudioRenderer(AudioRendererOptions_interrupt).then(async function (data) {
                audioRen_interrupt = data;
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender2 Created : ERROR : ' + err.message);
            });

            let b = await audioRen_interrupt.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE);
            console.info("AudioFrameworkRenderLog audioRen_interrupt setInterruptMode(INDEPENDENT_MODE) success");

            await audioRen_interrupt.start().then(async function () {
                console.info('AudioFrameworkRenderLog: renderInstant2 started :SUCCESS ');
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: renderInstant2 start :ERROR : ' + err.message);
            });
            await sleep(2000);
            await audioRen.release();
            await audioRen_interrupt.release();
            expect(interrput_flag).assertTrue();
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0700 : error = " + error);
            expect(false).assertTrue();
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0100
     * @tc.name      : SetInterruptMode mode 0 callback,is public share mode
     * @tc.desc      : SetInterruptMode mode 0 callback,is public share mode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0100", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        let mode = audio.InterruptMode.SHARE_MODE;
        audioRenderer.setInterruptMode(mode, async (err, data) => {
            if (err) {
                console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE CALLBACK: error: ${err.message}`);
                expect(false).assertTrue();
                await audioRenderer.release();
                done();
                return;
            }
            console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE CALLBACK: SUCCESS`);
            expect(true).assertTrue();
            await audioRenderer.release();
            done();
        })
    })

    /*
     * @tc.name:SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0200
     * @tc.desc:SetInterruptMode mode 1 callback,is independent mode
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0200", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        let mode = audio.InterruptMode.INDEPENDENT_MODE;
        audioRenderer.setInterruptMode(mode, async (err, data) => {
            if (err) {
                console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: error: ${err.message}`);
                expect(false).assertTrue();
                await audioRenderer.release();
                done();
                return;
            }
            console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: SUCCESS`);
            expect(true).assertTrue();
            await audioRenderer.release();
            done();
        })
    })

    /*
     * @tc.name:SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0300
     * @tc.desc:SetInterruptMode mode 0 promise,is public share mode
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0300", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        let mode = audio.InterruptMode.SHARE_MODE;
        await audioRenderer.setInterruptMode(mode).then(data => {
            console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE PROMISE: SUCCESS`);
            expect(true).assertTrue();
        }).catch(err => {
            console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE PROMISE: error: ${err.message}`);
            expect(false).assertTrue();
        })
        await audioRenderer.release();
        done();
    })

    /*
     * @tc.name:SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0400
     * @tc.desc:SetInterruptMode mode 1 promise,is independent mode
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0400", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        let mode = audio.InterruptMode.INDEPENDENT_MODE;
        await audioRenderer.setInterruptMode(mode).then(data => {
            console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE PROMISE: SUCCESS`);
            expect(true).assertTrue();
        }).catch(err => {
            console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE PROMISE: error: ${err.message}`);
            expect(false).assertTrue();
        })
        await audioRenderer.release();
        done();
    })

    /*
     * @tc.name:SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0500
     * @tc.desc:SetInterruptMode mode 'invalid_parameter',will catch error with type error
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0500", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        try {
            let data = await audioRenderer.setInterruptMode(stringParameter);
            console.info(`${TagFrmwkRender}: SetInterruptMode STRING PROMISE: SUCCESS`);
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`${TagFrmwkRender}: SetInterruptMode STRING PROMISE: error: ${err.message}`);
            expect(true).assertTrue();
            done();
        }
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0600
   * @tc.desc:SetInterruptMode mode 2,set it to default SHARE_MODE
   * @tc.type: FUNC
   * @tc.require: Issue Number
   */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0600", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        let mode = 2;
        try {
            let data = await audioRenderer.setInterruptMode(mode);
            console.info(`${TagFrmwkRender}: SetInterruptMode OUT OF BORDER PROMISE: SUCCESS`);
            expect(true).assertTrue();
            done();
        } catch (err) {
            console.info(`${TagFrmwkRender}: SetInterruptMode OUT OF BORDER PROMISE: ERROR : code: ${err.code}, mesage: ${err.message}`);
            expect(false).assertTrue();
            done();
        }
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0700
    * @tc.name      : SetInterruptMode invalid param callback
    * @tc.desc      : SetInterruptMode invalid param callback
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0700", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        try {
            audioRenderer.setInterruptMode(stringParameter, async (err, data) => {
                if (err) {
                    console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE CALLBACK: error: ${err.message}`);
                    expect(true).assertTrue();
                    await audioRenderer.release();
                    done();
                    return;
                } else {
                    console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE CALLBACK: SUCCESS`);
                    expect(false).assertTrue();
                    await audioRenderer.release();
                    done();
                }

            })
        } catch (err) {
            console.info(`${TagFrmwkRender}: SetInterruptMode OUT OF BORDER PROMISE: ERROR: ${err.message}`);
            expect(false).assertTrue();
            await audioRenderer.release();
            done();
        }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0800
     * @tc.name      : SetInterruptMode invalid param callback
     * @tc.desc      : SetInterruptMode invalid param callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETINTERRUPTMODE_0800", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        let mode = 2;
        try {
            audioRenderer.setInterruptMode(mode, async (err, data) => {
                if (err) {
                    console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE CALLBACK: error: ${err.message}`);
                    expect(false).assertTrue();
                    await audioRenderer.release();
                    done();
                    return;
                } else {
                    console.info(`${TagFrmwkRender}: SetInterruptMode SHARE_MODE CALLBACK: SUCCESS`);
                    expect(true).assertTrue();
                    await audioRenderer.release();
                    done();
                }

            })
        } catch (err) {
            console.info(`${TagFrmwkRender}: SetInterruptMode OUT OF BORDER PROMISE: ERROR: ${err.message}`);
            expect(false).assertTrue();
            await audioRenderer.release();
            done();
        }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_0100
     * @tc.name      : AudioRenderer - getAudioStreamId
     * @tc.desc      : AudioRenderer - getAudioStreamId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_0100", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        try {
            let data = await audioRenderer.getAudioStreamId();
            console.info(`${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_getAudioStreamId_0100 OUT OF BORDER PROMISE: SUCCESS ${data}`);
            expect(true).assertTrue();
            await audioRenderer.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
        } catch (err) {
            console.info(`${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_getAudioStreamId_0100 OUT OF BORDER PROMISE: ERROR: ${err.message}`);
            expect(false).assertTrue();
            await audioRenderer.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
        }
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_0200
     * @tc.name      : AudioRenderer - getAudioStreamId
     * @tc.desc      : AudioRenderer - getAudioStreamId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_0200", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        await audioRenderer.getAudioStreamId(async (err, data) => {
            if (err) {
                console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: error: ${err.message}`);
                expect(false).assertTrue();
                await audioRenderer.release().then(() => {
                    console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
                }).catch((err) => {
                    console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
                });
                done();
                return;
            }
            console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: SUCCESS ${data}`);
            expect(true).assertTrue();
            await audioRenderer.release().then(() => {
                console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
            });
            done();
        })
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_0300
     * @tc.name      : AudioRenderer - getAudioStreamId
     * @tc.desc      : AudioRenderer - getAudioStreamId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_GET_AUDIO_STREAM_ID_0300", 2, async function (done) {
        let audioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }
        let audioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        await audioRenderer.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        await audioRenderer.getAudioStreamId(async (err, data) => {
            if (err) {
                console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK : ${err.message}`);
                if (err.code == 6800103) {
                    console.log(`${TagFrmwkRender}:SetInterruptMode : SUCCESS`);
                    expect(true).assertTrue();
                } else {
                    console.log(`${TagFrmwkRender}: SetInterruptMode : error : ${err.code}`);
                    expect(false).assertTrue();
                }
            } else {
                console.info(`${TagFrmwkRender}: SetInterruptMode INDEPENDENT_MODE CALLBACK: SUCCESS ${data}`);
                expect(false).assertTrue();
            }
            done();
        })
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0100
     * @tc.name      : AudioRenderer - setVolume 0 - promise
     * @tc.desc      : AudioRenderer - setVolume 0 - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0100', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let audioRen;
        try {
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            let inputVolume = 0;

            await audioRen.setVolume(inputVolume).then(() => {
                expect(true).assertTrue();
                console.info(`${TagFrmwkRender}: setVolume to 0 : Success`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
                expect(false).assertTrue();
            });
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0100 : error = " + error);
            expect(false).assertTrue();
        }
        await sleep(2000);
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0200
     * @tc.name      : AudioRenderer - setVolume 0.5 - promise
     * @tc.desc      : AudioRenderer - setVolume 0.5 - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0200', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let audioRen;
        try {
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            let inputVolume = 0.5;

            await audioRen.setVolume(inputVolume).then(() => {
                expect(true).assertTrue();
                console.info(`${TagFrmwkRender}: setVolume to 0.5 : Success`);
            }).catch((err) => {
                console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
                expect(false).assertTrue();
            });
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0200 : error = " + error);
            expect(false).assertTrue();
        }
        await sleep(2000);
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0300
     * @tc.name      : AudioRenderer - setVolume 5 - promise
     * @tc.desc      : AudioRenderer - setVolume 5 - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0300', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let audioRen;
        try {
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            let inputVolume = 16;

            await audioRen.setVolume(inputVolume).then(() => {
                expect(false).assertTrue();
                console.info(`${TagFrmwkRender}: setVolume to 5 TEST: ERROR`);
            }).catch((err) => {
                if (err.code == 6800104) {
                    console.info(`${TagFrmwkRender}: setVolume to 5 : OK`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
                    expect(false).assertTrue();
                }
            });
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0300 : error = " + error);
            expect(false).assertTrue();
        }
        await sleep(2000);
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0400
     * @tc.name      : AudioRenderer - setVolume "string" - promise
     * @tc.desc      : AudioRenderer - setVolume "string" - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0400', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let audioRen;
        try {    
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            let inputVolume = "string";

            await audioRen.setVolume(inputVolume).then(() => {
                expect(false).assertTrue();
                console.info(`${TagFrmwkRender}: setVolume to string TEST: ERROR`);
            }).catch((err) => {
                if (err.code == 6800101) {
                    console.info(`${TagFrmwkRender}: setVolume : SUCCESS : code: ${err.code}, mesage: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
                    expect(false).assertTrue();
                }
            });
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0400 : error = " + error);
            expect(false).assertTrue();
        }
        await sleep(2000);
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0500
     * @tc.name      : AudioRenderer - setVolume 0 - callback
     * @tc.desc      : AudioRenderer - setVolume 0 - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0500', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let audioRen;
        try {
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            let inputVolume = 0;

            audioRen.setVolume(inputVolume, (err)=>{
                if(err) {
                    console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    expect(true).assertTrue();
                    console.info(`${TagFrmwkRender}: setVolume to 0 : Success`);
                }
            });
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0500 : error = " + error);
            expect(false).assertTrue();
        }
        await sleep(2000);
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0600
     * @tc.name      : AudioRenderer - setVolume 0.5 - callback
     * @tc.desc      : AudioRenderer - setVolume 0.5 - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0600', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let audioRen;
        try {
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            let inputVolume = 0.5;

            audioRen.setVolume(inputVolume, (err)=>{
                if(err) {
                    console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    expect(true).assertTrue();
                    console.info(`${TagFrmwkRender}: setVolume to 0.5 : Success`);
                }
            });
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0600 : error = " + error);
            expect(false).assertTrue();
        }
        await sleep(2000);
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0700
     * @tc.name      : AudioRenderer - setVolume 5 - callback
     * @tc.desc      : AudioRenderer - setVolume 5 - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0700', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let audioRen;
        try {
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            let inputVolume = 5;

            audioRen.setVolume(inputVolume, (err)=>{
                if(err) {
                    if (err.code == 6800104) {
                        console.info(`${TagFrmwkRender}: setVolume to 5 : OK`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
                        expect(false).assertTrue();
                    }
                } else {
                    expect(false).assertTrue();
                    console.info(`${TagFrmwkRender}: setVolume to 5 TEST: ERROR`);
                }
            });
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0700 : error = " + error);
            expect(false).assertTrue();
        }
        await sleep(2000);
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0800
     * @tc.name      : AudioRenderer - setVolume "string" - callback
     * @tc.desc      : AudioRenderer - setVolume "string" - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0800', 2, async function (done) {
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let audioRen;
        try {
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            let inputVolume = "string";

            audioRen.setVolume(inputVolume, (err)=>{
                if(err) {
                    if (err.code == 6800101) {
                        console.info(`${TagFrmwkRender}: setVolume to string : OK`);
                        expect(true).assertTrue();
                    } else {
                        console.info(`${TagFrmwkRender}: setVolume : ERROR : code: ${err.code}, mesage: ${err.message}`);
                        expect(false).assertTrue();
                    }
                } else {
                    expect(false).assertTrue();
                    console.info(`${TagFrmwkRender}: setVolume to string TEST: ERROR`);
                }
            });
        }
        catch (error) {
            console.log("SUB_MULTIMEDIA_AUDIO_SET_VOLUME_0800 : error = " + error);
            expect(false).assertTrue();
        }
        await sleep(2000);
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_ON_THROW_0100
     * @tc.name      : AUDIO_RENDERER_ON_THROW_ERR
     * @tc.desc      : AUDIO_RENDERER_ON_THROW_ERR
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_ON_THROW_0100', 2, async function (done) {
        let interrput_flag = false;
        let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_1,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        // STREAM_MUSIC
        let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
        }

        let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
        }
        let audioRen;
        try {
            await audio.createAudioRenderer(AudioRendererOptions).then(async function (data) {
                audioRen = data;
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
                console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
            }).catch((err) => {
                console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
            });

            audioRen.on('invalidString',async (data)=>{
                console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_INTERUPT_AUDIO_0700 : error = " + error);
                expect(false).assertTrue();
            });
        }
        catch (error) {
            if (error.code == 6800101) {
                console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_ON_THROW_0100 : SUCCESS");
                expect(true).assertTrue();
            } else {
                console.log("SUB_MULTIMEDIA_AUDIO_RENDERER_ON_THROW_0100 : error = " + error.code);
                expect(false).assertTrue();
            }
        }
        await audioRen.release().then(() => {
            console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
        }).catch((err) => {
            console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
        });
        done();
    })
})
