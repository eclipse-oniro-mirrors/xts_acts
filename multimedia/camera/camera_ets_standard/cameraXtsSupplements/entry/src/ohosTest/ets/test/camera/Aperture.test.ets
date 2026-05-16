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
// Camera 模块导入
import { camera } from '@kit.CameraKit';

// 权限模块导入
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';

// 错误处理导入
import { BusinessError } from '@kit.BasicServicesKit';

// 测试框架导入
import { describe, beforeAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { indexSurfaceId } from '../../testability/pages/Index';
import { driveFn, getPermission ,sleep} from '../common';

const TAG: string = 'xts-API24ApertureTest.tag';

export default function ApertureTest() {
  describe('ApertureTest', () => {
    // ========== beforeAll 权限申请 ==========
    beforeAll(async () => {
      console.info(TAG, 'beforeAll begin.');
      await getPermission();
      await driveFn();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_0100
     * @tc.desc getPhysicalAperture normal test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_0100';
      console.info(TAG, testName + ' begin.');

      // 变量声明
      let cameraManager: camera.CameraManager | null = null;
      let cameras: Array<camera.CameraDevice> = [];
      let cameraInput: camera.CameraInput | null = null;
      let previewOutput: camera.PreviewOutput | null = null;
      let photoOutput: camera.PhotoOutput | null = null;
      let photoSession: camera.PhotoSession | null = null;
      let supportedOutputCapability: camera.CameraOutputCapability | null = null;

      // ========== 预制过程 ==========
      // 说明：测试执行前需要满足的条件
      // 内容：
      // 1. 权限申请函数，必需要在beforeAll函数中实现
      // 2. 相机会话创建的前置操作，需要在这里实现
      // 3. 其他必要的初始化操作，需要在这里实现
      try {
        // 阶段2：获取相机实例
        cameraManager = camera.getCameraManager(getContext());
        if (!cameraManager) {
          console.error(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段3：设备输入
        cameras = cameraManager.getSupportedCameras();
        if (cameras.length === 0) {
          console.error(TAG, testName + ' cameras length is 0.');
          expect().assertFail();
          done();
          return;
        }

        cameraInput = cameraManager.createCameraInput(cameras[0]);
        await cameraInput.open();

        // 阶段4：查询相机能力（强制）
        supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameras[0]);
        if (!supportedOutputCapability) {
          console.error(TAG, testName + ' supportedOutputCapability is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段5：创建输出流
        let previewProfiles = supportedOutputCapability.previewProfiles;
        if (previewProfiles.length === 0) {
          console.error(TAG, testName + ' previewProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        let photoProfiles = supportedOutputCapability.photoProfiles;
        if (photoProfiles.length === 0) {
          console.error(TAG, testName + ' photoProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        previewOutput = cameraManager.createPreviewOutput(previewProfiles[0] ,indexSurfaceId);
        photoOutput = cameraManager.createPhotoOutput(photoProfiles[0]);

        // 阶段6：启动会话
        photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        await photoSession.beginConfig();
        photoSession.addInput(cameraInput);
        photoSession.addOutput(previewOutput);
        photoSession.addOutput(photoOutput);
        await photoSession.commitConfig();
        await photoSession.start();

        // ========== 测试过程 ==========
        // 说明：具体API接口调用测试
        // 内容：
        // 1. API调用
        // 2. 参数验证
        // 3. 返回值验证
        // 4. 状态检查

        // 阶段7：测试 Aperture 接口
        // 获取物理光圈控制器
        // 获取当前物理光圈值
        let physicalAperture: number = photoSession.getPhysicalAperture();
        console.info(TAG, testName + ' physicalAperture: ' + physicalAperture);

        // 返回值验证：必须为 number 类型
        expect(typeof physicalAperture).assertEqual('number');

        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }

      // ========== 恢复过程 ==========
      // 说明：测试执行后的清理操作
      // 内容：
      // 1. 相机会话的释放
      // 2. 测试过程中创建的资源的释放
      // 3. 其他必要的清理操作
      try {
        // 阶段8：释放相机资源
        if (photoSession) {
          await photoSession.stop();
        }
        if (cameraInput) {
          await cameraInput.close();
        }
        if (previewOutput) {
          previewOutput.release();
        }
        if (photoOutput) {
          photoOutput.release();
        }
        if (photoSession) {
          photoSession.release();
        }
        console.info(TAG, testName + ' release success.');
      } catch (error) {
        console.error(TAG, testName + ' release failed. err: ' + error.code + ', msg: ' + error.message);
      }

      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abnormal_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abnormal_0200
     * @tc.desc getPhysicalAperture error code 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abnormal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_getPhysicalAperture_photo_abnormal_0200';
      console.info(TAG, testName + ' begin.');

      // 变量声明
      let cameraManager: camera.CameraManager | null = null;
      let cameras: Array<camera.CameraDevice> = [];
      let cameraInput: camera.CameraInput | null = null;
      let previewOutput: camera.PreviewOutput | null = null;
      let photoOutput: camera.PhotoOutput | null = null;
      let photoSession: camera.PhotoSession | null = null;
      let supportedOutputCapability: camera.CameraOutputCapability | null = null;

      // ========== 预制过程 ==========
      try {
        // 阶段2：获取相机实例
        cameraManager = camera.getCameraManager(getContext());
        if (!cameraManager) {
          console.error(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段3：设备输入
        cameras = cameraManager.getSupportedCameras();
        if (cameras.length === 0) {
          console.error(TAG, testName + ' cameras length is 0.');
          expect().assertFail();
          done();
          return;
        }

        cameraInput = cameraManager.createCameraInput(cameras[0]);
        await cameraInput.open();

        // 阶段4：查询相机能力（强制）
        supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameras[0]);
        if (!supportedOutputCapability) {
          console.error(TAG, testName + ' supportedOutputCapability is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段5：创建输出流
        let previewProfiles = supportedOutputCapability.previewProfiles;
        if (previewProfiles.length === 0) {
          console.error(TAG, testName + ' previewProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        let photoProfiles = supportedOutputCapability.photoProfiles;
        if (photoProfiles.length === 0) {
          console.error(TAG, testName + ' photoProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        previewOutput = cameraManager.createPreviewOutput(previewProfiles[0], indexSurfaceId);
        photoOutput = cameraManager.createPhotoOutput(photoProfiles[0]);

        // 阶段6：启动会话（但不提交配置）
        photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        await photoSession.beginConfig();
        photoSession.addInput(cameraInput);
        photoSession.addOutput(previewOutput);
        photoSession.addOutput(photoOutput);
        // 不调用 commitConfig，模拟会话未配置场景

        // ========== 测试过程 ==========
        // 阶段7：测试 Aperture 接口
        // 获取物理光圈控制器

        // 预期错误码 7400103：会话未配置
        try {
          photoSession.getPhysicalAperture();
          console.error(TAG, testName + ' should throw error 7400103.');
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName + ' catch error: ' + error.code + ', msg: ' + error.message);
          expect(Number(error.code)).assertEqual(7400103);
        }

        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }

      // ========== 恢复过程 ==========
      try {
        // 阶段8：释放相机资源
        if (cameraInput) {
          await cameraInput.close();
        }
        if (previewOutput) {
          previewOutput.release();
        }
        if (photoOutput) {
          photoOutput.release();
        }
        if (photoSession) {
          photoSession.release();
        }
        console.info(TAG, testName + ' release success.');
      } catch (error) {
        console.error(TAG, testName + ' release failed. err: ' + error.code + ', msg: ' + error.message);
      }

      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0100
     * @tc.desc setPhysicalAperture normal test with minimum value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0100';
      console.info(TAG, testName + ' begin.');

      // 变量声明
      let cameraManager: camera.CameraManager | null = null;
      let cameras: Array<camera.CameraDevice> = [];
      let cameraInput: camera.CameraInput | null = null;
      let previewOutput: camera.PreviewOutput | null = null;
      let photoOutput: camera.PhotoOutput | null = null;
      let photoSession: camera.PhotoSession | null = null;
      let supportedOutputCapability: camera.CameraOutputCapability | null = null;

      // ========== 预制过程 ==========
      try {
        // 阶段2：获取相机实例
        cameraManager = camera.getCameraManager(getContext());
        if (!cameraManager) {
          console.error(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段3：设备输入
        cameras = cameraManager.getSupportedCameras();
        if (cameras.length === 0) {
          console.error(TAG, testName + ' cameras length is 0.');
          expect().assertFail();
          done();
          return;
        }

        cameraInput = cameraManager.createCameraInput(cameras[0]);
        await cameraInput.open();

        // 阶段4：查询相机能力（强制）
        supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameras[0]);
        if (!supportedOutputCapability) {
          console.error(TAG, testName + ' supportedOutputCapability is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段5：创建输出流
        let previewProfiles = supportedOutputCapability.previewProfiles;
        if (previewProfiles.length === 0) {
          console.error(TAG, testName + ' previewProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        let photoProfiles = supportedOutputCapability.photoProfiles;
        if (photoProfiles.length === 0) {
          console.error(TAG, testName + ' photoProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        previewOutput = cameraManager.createPreviewOutput(previewProfiles[0], indexSurfaceId);
        photoOutput = cameraManager.createPhotoOutput(photoProfiles[0]);

        // 阶段6：启动会话
        photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        await photoSession.beginConfig();
        photoSession.addInput(cameraInput);
        photoSession.addOutput(previewOutput);
        photoSession.addOutput(photoOutput);
        await photoSession.commitConfig();
        await photoSession.start();

        // ========== 测试过程 ==========
        // 阶段7：测试 Aperture 接口
        // 获取物理光圈控制器

        // 先查后用：获取支持的物理光圈范围
        let supportedApertures: Array<camera.PhysicalAperture> = photoSession.getSupportedPhysicalApertures();
        console.info(TAG, testName + ' supportedApertures: ' + JSON.stringify(supportedApertures));

        if (supportedApertures.length > 0) {
          // 设置物理光圈值为最小边界值
          let minAperture = supportedApertures[0];
          console.info(TAG, testName + ' set aperture to min: ' + JSON.stringify(minAperture));
          photoSession.setZoomRatio(minAperture.zoomRange[0]);
          await sleep(1000);
          photoSession.setPhysicalAperture(minAperture.apertures[0]);
          await sleep(1000);
          // 设置生效验证：获取当前物理光圈值验证设置是否生效
          let currentAperture: number = photoSession.getPhysicalAperture();
          console.info(TAG, testName + ' currentAperture: ' + currentAperture);

          // 验证设置的值与获取的值一致
          expect(currentAperture).assertEqual(minAperture.apertures[0]);
        }

        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }

      // ========== 恢复过程 ==========
      try {
        // 阶段8：释放相机资源
        if (photoSession) {
          await photoSession.stop();
        }
        if (cameraInput) {
          await cameraInput.close();
        }
        if (previewOutput) {
          previewOutput.release();
        }
        if (photoOutput) {
          photoOutput.release();
        }
        if (photoSession) {
          photoSession.release();
        }
        console.info(TAG, testName + ' release success.');
      } catch (error) {
        console.error(TAG, testName + ' release failed. err: ' + error.code + ', msg: ' + error.message);
      }

      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0200
     * @tc.desc setPhysicalAperture normal test with maximum value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0200';
      console.info(TAG, testName + ' begin.');

      // 变量声明
      let cameraManager: camera.CameraManager | null = null;
      let cameras: Array<camera.CameraDevice> = [];
      let cameraInput: camera.CameraInput | null = null;
      let previewOutput: camera.PreviewOutput | null = null;
      let photoOutput: camera.PhotoOutput | null = null;
      let photoSession: camera.PhotoSession | null = null;
      let supportedOutputCapability: camera.CameraOutputCapability | null = null;

      // ========== 预制过程 ==========
      try {
        // 阶段2：获取相机实例
        cameraManager = camera.getCameraManager(getContext());
        if (!cameraManager) {
          console.error(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段3：设备输入
        cameras = cameraManager.getSupportedCameras();
        if (cameras.length === 0) {
          console.error(TAG, testName + ' cameras length is 0.');
          expect().assertFail();
          done();
          return;
        }

        cameraInput = cameraManager.createCameraInput(cameras[0]);
        await cameraInput.open();

        // 阶段4：查询相机能力（强制）
        supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameras[0]);
        if (!supportedOutputCapability) {
          console.error(TAG, testName + ' supportedOutputCapability is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段5：创建输出流
        let previewProfiles = supportedOutputCapability.previewProfiles;
        if (previewProfiles.length === 0) {
          console.error(TAG, testName + ' previewProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        let photoProfiles = supportedOutputCapability.photoProfiles;
        if (photoProfiles.length === 0) {
          console.error(TAG, testName + ' photoProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        previewOutput = cameraManager.createPreviewOutput(previewProfiles[0], indexSurfaceId);
        photoOutput = cameraManager.createPhotoOutput(photoProfiles[0]);

        // 阶段6：启动会话
        photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        await photoSession.beginConfig();
        photoSession.addInput(cameraInput);
        photoSession.addOutput(previewOutput);
        photoSession.addOutput(photoOutput);
        await photoSession.commitConfig();
        await photoSession.start();

        // ========== 测试过程 ==========
        // 阶段7：测试 Aperture 接口
        // 获取物理光圈控制器

        // 先查后用：获取支持的物理光圈范围
        let supportedApertures = photoSession.getSupportedPhysicalApertures();
        console.info(TAG, testName + ' supportedApertures: ' + JSON.stringify(supportedApertures));

        if (supportedApertures.length > 0) {
          // 设置物理光圈值为最大边界值
          let maxAperture = supportedApertures[supportedApertures.length - 1];
          console.info(TAG, testName + ' set aperture to min: ' + JSON.stringify(maxAperture));
          photoSession.setZoomRatio(maxAperture.zoomRange[0]);
          await sleep(1000);
          photoSession.setPhysicalAperture(maxAperture.apertures[0]);
          await sleep(1000);
          // 设置生效验证：获取当前物理光圈值验证设置是否生效
          let currentAperture: number = photoSession.getPhysicalAperture();
          console.info(TAG, testName + ' currentAperture: ' + currentAperture);

          // 验证设置的值与获取的值一致
          expect(currentAperture).assertEqual(maxAperture.apertures[0]);
        }

        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }

      // ========== 恢复过程 ==========
      try {
        // 阶段8：释放相机资源
        if (photoSession) {
          await photoSession.stop();
        }
        if (cameraInput) {
          await cameraInput.close();
        }
        if (previewOutput) {
          previewOutput.release();
        }
        if (photoOutput) {
          photoOutput.release();
        }
        if (photoSession) {
          photoSession.release();
        }
        console.info(TAG, testName + ' release success.');
      } catch (error) {
        console.error(TAG, testName + ' release failed. err: ' + error.code + ', msg: ' + error.message);
      }

      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0300
     * @tc.desc setPhysicalAperture normal test with middle value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_0300';
      console.info(TAG, testName + ' begin.');

      // 变量声明
      let cameraManager: camera.CameraManager | null = null;
      let cameras: Array<camera.CameraDevice> = [];
      let cameraInput: camera.CameraInput | null = null;
      let previewOutput: camera.PreviewOutput | null = null;
      let photoOutput: camera.PhotoOutput | null = null;
      let photoSession: camera.PhotoSession | null = null;
      let supportedOutputCapability: camera.CameraOutputCapability | null = null;

      // ========== 预制过程 ==========
      try {
        // 阶段2：获取相机实例
        cameraManager = camera.getCameraManager(getContext());
        if (!cameraManager) {
          console.error(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段3：设备输入
        cameras = cameraManager.getSupportedCameras();
        if (cameras.length === 0) {
          console.error(TAG, testName + ' cameras length is 0.');
          expect().assertFail();
          done();
          return;
        }

        cameraInput = cameraManager.createCameraInput(cameras[0]);
        await cameraInput.open();

        // 阶段4：查询相机能力（强制）
        supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameras[0]);
        if (!supportedOutputCapability) {
          console.error(TAG, testName + ' supportedOutputCapability is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段5：创建输出流
        let previewProfiles = supportedOutputCapability.previewProfiles;
        if (previewProfiles.length === 0) {
          console.error(TAG, testName + ' previewProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        let photoProfiles = supportedOutputCapability.photoProfiles;
        if (photoProfiles.length === 0) {
          console.error(TAG, testName + ' photoProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        previewOutput = cameraManager.createPreviewOutput(previewProfiles[0], indexSurfaceId);
        photoOutput = cameraManager.createPhotoOutput(photoProfiles[0]);

        // 阶段6：启动会话
        photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        await photoSession.beginConfig();
        photoSession.addInput(cameraInput);
        photoSession.addOutput(previewOutput);
        photoSession.addOutput(photoOutput);
        await photoSession.commitConfig();
        await photoSession.start();

        // ========== 测试过程 ==========
        // 阶段7：测试 Aperture 接口
        // 获取物理光圈控制器

        // 先查后用：获取支持的物理光圈范围
        let supportedApertures = photoSession.getSupportedPhysicalApertures();
        console.info(TAG, testName + ' supportedApertures: ' + JSON.stringify(supportedApertures));

        if (supportedApertures.length > 0) {
          // 设置物理光圈值为中间值
          let middleIndex: number = Math.floor(supportedApertures.length / 2);
          let middleAperture = supportedApertures[middleIndex];
          console.info(TAG, testName + ' set aperture to middle: ' + JSON.stringify(middleAperture));
          photoSession.setZoomRatio(middleAperture.zoomRange[0]);
          await sleep(1000);
          photoSession.setPhysicalAperture(middleAperture.apertures[0]);
          await sleep(1000);
          // 设置生效验证：获取当前物理光圈值验证设置是否生效
          let currentAperture: number = photoSession.getPhysicalAperture();
          console.info(TAG, testName + ' currentAperture: ' + currentAperture);

          // 验证设置的值与获取的值一致
          expect(currentAperture).assertEqual(middleAperture.apertures[0]);
        }

        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }

      // ========== 恢复过程 ==========
      try {
        // 阶段8：释放相机资源
        if (photoSession) {
          await photoSession.stop();
        }
        if (cameraInput) {
          await cameraInput.close();
        }
        if (previewOutput) {
          previewOutput.release();
        }
        if (photoOutput) {
          photoOutput.release();
        }
        if (photoSession) {
          photoSession.release();
        }
        console.info(TAG, testName + ' release success.');
      } catch (error) {
        console.error(TAG, testName + ' release failed. err: ' + error.code + ', msg: ' + error.message);
      }

      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0200
     * @tc.desc setPhysicalAperture error code 7400103 test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0200';
      console.info(TAG, testName + ' begin.');

      // 变量声明
      let cameraManager: camera.CameraManager | null = null;
      let cameras: Array<camera.CameraDevice> = [];
      let cameraInput: camera.CameraInput | null = null;
      let previewOutput: camera.PreviewOutput | null = null;
      let photoOutput: camera.PhotoOutput | null = null;
      let photoSession: camera.PhotoSession | null = null;
      let supportedOutputCapability: camera.CameraOutputCapability | null = null;

      // ========== 预制过程 ==========
      try {
        // 阶段2：获取相机实例
        cameraManager = camera.getCameraManager(getContext());
        if (!cameraManager) {
          console.error(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段3：设备输入
        cameras = cameraManager.getSupportedCameras();
        if (cameras.length === 0) {
          console.error(TAG, testName + ' cameras length is 0.');
          expect().assertFail();
          done();
          return;
        }

        cameraInput = cameraManager.createCameraInput(cameras[0]);
        await cameraInput.open();

        // 阶段4：查询相机能力（强制）
        supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameras[0]);
        if (!supportedOutputCapability) {
          console.error(TAG, testName + ' supportedOutputCapability is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段5：创建输出流
        let previewProfiles = supportedOutputCapability.previewProfiles;
        if (previewProfiles.length === 0) {
          console.error(TAG, testName + ' previewProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        let photoProfiles = supportedOutputCapability.photoProfiles;
        if (photoProfiles.length === 0) {
          console.error(TAG, testName + ' photoProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        previewOutput = cameraManager.createPreviewOutput(previewProfiles[0],indexSurfaceId);
        photoOutput = cameraManager.createPhotoOutput(photoProfiles[0]);

        // 阶段6：启动会话（但不提交配置）
        photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        await photoSession.beginConfig();
        photoSession.addInput(cameraInput);
        photoSession.addOutput(previewOutput);
        photoSession.addOutput(photoOutput);
        // 不调用 commitConfig，模拟会话未配置场景

        // ========== 测试过程 ==========
        // 阶段7：测试 Aperture 接口
        // 获取物理光圈控制器

        // 预期错误码 7400103：会话未配置
        try {
          photoSession.setPhysicalAperture(1.8);
          console.error(TAG, testName + ' should throw error 7400103.');
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName + ' catch error: ' + error.code + ', msg: ' + error.message);
          expect(Number(error.code)).assertEqual(7400103);
        }

        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }

      // ========== 恢复过程 ==========
      try {
        // 阶段8：释放相机资源
        if (cameraInput) {
          await cameraInput.close();
        }
        if (previewOutput) {
          previewOutput.release();
        }
        if (photoOutput) {
          photoOutput.release();
        }
        if (photoSession) {
          photoSession.release();
        }
        console.info(TAG, testName + ' release success.');
      } catch (error) {
        console.error(TAG, testName + ' release failed. err: ' + error.code + ', msg: ' + error.message);
      }
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0300
     * @tc.desc setPhysicalAperture error parameter undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0300';
      console.info(TAG, testName + ' begin.');

      // 变量声明
      let cameraManager: camera.CameraManager | null = null;
      let cameras: Array<camera.CameraDevice> = [];
      let cameraInput: camera.CameraInput | null = null;
      let previewOutput: camera.PreviewOutput | null = null;
      let photoOutput: camera.PhotoOutput | null = null;
      let photoSession: camera.PhotoSession | null = null;
      let supportedOutputCapability: camera.CameraOutputCapability | null = null;

      // ========== 预制过程 ==========
      try {
        // 阶段2：获取相机实例
        cameraManager = camera.getCameraManager(getContext());
        if (!cameraManager) {
          console.error(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段3：设备输入
        cameras = cameraManager.getSupportedCameras();
        if (cameras.length === 0) {
          console.error(TAG, testName + ' cameras length is 0.');
          expect().assertFail();
          done();
          return;
        }

        cameraInput = cameraManager.createCameraInput(cameras[0]);
        await cameraInput.open();

        // 阶段4：查询相机能力（强制）
        supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameras[0]);
        if (!supportedOutputCapability) {
          console.error(TAG, testName + ' supportedOutputCapability is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段5：创建输出流
        let previewProfiles = supportedOutputCapability.previewProfiles;
        if (previewProfiles.length === 0) {
          console.error(TAG, testName + ' previewProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        let photoProfiles = supportedOutputCapability.photoProfiles;
        if (photoProfiles.length === 0) {
          console.error(TAG, testName + ' photoProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        previewOutput = cameraManager.createPreviewOutput(previewProfiles[0],indexSurfaceId);
        photoOutput = cameraManager.createPhotoOutput(photoProfiles[0]);

        // 阶段6：启动会话（但不提交配置）
        photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        await photoSession.beginConfig();
        photoSession.addInput(cameraInput);
        photoSession.addOutput(previewOutput);
        photoSession.addOutput(photoOutput);
        // 不调用 commitConfig，模拟会话未配置场景

        // ========== 测试过程 ==========
        // 阶段7：测试 Aperture 接口
        // 获取物理光圈控制器

        // 预期错误码 7400103：会话未配置
        try {
          photoSession.setPhysicalAperture(undefined);
          console.error(TAG, testName + ' should throw error 7400102.');
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName + ' catch error: ' + error.code + ', msg: ' + error.message);
          expect(Number(error.code)).assertEqual(7400102);
        }

        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }

      // ========== 恢复过程 ==========
      try {
        // 阶段8：释放相机资源
        if (cameraInput) {
          await cameraInput.close();
        }
        if (previewOutput) {
          previewOutput.release();
        }
        if (photoOutput) {
          photoOutput.release();
        }
        if (photoSession) {
          photoSession.release();
        }
        console.info(TAG, testName + ' release success.');
      } catch (error) {
        console.error(TAG, testName + ' release failed. err: ' + error.code + ', msg: ' + error.message);
      }
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0400
     * @tc.desc setPhysicalAperture error parameter null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_setPhysicalAperture_photo_abnormal_0400';
      console.info(TAG, testName + ' begin.');

      // 变量声明
      let cameraManager: camera.CameraManager | null = null;
      let cameras: Array<camera.CameraDevice> = [];
      let cameraInput: camera.CameraInput | null = null;
      let previewOutput: camera.PreviewOutput | null = null;
      let photoOutput: camera.PhotoOutput | null = null;
      let photoSession: camera.PhotoSession | null = null;
      let supportedOutputCapability: camera.CameraOutputCapability | null = null;

      // ========== 预制过程 ==========
      try {
        // 阶段2：获取相机实例
        cameraManager = camera.getCameraManager(getContext());
        if (!cameraManager) {
          console.error(TAG, testName + ' cameraManager is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段3：设备输入
        cameras = cameraManager.getSupportedCameras();
        if (cameras.length === 0) {
          console.error(TAG, testName + ' cameras length is 0.');
          expect().assertFail();
          done();
          return;
        }

        cameraInput = cameraManager.createCameraInput(cameras[0]);
        await cameraInput.open();

        // 阶段4：查询相机能力（强制）
        supportedOutputCapability = cameraManager.getSupportedOutputCapability(cameras[0]);
        if (!supportedOutputCapability) {
          console.error(TAG, testName + ' supportedOutputCapability is null.');
          expect().assertFail();
          done();
          return;
        }

        // 阶段5：创建输出流
        let previewProfiles = supportedOutputCapability.previewProfiles;
        if (previewProfiles.length === 0) {
          console.error(TAG, testName + ' previewProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        let photoProfiles = supportedOutputCapability.photoProfiles;
        if (photoProfiles.length === 0) {
          console.error(TAG, testName + ' photoProfiles length is 0.');
          expect().assertFail();
          done();
          return;
        }

        previewOutput = cameraManager.createPreviewOutput(previewProfiles[0],indexSurfaceId);
        photoOutput = cameraManager.createPhotoOutput(photoProfiles[0]);

        // 阶段6：启动会话（但不提交配置）
        photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
        await photoSession.beginConfig();
        photoSession.addInput(cameraInput);
        photoSession.addOutput(previewOutput);
        photoSession.addOutput(photoOutput);
        // 不调用 commitConfig，模拟会话未配置场景

        // ========== 测试过程 ==========
        // 阶段7：测试 Aperture 接口
        // 获取物理光圈控制器

        // 预期错误码 7400103：会话未配置
        try {
          photoSession.setPhysicalAperture(null);
          console.error(TAG, testName + ' should throw error 7400102.');
          expect().assertFail();
        } catch (error) {
          console.info(TAG, testName + ' catch error: ' + error.code + ', msg: ' + error.message);
          expect(Number(error.code)).assertEqual(7400102);
        }

        console.info(TAG, testName + ' success.');
      } catch (error) {
        // ========== 错误处理 ==========
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }

      // ========== 恢复过程 ==========
      try {
        // 阶段8：释放相机资源
        if (cameraInput) {
          await cameraInput.close();
        }
        if (previewOutput) {
          previewOutput.release();
        }
        if (photoOutput) {
          photoOutput.release();
        }
        if (photoSession) {
          photoSession.release();
        }
        console.info(TAG, testName + ' release success.');
      } catch (error) {
        console.error(TAG, testName + ' release failed. err: ' + error.code + ', msg: ' + error.message);
      }
      done();
    });
  });
}