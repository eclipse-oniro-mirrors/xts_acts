/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import * as avRecorderTestBase from '../../../../../AVRecorderTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function avRecorderTest() {
    describe('avRecorderTest', function () {
        let avRecorder = null;
        const RECORDER_TIME = 3000;
        const RECORDER_LONG_TIME = 3600000;
        const LOOP_TIMES = 1000;
        const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
        const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
        const ONLYAUDIO_TYPE = 'only_audio';
        let trackArray;
        let fdObject;
        let fdPath;

        let TAG = "[AvRecorderLocalTest] ";
        let avProfile = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioSampleRate : 48000,
            audioCodec : ENCORDER_AAC,
            fileFormat : FORMAT_M4A,
        }
        let avConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            profile : avProfile,
            url : 'fd://',
            rotation : 0,
            location : { latitude : 30, longitude : 130 }
        }

        beforeAll(async function () {
            console.info('beforeAll in1');
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(2000);
            await mediaTestBase.driveFn(2)
            console.info('beforeAll out');
        })

        beforeEach(async function () {
            console.info('beforeEach case');
            await avRecorderTestBase.sleep(3000);
        })

        afterEach(async function () {
            console.info('afterEach case');
            if (avRecorder != null) {
                avRecorder.release().then(() => {
                    console.info(TAG + 'this testCase execution completed')
                }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }
            await avRecorderTestBase.sleep(1000);
            console.info('afterEach case');
        })

        afterAll(function () {
            mediaTestBase.closeFd(fdObject.fileAsset, fdObject.fdNumber);
            console.info('afterAll case');
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100
            * @tc.name      : 001.test pause
            * @tc.desc      : Recorder audio 001.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderWithCallBack(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100
            * @tc.name      : 001.test pause->prepare
            * @tc.desc      : Recorder pause->prepare
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest01(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101
            * @tc.name      : 001.test pause
            * @tc.desc      : Recorder audio 001.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest001(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_AUDIO_FUNCTION_0101 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200
            * @tc.name      : 001.test channel
            * @tc.desc      : Recorder audio channel
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest02(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300
            * @tc.name      : 001.test channel
            * @tc.desc      : Recorder audio channel
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest03(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400
            * @tc.name      : 001.test resume->prepare
            * @tc.desc      : Recorder audio resume->prepare
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest04(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500
            * @tc.name      : 001.test channel
            * @tc.desc      : Recorder audio channel
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest05(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PREPARE_API_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600
            * @tc.name      : 001.test pause->start
            * @tc.desc      : Recorder audio pause->start
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest06(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700
            * @tc.name      : 001.test resume->start
            * @tc.desc      : Recorder audio resume->start
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest07(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800
            * @tc.name      : 001.test creatAVRecorder->pause
            * @tc.desc      : Recorder audio creatAVRecorder->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800', 0, async function (done) {
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest08(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900
            * @tc.name      : 001.test prepare->pause
            * @tc.desc      : Recorder audio prepare->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest09(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_START_API_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000
            * @tc.name      : 001.test start->pause
            * @tc.desc      : Recorder audio start->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest10(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100
            * @tc.name      : 001.test resume->pause
            * @tc.desc      : Recorder audio resume->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest11(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200
            * @tc.name      : 001.test stop->pause
            * @tc.desc      : Recorder audio stop->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest12(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300
            * @tc.name      : 001.test reset->pause
            * @tc.desc      : Recorder audio reset->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest13(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400
            * @tc.name      : 001.test all step->pause
            * @tc.desc      : Recorder audio all step->pause
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest14(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500
            * @tc.name      : 001.test pause three times
            * @tc.desc      : Recorder audio pause three times
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest15(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PAUSE_API_1500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600
            * @tc.name      : 001.test creatAVRecorder->resume
            * @tc.desc      : Recorder audio creatAVRecorder->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest16(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700
            * @tc.name      : 001.test prepare->resume
            * @tc.desc      : Recorder audio prepare->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest17(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800
            * @tc.name      : 001.test start->resume
            * @tc.desc      : Recorder audio start->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest18(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900
            * @tc.name      : 001.test pause->resume
            * @tc.desc      : Recorder audio pause->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest19(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_1900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000
            * @tc.name      : 001.test stop->resume
            * @tc.desc      : Recorder audio stop->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest20(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100
            * @tc.name      : 001.test reset->resume
            * @tc.desc      : Recorder audio reset->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest21(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200
            * @tc.name      : 001.test all->resume
            * @tc.desc      : Recorder audio all->resume
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest22(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300
            * @tc.name      : 001.test resume threee times
            * @tc.desc      : Recorder audio resume threee times
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest23(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESUME_API_2300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400
            * @tc.name      : 001.test pause->stop
            * @tc.desc      : Recorder audio pause->stop
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest24(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500
            * @tc.name      : 001.test resume->stop
            * @tc.desc      : Recorder audio resume->stop
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest25(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_STOP_API_2500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600
            * @tc.name      : 001.test pause->reset
            * @tc.desc      : Recorder audio pause->reset
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest26(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700
            * @tc.name      : 001.test resume->reset
            * @tc.desc      : Recorder audio resume->reset
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest27(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RESET_API_2700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800
            * @tc.name      : 001.test pause->release
            * @tc.desc      : Recorder audio pause->release
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest28(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900
            * @tc.name      : 001.test resume->release
            * @tc.desc      : Recorder audio resume->release
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest29(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_2900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000
            * @tc.name      : 001.test release 3 times
            * @tc.desc      : Recorder audio release 3 times
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest30(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_RELEASE_API_3000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100
            * @tc.name      : 001.test create->getInputSurface
            * @tc.desc      : Recorder audio create->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest31(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200
            * @tc.name      : 001.test  prepare->getInputSurface
            * @tc.desc      : Recorder audio  prepare->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest32(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300
            * @tc.name      : 001.test  start->getInputSurface
            * @tc.desc      : Recorder audio  start->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest33(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400
            * @tc.name      : 001.test pause->getInputSurface
            * @tc.desc      : Recorder audio pause->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest34(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500
            * @tc.name      : 001.test resume->getInputSurface
            * @tc.desc      : Recorder audio resume->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest35(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600
            * @tc.name      : 001.test stop->getInputSurface
            * @tc.desc      : Recorder audio stop->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest36(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700
            * @tc.name      : 001.test reset->getInputSurface
            * @tc.desc      : Recorder audio reset->getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest37(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800
            * @tc.name      : 001.test getInputSurface 3 times
            * @tc.desc      : Recorder audio getInputSurface 3 times
            * @tc.size      : MediumTest
            * @tc.type      : Reliabilit test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.avRecorderReliabilitTest38(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_GETINPUTSURFACE_API_3800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100
            * @tc.name      : 001.test createAVRecorder
            * @tc.desc      : Recorder audio createAVRecorder
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.createTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200
            * @tc.name      : 02.AvRecorder.prepare
            * @tc.desc      : Recorder audio AvRecorder.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.prepareTimeCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300
            * @tc.name      : 03.AvRecorder.getInputSurface
            * @tc.desc      : AvRecorder.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.getInputSurfaceTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400
            * @tc.name      : 04.AvRecorder.start
            * @tc.desc      : AvRecorder.start
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.startTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500
            * @tc.name      : 05.AvRecorder.pause
            * @tc.desc      : AvRecorder.pause
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.pauseTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600
            * @tc.name      : 06.AvRecorder.resume
            * @tc.desc      : AvRecorder.resume
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.resumeTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700
            * @tc.name      : 07.AvRecorder.stop
            * @tc.desc      : AvRecorder.stop
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.stopTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800
            * @tc.name      : 08.AvRecorder.reset
            * @tc.desc      : AvRecorder.reset
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.resetTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900
            * @tc.name      : 09.AvRecorder.release
            * @tc.desc      : AvRecorder.release
            * @tc.size      : MediumTest
            * @tc.type      : Performance test
            * @tc.level     : Level 4
        */
        it('SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900', 0, async function (done) {
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900 start')
            let fileName = avRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getAvRecorderFd(fileName, "audio");
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            avRecorderTestBase.releaseTimeTestCallback(avConfig, avRecorder, RECORDER_TIME, done);
            console.info(TAG + 'SUB_MULTIMEDIA_MEDIA_AVRECORDER_PERFORMANCE_CALLBACK_01_0900 end')
        })
    })
}

