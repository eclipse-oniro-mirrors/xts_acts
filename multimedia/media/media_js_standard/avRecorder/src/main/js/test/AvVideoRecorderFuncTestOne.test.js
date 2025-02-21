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

import deviceInfo from '@ohos.deviceInfo'
import media from '@ohos.multimedia.media'
import camera from '@ohos.multimedia.camera'
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import * as avRecorderTestBase from '../../../../../AVRecorderTestBase.js';
import * as avVideoRecorderTestBase from '../../../../../AvVideoRecorderTestBase.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function avVideoRecorderTestOne() {
    describe('avVideoRecorderTestOne', function () {
        let avRecorder = null;
        let isInitCamera = false;
        const recorderTime = 3000;
        const RECORDER_LONG_TIME = 3600000;
        const LOOP_TIMES = 1000;
        const FORMAT_M4A = media.ContainerFormatType.CFT_MPEG_4A;
        const ENCORDER_AAC = media.CodecMimeType.AUDIO_AAC;
        const ONLYAUDIO_TYPE = 'only_audio';
        let trackArray;
        let fdObject;
        let fdPath;
        let maxAmplitudeStartTimes = 0;
        let maxAmplitudePauseTimes = 0;
        let TAG = "[avVideoRecorderTestOne] ";
        let avProfile = {
            audioBitrate : 48000,
            audioChannels : 2,
            audioCodec : media.CodecMimeType.AUDIO_AAC,
            audioSampleRate : 48000,
            fileFormat : media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate : 280000, // 视频比特率
            videoCodec : media.CodecMimeType.VIDEO_AVC,
            videoFrameWidth : 640,  // 视频分辨率的宽
            videoFrameHeight : 480, // 视频分辨率的高
            videoFrameRate : 30 // 视频帧率
        }

        let metaData = {
            genre : "{marketing-name:\"HHH XXX\"}",
            videoOrientation : "180",
            location : { latitude : 35, longitude : 135 },
            customInfo : {
                "com.hh.version" : "5",
            }
        }

        let AutoCreateConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile: avProfile,
            url : '',
            rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
            location : { latitude : 30, longitude : 130 },
            fileGenerationMode : media.FileGenerationMode.APP_CREATE,
        }

        let avmetaConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile: avProfile,
            url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
            rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
            location : { latitude : 30, longitude : 130 },
            metadata : metaData,
        }

        let avConfig = {
            audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile: avProfile,
            url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
            rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
            location : { latitude : 30, longitude : 130 },
        }

        let avProfileMpeg = {
            fileFormat: media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate: 280000,
            videoCodec: media.CodecMimeType.VIDEO_AVC,
            videoFrameWidth: 640,
            videoFrameHeight: 480,
            videoFrameRate: 30
        }
        let avConfigMpeg = {
            videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile: avProfileMpeg,
            url: 'fd://35',
            rotation: 0,
            location: {
                latitude: 30, longitude: 130
            }
        }
        let avProfileMpegAac = {
            audioBitrate: 48000,
            audioChannels: 2,
            audioCodec: media.CodecMimeType.AUDIO_AAC,
            audioSampleRate: 48000,
            fileFormat: media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate: 280000,
            videoCodec: media.CodecMimeType.VIDEO_AVC,
            videoFrameWidth: 640,
            videoFrameHeight: 480,
            videoFrameRate: 30
        }
        let avConfigMpegAac = {
            audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile: avProfileMpegAac,
            url: 'fd://35',
            rotation: 0,
            location: {
                latitude: 30, longitude: 130
            }
        }
        let avProfileH264 = {
            fileFormat: media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate: 280000,
            videoCodec: media.CodecMimeType.VIDEO_AVC,
            videoFrameWidth: 640,
            videoFrameHeight: 480,
            videoFrameRate: 30
        }
        let avConfigH264 = {
            videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile: avProfileH264,
            url: 'fd://35',
            rotation: 0,
            location: {
                latitude: 30, longitude: 130
            }
        }

        let avProfileH265 = {
            fileFormat: media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate: 280000,
            videoCodec: media.CodecMimeType.VIDEO_HEVC,
            videoFrameWidth: 640,
            videoFrameHeight: 480,
            videoFrameRate: 30
        }
        let avConfigH265 = {
            videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile: avProfileH265,
            url: 'fd://35',
            rotation: 0,
            location: {
                latitude: 30, longitude: 130
            }
        }

        let avProfileH264Aac = {
            audioBitrate: 48000,
            audioChannels: 2,
            audioCodec: media.CodecMimeType.AUDIO_AAC,
            audioSampleRate: 48000,
            fileFormat: media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate: 280000,
            videoCodec: media.CodecMimeType.VIDEO_AVC,
            videoFrameWidth: 640,
            videoFrameHeight: 480,
            videoFrameRate: 30
        }
        let avConfigH264Aac = {
            audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile: avProfileH264Aac,
            url: 'fd://35',
            rotation: 0,
            location: {
                latitude: 30, longitude: 130
            }
        }

        let avProfileH265Aac = {
            audioBitrate: 48000,
            audioChannels: 2,
            audioCodec: media.CodecMimeType.AUDIO_AAC,
            audioSampleRate: 48000,
            fileFormat: media.ContainerFormatType.CFT_MPEG_4,
            videoBitrate: 280000,
            videoCodec: media.CodecMimeType.VIDEO_HEVC,
            videoFrameWidth: 640,
            videoFrameHeight: 480,
            videoFrameRate: 30,
            isHdr: false,
            enableTemporalScale: false
        }
        let avConfigH265Aac = {
            audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
            profile: avProfileH265Aac,
            url: 'fd://35',
            rotation: 0,
            location: {
                latitude: 30, longitude: 130
            }
        }
	
	    let avConfigOnlyAac = {
            audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
            profile: avProfileH264Aac,
            url: 'fd://35',
            rotation: 0,
            location: {
                latitude: 30, longitude: 130
            }
        }

        let events = require('events');
        let eventEmitter = new events.EventEmitter();

        const CREATE_CALLBACK_EVENT = 'createCallback';
        const SETONCALLBACK_EVENT = 'setAvRecorderCallback';
        const SETPHOTOASSETCALLBACK_EVENT = 'setPhotoAssetCallback';
        const PREPARE_CALLBACK_EVENT = 'prepareCallback';
        const GETINPUTSURFACE_CALLBACK_EVENT = 'getInputSurfaceCallback';
        const INITCAMERA_EVENT = 'initCamera';
        const STARTCAMERA_EVENT = 'startCameraOutput';
        const STOPCAMERA_EVENT = 'stopCameraOutput';
        const STARTRECORDER_CALLBACK_EVENT = 'startCallback';
        const PAUSERECORDER_CALLBACK_EVENT = 'pauseCallback';
        const RESUMERECORDER_CALLBACK_EVENT = 'resumeCallback';
        const STOPRECORDER_CALLBACK_EVENT = 'stopCallback';
        const RESETRECORDER_CALLBACK_EVENT = 'resetCallback';
        const RELEASECORDER_CALLBACK_EVENT = 'releaseCallback';
        const RELEASECAMERA_EVENT = 'releaseCamera';
        const CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT = 'audioCapturerInfoCallback';
        const ENCODER_INFO_CALLBACK_EVENT = 'availableEncoderCallback';
        const MAX_AMPLITUDE_CALLBACK_EVENT = 'maxAmplitudeCallback';
        const END_EVENT = 'end';

        const CREATE_PROMISE_EVENT = 'createPromise';
        const PREPARE_PROMISE_EVENT = 'preparePromise';
        const GETINPUTSURFACE_PROMISE_EVENT = 'getInputSurfacePromise';
        const GETAVRECORDERCONFIG_PROMISE_EVENT = 'getAVRecorderConfigPromise';
        const STARTRECORDER_PROMISE_EVENT = 'startPromise';
        const PAUSERECORDER_PROMISE_EVENT = 'pausePromise';
        const RESUMERECORDER_PROMISE_EVENT = 'resumePromise';
        const STOPRECORDER_PROMISE_EVENT = 'stopPromise';
        const RESETRECORDER_PROMISE_EVENT = 'resetPromise';
        const RELEASECORDER_PROMISE_EVENT = 'releasePromise';
        const CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT = 'audioCapturerInfoPromise';
        const ENCODER_INFO_PROMISE_EVENT = 'availableEncoderPromise';
        const MAX_AMPLITUDE_PROMISE_EVENT = 'maxAmplitudePromise';

        const UPDATE_ROTATION_EVENT = 'updateRotationEvent';

        let cameraManager;
        let videoOutput;
        let captureSession;
        let cameraInput;
        let previewOutput;
        let cameraOutputCap;
        let videoSurfaceId = null;
        let myVideoProfile = null;
        let myPreviewProfile = null;
        let isSupportCameraVideoProfiles = true;

        beforeAll(async function () {
            console.info('beforeAll in1');
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            let permissionName5 = 'ohos.permission.CAMERA';
            let permissionNames = [permissionName1, permissionName2, permissionName3, permissionName4, permissionName5];
            await mediaTestBase.getPermission(permissionNames);
            await mediaTestBase.msleepAsync(5000);
            await mediaTestBase.driveFn(4)

            let context = globalThis.contextVideo;
            console.info('initCamera 002');
            cameraManager = camera.getCameraManager(context)
            console.info('initCamera 003');
            if (!cameraManager) {
                console.error("camera.getCameraManager error")
                return;
            }
            let cameras = cameraManager.getSupportedCameras();
            let cameraDevice = cameras[0];
            console.info('initCamera 006');
            let cameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice);
            if (cameraOutputCapability?.videoProfiles) {
                console.info('initCamera 007');
                setProfileSize(cameraOutputCapability.videoProfiles,cameraOutputCapability.previewProfiles);
                let configs = [avConfig, avConfigMpeg, avConfigMpegAac, avConfigH264, avConfigH264Aac, avConfigH265, avConfigH265Aac]
                for (let i = 0; i < configs.length; i++) {
                    checkDevice(configs[i])
                }
                avConfigH264.profile.videoBitrate = 280000;
                avConfigH264Aac.profile.videoBitrate = 280000;
    
                console.info('beforeAll out');

            } else {
                isSupportCameraVideoProfiles = false;
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                console.info('beforeAll out');
            }

            console.info('beforeAll out');
        })

        beforeEach(async function () {
            console.info('beforeEach case');
            if (isSupportCameraVideoProfiles) {
                await avRecorderTestBase.sleep(1000);
                fdObject = null;
            }
        })

        afterEach(async function () {
            console.info('afterEach case');
            if (isSupportCameraVideoProfiles) {
                isInitCamera = false
                if (avRecorder != null) {
                    avRecorder.release().then(() => {
                        console.info(TAG + 'this testCase execution completed')
                    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
                }
                await mediaTestBase.closeFd(fdObject?.fdNumber);
                await avRecorderTestBase.sleep(1000);
            }
        })

        afterAll(function () {
            console.info('afterAll case');
        })

         function setProfileSize(videoProfiles, previewProfiles) {
            console.log('choosen videoProfiles: ' + JSON.stringify(videoProfiles));
            console.log('choosen previewProfiles: ' + JSON.stringify(previewProfiles));

            let myVideoProfile0 = [];
            let myPreviewProfile0 = [];
            outerLoop: for (let i = 0; i < videoProfiles.length; i++) {
                for (let j = 0; j < previewProfiles.length; j++) {
                    if(checkIfQuotientsAreEqual(videoProfiles[i], previewProfiles[j])){
                        myVideoProfile0[0] = videoProfiles[i];
                        myPreviewProfile0[0] = previewProfiles[j];
                        console.log('choosen myVideoProfile0: ' + JSON.stringify(myVideoProfile0));
                        console.log('choosen myPreviewProfile0: ' + JSON.stringify(myPreviewProfile0));
                        break outerLoop;
                    }
                }
            }
            myVideoProfile = myVideoProfile0[0];
            myPreviewProfile = myPreviewProfile0[0];
            console.log('choosen myVideoProfile: ' + JSON.stringify(myVideoProfile));
            console.log('choosen myPreviewProfile: ' + JSON.stringify(myPreviewProfile));
         }

         function checkIfQuotientsAreEqual(videoProfileSize, previewProfileSize) {
            return (videoProfileSize.size.width / videoProfileSize.size.height) === (previewProfileSize.size.width / previewProfileSize.size.height);
         }

        function checkDevice(avConfig) {
            if (deviceInfo.deviceType === 'default') {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES
            } else {
                avConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV
            }
            avConfig.profile.videoFrameWidth = myVideoProfile.size.width;
            avConfig.profile.videoFrameHeight = myVideoProfile.size.height;
        }

        async function initCamera(avRecorder, avConfig, recorderTime, steps, done) {
            // 获取相机列表
            let cameras = cameraManager.getSupportedCameras();
            let cameraDevice = cameras[0];
            // 创建相机输入流
            try {
                cameraInput = cameraManager.createCameraInput(cameraDevice);
                console.info('createCameraInput success');
            } catch (error) {
                console.error('Failed to createCameraInput errorCode = ' + error.code);
            }
            // 监听cameraInput错误信息
            cameraInput.on('error', cameraDevice, (error) => {
                console.log(`Camera input error code: ${error.code}`);
            })

            // 创建VideoOutput对象
            // let profile = cameraOutputCapability.videoProfiles[0];
            let profile = myVideoProfile;
            console.log('choosen[0] profile: ' + JSON.stringify(profile));
            try {
                videoOutput = cameraManager.createVideoOutput(profile, videoSurfaceId)
                console.info('createVideoOutput success');
            } catch (error) {
                console.error('Failed to create the videoOutput instance. errorCode = ' + error.code);
            }
            // 监听视频输出错误信息
            videoOutput.on('error', (error) => {
                console.log(`Preview output error code: ${error.code}`);
            })

            // 创建previewOutput输出对象
            let surfaceId = globalThis.value;
            let previewProfile = myPreviewProfile;
            console.log('choosen[0] previewProfile: ' + JSON.stringify(previewProfile));
            try {
                previewOutput = cameraManager.createPreviewOutput(previewProfile, surfaceId)
                console.info('createPreviewOutput success');
            } catch (error) {
                console.error('Failed to create the PreviewOutput instance errorCode = ' + error.code);
            }

            // 打开相机
            await cameraInput.open();

            //创建会话
            try {
                captureSession = cameraManager.createCaptureSession()
                console.info('createCaptureSession success');
            } catch (error) {
                console.error('Failed to create the CaptureSession instance. errorCode = ' + error.code);
            }

            // 监听session错误信息
            captureSession.on('error', (error) => {
                console.log(`Capture session error code: ${error.code}`);
            })

            // 开始配置会话
            try {
                captureSession.beginConfig()
                console.info('beginConfig success');
            } catch (error) {
                console.error('Failed to beginConfig. errorCode = ' + error.code);
            }

            // 向会话中添加相机输入流
            try {
                captureSession.addInput(cameraInput)
                console.info('captureSession.addInput cameraInput success');
            } catch (error) {
                console.error('Failed to addInput. errorCode = ' + error.code);
            }

            // 向会话中添加预览输入流
            try {
                captureSession.addOutput(previewOutput)
                console.info('captureSession.addOutput previewOutput success');
            } catch (error) {
                console.error('Failed to addOutput(previewOutput). errorCode = ' + error.code);
            }

            // 向会话中添加录像输出流
            try {
                captureSession.addOutput(videoOutput)
                console.info('captureSession.addOutput videoOutput success');
            } catch (error) {
                console.error('Failed to addOutput(videoOutput). errorCode = ' + error.code);
            }

            // 提交会话配置
            await captureSession.commitConfig()

            // 启动会话
            await captureSession.start().then(() => {
                isInitCamera = true
                console.log('captureSession start success.');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            })
        }

        function toNextStep(avRecorder, avConfig, recorderTime, steps, done) {
            if (steps[0] == END_EVENT) {
                console.info('case success!!');
                done();
            } else {
                eventEmitter.emit(steps[0], avRecorder, avConfig, recorderTime, steps, done);
            }
        }

        function setAvRecorderCallback(avRecorder, done) {
            // 状态机变化回调函数
            avRecorder.on('stateChange', (state, reason) => {
                console.info(TAG + 'current state is: ' + state);
            })
            // 错误上报回调函数
            avRecorder.on('error', async (err) => {
                try {
                    console.error(TAG + 'error ocConstantSourceNode, error message is ' + err);
                    await releaseRecorderPromise(avRecorder, done);
                } catch (error) {
                    // 处理错误
                    console.error(TAG + 'when error on execute releaseRecorderPromise error message is ' + error);
                }
            });
        }

        function setPhotoAssetAvailableCallback(avRecorder, done) {
            avRecorder.on('photoAssetAvailable', (asset) => {
                console.info(TAG + 'photoAssetAvailable called');
                if (asset != undefined) {
                    mediaTestBase.saveVideo(asset);
                } else {
                    console.error(TAG + 'asset is undefined');
                }
                console.info(TAG + 'photoAssetAvailable end');
            })
        }

        async function releaseRecorderPromise(avRecorder, done) {
            await avRecorderTestBase.releasePromise(avRecorder)
            if(isInitCamera == true){
                releaseCameraError(avRecorder, done)
            }else{
                done();
            }
        }

        eventEmitter.on(CREATE_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            media.createAVRecorder((error, recorder) => {
                if (recorder != null) {
                    avRecorder = recorder;
                    expect(avRecorder.state).assertEqual('idle');
                    console.info('createAVRecorder idleCallback success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }  else {
                    console.info(`createAVRecorder idleCallback fail, error:${error}`);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            });
        });

        eventEmitter.on(CREATE_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            media.createAVRecorder().then((recorder) => {
                if (recorder != null) {
                    avRecorder = recorder;
                    console.info('createAVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('createAVRecorder fail');
                }
            }).catch((error) => {
                console.info(`createAVRecorder catchCallback, error:${error}`);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(SETONCALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                setAvRecorderCallback(avRecorder, done)
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }catch(error){
                console.info('setAvRecorderCallback failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(SETPHOTOASSETCALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                setPhotoAssetAvailableCallback(avRecorder, done)
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }catch(error){
                console.info('setAvRecorderCallback failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(PREPARE_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.prepare(avConfig, (err) => {
                console.info('case prepare called');
                if (err == null) {
                    console.error(`case prepare success, state is ${avRecorder.state}`);
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.PREPARED);
                    console.info('prepare success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }  else {
                    console.error(`case prepare error, errMessage is ${err.message}`);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(UPDATE_ROTATION_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let rotation = 90
            avRecorder.updateRotation(rotation).then(() => {
                console.info('updateRotation success');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((error) => {
                console.error('updateRotation failed and catch error is ' + error.message);
                expect(false).assertEqual(true)
            });
        });

        eventEmitter.on(PREPARE_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.prepare(avConfig).then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.PREPARED);
                console.info('prepare success');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('prepare failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(GETINPUTSURFACE_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.getInputSurface((err, surfaceId) => {
                if (err == null) {
                    console.info('getInputSurface success');
                    videoSurfaceId = surfaceId;
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }  else {
                    console.info('getInputSurface failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            });
        });

        eventEmitter.on(GETINPUTSURFACE_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.getInputSurface().then((surfaceId) => {
                console.info('getInputSurface success');
                videoSurfaceId = surfaceId;
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('getInputSurface failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(GETAVRECORDERCONFIG_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.getAVRecorderConfig().then((config) => {
                console.info('getAVRecorderConfig success');
                expect(config.audioSourceType).assertEqual(avConfig.audioSourceType);
                expect(config.audioBitrate).assertEqual(avConfig.audioBitrate);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('getAVRecorderConfig failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(INITCAMERA_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                initCamera(avRecorder, avConfig, recorderTime, steps, done)
            }catch(error){
                console.info('initCamera failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(STARTCAMERA_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                startCameraOutput(avRecorder, avConfig, recorderTime, steps, done)
            }catch(error){
                console.info('startCameraOutput failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(STOPCAMERA_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                stopCameraOutput(avRecorder, avConfig, recorderTime, steps, done)
            }catch(error){
                console.info('stopCameraOutput failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(STARTRECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.start((err) => {
                console.info('case start called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.STARTED);
                    console.info('start AVRecorder success');
                    setTimeout(() => {
                        console.info('STARTRECORDER_CALLBACK_EVENT setTimeout success');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                    }, recorderTime);
                } else {
                    console.info('start AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(STARTRECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.start().then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.STARTED);
                console.info('start success');
                setTimeout(() => {
                    console.info('STARTRECORDER_PROMISE_EVENT setTimeout success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }, recorderTime);
            }).catch((err) => {
                console.info('start failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(PAUSERECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.pause((err) => {
                console.info('case pause called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.PAUSED);
                    console.info('pause AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('pause AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(PAUSERECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.pause().then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.PAUSED);
                console.info('pause AVRecorder success');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('pause failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(RESUMERECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let resumeValue = true;
            avRecorder.resume((err) => {
                console.info('case resume called');
                if (err == null) {
                    console.info('resume AVRecorder success');
                    expect(resumeValue).assertEqual(true);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    resumeValue = false
                    console.info('resume AVRecorder failed and error is ' + err.message);
                    console.info('resumeValue is ' + resumeValue);
                    expect(resumeValue).assertEqual(false);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(RESUMERECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let resumeValue = true;
            avRecorder.resume().then(() => {
                console.info('resume success');
                expect(resumeValue).assertEqual(true);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                resumeValue = false
                console.info('resume AVRecorder failed and error is ' + err.message);
                console.info('resumeValue is ' + resumeValue);
                expect(resumeValue).assertEqual(false);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(STOPRECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let stopValue = true;
            avRecorder.stop((err) => {
                console.info('case stop called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.STOPPED);
                    console.info('stop AVRecorder success');
                    expect(stopValue).assertEqual(true);
                    setTimeout(() => {
                        console.info('STOPRECORDER_CALLBACK_EVENT setTimeout success');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                    }, 500);
                } else {
                    stopValue = false
                    console.info('stop AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(STOPRECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let stopValue = true;
            avRecorder.stop((err) => {
                console.info('case stop called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.STOPPED);
                    console.info('stop AVRecorder success');
                    expect(stopValue).assertEqual(true);
                    setTimeout(() => {
                        console.info('STOPRECORDER_PROMISE_EVENT setTimeout success');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                    }, 500);
                } else {
                    stopValue = false
                    console.info('stop AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(RESETRECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.reset((err) => {
                console.info('case reset called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.IDLE);
                    console.info('reset AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('reset AVRecorder failed and error is ' + err.message);
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            })
        });

        eventEmitter.on(RESETRECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.reset().then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.IDLE);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('reset AVRecorder failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        });

        eventEmitter.on(RELEASECORDER_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.release((err) => {
                console.info('case release called');
                if (err == null) {
                    expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED);
                    console.info('release AVRecorder success');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('release AVRecorder failed and error is ' + err.message);
                }
            })
        });

        eventEmitter.on(RELEASECORDER_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            avRecorder.release().then(() => {
                expect(avRecorder.state).assertEqual(avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED);
                console.info('release AVRecorder success');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }).catch((err) => {
                console.info('release AVRecorder failed and catch error is ' + err.message);
            });
        });

        eventEmitter.on(CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let state = avRecorder.state;
            avRecorder.getCurrentAudioCapturerInfo().then((captureInfo) => {
                switch(state) {
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.IDLE:
                        console.info('getCurrentAudioCapturerInfo in idle state');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.PREPARED:
                        console.info('getCurrentAudioCapturerInfo in prepared state');
                        expect(captureInfo.capturerState).assertEqual(avVideoRecorderTestBase.AV_RECORDER_AUDIO_STATE.PREPARED);
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.STARTED:
                        console.info('getCurrentAudioCapturerInfo in started state');
                        expect(captureInfo.capturerState).assertEqual(avVideoRecorderTestBase.AV_RECORDER_AUDIO_STATE.STARTED);
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.PAUSED:
                        console.info('getCurrentAudioCapturerInfo in paused state');
                        expect(captureInfo.capturerState).assertEqual(avVideoRecorderTestBase.AV_RECORDER_AUDIO_STATE.PAUSED);
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.STOPPED:
                        console.info('getCurrentAudioCapturerInfo in stopped state');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED:
                        console.info('getCurrentAudioCapturerInfo in released state');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    default:
                        break;
                }
            }).catch((error) => {
                console.info('getCurrentAudioCapturerInfo failed and catch error is ' + error.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            })
        });

        eventEmitter.on(ENCODER_INFO_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let state = avRecorder.state;
            avRecorder.getAvailableEncoder().then((encoderInfo) => {
                if (state == avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED) {
                    console.info('getAvailableEncoder in released state');
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                } else {
                    console.info('getAvailableEncoder encoderInfo length: ' + encoderInfo.length);
                    expect(encoderInfo.length).assertLarger(0);
                    for (let i = 0; i < encoderInfo.length; i++) {
                        if (encoderInfo[i].type == 'video') {
                            console.info('getAvailableEncoder video encoder frameRate min ' + encoderInfo[i].frameRate.min);
                            console.info('getAvailableEncoder video encoder frameRate max ' + encoderInfo[i].frameRate.max);
                            if (encoderInfo[i].frameRate.min == 0 && encoderInfo[i].frameRate.max == 0) {
                                continue;
                            }
                            expect(encoderInfo[i].frameRate.max).assertLarger(0);
                        } else {
                            console.info('getAvailableEncoder audio encoder bitrate min ' + encoderInfo[i].bitRate.min);
                            console.info('getAvailableEncoder audio encoder bitrate max ' + encoderInfo[i].bitRate.max);
                            if (encoderInfo[i].bitRate.min == 0 && encoderInfo[i].bitRate.max == 0) {
                                continue;
                            }
                            expect(encoderInfo[i].bitRate.max).assertLarger(0);
                        }
                    }
                    toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                }
            }).catch((error) => {
                console.info('avRecorder getAvailableEncoder failed and catch error is: ' + error.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            })
        });

        eventEmitter.on(MAX_AMPLITUDE_PROMISE_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            let state = avRecorder.state;
            avRecorder.getAudioCapturerMaxAmplitude().then((maxAmplitude) => {
                switch (state) {
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.IDLE:
                        maxAmplitudeStartTimes = 0;
                        maxAmplitudePauseTimes = 0;
                        console.info('getAudioCapturerMaxAmplitude in idle state');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.PREPARED:
                        maxAmplitudeStartTimes = 0;
                        maxAmplitudePauseTimes = 0;
                        console.info('getAudioCapturerMaxAmplitude in prepared state');
                        expect(maxAmplitude).assertEqual(0);
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.STARTED:
                        maxAmplitudePauseTimes = 0;
                        console.info('getAudioCapturerMaxAmplitude in started state');
                        if (maxAmplitudeStartTimes != 0) {
                            expect(maxAmplitude).assertLarger(0);
                        }
                        maxAmplitudeStartTimes++;
                        mediaTestBase.msleep(300);
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.PAUSED:
                        maxAmplitudeStartTimes = 0;
                        console.info('getAudioCapturerMaxAmplitude in paused state');
                        if (maxAmplitudePauseTimes != 0) {
                            expect(maxAmplitude).assertEqual(0);
                        }
                        maxAmplitudePauseTimes++;
                        mediaTestBase.msleep(100);
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.STOPPED:
                        maxAmplitudeStartTimes = 0;
                        maxAmplitudePauseTimes = 0;
                        console.info('getAudioCapturerMaxAmplitude in stopped state');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    case avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED:
                        maxAmplitudeStartTimes = 0;
                        maxAmplitudePauseTimes = 0;
                        console.info('getAudioCapturerMaxAmplitude in released state');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                        break;
                    default:
                        break;
                }
            }).catch((error) => {
                console.info('avRecorder getAudioCapturerMaxAmplitude failed and catch error is ' + error.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            })
        });

        async function startCameraOutput(avRecorder, avConfig, recorderTime, steps, done) {
            console.info('startCameraOutput start')
            await videoOutput.start(async (err) => {
                if (err) {
                    console.error(`Failed to start the video output ${err.message}`);
                    return;
                }
                console.log('Callback invoked to indicate the video output start success.');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });
        }

        async function stopCameraOutput(avRecorder, avConfig, recorderTime, steps, done) {
            await videoOutput.stop((err) => {
                if (err) {
                    console.error(`Failed to stop the video output ${err.message}`);
                    return;
                }
                console.log('Callback invoked to indicate the video output stop success.');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            });

        }

        eventEmitter.on(RELEASECAMERA_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try{
                releaseCamera(avRecorder, avConfig, recorderTime, steps, done)

            }catch(error){
                console.info('releaseCamera failed and catch error is ' + error.message);
            }
        });

        eventEmitter.on(CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try {
                let state = avRecorder.state;
                avRecorder.getCurrentAudioCapturerInfo((err, captureInfo) => {
                    switch(state) {
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.IDLE:
                            console.info('getCurrentAudioCapturerInfo in idle state');
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.PREPARED:
                            console.info('getCurrentAudioCapturerInfo in prepared state');
                            expect(captureInfo.capturerState).assertEqual(avVideoRecorderTestBase.AV_RECORDER_AUDIO_STATE.PREPARED);
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.STARTED:
                            console.info('getCurrentAudioCapturerInfo in started state');
                            expect(captureInfo.capturerState).assertEqual(avVideoRecorderTestBase.AV_RECORDER_AUDIO_STATE.STARTED);
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.PAUSED:
                            console.info('getCurrentAudioCapturerInfo in paused state');
                            expect(captureInfo.capturerState).assertEqual(avVideoRecorderTestBase.AV_RECORDER_AUDIO_STATE.PAUSED);
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.STOPPED:
                            console.info('getCurrentAudioCapturerInfo in stopped state');
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED:
                            console.info('getCurrentAudioCapturerInfo in released state');
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        default:
                            break;
                    }
                })
            } catch (error) {
                console.info('avRecorder getCurrentAudioCapturerInfo failed and catch error is ' + error.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }
        });

        eventEmitter.on(ENCODER_INFO_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try {
                let state = avRecorder.state;
                avRecorder.getAvailableEncoder((err, encoderInfo) => {
                    if (state == avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED) {
                        console.info('getAvailableEncoder in released state');
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                    } else {
                        console.info('getAvailableEncoder encoderInfo length: ' + encoderInfo.length);
                        expect(encoderInfo.length).assertLarger(0);
                        for (let i = 0; i < encoderInfo.length; i++) {
                            if (encoderInfo[i].type == 'video') {
                                console.info('getAvailableEncoder video encoder frameRate min ' + encoderInfo[i].frameRate.min);
                                console.info('getAvailableEncoder video encoder frameRate max ' + encoderInfo[i].frameRate.max);
                                if (encoderInfo[i].frameRate.min == 0 && encoderInfo[i].frameRate.max == 0) {
                                    continue;
                                }
                                expect(encoderInfo[i].frameRate.max).assertLarger(0);
                            } else {
                                console.info('getAvailableEncoder audio encoder bitrate min ' + encoderInfo[i].bitRate.min);
                                console.info('getAvailableEncoder audio encoder bitrate max ' + encoderInfo[i].bitRate.min);
                                if (encoderInfo[i].bitRate.min == 0 && encoderInfo[i].bitRate.max == 0) {
                                    continue;
                                }
                                expect(encoderInfo[i].bitRate.max).assertLarger(0);
                            }
                        }
                        toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                    }
                });
            } catch (error) {
                console.info('avRecorder getAvailableEncoder failed and catch error is ' + error.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }
        });

        eventEmitter.on(MAX_AMPLITUDE_CALLBACK_EVENT, (avRecorder, avConfig, recorderTime, steps, done) => {
            steps.shift();
            try {
                let state = avRecorder.state;
                avRecorder.getAudioCapturerMaxAmplitude((err, maxAmplitude) => {
                    switch (state) {
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.IDLE:
                            maxAmplitudeStartTimes = 0;
                            maxAmplitudePauseTimes = 0;
                            console.info('getAudioCapturerMaxAmplitude in idle state');
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.PREPARED:
                            maxAmplitudeStartTimes = 0;
                            maxAmplitudePauseTimes = 0;
                            console.info('getAudioCapturerMaxAmplitude in prepared state');
                            expect(maxAmplitude).assertEqual(0);
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.STARTED:
                            maxAmplitudePauseTimes = 0;
                            console.info('getAudioCapturerMaxAmplitude in started state');
                            if (maxAmplitudeStartTimes != 0) {
                                expect(maxAmplitude).assertLarger(0);
                            }
                            maxAmplitudeStartTimes++;
                            mediaTestBase.msleep(300);
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.PAUSED:
                            maxAmplitudeStartTimes = 0;
                            console.info('getAudioCapturerMaxAmplitude in paused state');
                            if (maxAmplitudePauseTimes != 0) {
                                expect(maxAmplitude).assertEqual(0);
                            }
                            maxAmplitudePauseTimes++;
                            mediaTestBase.msleep(100);
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.STOPPED:
                            maxAmplitudeStartTimes = 0;
                            maxAmplitudePauseTimes = 0;
                            console.info('getAudioCapturerMaxAmplitude in stopped state');
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        case avVideoRecorderTestBase.AV_RECORDER_STATE.RELEASED:
                            maxAmplitudeStartTimes = 0;
                            maxAmplitudePauseTimes = 0;
                            console.info('getAudioCapturerMaxAmplitude in released state');
                            toNextStep(avRecorder, avConfig, recorderTime, steps, done);
                            break;
                        default:
                            break;
                    }
                })
            } catch (error) {
                console.info('avRecorder getAudioCapturerMaxAmplitude failed and catch error is ' + error.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }
        });

        async function releaseCameraError(avRecorder, done) {
            try{
                await captureSession.stop()
                console.info('releaseCameraError 001');
                console.info('captureSession.stop success');
                await cameraInput.close()
                console.info('releaseCameraError 002');
                console.info('cameraInput.close success');
                await previewOutput.release()
                console.info('releaseCameraError 003');
                console.info('previewOutput.release success');
                await videoOutput.release()
                console.info('releaseCameraError 004');
                console.info('videoOutput.release success');
                await captureSession.release()
                console.info('releaseCameraError 005');
                console.info('captureSession.release success');
                captureSession = null
                console.info('releaseCameraError success');
                done();
            } catch(err){
                console.info('releaseCameraError failed and catch error is ' + err.message);
                done();
            }
        }

        async function releaseCamera(avRecorder, avConfig, recorderTime, steps, done) {
            try{
                await captureSession.stop()
                console.info('releaseCamera 001');
                console.info('captureSession.stop success');
                await cameraInput.close()
                console.info('releaseCamera 002');
                console.info('cameraInput.close success');
                await previewOutput.release()
                console.info('releaseCamera 003');
                console.info('previewOutput.release success');
                await videoOutput.release()
                console.info('releaseCamera 004');
                console.info('videoOutput.release success');
                await captureSession.release()
                console.info('releaseCamera 005');
                console.info('captureSession.release success');
                captureSession = null
                console.info('releaseCamera success');
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            } catch(err){
                console.info('releaseCamera failed and catch error is ' + err.message);
                toNextStep(avRecorder, avConfig, recorderTime, steps, done);
            }
        }

        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400
            * @tc.name      : 001.test start-pause-resume
            * @tc.desc      : Recorder video start-pause-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500
            * @tc.name      : 001.test start-stop-resume
            * @tc.desc      : Recorder video start-stop-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600
            * @tc.name      : 001.test start-reset-resume
            * @tc.desc      : Recorder video start-reset-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800
            * @tc.name      : 001.test create-prepare-getInputSurface-start-pause-resume-resume-resume
            * @tc.desc      : Recorder create-prepare-getInputSurface-start-pause-resume-resume-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT,STARTRECORDER_PROMISE_EVENT,
                // pause
                PAUSERECORDER_PROMISE_EVENT,STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT,RESUMERECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT,STARTRECORDER_PROMISE_EVENT,
                // stop
                STOPRECORDER_PROMISE_EVENT,STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT,RESUMERECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT,STARTRECORDER_PROMISE_EVENT,
                // RESET
                RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT,STARTRECORDER_PROMISE_EVENT,
                // pause
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT,RESUMERECORDER_PROMISE_EVENT,
                // resume recorder
                RESUMERECORDER_PROMISE_EVENT,
                // resume recorder
                RESUMERECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500
            * @tc.name      : 001.test start-pause-resume-stop
            * @tc.desc      : Recorder start-pause-resume-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0500
            * @tc.name      : 001.test resume-stop
            * @tc.desc      : Recorder video resume-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                //pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                //resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0500
            * @tc.name      : 001.test start-resume-reset
            * @tc.desc      : Recorder video start-resume-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT,STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100
            * @tc.name      : 001.test create-resume
            * @tc.desc      : Recorder video create-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            console.info('avRecorderResumeCallBack1 test start');
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200
            * @tc.name      : 001.test prepare-resume
            * @tc.desc      : Recorder video prepare-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700
            * @tc.name      : 001.test create-prepare-getInputSurface-resume
            * @tc.desc      : Recorder create-prepare-getInputSurface-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_CALLBACK_0700 end')
        })



        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT,STARTRECORDER_PROMISE_EVENT,
                // resume recorder
                RESUMERECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700
            * @tc.name      : 001.test start-resume
            * @tc.desc      : Recorder video start-resume
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESUME_PROMISE_0700 end')
        })




        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300
            * @tc.name      : 001.test start-stop
            * @tc.desc      : Recorder video start-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400
            * @tc.name      : 001.test start-pause-stop
            * @tc.desc      : Recorder video start-pause-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0400 end')
        })



        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600
            * @tc.name      : 001.test start-reset-stop
            * @tc.desc      : Recorder start-reset-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800
            * @tc.name      : 001.test start-stop-stop-stop
            * @tc.desc      : Recorder start-stop-stop-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_CALLBACK_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100
            * @tc.name      : 001.test create-stop
            * @tc.desc      : Recorder video create-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200
            * @tc.name      : 001.test prepare-stop
            * @tc.desc      : Recorder video prepare-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0300
            * @tc.name      : 001.test start-stop
            * @tc.desc      : Recorder video start-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT,STARTRECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0300 end')
        })


        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0400
            * @tc.name      : 001.test pause-stop
            * @tc.desc      : Recorder video pause-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT,STARTRECORDER_PROMISE_EVENT,
                //pause recorder
                PAUSERECORDER_PROMISE_EVENT,STOPCAMERA_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0400 end')
        })


        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0600
            * @tc.name      : 001.test reset-stop
            * @tc.desc      : Recorder video reset-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT,STARTRECORDER_PROMISE_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT,STOPCAMERA_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700
            * @tc.name      : 001.test getInputSurface-stop
            * @tc.desc      : Recorder video getInputSurface-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT,
                // start recorder
                STARTRECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,
                // release avRecorder
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0800
            * @tc.name      : 001.test start-stop-stop-stop
            * @tc.desc      : Recorder video start-stop-stop-stop
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_STOP_PROMISE_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100
            * @tc.name      : 001.test create-reset
            * @tc.desc      : Recorder video create-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            console.info('avRecorderResumeCallBack1 test start');
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200
            * @tc.name      : 001.test prepare-reset
            * @tc.desc      : Recorder video prepare-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300
            * @tc.name      : 001.test start-reset
            * @tc.desc      : Recorder video start-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400
            * @tc.name      : 001.test start-pause-reset
            * @tc.desc      : Recorder video start-pause-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500
            * @tc.name      : 001.test start-resume-reset
            * @tc.desc      : Recorder video start-resume-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600
            * @tc.name      : 001.test start-stop-reset
            * @tc.desc      : Recorder video start-stop-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700
            * @tc.name      : 001.test create-prepare-getInputSurface-reset
            * @tc.desc      : Recorder create-prepare-getInputSurface-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800
            * @tc.name      : 001.test create-prepare-getInputSurface-start-reset-reset-reset
            * @tc.desc      : Recorder create-prepare-getInputSurface-start-reset-reset-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_CALLBACK_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0100
            * @tc.name      : 001.test create-reset
            * @tc.desc      : Recorder video create-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0200
            * @tc.name      : 001.test prepare-reset
            * @tc.desc      : Recorder video prepare-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,PREPARE_PROMISE_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0300
            * @tc.name      : 001.test start-reset
            * @tc.desc      : Recorder video start-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0400
            * @tc.name      : 001.test start-pause-reset
            * @tc.desc      : Recorder video start-pause-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0400 end')
        })



        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0600
            * @tc.name      : 001.test start-stop-reset
            * @tc.desc      : Recorder video start-stop-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,STOPCAMERA_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700
            * @tc.name      : 001.test create-prepare-getInputSurface-reset
            * @tc.desc      : Recorder create-prepare-getInputSurface-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0800
            * @tc.name      : 001.test create-prepare-getInputSurface-start-reset-reset-reset
            * @tc.desc      : Recorder create-prepare-getInputSurface-start-reset-reset-reset
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT,STOPCAMERA_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT,
                // reset recorder
                RESETRECORDER_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_RESET_PROMISE_0800 end')
        })

        // promise prepare
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100
            * @tc.name      : 01. create->prepare
            * @tc.desc      : 1.create 2.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2PreparePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200
            * @tc.name      : 02. start->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.start2PreparePromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300
           * @tc.name      : 03. pause->prepare
           * @tc.desc      : 1.create 2.prepare 3.start 4.pause 5.prepare
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level 2
       */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.pause2PreparePromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0300 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400
           * @tc.name      : 04. resume->prepare
           * @tc.desc      : 1.create 2.prepare 3.start 4.pause 5.resume 6.prepare
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level 2
       */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                //? AVRecorderTestBase.resumePromise
                RESUMERECORDER_PROMISE_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.resume2PreparePromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500
            * @tc.name      : 05. stop->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.stop 5.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.stopPromise
                STOPRECORDER_PROMISE_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.stop2PreparePromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600
            * @tc.name      : 06. reset->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.reset 5.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.resetPromise
                RESETRECORDER_PROMISE_EVENT,
                // preparePromise
                PREPARE_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.reset2PreparePromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700
            * @tc.name      : 07. getInputSurface->prepare
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // releaseRecorderCallBack
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.getInputSurface2PreparePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800
            * @tc.name      : 08. prepare 3 times
            * @tc.desc      : 1.create 2.prepare 3.prepare 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 3;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT
            );
            for (let i = 0; i < loopTimes; i++)
            {
                mySteps.push(
                    // preparePromise
                    PREPARE_PROMISE_EVENT,
                    // AVRecorderTestBase.resetPromise
                    RESETRECORDER_PROMISE_EVENT,
                )
            }
            mySteps.push(
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.prepare3TimesPromise(avConfig, avRecorder, loopTimes, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900
            * @tc.name      : 09.audioBitrate -1
            * @tc.desc      : 1.create 2.prepare (audioBitrate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900 start')
            let avNewProfile = {
                audioBitrate : -1,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
                profile : avNewProfile,
                url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
                rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000
            * @tc.name      : 10.audioSampleRate -1
            * @tc.desc      : 1.create 2.prepare (audioSampleRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : -1,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100
            * @tc.name      : 11.videoBitrateRange -1
            * @tc.desc      : 1.create 2.prepare (videoBitrateRange -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : -1, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200
            * @tc.name      : 12.videoFrameRate -1
            * @tc.desc      : 1.create 2.prepare (videoFrameRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : -1 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.avConfigChangedPromise(avNewConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_PROMISE_1200 end')
        })

        // Promise getInputSurface
        /* *
             * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100
             * @tc.name      : 01. create->getInputSurface
             * @tc.desc      : 1.create 2.getInputSurface
             * @tc.size      : MediumTest
             * @tc.type      : Function
             * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2GetInputSurfacePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200
            * @tc.name      : 02. prepare->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2GetInputSurfacePromise2(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300
            * @tc.name      : 03. start->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2GetInputSurfacePromise3(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400
            * @tc.name      : 04. pause->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2GetInputSurfacePromise4(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500
            * @tc.name      : 05. resume->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                //? AVRecorderTestBase.resumePromise
                RESUMERECORDER_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2GetInputSurfacePromise5(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600
            * @tc.name      : 06. stop->getInputSurface
            * @tc.desc      :1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.stopPromise
                STOPRECORDER_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2GetInputSurfacePromise6(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700
            * @tc.name      : 07. reset->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.resetPromise
                RESETRECORDER_PROMISE_EVENT,
                //? getInputSurfaceErrPromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2GetInputSurfacePromise7(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800
            * @tc.name      : 08. getInputSurface 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.getInputSurface 5.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 3;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT
            );
            for (let i = 0; i < loopTimes; i++)
            {
                mySteps.push(
                    // getInputSurfacePromise
                    GETINPUTSURFACE_PROMISE_EVENT
                )
            }
            mySteps.push(
                // initCamera
                INITCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                END_EVENT
            )
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.getInputSurface3TimesPromise(avConfig, avRecorder, loopTimes, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_PROMISE_0800 end')
        })

        // Promise start
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100
            * @tc.name      : 01. create->start
            * @tc.desc      : 1.create 2.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                //? startErrPromise
                STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2StartPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200
            * @tc.name      : 02. prepare->start
            * @tc.desc      : 1.create 2.prepare 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? startErrPromise
                STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.prepare2StartPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300
            * @tc.name      : 03. pause->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                //? startErrPromise
                STARTRECORDER_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.pause2StartPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400
            * @tc.name      : 04. resume->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                //? AVRecorderTestBase.resumePromise
                RESUMERECORDER_PROMISE_EVENT,
                //? startErrPromise
                STARTRECORDER_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.resume2StartPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500
            * @tc.name      : 05. stop->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.stopPromise
                STOPRECORDER_PROMISE_EVENT,
                //? startErrPromise
                STARTRECORDER_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.stop2StartPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600
            * @tc.name      : 06. reset->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.resetPromise
                RESETRECORDER_PROMISE_EVENT,
                //? startErrPromise
                STARTRECORDER_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.reset2StartPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700
            * @tc.name      : 07. getInputSurface->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.getInputSurface2StartPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800
            * @tc.name      : 08. start 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.start 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 3;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT
            );
            for (let i = 0; i < loopTimes; i++)
            {
                mySteps.push(
                    // startRecordingProcessPromise
                    STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                    // AVRecorderTestBase.resetPromise
                    RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                    // AVRecorderTestBase.preparePromise
                    PREPARE_PROMISE_EVENT,
                )
            }
            mySteps.push(
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_PROMISE_0800 end')
        })

        // Promise pause
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100
            * @tc.name      : 01. create->pause
            * @tc.desc      : 1.create 2.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                //? pauseErrPromise
                PAUSERECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.create2PausePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200
            * @tc.name      : 02. prepare->pause
            * @tc.desc      : 1.create 2.prepare 3.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                //? pauseErrPromise
                PAUSERECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.prepare2PausePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300
            * @tc.name      : 03. start->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pauseRecordingProcessPromise
                PAUSERECORDER_PROMISE_EVENT, STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.start2PausePromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400
            * @tc.name      : 04. resume->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pauseRecordingProcessPromise
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                //? resumeRecordingProcessPromise
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // pauseRecordingProcessPromise
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.resume2PausePromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500
            * @tc.name      : 05. stop->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.stopPromise
                STOPRECORDER_PROMISE_EVENT,
                //? pauseErrPromise
                PAUSERECORDER_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.stop2PausePromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600
            * @tc.name      : 06. reset->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.resetPromise
                RESETRECORDER_PROMISE_EVENT,
                //? pauseErrPromise
                PAUSERECORDER_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.reset2PausePromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700
            * @tc.name      : 07. getInputSurface->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                //? pauseErrPromise
                PAUSERECORDER_PROMISE_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.getInputSurface2PausePromise(avConfig, avRecorder, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800
            * @tc.name      : 08. pause 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.pause 7.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let loopTimes = 3;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT
            );
            for (let i = 0; i < loopTimes; i++)
            {
                mySteps.push(
                    // pauseRecordingProcessPromise
                    PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                    //? resumeRecordingProcessPromise
                    STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT
                )
            }
            mySteps.push(
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_PROMISE_0800 end')
        })

        // 状态切换
        // 01.promise回调方式
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100
            * @tc.name      : 01.AVRecorder test recording 3 seconds
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2ReleaseWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200
            * @tc.name      : 02.AVRecorder test recording 3 seconds to pause
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pauseRecordingProcessPromise
                PAUSERECORDER_PROMISE_EVENT, STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2PauseWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300
            * @tc.name      : 03.AVRecorder test recording 3 seconds to pause to resume
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                //? AVRecorderTestBase.resumePromise
                RESUMERECORDER_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2ResumeWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400
            * @tc.name      : 04.AVRecorder test recording 3 seconds to stop
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // stopRecordingProcessPromise
                STOPRECORDER_PROMISE_EVENT,STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2StopWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500
            * @tc.name      : 05.AVRecorder test recording 3 seconds to reset
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // resetRecordingProcessPromise
                RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2ResetWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0600
            * @tc.name      : 06.AVRecorder test stop recording after recording 3 seconds
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.stop 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                // stopRecordingProcessPromise
                STOPRECORDER_PROMISE_EVENT,STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2Pause2StopWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0700
            * @tc.name      : 07.AVRecorder test reset recording after recording 3 seconds
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.reset 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                // resetRecordingProcessPromise
                RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2Pause2ResetWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0800
            * @tc.name      : 08.AVRecorder test resume recording after pause and stop recording
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.stop 8.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                //? AVRecorderTestBase.resumePromise
                RESUMERECORDER_PROMISE_EVENT,
                // stopRecordingProcessPromise
                STOPRECORDER_PROMISE_EVENT,STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2Resume2WithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0900
            * @tc.name      : 09.AVRecorder test resume recording after pause and reset recording
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.reset 8.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0900', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0900 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT,
                //? AVRecorderTestBase.resumePromise
                RESUMERECORDER_PROMISE_EVENT,
                // resetRecordingProcessPromise
                RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2reset2WithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1000
            * @tc.name      : 10.AVRecorder test recording 3 seconds (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1000', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1000 start')
            let avNewProfile = {
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
                profile : avNewProfile,
                url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
                rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1100
            * @tc.name      : 11.AVRecorder test recording 3 seconds to pause (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1100 start')
            let avNewProfile = {
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
                profile : avNewProfile,
                url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
                rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pauseRecordingProcessPromise
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2PauseWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1200
            * @tc.name      : 12.AVRecorder test recording 3 seconds to pause to resume (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1200 start')
            let avNewProfile = {
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
                profile : avNewProfile,
                url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
                rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // AVRecorderTestBase.pausePromise
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                //? AVRecorderTestBase.resumePromise
                RESUMERECORDER_PROMISE_EVENT,
                // stopCameraOutput
                STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1300
            * @tc.name      : 13.AVRecorder test recording 3 seconds to stop (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1300 start')
            let avNewProfile = {
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
                profile : avNewProfile,
                url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
                rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // stopRecordingProcessPromise
                STOPRECORDER_PROMISE_EVENT,STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2StopWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1400
            * @tc.name      : 14.AVRecorder test recording 3 seconds to reset (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1400 start')
            let avNewProfile = {
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES, // 视频源类型，支持YUV和ES两种格式
                profile : avNewProfile,
                url : 'fd://35', //  参考应用文件访问与管理开发示例新建并读写一个文件
                rotation : 0, // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // AVRecorderTestBase.preparePromise
                PREPARE_PROMISE_EVENT,
                // getInputSurfacePromise
                GETINPUTSURFACE_PROMISE_EVENT,
                // initCamera
                INITCAMERA_EVENT,
                // startRecordingProcessPromise
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // resetRecordingProcessPromise
                RESETRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT, STOPRECORDER_CALLBACK_EVENT,
                // releaseRecorderPromise
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);

            // avVideoRecorderTestBase.recordStart2ResetWithPromise(avConfig, avRecorder, recorderTime, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_1400 end')
        })

        // 02.callback回调
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0100
            * @tc.name      : 01.AVRecorder test recording 3 seconds
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0200
            * @tc.name      : 02.AVRecorder test recording 3 seconds to pause
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0300
            * @tc.name      : 03.AVRecorder test recording 3 seconds to pause to resume
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // resume avRecorder
                RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0400
            * @tc.name      : 04.AVRecorder test recording 3 seconds to stop
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop avRecorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0500
            * @tc.name      : 05.AVRecorder test recording 3 seconds to reset
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset avRecorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0600
            * @tc.name      : 06.AVRecorder test stop recording after recording 3 seconds
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.stop 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // stop avRecorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0700
            * @tc.name      : 07.AVRecorder test reset recording after recording 3 seconds
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.reset 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // reset avRecorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0800
            * @tc.name      : 08.AVRecorder test resume recording after pause and stop recording
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.stop 8.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // resume avRecorder
                RESUMERECORDER_CALLBACK_EVENT,
                // stop avRecorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0900
            * @tc.name      : 09.AVRecorder test resume recording after pause and reset recording
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.reset 8.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0900', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0900 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // resume avRecorder
                RESUMERECORDER_CALLBACK_EVENT,
                // reset avRecorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1000
            * @tc.name      : 10.AVRecorder test recording 3 seconds (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1000', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1000 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1100
            * @tc.name      : 11.AVRecorder test recording 3 seconds to pause (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1200
            * @tc.name      : 12.AVRecorder test recording 3 seconds to pause to resume (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // resume avRecorder
                RESUMERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1300
            * @tc.name      : 13.AVRecorder test recording 3 seconds to stop (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.stop 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop avRecorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1400
            * @tc.name      : 14.AVRecorder test recording 3 seconds to reset (only video)
            * @tc.desc      : 1.createAVRecorder 2.prepare 3.getInputSurface 4.start 5.reset 6.release
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset avRecorder
                RESETRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_1400 end')
        })

        // Callback  prepare
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100
            * @tc.name      : 01. create->prepare
            * @tc.desc      : 1.create 2.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorde
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0200
            * @tc.name      : 02. start->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0200 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0300
           * @tc.name      : 03. pause->prepare
           * @tc.desc      : 1.create 2.prepare 3.start 4.pause 5.prepare
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level 2
       */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pasue avRecorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0300 end')
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0400
           * @tc.name      : 04. resume->prepare
           * @tc.desc      : 1.create 2.prepare 3.start 4.pause 5.resume 6.prepare
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level 2
       */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pasue avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // resume avRecorder
                RESUMERECORDER_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0500
            * @tc.name      : 05. stop->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.stop 5.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop avRecorder
                STOPRECORDER_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0600
            * @tc.name      : 06. reset->prepare
            * @tc.desc      : 1.create 2.prepare 3.start 4.reset 5.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset avRecorder
                RESETRECORDER_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0700
            * @tc.name      : 07. getInputSurface->prepare
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800
            * @tc.name      : 08. prepare 3 times
            * @tc.desc      : 1.create 2.prepare 3.prepare 4.prepare
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900
            * @tc.name      : 09.audioBitrate -1
            * @tc.desc      : 1.create 2.prepare (audioBitrate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900 start')
            let avNewProfile = {
                audioBitrate : -1,
                audioChannels : 2,
                audioSampleRate : 48000,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000,
                videoCodec : media.CodecMimeType.VIDEO_AVC,
                videoFrameWidth : 640,
                videoFrameHeight : 480,
                videoFrameRate : 30,
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000
            * @tc.name      : 10.audioSampleRate -1
            * @tc.desc      : 1.create 2.prepare (audioSampleRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioSampleRate : -1,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000,
                videoCodec : media.CodecMimeType.VIDEO_AVC,
                videoFrameWidth : 640,
                videoFrameHeight : 480,
                videoFrameRate : 30,
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100
            * @tc.name      : 11.videoBitrateRange -1
            * @tc.desc      : 1.create 2.prepare (videoBitrateRange -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : -1, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : 30 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200
            * @tc.name      : 12.videoFrameRate -1
            * @tc.desc      : 1.create 2.prepare (videoFrameRate -1)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200 start')
            let avNewProfile = {
                audioBitrate : 48000,
                audioChannels : 2,
                audioCodec : media.CodecMimeType.AUDIO_AAC,
                audioSampleRate : 48000,
                fileFormat : media.ContainerFormatType.CFT_MPEG_4, // 视频文件封装格式，只支持MP4
                videoBitrate : 280000, // 视频比特率
                videoCodec : media.CodecMimeType.VIDEO_AVC, // 视频文件编码格式，支持mpeg4和avc两种格式
                videoFrameWidth : 640,  // 视频分辨率的宽
                videoFrameHeight : 480, // 视频分辨率的高
                videoFrameRate : -1 // 视频帧率
            }
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avNewProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avNewConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PREPARE_CALLBACK_1200 end')
        })

        // Callback getInputSurface
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100
            * @tc.name      : 01. create->getInputSurface
            * @tc.desc      : 1.create 2.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200
            * @tc.name      : 02. prepare->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0300
            * @tc.name      : 03. start->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0400
            * @tc.name      : 04. pause->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0500
            * @tc.name      : 05. resume->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // resume avRecorder
                RESUMERECORDER_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0600
            * @tc.name      : 06. stop->getInputSurface
            * @tc.desc      :1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop avRecorder
                STOPRECORDER_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0700
            * @tc.name      : 07. reset->getInputSurface
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset avRecorder
                RESETRECORDER_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800
            * @tc.name      : 08. getInputSurface 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.getInputSurface 5.getInputSurface
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // getInputSurface
                GETINPUTSURFACE_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETSURFACE_CALLBACK_0800 end')
        })

        // Callback start
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100
            * @tc.name      : 01. create->start
            * @tc.desc      : 1.create 2.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // start avRecorder
                STARTRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200
            * @tc.name      : 02. prepare->start
            * @tc.desc      : 1.create 2.prepare 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // start avRecorder
                STARTRECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0300
            * @tc.name      : 03. pause->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // start avRecorder
                STARTRECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0400
            * @tc.name      : 04. resume->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // resume avRecorder
                RESUMERECORDER_CALLBACK_EVENT,
                // start avRecorder
                STARTRECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0500
            * @tc.name      : 05. stop->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop avRecorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0600
            * @tc.name      : 06. reset->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset avRecorder
                RESETRECORDER_CALLBACK_EVENT,
                // start avRecorder
                STARTRECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0700
            * @tc.name      : 07. getInputSurface->start
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0800
            * @tc.name      : 08. start 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.start 6.start
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // start avRecorder
                STARTRECORDER_CALLBACK_EVENT,
                // start avRecorder
                STARTRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_START_CALLBACK_0800 end')
        })

        // Callback pause
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100
            * @tc.name      : 01. create->pause
            * @tc.desc      : 1.create 2.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200
            * @tc.name      : 02. prepare->pause
            * @tc.desc      : 1.create 2.prepare 3.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // release avRecorder
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0300
            * @tc.name      : 03. start->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0300 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0400
            * @tc.name      : 04. resume->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.resume 7.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0400 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // resume avRecorder
                RESUMERECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0500
            * @tc.name      : 05. stop->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.stop 6.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0500 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // stop avRecorder
                STOPRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0600
            * @tc.name      : 06. reset->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.reset 6.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0600 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset avRecorder
                RESETRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0700
            * @tc.name      : 07. getInputSurface->pause
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0700 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // reset avRecorder
                RESETRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0800
            * @tc.name      : 08. pause 3 times
            * @tc.desc      : 1.create 2.prepare 3.getInputSurface 4.start 5.pause 6.pause 7.pause
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0800 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfig.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start avRecorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // pause avRecorder
                PAUSERECORDER_CALLBACK_EVENT,
                // stop camera
                STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_PAUSE_CALLBACK_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200
            * @tc.name      : 02.AVRecorder recording(audioBitrate 8000,audioSampleRate 8000,videoBitrateRange 280000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200 start')

            avProfileMpegAac.audioBitrate = 8000
            avProfileMpegAac.audioSampleRate = 8000
            avProfileMpegAac.videoBitrate = 280000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300
            * @tc.name      : 03.AVRecorder recording(audioBitrate 16000,audioSampleRate 32000,videoBitrateRange 560000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300 start')

            avProfileMpegAac.audioBitrate = 16000
            avProfileMpegAac.audioSampleRate = 32000
            avProfileMpegAac.videoBitrate = 560000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400
            * @tc.name      : 04.AVRecorder recording(audioBitrate 32000,audioSampleRate 44100,videoBitrateRange 1120000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400 start')

            avProfileMpegAac.audioBitrate = 32000
            avProfileMpegAac.audioSampleRate = 44100
            avProfileMpegAac.videoBitrate = 1120000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500
            * @tc.name      : 05.AVRecorder recording(audioBitrate 112000,audioSampleRate 96000,videoBitrateRange 2240000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500 start')

            avProfileMpegAac.audioBitrate = 112000
            avProfileMpegAac.audioSampleRate = 96000
            avProfileMpegAac.videoBitrate = 2240000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0500 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600
            * @tc.name      : 06.AVRecorder recording orientationHint:90
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600 start')

            avConfigMpegAac.orientationHint = 90

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0600 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700
            * @tc.name      : 07.AVRecorder recording orientationHint:180
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700 start')

            avConfigMpegAac.orientationHint = 180

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0700 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800
            * @tc.name      : 08.AVRecorder recording orientationHint:270
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800 start')

            avConfigMpegAac.orientationHint = 270

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0800 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900
            * @tc.name      : 09.AVRecorder recording videoFrameRate:5
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900 start')

            avProfileMpegAac.videoFrameRate = 5

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_0900 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000
            * @tc.name      : 10.AVRecorder recording videoFrameRate:30
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000 start')

            avProfileMpegAac.videoFrameRate = 30

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1000 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200
            * @tc.name      : 12.AVRecorder Record MPEG4
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpeg.url = fdPath
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpeg, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_MPEG4_1200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0100
            * @tc.name      : 001.test 1，record 3s； 2，pause 3，resume 4，stop 5，restart
            * @tc.desc      : Recorder video 1，record 3s； 2，pause 3，resume 4，stop 5，restart
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0200
            * @tc.name      : 02.AVRecorder recording(audioBitrate 8000,audioSampleRate 8000,videoBitrateRange 280000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0200 start')

            avProfileMpegAac.audioBitrate = 8000
            avProfileMpegAac.audioSampleRate = 8000
            avProfileMpegAac.videoBitrate = 280000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0300
            * @tc.name      : 03.AVRecorder recording(audioBitrate 16000,audioSampleRate 32000,videoBitrateRange 560000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0300 start')

            avProfileMpegAac.audioBitrate = 16000
            avProfileMpegAac.audioSampleRate = 32000
            avProfileMpegAac.videoBitrate = 560000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0300 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0400
            * @tc.name      : 04.AVRecorder recording(audioBitrate 32000,audioSampleRate 44100,videoBitrateRange 1120000)
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0400 start')

            avProfileMpegAac.audioBitrate = 32000
            avProfileMpegAac.audioSampleRate = 44100
            avProfileMpegAac.videoBitrate = 1120000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0400 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0500
        * @tc.name      : 05.AVRecorder recording(audioBitrate 112000,audioSampleRate 96000,videoBitrateRange 2240000)
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0500 start')

            avProfileMpegAac.audioBitrate = 112000
            avProfileMpegAac.audioSampleRate = 96000
            avProfileMpegAac.videoBitrate = 2240000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0500 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0600
        * @tc.name      : 06.AVRecorder recording orientationHint:90
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0600 start')

            avConfigMpegAac.orientationHint = 90

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0600 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0700
        * @tc.name      : 07.AVRecorder recording orientationHint:180
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0700 start')

            avConfigMpegAac.orientationHint = 180

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0700 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0800
        * @tc.name      : 08.AVRecorder recording orientationHint:270
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0800 start')

            avConfigMpegAac.orientationHint = 270

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0800 end')
        })

        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0900
        //     * @tc.name      : 09.AVRecorder recording videoFrameRate:5
        //     * @tc.desc      : Recorder video (test failed)
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0900', 0, async function (done) {
        //    if (!isSupportCameraVideoProfiles) {
        //        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        //        expect(true).assertTrue();
        //        done();
        //   }
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0900 start')
        //
        //     avProfileMpegAac.videoFrameRate = 5
        //
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getFd(fileName);
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfigMpegAac.url = fdPath;
        //
        //     let mySteps = new Array(
        //         // init avRecorder
        //         CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        //         // init camera
        //         GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        //         // start recorder
        //         STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        //         // pause recorder
        //         PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        //         // resume recorder
        //         STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        //         // stop recorder
        //         STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        //         // release avRecorder and camera
        //         RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        //         // end
        //         END_EVENT
        //     );
        //
        //     eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_0900 end')
        // })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1000
        * @tc.name      : 10.AVRecorder recording videoFrameRate:30
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1000', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1000 start')

            avProfileMpegAac.videoFrameRate = 30

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpegAac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpegAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1000 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1200
        * @tc.name      : 12.AVRecorder Record MPEG4
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1200 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigMpeg.url = fdPath

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigMpeg, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_MPEG4_1200 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0100
        * @tc.name      : 01.AVRecorder Record H264+AAC
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0100 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0200
        * @tc.name      : 02.AVRecorder recording(audioBitrate 8000,audioSampleRate 8000,videoBitrateRange 280000)
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0200 start')

            avProfileH264Aac.audioBitrate = 8000
            avProfileH264Aac.audioSampleRate = 8000
            avProfileH264Aac.videoBitrate = 280000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0200 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0300
        * @tc.name      : 03.AVRecorder recording(audioBitrate 16000,audioSampleRate 32000,videoBitrateRange 560000)
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0300 start')

            avProfileH264Aac.audioBitrate = 16000
            avProfileH264Aac.audioSampleRate = 32000
            avProfileH264Aac.videoBitrate = 560000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0300 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0400
        * @tc.name      : 04.AVRecorder recording(audioBitrate 32000,audioSampleRate 44100,videoBitrateRange 1120000)
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0400 start')

            avProfileH264Aac.audioBitrate = 32000
            avProfileH264Aac.audioSampleRate = 44100
            avProfileH264Aac.videoBitrate = 1120000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0400 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0500
        * @tc.name      : 05.AVRecorder recording(audioBitrate 112000,audioSampleRate 96000,videoBitrateRange 2240000)
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0500 start')

            avProfileH264Aac.audioBitrate = 112000
            avProfileH264Aac.audioSampleRate = 96000
            avProfileH264Aac.videoBitrate = 2240000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0500 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0600
        * @tc.name      : 06.AVRecorder recording orientationHint:90
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0600 start')

            avConfigH264Aac.orientationHint = 90

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0600 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0700
        * @tc.name      : 07.AVRecorder recording orientationHint:180
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0700 start')

            avConfigH264Aac.orientationHint = 180

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0700 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0800
        * @tc.name      : 08.AVRecorder recording orientationHint:270
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0800 start')

            avConfigH264Aac.orientationHint = 270

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0800 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0900
        * @tc.name      : 09.AVRecorder recording videoFrameRate:5
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0900', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0900 start')

            avProfileH264Aac.videoFrameRate = 5

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_0900 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1000
        * @tc.name      : 10.AVRecorder recording videoFrameRate:30
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1000', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1000 start')

            avProfileH264Aac.videoFrameRate = 30

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1000 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1200
        * @tc.name      : 12.AVRecorder Record MPEG4
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1200 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264.url = fdPath
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H264_1200 end')
        })

        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0100
        //     * @tc.name      : 01.AVRecorder Record H264+AAC
        //     * @tc.desc      : Recorder video (test failed)
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0100', 0, async function (done) {
        //    if (!isSupportCameraVideoProfiles) {
        //        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        //        expect(true).assertTrue();
        //        done();
        //   }
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0100 start')
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getFd(fileName);
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfigH264Aac.url = fdPath;
        //
        //     let mySteps = new Array(
        //         // init avRecorder
        //         CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        //         // init camera
        //         GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        //         // start recorder
        //         STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        //         // pause recorder
        //         PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        //         // resume recorder
        //         STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        //         // stop recorder
        //         STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        //         // release avRecorder and camera
        //         RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        //         // end
        //         END_EVENT
        //     );
        //
        //     eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0100 end')
        // })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0200
        * @tc.name      : 02.AVRecorder recording(audioBitrate 8000,audioSampleRate 8000,videoBitrateRange 280000)
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0200 start')

            avProfileH264Aac.audioBitrate = 8000
            avProfileH264Aac.audioSampleRate = 8000
            avProfileH264Aac.videoBitrate = 280000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0200 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0300
        * @tc.name      : 03.AVRecorder recording(audioBitrate 16000,audioSampleRate 32000,videoBitrateRange 560000)
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0300 start')

            avProfileH264Aac.audioBitrate = 16000
            avProfileH264Aac.audioSampleRate = 32000
            avProfileH264Aac.videoBitrate = 560000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0300 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0400
        * @tc.name      : 04.AVRecorder recording(audioBitrate 32000,audioSampleRate 44100,videoBitrateRange 1120000)
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0400 start')

            avProfileH264Aac.audioBitrate = 32000
            avProfileH264Aac.audioSampleRate = 44100
            avProfileH264Aac.videoBitrate = 1120000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0400 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0500
        * @tc.name      : 05.AVRecorder recording(audioBitrate 112000,audioSampleRate 96000,videoBitrateRange 2240000)
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0500', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0500 start')

            avProfileH264Aac.audioBitrate = 112000
            avProfileH264Aac.audioSampleRate = 96000
            avProfileH264Aac.videoBitrate = 2240000

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0500 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0600
        * @tc.name      : 06.AVRecorder recording orientationHint:90
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0600', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0600 start')

            avConfigH264Aac.orientationHint = 90

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0600 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0700
        * @tc.name      : 07.AVRecorder recording orientationHint:180
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0700', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0700 start')

            avConfigH264Aac.orientationHint = 180

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0700 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0800
        * @tc.name      : 08.AVRecorder recording orientationHint:270
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0800', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0800 start')

            avConfigH264Aac.orientationHint = 270

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0800 end')
        })

        // /* *
        //     * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0900
        //     * @tc.name      : 09.AVRecorder recording videoFrameRate:5
        //     * @tc.desc      : Recorder video (test failed)
        //     * @tc.size      : MediumTest
        //     * @tc.type      : Function test
        //     * @tc.level     : Level2
        // */
        // it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0900', 0, async function (done) {
        //    if (!isSupportCameraVideoProfiles) {
        //        console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
        //        expect(true).assertTrue();
        //        done();
        //   }
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0900 start')
        //
        //     avProfileH264Aac.videoFrameRate = 5
        //
        //     let fileName = avVideoRecorderTestBase.resourceName()
        //     fdObject = await mediaTestBase.getFd(fileName);
        //     fdPath = "fd://" + fdObject.fdNumber;
        //     avConfigH264Aac.url = fdPath;
        //
        //     let mySteps = new Array(
        //         // init avRecorder
        //         CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
        //         // init camera
        //         GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
        //         // start recorder
        //         STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
        //         // pause recorder
        //         PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        //         // resume recorder
        //         STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
        //         // stop recorder
        //         STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
        //         // release avRecorder and camera
        //         RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
        //         // end
        //         END_EVENT
        //     );
        //
        //     eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
        //     console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_0900 end')
        // })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1000
        * @tc.name      : 10.AVRecorder recording videoFrameRate:30
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1000', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1000 start')

            avProfileH264Aac.videoFrameRate = 30

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1000 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1200
        * @tc.name      : 12.AVRecorder Record MPEG4
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1200 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264.url = fdPath

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H264_1200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETAVRECORDERCONFIG_PROMISE_0100
            * @tc.name      : 02. prepare->getAVRecorderConfig
            * @tc.desc      : 1.create 2.prepare 3.getAVRecorderConfig
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETAVRECORDERCONFIG_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETAVRECORDERCONFIG_PROMISE_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH264Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // getAVRecorderConfigPromise
                GETAVRECORDERCONFIG_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH264Aac, recorderTime, mySteps, done);

            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_GETAVRECORDERCONFIG_PROMISE_0100 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H265_0100
        * @tc.name      : 01.AVRecorder Record H265+AAC
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H265_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H265_0100 start')
            if (deviceInfo.deviceInfo === 'default') {
                avConfigH265Aac.videoCodec = media.CodecMimeType.VIDEO_AVC
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH265Aac.url = fdPath;
            let mySteps = new Array(
                // init avRecorder
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT, PREPARE_PROMISE_EVENT,
                // init camera
                GETINPUTSURFACE_PROMISE_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_PROMISE_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_PROMISE_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfigH265Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_PROMISE_H265_0100 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0100
        * @tc.name      : 01.AVRecorder Record H265+AAC
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0100 start')
            if (deviceInfo.deviceInfo === 'default') {
                avConfigH265Aac.videoCodec = media.CodecMimeType.VIDEO_AVC
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH265Aac.url = fdPath;

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH265Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0100 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0200
        * @tc.name      : 02.AVRecorder Record isHdr
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0200 start')
            if (deviceInfo.deviceInfo === 'default') {
                avConfigH265Aac.videoCodec = media.CodecMimeType.VIDEO_AVC
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigH265Aac.url = fdPath
            avConfigH265Aac.isHdr = false

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigH265Aac, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_FUNCTION_CALLBACK_H265_0200 end')
        })

        /* *
        * @tc.number    : SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_CALLBACK_0100
        * @tc.name      : 13.AVRecorder getCurrentAudioCapturerInfo
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_CALLBACK_0100 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigOnlyAac.url = fdPath

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT,
                // start recorder
                STARTRECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_CALLBACK_0100 end')
        })

        /* *
        * @tc.number    : SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_CALLBACK_0100
        * @tc.name      : 13.AVRecorder getAvailableEncoder
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_CALLBACK_0100 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigOnlyAac.url = fdPath

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
                // start recorder
                STARTRECORDER_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, ENCODER_INFO_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_CALLBACK_0100 end')
        })

        /* *
        * @tc.number    : SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_CALLBACK_0100
        * @tc.name      : 13.AVRecorder getMaxAmplitude
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_CALLBACK_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_CALLBACK_0100 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigOnlyAac.url = fdPath

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT,
                // start recorder
                STARTRECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT, MAX_AMPLITUDE_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_CALLBACK_0100 end')
        })

        /* *
        * @tc.number    : SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_PROMISE_0100
        * @tc.name      : 13.AVRecorder getCurrentAudioCapturerInfo
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_PROMISE_0100 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigOnlyAac.url = fdPath

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT,
                // start recorder
                STARTRECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT, CURRENT_AUDIOCAPTURER_INFO_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_CURRENT_CAPTURER_INFO_PROMISE_0100 end')
        })

        /* *
        * @tc.number    : SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_PROMISE_0100
        * @tc.name      : 13.AVRecorder getAvailableEncoder
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_PROMISE_0100 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigOnlyAac.url = fdPath

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
                // start recorder
                STARTRECORDER_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, ENCODER_INFO_PROMISE_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_AVAILABLE_ENCODER_PROMISE_0100 end')
        })

        /* *
        * @tc.number    : SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_PROMISE_0100
        * @tc.name      : 13.AVRecorder getMaxAmplitude
        * @tc.desc      : Recorder video
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
        it('SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_PROMISE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_PROMISE_0100 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigOnlyAac.url = fdPath

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT,
                // prepare avRecorder
                PREPARE_CALLBACK_EVENT, MAX_AMPLITUDE_PROMISE_EVENT,
                // start recorder
                STARTRECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_PROMISE_EVENT, MAX_AMPLITUDE_PROMISE_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_PROMISE_EVENT, MAX_AMPLITUDE_PROMISE_EVENT,
                // resume recorder
                RESUMERECORDER_CALLBACK_EVENT, MAX_AMPLITUDE_PROMISE_EVENT, MAX_AMPLITUDE_PROMISE_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_GET_MAX_AMPLITUDE_PROMISE_0100 end')
        })

        /* *
        * @tc.number    : SUM_MULTIMEDIA_MEDIA_ERRORCODE_ENUM_0100
        * @tc.name      : ErrorCode
        * @tc.desc      : Test Enumerate ErrorCode
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
        */
       it('SUM_MULTIMEDIA_MEDIA_ERRORCODE_ENUM_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
        let newErrorCode = media.AVErrorCode.AVERR_AUDIO_INTERRUPTED;
        console.info('AVERR_AUDIO_INTERRUPTED:' + newErrorCode);
        done();
       })

         /* *
            * @tc.number    : SUM_MULTIMEDIA_AVRECORDER_SET_UPDATE_ROTATION_0100
            * @tc.name      : AVRecorder updateRotation
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level3
        */
        it('SUM_MULTIMEDIA_AVRECORDER_UPDATE_ROTATION_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_UPDATE_ROTATION__0100 start')

            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avConfigOnlyAac.url = fdPath

            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT,
                //prepare avRecorder
                PREPARE_CALLBACK_EVENT,
                //update rotation
                UPDATE_ROTATION_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );

            eventEmitter.emit(mySteps[0], avRecorder, avConfigOnlyAac, recorderTime, mySteps, done);
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_UPDATE_ROTATION__0100 end')
        })

        /* *
            * @tc.number    : SUM_MULTIMEDIA_AVRECORDER_CREATE_0100
            * @tc.name      : AVVideoRecorder
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level3
        */
        it('SUM_MULTIMEDIA_AVRECORDER_CREATE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_CREATE_0100 start')
            media.createVideoRecorder((videoRecorder) => {

            })
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_CREATE_0100 end')
            done();
        })

        /* *
            * @tc.number    : SUM_MULTIMEDIA_AVRECORDER_CREATE_0200
            * @tc.name      : AVVideoRecorder
            * @tc.desc      : Recorder video
            * @tc.size      : MediumTest
            * @tc.type      : Function test
            * @tc.level     : Level3
        */
        it('SUM_MULTIMEDIA_AVRECORDER_CREATE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_CREATE_0200 start')
            try {
                media.createVideoRecorder();
            } catch(error) {

            }

            console.info(TAG + 'SUM_MULTIMEDIA_AVRECORDER_CREATE_0200 end')
            done();
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0100
            * @tc.name      : 09.metadata
            * @tc.desc      : recorder (metadata)
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0100 start')
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avmetaConfig.url = fdPath;
            checkDevice(avmetaConfig)
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avmetaConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AVMETADATA_0100 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200
        * @tc.name      : 09.metadata customInfo(number)
        * @tc.desc      : recorder (metadata)
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200 start')
            let customInfo = {
                "test02": 1000,
            }
            avmetaConfig.metadata.customInfo = customInfo;
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avmetaConfig.url = fdPath;
            checkDevice(avmetaConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avmetaConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200 end')
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200
        * @tc.name      : 09.metadata videoOrientation(99)
        * @tc.desc      : recorder (metadata)
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200 start')

            avmetaConfig.metadata.videoOrientation = "99";
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avmetaConfig.url = fdPath;
            checkDevice(avmetaConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avmetaConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_METADATA_0200 end')
        })
        
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0100
            * @tc.name      : 01.AVRecorder set AudioSourceType 
            * @tc.desc      : AudioSourceType set AUDIO_SOURCE_TYPE_VOICE_RECOGNITION
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0100 start')
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_RECOGNITION,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0200
            * @tc.name      : 02.AVRecorder set AudioSourceType 
            * @tc.desc      : AudioSourceType set AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0200 start')
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0200 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0300
            * @tc.name      : 03.AVRecorder set AudioSourceType 
            * @tc.desc      : AudioSourceType set AUDIO_SOURCE_TYPE_VOICE_MESSAGE
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0300', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0300 start')
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_VOICE_MESSAGE,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0300 end')
        })
   
        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0400
            * @tc.name      : 04.AVRecorder set AudioSourceType 
            * @tc.desc      : AudioSourceType set AUDIO_SOURCE_TYPE_CAMCORDER
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0400', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0400 start')
            let avNewConfig = {
                audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_CAMCORDER,
                videoSourceType : media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES,
                profile : avProfile,
                url : 'fd://35',
                rotation : 0,
                location : { latitude : 30, longitude : 130 }
            }
            let fileName = avVideoRecorderTestBase.resourceName()
            fdObject = await mediaTestBase.getFd(fileName);
            fdPath = "fd://" + fdObject.fdNumber;
            avNewConfig.url = fdPath;
            checkDevice(avNewConfig)
            let mySteps = new Array(
                // setAvRecorderCallback
                CREATE_PROMISE_EVENT, SETONCALLBACK_EVENT,
                // prepareErrPromise
                PREPARE_PROMISE_EVENT,
                // AVRecorderTestBase.releasePromise
                RELEASECORDER_PROMISE_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, avConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUDIO_SOURCE_TYPE_0400 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0100
            * @tc.name      : 09.FileGenerationMode 1 + url ''
            * @tc.desc      : recorder
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0100', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0100 start')
            AutoCreateConfig.fileGenerationMode = media.FileGenerationMode.AUTO_CREATE_CAMERA_SCENE;

            checkDevice(AutoCreateConfig)
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, SETPHOTOASSETCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // init camera
                GETINPUTSURFACE_CALLBACK_EVENT, INITCAMERA_EVENT,
                // start recorder
                STARTCAMERA_EVENT, STARTRECORDER_CALLBACK_EVENT,
                // pause recorder
                PAUSERECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // resume recorder
                STARTCAMERA_EVENT, RESUMERECORDER_CALLBACK_EVENT,
                // stop recorder
                STOPRECORDER_CALLBACK_EVENT, STOPCAMERA_EVENT,
                // release avRecorder and camera
                RELEASECORDER_CALLBACK_EVENT, RELEASECAMERA_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, AutoCreateConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0100 end')
        })

        /* *
            * @tc.number    : SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0200
            * @tc.name      : 09.FileGenerationMode 0 + url ''
            * @tc.desc      : recorder
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0200', 0, async function (done) {
            if (!isSupportCameraVideoProfiles) {
                console.info('Failed to obtain the default videoProfiles object.Not support usb camera');
                expect(true).assertTrue();
                done();
            }
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0200 start')
            AutoCreateConfig.fileGenerationMode = media.FileGenerationMode.APP_CREATE;

            checkDevice(AutoCreateConfig)
            let mySteps = new Array(
                // init avRecorder
                CREATE_CALLBACK_EVENT, SETONCALLBACK_EVENT, SETPHOTOASSETCALLBACK_EVENT, PREPARE_CALLBACK_EVENT,
                // release avRecorde
                RELEASECORDER_CALLBACK_EVENT,
                // end
                END_EVENT
            );
            eventEmitter.emit(mySteps[0], avRecorder, AutoCreateConfig, recorderTime, mySteps, done);
            console.info(TAG + 'SUB_MULTIMEDIA_AVRECORDER_VIDEO_AUTO_CREATE_FILE_0200 end')
        })
    })
}
