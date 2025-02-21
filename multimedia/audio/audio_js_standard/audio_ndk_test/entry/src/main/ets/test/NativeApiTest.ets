/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import featureAbility from '@ohos.ability.featureAbility';
import { UiDriver, BY } from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
import myaudioNdk from "libaudioNdkTest.so"
const Tag = 'audio_ndk_test:'
export default function audioNDK() {
    describe('audioNDKTest', function () {
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();
        async function getPermission() {
            let permissions = ['ohos.permission.MICROPHONE'];
            featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
                console.info(Tag + "request success" + JSON.stringify(data));
            })
        }
        async function driveFn() {
            console.info(Tag + `come in driveFn`);
            let driver = await UiDriver.create();
            console.info(Tag + `driver is ${JSON.stringify(driver)}`);
            await sleep(100);
            console.info(Tag + `UiDriver start`);
            let button = await driver.findComponent(BY.text('允许'));
            if(button == null){
                let cmd = "hidumper -s WindowManagerService -a'-a'"
                await delegator.executeShellCommand(cmd);
            }
            console.info(Tag + `button is ${JSON.stringify(button)}`);
            await sleep(100);
            await button.click();
        }
        beforeAll(async function () {
            await getPermission();
            await sleep(100);
            await driveFn();
            console.info('beforeAll case');
        })

        beforeEach(function () {
            console.info('beforeEach case');
        })

        afterEach(function () {
            console.info('afterEach case');
        })

        afterAll(function () {
            console.info('afterAll case');
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100
            * @tc.name      : create OH_AudioStreamBuilder with AUDIOSTREAM_TYPE_CAPTURER
            * @tc.desc      : test OH_AudioStreamBuilder with AUDIOSTREAM_TYPE_CAPTURER
            * @tc.size      : MediumTest 
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100', 0, async function (done) {
            let a = myaudioNdk.createAudioStreamBuilder();
            console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100 createAudioStreamBuilder: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100
            * @tc.name      : generate audioCapturer with OH_AudioStreamBuilder_GenerateCapturer 
            * @tc.desc      : test OH_AudioStreamBuilder_GenerateCapturer
            * @tc.size      : MediumTest 
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGenerate();
            console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100 audioCaptureGenerate: ${a}`);
            expect(a).assertEqual(0)
            done()
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100
            * @tc.name      : generate audioCapturer err 
            * @tc.desc      : test OH_AudioStreamBuilder is not instantiated in OH_AudioStreamBuilder_GenerateCapturer 
            * @tc.size      : MediumTest MediumTest
            * @tc.type      : Function
            * @tc.level     : Level3
        */
        it('SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGenerateErr();
            console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100 audioCaptureGenerateErr: ${a}`);
            expect(a).assertEqual(1)
            done()
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100
            * @tc.name      : start audioCapturer
            * @tc.desc      : test OH_AudioCapturer_Start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureStart();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100 audioCaptureStart: ${a}`);
            expect(a).assertEqual(0)
            done()
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100
            * @tc.name      : start audioCapture twice
            * @tc.desc      : test OH_AudioCapturer_Start twice
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureStartErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100 audioCaptureStartErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100
           * @tc.name      : pause audioCapturer after start
           * @tc.desc      : test OH_AudioCapturer_Pause
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100', 0, async function (done) {
            let a = myaudioNdk.audioCapturePause();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100 audioCapturePause: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100
           * @tc.name      : pause audioCapturer without start
           * @tc.desc      : test OH_AudioCapturer_Pause without OH_AudioCapturer_Start
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioCapturePauseErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100 audioCapturePauseErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100
           * @tc.name      : stop audioCapturer after start
           * @tc.desc      : test OH_AudioCapturer_Stop
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureStop();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100 audioCaptureStop: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100
           * @tc.name      : stop audioCapturer without start 
           * @tc.desc      : test OH_AudioCapturer_Stop without start
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureStopErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100 audioCaptureStopErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100
           * @tc.name      : flush audioCapturer after start 
           * @tc.desc      : test OH_AudioCapturer_Flush
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level1
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureFlush();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100 audioCaptureFlush: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100
           * @tc.name      : flush audioCapturer without start
           * @tc.desc      : test OH_AudioCapturer_Flush without start
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : FWK Layer
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureFlushErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100 audioCaptureFlushErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100
           * @tc.name      : release audioCapturer after start 
           * @tc.desc      : test OH_AudioCapturer_Release
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureRelease();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100 audioCaptureRelease: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100
           * @tc.name      : release audioCapturer twice
           * @tc.desc      : test OH_AudioCapturer_Release twice
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureReleaseErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100 audioCaptureReleaseErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100
           * @tc.name      : get latency mode after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetLatencyMode
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetParameter();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100 audioCaptureGetParameter: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100
           * @tc.name      : get current state after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetCurrentState
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetCurrentState();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100 audioCaptureGetCurrentState: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100
           * @tc.name      : get streamId after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetStreamId
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetStreamId();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100 audioCaptureGetStreamId: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100
           * @tc.name      : get sampleRate after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetSamplingRate
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetSamplingRate();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100 audioCaptureGetSamplingRate: ${a}`);
			expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100
           * @tc.name      : get sampleFormat after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetSampleFormat
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetSampleFormat();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100 audioCaptureGetSampleFormat: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100
           * @tc.name      : get encodingType after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetEncodingType
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetEncodingType();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100 audioCaptureGetEncodingType: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100
           * @tc.name      : get capturerInfo after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetCapturerInfo
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetCapturerInfo();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100 audioCaptureGetCapturerInfo: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
		/* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100
           * @tc.name      : get channelCount after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetChannelCount
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetChannelCount();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100 audioCaptureGetChannelCount: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100
           * @tc.name      : GetTimestamp after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetTimestamp
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetTimestamp();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100 audioCaptureGetTimestamp: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100
           * @tc.name      : get FramesRead after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetFramesRead
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetFramesRead();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100 audioCaptureGetFramesRead: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100
           * @tc.name      : get FrameSizeInCallback after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetFrameSizeInCallback
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100', 0, async function (done) {
            let a = myaudioNdk.audioCaptureGetFrameSizeInCallback();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100 audioCaptureGetFrameSizeInCallback: ${a}`);
            expect(a).assertEqual(0)
            done()
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100
           * @tc.name      : SetSpeed with OH_AudioStreamBuilder_GenerateRenderer  
           * @tc.desc      : test OH_AudioRenderer_SetSpeed
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100', 0, async function (done) {
            let a = myaudioNdk.audioRendererSetSpeed();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100 audioRendererSetSpeed: ${a}`);
            expect(a).assertEqual(0)
            done()
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100
           * @tc.name      : GetSpeed with OH_AudioStreamBuilder_GenerateRenderer  
           * @tc.desc      : test OH_AudioRenderer_GetSpeed
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100', 0, async function (done) {
            let a = myaudioNdk.audioRendererGetSpeed();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100 audioRendererGetSpeed: ${a}`);
            expect(a).assertEqual(0)
            done()
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100
           * @tc.name      : SetSpeed&GetSpeed with OH_AudioStreamBuilder_GenerateRenderer  
           * @tc.desc      : test OH_AudioRenderer_GetSpeed
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100', 0, async function (done) {
            let a = myaudioNdk.audioRendererSetGetSpeed();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100 audioRendererSetGetSpeed: ${a}`);
            expect(a).assertEqual(1.5)
            done()
        })
        
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100
           * @tc.name      : SetRendererOutputDeviceChangeCallback with OH_AudioStreamBuilder_GenerateRenderer  
           * @tc.desc      : test OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100', 0, async function (done) {
            let a = myaudioNdk.audioSetRendererOutputDeviceChangeCallback();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100 audioCaptureGetCapturerInfo: ${a}`);
            expect(a).assertEqual(0)
            done()
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100
           * @tc.name      : GetFramesWritten with OH_AudioRenderer_GetFramesWritten  
           * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetFramesWritten();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100 audioRenderGetFramesWritten: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100
           * @tc.name      : GetTimestamp with OH_AudioRenderer_GetTimestamp  
           * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetTimestamp();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100 audioRenderGetTimestamp: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100
           * @tc.name      : GetFrameSizeInCallback with OH_AudioRenderer_GetFrameSizeInCallback  
           * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetFrameSizeInCallback();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100 audioRenderGetFrameSizeInCallback: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_0100
           * @tc.name      : generate audioRenderer with OH_AudioStreamBuilder_GenerateRenderer  
           * @tc.desc      : test OH_AudioStreamBuilder_GenerateRenderer
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGenerate();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_0100 audioCaptureGetCapturerInfo: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_ERR_0100
           * @tc.name      : generate audioRenderer err
           * @tc.desc      : test OH_AudioStreamBuilder is not instantiated in OH_AudioStreamBuilder_GenerateRenderer
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGenerateErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GERNERATE_RENDERER_ERR_0100 audioRenderGenerateErr: ${a}`);
            expect(a).assertEqual(1)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100
           * @tc.name      : start audioRenderer
           * @tc.desc      : test OH_AudioRenderer_Start
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderStart();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100 audioRenderStart: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100
           * @tc.name      : start audioRenderer after start
           * @tc.desc      : test OH_AudioRenderer_Start twice
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderStartErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100 audioRenderStartErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100
           * @tc.name      : pause audioRenderer after start  
           * @tc.desc      : test OH_AudioRenderer_Pause
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderPause();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100 audioRenderPause: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100
           * @tc.name      : pause audioRenderer without start
           * @tc.desc      : test OH_AudioRenderer_Pause without start 
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderPauseErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100 audioRenderPauseErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100
           * @tc.name      : stop audioRenderer after start
           * @tc.desc      : test OH_AudioRenderer_Stop 
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderStop();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100 audioRenderStop: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100
           * @tc.name      : stop audioRenderer without start 
           * @tc.desc      : test OH_AudioRenderer_Stop without start 
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderStopErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100 audioRenderStopErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100
           * @tc.name      : flush audioRenderer after start
           * @tc.desc      : test OH_AudioRenderer_Flush 
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderFlush();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100 audioRenderFlush: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100
           * @tc.name      : flush audioRenderer without start 
           * @tc.desc      : test OH_AudioRenderer_Flush without start 
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderFlushErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100 audioRenderFlushErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100
           * @tc.name      : release audioRenderer after start 
           * @tc.desc      : test OH_AudioRenderer_Release
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level0
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderRelease();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100 audioRenderRelease: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100
           * @tc.name      : release audioRenderer twice
           * @tc.desc      : test OH_AudioRenderer_Release twice
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderReleaseErr();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100 audioRenderReleaseErr: ${a}`);
            expect(a).assertEqual(2)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100
           * @tc.name      : get current state after generate audioRenderer 
           * @tc.desc      : test OH_AudioRenderer_GetCurrentState
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetCurrentState();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100 audioRenderGetCurrentState: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100
           * @tc.name      : get latencyMode after generate audioRenderer
           * @tc.desc      : test OH_AudioRenderer_GetLatencyMode
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetParameter();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100 audioRenderGetParameter: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100
           * @tc.name      : get streamId after generate audioRenderer 
           * @tc.desc      : test OH_AudioRenderer_GetStreamId
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetStreamId();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100 audioRenderGetStreamId: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100
           * @tc.name      : get samplingRate after generate audioRenderer 
           * @tc.desc      : test OH_AudioRenderer_GetSamplingRate
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetSamplingRate();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100 audioRenderGetSamplingRate: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100
           * @tc.name      : get sampleFormat after generate audioRenderer
           * @tc.desc      : test OH_AudioRenderer_GetSampleFormat
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetSampleFormat();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100 audioRenderGetSampleFormat: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100
           * @tc.name      : get encodingType after generate audioRenderer
           * @tc.desc      : test OH_AudioRenderer_GetEncodingType
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetEncodingType();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100 audioRenderGetEncodingType: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100
           * @tc.name      : get RendererInfo after generate audioRenderer
           * @tc.desc      : test OH_AudioRenderer_GetRendererInfo
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetRendererInfo();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100 audioRenderGetRendererInfo: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
		/* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100
           * @tc.name      : get ChannelCount after generate audioRenderer
           * @tc.desc      : test OH_AudioRenderer_GetChannelCount
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100', 0, async function (done) {
            let a = myaudioNdk.audioRenderGetChannelCount();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100 audioRenderGetChannelCount: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100
           * @tc.name      : set sampleRate 48000 after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetSamplingRate
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetSamplingRate();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100 audioStreamBuilderSetSamplingRate: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100
           * @tc.name      : set channelCount 1 after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetChannelCount
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetChannelCount();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100 audioStreamBuilderSetChannelCount: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100
           * @tc.name      : set sampleFormat AUDIOSTREAM_SAMPLE_U8 after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetSampleFormat
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetSampleFormat();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100 audioStreamBuilderSetSampleFormat: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100
           * @tc.name      : set encodingType AUDIOSTREAM_ENCODING_TYPE_RAW after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetEncodingType
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetEncodingType();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100 audioStreamBuilderSetEncodingType: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100
           * @tc.name      : set latencyMode AUDIOSTREAM_LATENCY_MODE_NORMAL streamUsage after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetLatencyMode
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetLatencyMode();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100 audioStreamBuilderSetLatencyMode: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100
           * @tc.name      : set captureInfo AUDIOSTREAM_USAGE_MUSIC after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetRendererInfo
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetRendererInfo();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100 audioStreamBuilderSetRendererInfo: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100
           * @tc.name      : set captureInfo AUDIOSTREAM_SOURCE_TYPE_MIC after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerInfo
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetCapturerInfo();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100 audioStreamBuilderSetCapturerInfo: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100
           * @tc.name      : set rendererCallback after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetRendererCallback
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetRendererCallback();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100 audioStreamBuilderSetRendererCallback: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100
           * @tc.name      : set captureCallback after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerCallback
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetCapturerCallback();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100 audioStreamBuilderSetCapturerCallback: ${a}`);
            expect(a).assertEqual(0)
            done()
        })


        /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100
           * @tc.name      : set framesize in callback after create audioStreamBuilder
           * @tc.desc      : test OH_AudioStreamBuilder_SetFrameSizeInCallback
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
        it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100', 0, async function (done) {
            let a = myaudioNdk.audioStreamBuilderSetFrameSizeInCallback();
			console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100 audioStreamBuilderSetFrameSizeInCallback: ${a}`);
            expect(a).assertEqual(0)
            done()
        })
    })
}
