/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

import { driveFn, getPermission } from '../common';
import { indexSurfaceId } from '../../testability/pages/Index';

const TAG = 'xts-API24-ApertureQueryGetSupportedPhysicalAperturesTest';

// ========== 共用函数定义（放在 describe 之外） ==========

// 延迟函数
let sleep = (ms: number = 100): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

// 空值检查函数
let isEmpty = (value: ESObject): boolean => {
  if (value === null || value === undefined) {
    return true;
  }
  if (typeof value === 'string' && value.trim() === '') {
    return true;
  }
  if (Array.isArray(value) && value.length === 0) {
    return true;
  }
  return false;
}

// 创建相机管理器
let createCameraManager = (context: ESObject): camera.CameraManager => {
  return camera.getCameraManager(context);
}

// 获取支持的相机设备
let getSupportedCameras = (cameraManager: camera.CameraManager): Array<camera.CameraDevice> => {
  return cameraManager.getSupportedCameras();
}

// 创建相机输入
let createCameraInput = (cameraManager: camera.CameraManager, cameraDevice: camera.CameraDevice): camera.CameraInput => {
  return cameraManager.createCameraInput(cameraDevice);
}

// 查询相机支持的输出能力
let getSupportedOutputCapability = (cameraManager: camera.CameraManager, cameraDevice: camera.CameraDevice, sceneMode: camera.SceneMode): camera.CameraOutputCapability => {
  return cameraManager.getSupportedOutputCapability(cameraDevice, sceneMode);
}

// 创建预览输出
let createPreviewOutput = (cameraManager: camera.CameraManager, previewProfile: camera.Profile, surfaceId: string): camera.PreviewOutput => {
  return cameraManager.createPreviewOutput(previewProfile, surfaceId);
}

// 创建拍照输出
let createPhotoOutput = (cameraManager: camera.CameraManager, photoProfile: camera.Profile): camera.PhotoOutput => {
  return cameraManager.createPhotoOutput(photoProfile);
}

// 创建拍照会话
let createPhotoSession = (cameraManager: camera.CameraManager, sceneMode: camera.SceneMode): camera.PhotoSession => {
  return cameraManager.createSession(sceneMode) as camera.PhotoSession;
}

// 释放相机资源
let releaseCameraResources = async (cameraInput: camera.CameraInput, previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput, photoSession: camera.PhotoSession): Promise<void> => {
  await photoSession?.stop();
  await cameraInput?.close();
  await previewOutput?.release();
  await photoOutput?.release();
  await photoSession?.release();
}

// ========== 测试套函数 ==========
export default function ApertureQueryGetSupportedPhysicalAperturesTest() {
  describe('ApertureQueryGetSupportedPhysicalAperturesTest', () => {
    let mCameraManager: camera.CameraManager | undefined;
    let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
    let mCameraInput: camera.CameraInput | undefined;
    let mPreviewOutput: camera.PreviewOutput | undefined;
    let mPhotoOutput: camera.PhotoOutput | undefined;
    let mPhotoSession: camera.PhotoSession | undefined;

    // beforeALL函数中申请权限
    beforeAll(async () => {
      console.info(TAG, 'beforeAll begin.');
      await getPermission();
      await driveFn();
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0100
     * @tc.desc   getSupportedPhysicalApertures normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0100';
      console.info(TAG, testName + ' begin.');

      // ========== 预制过程 ==========
      // 1. 创建相机管理器实例
      mCameraManager = createCameraManager(getContext());
      if (isEmpty(mCameraManager)) {
        console.error(TAG, testName + ' failed. mCameraManager is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 2. 获取支持的相机列表
      mCameraDeviceArray = getSupportedCameras(mCameraManager!);
      if (isEmpty(mCameraDeviceArray) || mCameraDeviceArray!.length === 0) {
        console.error(TAG, testName + ' failed. mCameraDeviceArray is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 3. 创建相机输入
      mCameraInput = createCameraInput(mCameraManager!, mCameraDeviceArray![0]);
      if (isEmpty(mCameraInput)) {
        console.error(TAG, testName + ' failed. mCameraInput is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 4. 打开相机
      await mCameraInput!.open();

      // 5. 查询相机支持的输出能力
      let cameraOutputCap: camera.CameraOutputCapability = getSupportedOutputCapability(
        mCameraManager!,
        mCameraDeviceArray![0],
        camera.SceneMode.NORMAL_PHOTO
      );

      // 6. 创建预览输出
      mPreviewOutput = createPreviewOutput(mCameraManager!, cameraOutputCap.previewProfiles[0], indexSurfaceId);
      if (isEmpty(mPreviewOutput)) {
        console.error(TAG, testName + ' failed. mPreviewOutput is empty.', mCameraManager, cameraOutputCap.previewProfiles[0], indexSurfaceId, indexSurfaceId);
        expect().assertFail();
        done();
        return;
      }

      // 7. 创建拍照输出
      mPhotoOutput = createPhotoOutput(mCameraManager!, cameraOutputCap.photoProfiles[0]);
      if (isEmpty(mPhotoOutput)) {
        console.error(TAG, testName + ' failed. mPhotoOutput is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 8. 创建拍照会话
      mPhotoSession = createPhotoSession(mCameraManager!, camera.SceneMode.NORMAL_PHOTO);
      if (isEmpty(mPhotoSession)) {
        console.error(TAG, testName + ' failed. mPhotoSession is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 9. 开始配置
      mPhotoSession!.beginConfig();

      // 10. 添加输入流
      mPhotoSession!.addInput(mCameraInput!);

      // 11. 添加输出流
      mPhotoSession!.addOutput(mPreviewOutput!);
      mPhotoSession!.addOutput(mPhotoOutput!);

      // 12. 提交配置
      await mPhotoSession!.commitConfig();

      // 13. 启动会话
      await mPhotoSession!.start();

      // ========== 测试过程 ==========
      try {
        // 14. 调用 getSupportedPhysicalApertures 获取支持的物理光圈
        let apertures: Array<camera.PhysicalAperture> = mPhotoSession!.getSupportedPhysicalApertures();

        // 15. 验证返回值类型为 Array<PhysicalAperture>
        console.info(TAG, testName + ' apertures: ' + JSON.stringify(apertures));
        expect(Array.isArray(apertures)).assertTrue();
        console.info(TAG, testName + ' success.');
        done();
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }

      // ========== 恢复过程 ==========
      await releaseCameraResources(mCameraInput!, mPreviewOutput!, mPhotoOutput!, mPhotoSession!);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0200
     * @tc.desc   getSupportedPhysicalApertures repeated call test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0200';
      console.info(TAG, testName + ' begin.');

      // ========== 预制过程 ==========
      // 1. 创建相机管理器实例
      mCameraManager = createCameraManager(getContext());
      if (isEmpty(mCameraManager)) {
        console.error(TAG, testName + ' failed. mCameraManager is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 2. 获取支持的相机列表
      mCameraDeviceArray = getSupportedCameras(mCameraManager!);
      if (isEmpty(mCameraDeviceArray) || mCameraDeviceArray!.length === 0) {
        console.error(TAG, testName + ' failed. mCameraDeviceArray is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 3. 创建相机输入
      mCameraInput = createCameraInput(mCameraManager!, mCameraDeviceArray![0]);
      if (isEmpty(mCameraInput)) {
        console.error(TAG, testName + ' failed. mCameraInput is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 4. 打开相机
      await mCameraInput!.open();

      // 5. 查询相机支持的输出能力
      let cameraOutputCap: camera.CameraOutputCapability = getSupportedOutputCapability(
        mCameraManager!,
        mCameraDeviceArray![0],
        camera.SceneMode.NORMAL_PHOTO
      );

      // 6. 创建预览输出
      mPreviewOutput = createPreviewOutput(mCameraManager!, cameraOutputCap.previewProfiles[0], indexSurfaceId);
      if (isEmpty(mPreviewOutput)) {
        console.error(TAG, testName + ' failed. mPreviewOutput is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 7. 创建拍照输出
      mPhotoOutput = createPhotoOutput(mCameraManager!, cameraOutputCap.photoProfiles[0]);
      if (isEmpty(mPhotoOutput)) {
        console.error(TAG, testName + ' failed. mPhotoOutput is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 8. 创建拍照会话
      mPhotoSession = createPhotoSession(mCameraManager!, camera.SceneMode.NORMAL_PHOTO);
      if (isEmpty(mPhotoSession)) {
        console.error(TAG, testName + ' failed. mPhotoSession is empty.');
        expect().assertFail();
        done();
        return;
      }

      // 9. 开始配置
      mPhotoSession!.beginConfig();

      // 10. 添加输入流
      mPhotoSession!.addInput(mCameraInput!);

      // 11. 添加输出流
      mPhotoSession!.addOutput(mPreviewOutput!);
      mPhotoSession!.addOutput(mPhotoOutput!);

      // 12. 提交配置
      await mPhotoSession!.commitConfig();

      // 13. 启动会话
      await mPhotoSession!.start();

      // ========== 测试过程 ==========
      try {
        // 14. 第一次调用 getSupportedPhysicalApertures
        let apertures1: Array<camera.PhysicalAperture> = mPhotoSession!.getSupportedPhysicalApertures();
        console.info(TAG, testName + ' first call apertures: ' + JSON.stringify(apertures1));

        // 15. 第二次调用 getSupportedPhysicalApertures
        let apertures2: Array<camera.PhysicalAperture> = mPhotoSession!.getSupportedPhysicalApertures();
        console.info(TAG, testName + ' second call apertures: ' + JSON.stringify(apertures2));

        // 16. 验证两次调用返回值类型一致
        expect(Array.isArray(apertures1)).assertTrue();
        expect(Array.isArray(apertures2)).assertTrue();
        console.info(TAG, testName + ' success.');
          // 17. 验证两次调用返回值长度一致 
          expect(apertures1.length).assertEqual(apertures2.length); 
          // 18. 验证两次调用返回值内容一致 
          for (let i = 0; i < apertures1.length; i++) { 
            expect(apertures1[i]).assertEqual(apertures2[i]); 
          } 
        console.info(TAG, testName + ' success.');
        done();
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }

      // ========== 恢复过程 ==========
      await releaseCameraResources(mCameraInput!, mPreviewOutput!, mPhotoOutput!, mPhotoSession!);
    });



    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0400
     * @tc.desc   getSupportedPhysicalApertures error code 7400103 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getSupportedPhysicalApertures_0400';
      console.info(TAG, testName + ' begin.');
      // ========== 预制过程 ==========
      // 1. 创建相机管理器实例
      mCameraManager = createCameraManager(getContext());
      if (isEmpty(mCameraManager)) {
        console.error(TAG, testName + ' failed. mCameraManager is empty.');
        expect().assertFail();
        done();
        return;
      }
      // 2. 获取支持的相机列表
      mCameraDeviceArray = getSupportedCameras(mCameraManager!);
      if (isEmpty(mCameraDeviceArray) || mCameraDeviceArray!.length === 0) {
        console.error(TAG, testName + ' failed. mCameraDeviceArray is empty.');
        expect().assertFail();
        done();
        return;
      }
      // 3. 创建相机输入
      mCameraInput = createCameraInput(mCameraManager!, mCameraDeviceArray![0]);
      if (isEmpty(mCameraInput)) {
        console.error(TAG, testName + ' failed. mCameraInput is empty.');
        expect().assertFail();
        done();
        return;
      }
      // 4. 打开相机
      await mCameraInput!.open();
      // 5. 查询相机支持的输出能力
      let cameraOutputCap: camera.CameraOutputCapability = getSupportedOutputCapability(
        mCameraManager!,
        mCameraDeviceArray![0],
        camera.SceneMode.NORMAL_PHOTO
      );
      // 6. 创建预览输出
      mPreviewOutput = createPreviewOutput(mCameraManager!, cameraOutputCap.previewProfiles[0], indexSurfaceId);
      if (isEmpty(mPreviewOutput)) {
        console.error(TAG, testName + ' failed. mPreviewOutput is empty.');
        expect().assertFail();
        done();
        return;
      }
      // 7. 创建拍照输出
      mPhotoOutput = createPhotoOutput(mCameraManager!, cameraOutputCap.photoProfiles[0]);
      if (isEmpty(mPhotoOutput)) {
        console.error(TAG, testName + ' failed. mPhotoOutput is empty.');
        expect().assertFail();
        done();
        return;
      }
      // 8. 创建拍照会话
      mPhotoSession = createPhotoSession(mCameraManager!, camera.SceneMode.NORMAL_PHOTO);
      if (isEmpty(mPhotoSession)) {
        console.error(TAG, testName + ' failed. mPhotoSession is empty.');
        expect().assertFail();
        done();
        return;
      }
      try {
        // 12. 在会话未配置时调用 getSupportedPhysicalApertures，期望抛出错误码 7400103
        let apertures: Array<camera.PhysicalAperture> = mPhotoSession!.getSupportedPhysicalApertures();

        // 如果没有抛出异常，测试失败
        console.error(TAG, testName + ' failed. Expected error 7400103, but no error was thrown.',apertures);
        expect().assertFail();
        done();
      } catch (error) {
        // ========== 错误处理 ==========
        let err = error as BusinessError;
        console.error(TAG, testName + ' caught error. code: ' + err.code + ', msg: ' + err.message);

        // 13. 验证错误码为 7400103
        expect(Number(err.code)).assertEqual(7400103);

        console.info(TAG, testName + ' success.');
        done();
      }

      // ========== 恢复过程 ==========
      await releaseCameraResources(mCameraInput!, mPreviewOutput!, mPhotoOutput!, mPhotoSession!);
    });
  });
}