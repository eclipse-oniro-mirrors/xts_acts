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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import {
  getPermission,
  sleep,
  isHdrVideo,
  setVideoColorSpace,
  getSupportedVideoStabilizationMode,
  setVideoStabilizationMode,
  expectEqualPhotoCount,
  getHelper,
  getAllPhotoAssetsCount,
  getCameraManager,
  getSupportedCameras,
  getCameraOutputCapability,
  setZoomRatioRange,
  getSuppotredZoomRatioRange,
  createAvRecorder,
  getVideoOutput,
  createAndConfigSession,
  createCameraInput,
  openCamera,
  createVideoPreviewOutputFromProFile,
  addInputIntoSession,
  addOutputIntoSession,
  commitSessionConfig,
  startSession,
  startVideoOutput,
  startAvRecoder,
  onPreviewOutputFrameStart,
  offPreviewOutputFrameStart,
  stopVideoOutput,
  stopAvRecoder,
  stopSession,
  releaseInPutStream,
  releaseOutPutStream,
  releaseSession,
  releaseAvRecoder,
  createVideoFile,
  setAvRecorderConfig,
  saveAsset,
  getActiveVideoStabilizationMode,
  getPhotoAssetsWithKeyFromFileNames,
  generateNameForAsset,
  getVideoRotation
} from './CameraCommonAPI';

import {
  setFocusMode, getSuppotredFrameRateRange,
} from './CameraCommonAPI'
import { media } from '@kit.MediaKit';


export default function CameraVideoRecordWithMultiDiffConfig() {
  describe('CameraVideoRecordWithMultiDiffConfig', () => {
    console.info('----------CameraVideoRecordWithMultiDiffConfig begin--------------')
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission()
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
      sleep(1000);
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_000
     * @tc.name      : SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_000
     * @tc.desc      : camera recorde HDR 1 video and Test HDR info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let testNum = 'SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_000';
        //预制条件
        await getPermission();
        let helper = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        for (let camreId of cameras) {
          let cameraOutputCapability = getCameraOutputCapability(cameraManager, camreId, camera.SceneMode.NORMAL_VIDEO);
          for (let videoProfile of cameraOutputCapability?.videoProfiles!) {
            for (let previewProfile of cameraOutputCapability?.previewProfiles!) {
              if (previewProfile.size.height != videoProfile.size.height
                || previewProfile.size.width != videoProfile.size.width
                || previewProfile.format != videoProfile.format) {
                continue;
              }
              let frameRateRange = getSuppotredFrameRateRange(videoProfile);
              for (let frameRate of frameRateRange) {
                const befortCount = await getAllPhotoAssetsCount();
                let videoOutput: camera.VideoOutput | undefined = undefined
                let cameraInput: camera.CameraInput | undefined = undefined
                let previewOutPut: camera.PreviewOutput | undefined = undefined
                let session: ESObject = undefined
                let avRecoder: media.AVRecorder | undefined = undefined
                try {
                  console.info(`${testNum} videoProfile frameRateRange is ${videoProfile.frameRateRange} videoProfile
                  format is ${videoProfile.format} videoProfile size is ${videoProfile.size}`);
                  console.info(`${testNum} previewProfile format is ${previewProfile.format}
                  previewProfile size is ${previewProfile.size} `);
                  console.info(`${testNum} camrePosition is ${camreId.cameraPosition}
                  camreType is ${camreId.connectionType}`);
                  // 创建空的视频文件
                  let videoName =
                    await generateNameForAsset(camera.SceneMode.NORMAL_VIDEO, camreId, videoProfile, previewProfile, 1, frameRate)
                  let videoUri: string = `file://${getContext().filesDir}/${videoName}.mp4`; // 本地沙箱路径。
                  let file: fs.File = await createVideoFile(videoUri)
                  avRecoder = await createAvRecorder();
                  await setAvRecorderConfig(avRecoder, file, videoProfile, frameRate);
                  // 创建VideoOutput对象。
                  videoOutput = await getVideoOutput(cameraManager, avRecoder, videoProfile);
                  session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);
                  cameraInput = createCameraInput(cameraManager, camreId);
                  previewOutPut = createVideoPreviewOutputFromProFile(cameraManager, previewProfile);
                  await openCamera(cameraInput);
                  await addInputIntoSession(session, cameraInput);
                  await addOutputIntoSession(session, previewOutPut);
                  await addOutputIntoSession(session, videoOutput);

                  await commitSessionConfig(session);
                  // 更新视频旋转角度
                  let rotation = await getVideoRotation(videoOutput)
                  console.info(`videoRotation: ${rotation}`)
                  avRecoder.updateRotation(rotation)
                  // 设置色彩空间
                  setVideoColorSpace(session, videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
                    videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)
                  let videoStabilizationModes = getSupportedVideoStabilizationMode(session);
                  // 遍历防抖模式
                  for (let vsMode of videoStabilizationModes) {
                    if (videoStabilizationModes.length > 0 && vsMode != camera.VideoStabilizationMode.OFF) {
                      console.info("set vsMode: " + vsMode)
                      setVideoStabilizationMode(session, vsMode)
                      let activeMode = getActiveVideoStabilizationMode(session)
                      console.info("get vsMode: " + activeMode)
                    }
                  }
                  await startSession(session);
                  startVideoOutput(videoOutput);
                  setFocusMode(session);
                  await onPreviewOutputFrameStart(previewOutPut!);
                  let zoomRatioRange = getSuppotredZoomRatioRange(session);
                  await startAvRecoder(avRecoder);
                  if (zoomRatioRange != undefined) {
                    for (let zoomRatio of zoomRatioRange!) {
                      console.info('Profile is zoomRatio is ' + zoomRatio)
                      setZoomRatioRange(session, zoomRatioRange!, zoomRatio);
                      await sleep(2000);
                    }
                  } else {
                    await sleep(3000);
                  }
                  stopVideoOutput(videoOutput);
                  await stopAvRecoder(avRecoder, file);
                  await releaseAvRecoder(avRecoder);

                  //测试过程
                  // 检查录制的资产
                  let asset = await saveAsset(helper, videoUri, getContext())
                  await sleep(5000)
                  if (videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 ||
                    videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010) {
                    let assets = await getPhotoAssetsWithKeyFromFileNames(helper, [asset!.displayName]);
                    asset = assets[0]
                    isHdrVideo(asset!);
                  }

                  await expectEqualPhotoCount(befortCount, 1);
                  console.info(`视频文件：${asset!.displayName}`)
                  await sleep(4000);

                  //恢复过程
                  offPreviewOutputFrameStart(previewOutPut!);
                  stopSession(session);
                  releaseInPutStream(cameraInput);
                  releaseOutPutStream(previewOutPut);
                  releaseOutPutStream(videoOutput);
                  releaseSession(session)
                  await sleep(2000);
                } catch (error) {
                  //恢复过程
                  await releaseAvRecoder(avRecoder!);
                  if (previewOutPut != undefined) {
                    offPreviewOutputFrameStart(previewOutPut!);
                  }
                  stopSession(session);
                  releaseInPutStream(cameraInput);
                  releaseOutPutStream(previewOutPut)
                  releaseOutPutStream(videoOutput);
                  releaseSession(session)
                  await sleep(2000);
                  continue
                }
              }
            }
          }
        }
        await sleep(4000);
        helper.release();
        done();

      } catch (error) {
        console.info('error is ' + JSON.stringify(error))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_001
     * @tc.name      : SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_001
     * @tc.desc      : camera recorde HDR 1 video and Test HDR info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let testNum = 'SUB_CAMERA_HDRVIDEORECORDER__MULTICONFIG_001'
        //预制条件
        await getPermission();
        let helper = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        for (let camreId of cameras) {
          let cameraOutputCapability = getCameraOutputCapability(cameraManager, camreId, camera.SceneMode.NORMAL_VIDEO);
          for (let videoProfile of cameraOutputCapability?.videoProfiles!) {
            for (let previewProfile of cameraOutputCapability?.previewProfiles!) {
              if (previewProfile.size.height != videoProfile.size.height
                || previewProfile.size.width != videoProfile.size.width
                || previewProfile.format != videoProfile.format) {
                continue;
              }
              let frameRateRange = getSuppotredFrameRateRange(videoProfile);
              for (let frameRate of frameRateRange) {
                const befortCount = await getAllPhotoAssetsCount();
                let videoOutput: camera.VideoOutput | undefined = undefined
                let cameraInput: camera.CameraInput | undefined = undefined
                let previewOutPut: camera.PreviewOutput | undefined = undefined
                let session: ESObject = undefined
                let avRecoder: media.AVRecorder | undefined = undefined
                try {
                  console.info(`${testNum} videoProfile frameRateRange is ${videoProfile.frameRateRange} videoProfile
                  format is ${videoProfile.format} videoProfile size is ${videoProfile.size}`);
                  console.info(`${testNum} previewProfile format is ${previewProfile.format} previewProfile
                  size is ${previewProfile.size} `);
                  console.info(`${testNum} camrePosition is ${camreId.cameraPosition} camreType
                  is ${camreId.connectionType}`);
                  // 创建空的视频文件
                  let videoName =
                    await generateNameForAsset(camera.SceneMode.NORMAL_VIDEO, camreId, videoProfile, previewProfile)
                  let videoUri: string = `file://${getContext().filesDir}/${videoName}.mp4`; // 本地沙箱路径。
                  let file: fs.File = await createVideoFile(videoUri)
                  avRecoder = await createAvRecorder();
                  await setAvRecorderConfig(avRecoder, file, videoProfile, frameRate);
                  // 创建VideoOutput对象。
                  videoOutput = await getVideoOutput(cameraManager, avRecoder, videoProfile);
                  session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_VIDEO);
                  cameraInput = createCameraInput(cameraManager, camreId);
                  previewOutPut = createVideoPreviewOutputFromProFile(cameraManager, previewProfile);
                  await openCamera(cameraInput);
                  await addInputIntoSession(session, cameraInput);
                  await addOutputIntoSession(session, previewOutPut);
                  await addOutputIntoSession(session, videoOutput);

                  // 设置色彩空间
                  setVideoColorSpace(session, videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
                    videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010)

                  await commitSessionConfig(session);
                  // 更新视频旋转角度
                  let rotation = await getVideoRotation(videoOutput)
                  console.info(`videoRotation: ${rotation}`)
                  avRecoder.updateRotation(rotation)
                  let videoStabilizationModes = getSupportedVideoStabilizationMode(session);
                  // 遍历防抖模式
                  for (let vsMode of videoStabilizationModes) {
                    if (videoStabilizationModes.length > 0 && vsMode != camera.VideoStabilizationMode.OFF) {
                      console.info("set vsMode: " + vsMode)
                      setVideoStabilizationMode(session, vsMode)
                      let activeMode = getActiveVideoStabilizationMode(session)
                      console.info("get vsMode: " + activeMode)
                    }
                  }
                  await startSession(session);
                  startVideoOutput(videoOutput);
                  setFocusMode(session);
                  await onPreviewOutputFrameStart(previewOutPut!);
                  let zoomRatioRange = getSuppotredZoomRatioRange(session);
                  await startAvRecoder(avRecoder);
                  if (zoomRatioRange != undefined) {
                    for (let zoomRatio of zoomRatioRange!) {
                      console.info('Profile is zoomRatio is ' + zoomRatio)
                      setZoomRatioRange(session, zoomRatioRange!, zoomRatio);
                      await sleep(2000);
                    }
                  } else {
                    await sleep(3000);
                  }
                  stopVideoOutput(videoOutput);
                  await stopAvRecoder(avRecoder, file);
                  await releaseAvRecoder(avRecoder);

                  //测试过程
                  // 检查录制的资产
                  let asset = await saveAsset(helper, videoUri, getContext())
                  await sleep(5000)
                  if (videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010 ||
                    videoProfile.format == camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010) {
                    let assets = await getPhotoAssetsWithKeyFromFileNames(helper, [asset!.displayName]);
                    asset = assets[0]
                    isHdrVideo(asset!);
                  }

                  await expectEqualPhotoCount(befortCount, 1);
                  console.info(`视频文件：${asset!.displayName}`)
                  await sleep(4000);

                  //恢复过程
                  offPreviewOutputFrameStart(previewOutPut!);
                  stopSession(session);
                  releaseInPutStream(cameraInput);
                  releaseOutPutStream(previewOutPut);
                  releaseOutPutStream(videoOutput);
                  releaseSession(session)
                  await sleep(2000);
                } catch (error) {
                  //恢复过程
                  await releaseAvRecoder(avRecoder!);
                  if (previewOutPut != undefined) {
                    offPreviewOutputFrameStart(previewOutPut!);
                  }
                  stopSession(session);
                  releaseInPutStream(cameraInput);
                  releaseOutPutStream(previewOutPut)
                  releaseOutPutStream(videoOutput);
                  releaseSession(session)
                  await sleep(2000);
                  continue
                }
              }
            }
          }
        }
        await sleep(4000);
        helper.release();
        done();

      } catch (error) {
        console.info('error is ' + JSON.stringify(error))
        expect().assertFail();
        done();
      }
    })

  })
}