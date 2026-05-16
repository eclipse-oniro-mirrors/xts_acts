/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import Utils from './Util.test';
import Context from "application.Context"
import cameraObj from '@ohos.multimedia.camera';

const TAG: string = 'CameraNoPermission:';

let mCameraManager: cameraObj.CameraManager | undefined;
let mCameraDevicesArray: Array<cameraObj.CameraDevice> = [];
let mCameraInput: cameraObj.CameraInput | undefined;
let photoOutput: cameraObj.PhotoOutput | undefined;
let mCameraNum: number;
let isCameraInputOpen: boolean = false;

export default function cameraNoPermissionStaticTest() {
    let getCameraManagerInstance = () => {
        console.info(TAG + 'Enter getCameraManagerInstance');
        let appContext: Context = Hypium.get("Context") as Context;
        mCameraManager = cameraObj.getCameraManager(appContext);
        if (mCameraManager === null || mCameraManager === undefined) {
            console.info(TAG + "getCameraManager FAILED");
            return false;
        }
        console.info(TAG + 'Exit getCameraManagerInstance');
        return true;
    }

    let getCameraSupportDevicesArray = () => {
        console.info(TAG + 'Enter getCameraSupportDevicesArray');
        mCameraDevicesArray = mCameraManager!.getSupportedCameras();
        if (mCameraDevicesArray === null || mCameraDevicesArray === undefined) {
            console.info(TAG + "getSupportedCameras FAILED");
            return false;
        }
        mCameraNum = mCameraDevicesArray.length;
        console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
        expect(mCameraNum).assertLarger(0);
        return true;
    }

    // 创建Output参数为cameraDevice的下标、相机模式
    let createOutput = (index: int, mode: cameraObj.SceneMode) => {
        let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDevicesArray[index], mode)
        if (mode == cameraObj.SceneMode.NORMAL_PHOTO) {
            photoOutput = mCameraManager!.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
            console.info(TAG + 'create NORMAL_PHOTO');
        } else {
            console.info(TAG + 'create NORMAL_VIDEO');
        }

    }

    describe("cameraNoPermissionStaticTest", (): void => {

        beforeAll(() => {
            console.info(TAG + 'beforeAll case');
        })

        beforeEach(async (): Promise<void> => {
            console.info(TAG + 'beforeEach case');
            await Utils.msSleep(1000);
            getCameraManagerInstance();
            getCameraSupportDevicesArray();
        })

        afterEach(async (): Promise<void> => {
            console.info(TAG + 'afterEach case');
            if (isCameraInputOpen && !(mCameraInput === null || mCameraInput === undefined)) {
                await mCameraInput!.close();
                isCameraInputOpen = false;
            }
        })

        afterAll(async (): Promise<void> => {
            console.info(TAG + 'afterAll case');
        })

        /**
         * @tc.name SUB_MULTIMEDIA_CAMERA_CAMERAMANAGER_CREATECAMERAINPUT_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERAMANAGER_CREATECAMERAINPUT_STATIC_0100
         * @tc.desc  CameraManager-createCameraInput with no permission
         * @tc.level LEVEL1
         * @tc.size MEDIUMTEST
         * @tc.type FUNCTION
        */
        it("SUB_MULTIMEDIA_CAMERA_CAMERAMANAGER_CREATECAMERAINPUT_STATIC_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            const testName:string = 'SUB_MULTIMEDIA_CAMERA_CAMERAMANAGER_CREATECAMERAINPUT_STATIC_0100 ';
            console.info(TAG, testName + 'begin');
            try {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDevicesArray[0]);
                isCameraInputOpen = true;
                expect().assertFail();
                done();
            } catch (err) {
                console.info(TAG, testName + 'failed, err.code:' + err.code + ' err.message:' + err.message);
                //与动态接口保持一致，无权限场景抛出7400102
                expect(err.code).assertEqual(7400102);
                done();
            }
        })

        /**
         * @tc.name SUB_MULTIMEDIA_CAMERA_CAMERAMANAGER_CREATECAMERAINPUT_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERAMANAGER_CREATECAMERAINPUT_STATIC_0200
         * @tc.desc  CameraManager-createCameraInput with no permission
         * @tc.level LEVEL1
         * @tc.size MEDIUMTEST
         * @tc.type FUNCTION
         */
        it("SUB_MULTIMEDIA_CAMERA_CAMERAMANAGER_CREATECAMERAINPUT_STATIC_0200",
            TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            const testName:string = 'SUB_MULTIMEDIA_CAMERA_CAMERAMANAGER_CREATECAMERAINPUT_STATIC_0200 ';
            console.info(TAG, testName + 'begin');
            try {
                mCameraInput = mCameraManager!.createCameraInput(mCameraDevicesArray[0].cameraPosition, mCameraDevicesArray[0].cameraType);
                isCameraInputOpen = true;
                expect().assertFail();
                done();
            } catch (err) {
                console.info(TAG, testName + 'failed, err.code:' + err.code + ' err.message:' + err.message);
                //与动态接口保持一致，无权限场景抛出7400102
                expect(err.code).assertEqual(7400102);
                done();
            }
        })

        /**
         * @tc.name SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_ENABLEMOVINGPHOTO_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_ENABLEMOVINGPHOTO_STATIC_0100
         * @tc.desc  PhotoOutput-enableMovingPhoto with no permission
         * @tc.level LEVEL1
         * @tc.size MEDIUMTEST
         * @tc.type FUNCTION
         */
        it("SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_ENABLEMOVINGPHOTO_STATIC_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
            async (done: () => void): Promise<void> => {
            const testName:string = 'SUB_MULTIMEDIA_CAMERA_PHOTOOUTPUT_ENABLEMOVINGPHOTO_STATIC_0100 ';
            console.info(TAG, testName + 'begin');
            try {
                //创建输出流
                createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

                //音频非必备权限、不允许新增抛出错误码，因此无权限场景不报错
                photoOutput!.enableMovingPhoto(true)
                done();
            } catch (err) {
                console.info(TAG, testName + 'failed, err.code:' + err.code + ' err.message:' + err.message);
                expect().assertFail();
                done();
            }
        })

    })

}