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

import cameraObj from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Context from "application.Context";
import Utils from './Util.test';
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'CameraSessionSystemPressureTest: '
const TAG = "CameraSessionSystemPressureTest: ";

// Define global letiables
let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.Session;
let isCameraSessionCreated: boolean = false;

// CAMERA-0 letiables
let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let isPreviewOutputCreated: boolean = false;

export default function cameraSessionSystemPressureTest() {
    let isEmpty01 = (data: cameraObj.CameraManager) => {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    let isEmpty02 = (data: Array<cameraObj.CameraDevice>) => {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    let isEmpty04 = (data: cameraObj.CameraInput) => {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    let isEmpty05 = (data: cameraObj.CameraOutputCapability) => {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    let isEmpty06 = (data: Array<cameraObj.Profile>) => {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    let isEmpty07 = (data: cameraObj.PreviewOutput) => {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    let mgetCameraManagerInstance = () => {
        console.info('Enter mgetCameraManagerInstance');
        let appContext: Context = Hypium.get("Context") as Context;
        mCameraManager = cameraObj.getCameraManager(appContext);
        if (isEmpty01(mCameraManager)) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }
        console.info('Exit mgetCameraManagerInstance');
        return true;
    }

    let getCameraSupportDevicesArray = () => {
        console.info('Enter getCameraSupportDevicesArray');
        mCameraDevicesArray = mCameraManager.getSupportedCameras();
        if (isEmpty02(mCameraDevicesArray)) {
            console.info(TAG + "getSupportedCameras FAILED");
            return false;
        }
        mCameraNum = mCameraDevicesArray.length;
        console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
        console.info('Exit getCameraSupportDevicesArray');
        return true;
    }

    let createCameraSessionWithMode = (mode: cameraObj.SceneMode) => {
        console.info('Enter createCameraSessionWithMode');
        try {
            if (mode == cameraObj.SceneMode.NORMAL_PHOTO) {
                console.info('create photo session');
                mCameraSession = mCameraManager.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO) as cameraObj.PhotoSession;
            } else if (mode == cameraObj.SceneMode.NORMAL_VIDEO) {
                console.info('create video session');
                mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO) as cameraObj.VideoSession;
            } else {
                console.error('createCameraSessionWithMode unknown sceneMode');
                return;
            }
            isCameraSessionCreated = true;
        } catch (err: BusinessError) {
            console.info('createCaptureSession FAILED, err: ' + err);
            expect().assertFail();
        }
    }

    let releaseCameraSessionInstance = async () => {
        console.info('Enter releaseCameraSessionInstance');
        if (isCameraSessionCreated && mCameraSession != undefined) {
            try {
                await mCameraSession.release();
                isCameraSessionCreated = false;
            } catch (err) {
                let error = err as BusinessError;
                console.info('releaseCameraSessionInstance FAILED, err: ' + JSON.stringify(error));
            }
        }
    }

    let createInput = async (idx: int) => {
        console.info('Enter createInput');
        if (isEmpty02(mCameraDevicesArray)) {
            console.info(TAG + "Entering createInputs FAILED with NoCamera");
            return false;
        }
        mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
        if (isEmpty04(mCameraInput)) {
            console.info(TAG + "createCameraInput FAILED");
            return false;
        }
        await mCameraInput.open();
        console.info(idx + 'th CameraInput is: ' + mCameraInput);
        console.info('Exit createInput');
        return true;
    }

    let createOutput = (idx: int) => {
        console.info('Enter createOutput');
        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx], cameraObj.SceneMode.NORMAL_PHOTO);
        if (!isEmpty05(cameraOutputCap)) {
            if (!isEmpty06(cameraOutputCap.previewProfiles)) {
                console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
                for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
                    let surfaceIds = Hypium.get('SurfaceId') as string;
                    mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceIds);
                    if (!isEmpty07(mPreviewOutput)) {
                        isPreviewOutputCreated = true;
                        break;
                    }
                }
                if (isEmpty07(mPreviewOutput)) {
                    console.info(TAG + "createPreviewOutput FAILED");
                }
                console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
            }
        }
        console.info('Exit createOutputs');
        return true;
    }


    // 创建视频录制的参数
    let videoProfile: media.AVRecorderProfile = {
    audioBitrate: 48000,
    audioChannels: 2,
    audioCodec: media.CodecMimeType.AUDIO_AAC,
    audioSampleRate: 48000,
    fileFormat: media.ContainerFormatType.CFT_MPEG_4,
    videoBitrate: 2000000,
    videoCodec: media.CodecMimeType.VIDEO_AVC,
    videoFrameWidth: 640,
    videoFrameHeight: 480,
    videoFrameRate: 30
    }

    let videoConfig: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
    profile: videoProfile,
    url: 'file:///data/media/CameraJSUnitOutput.mp4',
    }

    // 创建录像输出流
    let AVRecorder: media.AVRecorder | undefined;
    let isAVRecorderCreated: boolean = false;
    let videoSurfaceId: string | undefined = '';
    let fdNumber: int;
    let fdPath: string;
    let mVideoOutput: cameraObj.VideoOutput;
    let isVideoOutputCreated: boolean = false;

    let getFd = async (pathName: string) => {
        let fileDir: string = Hypium.get('pathDir') as string;
        pathName = fileDir + '/' + pathName;
        let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fdNumber = file.fd;
        fdPath = "fd://" + `${fdNumber}`;
        hilog.info(domain, tag, 'case getFd number is: ' + fdNumber);
    }

    let closeFd = async () => {
        hilog.info(domain, tag, 'case come in closeFd')
        if (fdNumber != null) {
        fs.closeSync(fdNumber);
        } else {
        hilog.info(domain, tag, '[fs.closeSync] case fdNumber is null');
        }
    }

    let getVideoSurface = async () => {
        await getFd('CameraManager.mp4');
        await Utils.msSleep(2000);
        videoConfig.url = fdPath;
        try {
            AVRecorder = await media.createAVRecorder();
            isAVRecorderCreated = true;
            let errs = await AVRecorder!.prepare(videoConfig);
            videoSurfaceId = await AVRecorder!.getInputSurface();
            hilog.info(domain, tag, `getSurfaceId success, videoSurfaceId is ${videoSurfaceId}`);
        } catch (err) {
            let error = err as BusinessError;
            hilog.info(domain, tag, 'getSurfaceId failed, err:' + JSON.stringify(error));
        }
    }

    let releaseAVRecorder = async () => {
        hilog.info(domain, tag, "start releaseAVRecorder");
        if (isAVRecorderCreated && AVRecorder != undefined) {
            try {
                await AVRecorder!.release();
                isAVRecorderCreated = false;
            } catch (err) {
                let error = err as BusinessError;
                hilog.info(domain, tag, 'releaseAVRecorder FAILED, err: ' + JSON.stringify(error));
            }
        }
        hilog.info(domain, tag, "releaseAVRecorder end")
    }

    let createVideoAndPreviewOutput = (idx: int) => {
        console.info('Enter createVideoAndPreviewOutput');
        let height:int = 0;
        let width:int = 0;
        let previewIndex:int = 0;
        let videoIndex:int = 0;
        let equalFlag: boolean = false;
        let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx], cameraObj.SceneMode.NORMAL_VIDEO);

        if (cameraOutputCap != undefined) {
            if (cameraOutputCap.previewProfiles != null && cameraOutputCap.photoProfiles !=null && cameraOutputCap.videoProfiles != null) {
                for (previewIndex = 0; previewIndex < cameraOutputCap.previewProfiles.length; previewIndex++) {
                    height = cameraOutputCap.previewProfiles[previewIndex].size.height
                    width = cameraOutputCap.previewProfiles[previewIndex].size.width;
                    for (videoIndex = 0; videoIndex < cameraOutputCap.videoProfiles.length; videoIndex++) {
                        if (cameraOutputCap.videoProfiles[videoIndex].size.height === height &&
                            cameraOutputCap.videoProfiles[videoIndex].size.width === width) {
                            equalFlag = true;
                            break;
                        }
                    }
                    if (equalFlag) {
                        break;
                    }
                }
		let surfaceIds = Hypium.get('SurfaceId') as string;
                if (equalFlag) {
                    mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[previewIndex], surfaceIds);
                    if (mPreviewOutput == undefined) {
                        console.info(TAG + "createPreviewOutput FAILED");
                    } else {
                        isPreviewOutputCreated = true;
                    }
                    console.info(TAG + "createPreviewOutput is: " + mPreviewOutput);
                    mVideoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[videoIndex], videoSurfaceId!);
                    if (mVideoOutput == null || mVideoOutput == undefined) {
                        console.info(TAG + "createVideoOutput FAILED");
                    } else {
                        isVideoOutputCreated = true;
                    }
                    console.info(TAG + "createVideoOutput is: " + mVideoOutput);
                } else {
                    console.info(TAG + "No same profile size for preview and video");
                    mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceIds);
                    if (mPreviewOutput == undefined) {
                        console.info(TAG + "createPreviewOutput FAILED");
                    } else {
                        isPreviewOutputCreated = true;
                    }
                    console.info(TAG + "createPreviewOutput is: " + mPreviewOutput);
                }
            }
        }
        console.info('Exit createVideoAndPreviewOutput');
        return true;
    }

    let releaseOutput = async () => {
        console.info('Enter releaseOutput');
        if (isPreviewOutputCreated && mPreviewOutput != undefined) {
            try {
                await mPreviewOutput.release();
                isPreviewOutputCreated = false;
            } catch (err) {
                let error = err as BusinessError;
                console.info('release mPreviewOutput FAILED, err: ' + JSON.stringify(error));
            }
        }
        if (isVideoOutputCreated && mVideoOutput != undefined) {
            try {
                await mVideoOutput.release();
                isVideoOutputCreated = false;
            } catch (err) {
                let error = err as BusinessError;
                console.info('release mVideoOutput FAILED, err: ' + JSON.stringify(error));
            }
        }
        console.info('Exit releaseOutput');
    }

    describe('cameraSessionSystemPressureTest', () => {
        console.info(TAG + '----------cameraSessionSystemPressureTest--------------')
        beforeAll(async () => {
            await getVideoSurface();
            mgetCameraManagerInstance();
            getCameraSupportDevicesArray();
            console.info('beforeAll case');
        })

        beforeEach(() => {
            console.info('beforeEach case');
        })

        afterEach(async () => {
            console.info('afterEach case');
            await releaseOutput();
            await releaseCameraSessionInstance();
        })

        afterAll(async () => {
            console.info('afterAll case');
            await releaseAVRecorder();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100
         * @tc.desc   Check whether register system pressure callback is successful.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100--------------");
            if (mCameraNum == 0) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG +
                        "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100 start for camera[" + i + "]");
                    await createInput(i);
                    createOutput(i);
                    createCameraSessionWithMode(cameraObj.SceneMode.NORMAL_PHOTO);
                    mCameraSession.beginConfig();
                    if (isEmpty04(mCameraInput)) {
                        console.info(TAG + "cameraInput is null.");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addInput(mCameraInput);
                    if (isEmpty07(mPreviewOutput)) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addOutput(mPreviewOutput);
                    await mCameraSession.commitConfig();

                    (mCameraSession as cameraObj.PhotoSession).onSystemPressureLevelChange((error: BusinessError | null, pressureState: cameraObj.SystemPressureLevel | undefined) => {
                        if (error !== undefined && error!.code !== 0) {
                            expect().assertFail();
                        }
                        done();
                    })

                    await mCameraSession.start();
                    await mCameraSession.stop();
                    await mCameraInput.close();
                    await releaseCameraSessionInstance();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100 end for camera[" +
                        i + "]");
                }
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100 ends here");
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100
         * @tc.desc   Check whether unregister system pressure callback is successful.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100--------------");
            if (mCameraNum == 0) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG +
                        "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100 start for camera[" + i + "]");
                    await createInput(i);
                    createOutput(i);
                    createCameraSessionWithMode(cameraObj.SceneMode.NORMAL_PHOTO);
                    mCameraSession.beginConfig();
                    if (isEmpty04(mCameraInput)) {
                        console.info(TAG + "cameraInput is null.");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addInput(mCameraInput);
                    if (isEmpty07(mPreviewOutput)) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addOutput(mPreviewOutput);
                    await mCameraSession.commitConfig();

                    (mCameraSession as cameraObj.PhotoSession).offSystemPressureLevelChange();

                    await mCameraSession.start();
                    await mCameraSession.stop();
                    await mCameraInput.close();
                    await releaseCameraSessionInstance();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100 end for camera[" +
                        i + "]");
                }
                console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100 ends here");
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100
         * @tc.desc   Check whether register system pressure callback is successful.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("--------------SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100--------------");
            if (mCameraNum == 0) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG +
                        "Entering SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100 start for camera[" + i + "]");
                    await createInput(i);
                    createVideoAndPreviewOutput(i);
                    createCameraSessionWithMode(cameraObj.SceneMode.NORMAL_VIDEO);
                    mCameraSession.beginConfig();
                    if (isEmpty04(mCameraInput)) {
                        console.info(TAG + "cameraInput is null.");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addInput(mCameraInput);
                    if (isEmpty07(mPreviewOutput)) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addOutput(mPreviewOutput);
                    if (isVideoOutputCreated && mVideoOutput != undefined && mCameraSession.canAddOutput(mVideoOutput) == true) {
                        mCameraSession.addOutput(mVideoOutput);
                    }
                    await mCameraSession.commitConfig();

                    (mCameraSession as cameraObj.VideoSession).onSystemPressureLevelChange((error: BusinessError | null, pressureState: cameraObj.SystemPressureLevel | undefined) => {
                        if (error !== undefined && error!.code !== 0) {
                            expect().assertFail();
                        }
                        done();
                    })

                    await mCameraSession.start();
                    await mCameraSession.stop();
                    await mCameraInput.close();
                    await releaseCameraSessionInstance();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100 end for camera[" +
                        i + "]");
                }
                console.info(TAG + "Entering SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_ON_STATIC_0100 ends here");
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100
         * @tc.desc   Check whether unregister system pressure callback is successful.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info("--------------SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100--------------");
            if (mCameraNum == 0) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100 FAILED with NoCamera");
                expect().assertFail();
                done();
            } else {
                for (let i = 0; i < mCameraNum; i++) {
                    console.info(TAG +
                        "Entering SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100 start for camera[" + i + "]");
                    await createInput(i);
                    createVideoAndPreviewOutput(i);
                    createCameraSessionWithMode(cameraObj.SceneMode.NORMAL_VIDEO);
                    mCameraSession.beginConfig();
                    if (isEmpty04(mCameraInput)) {
                        console.info(TAG + "cameraInput is null.");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addInput(mCameraInput);
                    if (isEmpty07(mPreviewOutput)) {
                        console.info(TAG + "Start to addOutput mPreviewOutput");
                        expect().assertFail();
                        done();
                    }
                    mCameraSession.addOutput(mPreviewOutput);
                    if (isVideoOutputCreated && mVideoOutput != undefined && mCameraSession.canAddOutput(mVideoOutput) == true) {
                        mCameraSession.addOutput(mVideoOutput);
                    }
                    await mCameraSession.commitConfig();

                    (mCameraSession as cameraObj.VideoSession).offSystemPressureLevelChange();

                    await mCameraSession.start();
                    await mCameraSession.stop();
                    await mCameraInput.close();
                    await releaseCameraSessionInstance();
                    console.info(TAG + "Entering SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100 end for camera[" +
                        i + "]");
                }
                console.info(TAG + "Entering SUB_MULTIMEDIA_VIDEO_SESSION_SYSTEM_PRESSURE_LEVEL_OFF_STATIC_0100 ends here");
                done();
            }
        })
    })
}