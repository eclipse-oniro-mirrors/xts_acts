import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  addInputIntoSession,
  addOutputIntoSession,
  commitSessionConfig,
  createAndConfigSession,
  createCameraInput,
  getCameraManager,
  getCameraOutputCapability,
  getPermission,
  getSupportedCameras,
  openCamera,
  releaseInPutStream,
  releaseOutPutStream,
  releaseSession,
  sleep,
  startSession,
  stopSession,
  cameraCaptureRelyOnNum,
  onPhotoOutputPhotoAssetAvailable,
  offPhotoOutputPhotoAssetAvailable,
  setFocusMode,
  getSuppotredZoomRatioRange,
  setZoomRatioRange,
  onCaptureReady,
  offCaptureReady,
  getHelper,
  onPreviewOutputFrameStart,
  offPreviewOutputFrameStart,
  expectEqualPhotoCount,
  getAllPhotoAssetsCount,
  getPhotoOutputFromProfile,
  createPreviewOutputFromProfile,
  setImageColorSpace,
  IsexistMovingPhotoVideo,
  generateNameForAsset,
  renameAsset
} from './CameraCommonAPI'

import {
  enableMovingPhoto,
} from './CameraCommonAPI'

import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { camera } from '@kit.CameraKit';


export default function CameraCapturePhotosWithMultiDiffConfig() {
  describe('CameraCapturePhotosWithMultiDiffConfig', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after e ach unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    : SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_000
     * @tc.name      : SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_000
     * @tc.desc      : camera capture 1 dynamic photo with multi Different config
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_CAMERA_CPATUREDYNAMICPHOTO_TESTMULTICONFIG_000'
      try {
        //预制条件
        let capturePhotoNum = 1;
        await getPermission();
        let helperInstance = await getHelper();
        let cameraManager = await getCameraManager();
        let cameras = getSupportedCameras(cameraManager);
        let fileNames: Array<string> = [];
        for (let camreId of cameras) {
          let cameraOutputCapability = getCameraOutputCapability(cameraManager, camreId, camera.SceneMode.NORMAL_PHOTO)
          for (let photoOutputProfile of cameraOutputCapability?.photoProfiles!) {
            for (let previewOutPutProfile of cameraOutputCapability?.previewProfiles!) {
              let photoOutput: camera.PhotoOutput | undefined = undefined
              let cameraInput: camera.CameraInput | undefined = undefined
              let previewOutPut: camera.PreviewOutput | undefined = undefined
              let session: ESObject = undefined
              let isHdrImage: boolean = true
              try {
                console.info(`${testNum} photoProfile format is ${photoOutputProfile.format} photoProfile size is ${photoOutputProfile.size}`);
                console.info(`${testNum} previewProfile format is ${previewOutPutProfile.format} previewProfile size is ${previewOutPutProfile.size} `);
                console.info(`${testNum} camrePosition is ${camreId.cameraPosition} camreType is ${camreId.connectionType}`);
                photoOutput = getPhotoOutputFromProfile(cameraManager, photoOutputProfile)
                cameraInput = createCameraInput(cameraManager, camreId);
                previewOutPut = createPreviewOutputFromProfile(cameraManager, previewOutPutProfile!);
                await openCamera(cameraInput);
                session = createAndConfigSession(cameraManager, camera.SceneMode.NORMAL_PHOTO);

                await addInputIntoSession(session, cameraInput);
                await addOutputIntoSession(session, previewOutPut);
                await addOutputIntoSession(session, photoOutput);
                await commitSessionConfig(session);
                setImageColorSpace(session, isHdrImage)
                await startSession(session);
                await onPreviewOutputFrameStart(previewOutPut!);
                enableMovingPhoto(photoOutput)
                setFocusMode(session);
                let assetArray: photoAccessHelper.PhotoAsset[] = []
                let zoomRatioRange = getSuppotredZoomRatioRange(session);
                if (zoomRatioRange != undefined) {
                for (let zoomRatio of zoomRatioRange!) {
                    let newTitle: string = await generateNameForAsset(camera.SceneMode.NORMAL_PHOTO, camreId, photoOutputProfile, previewOutPutProfile, zoomRatio)
                    const befortCount = await getAllPhotoAssetsCount();
                    setZoomRatioRange(session, zoomRatioRange!, zoomRatio);

                    //测试过程
                    onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
                    onCaptureReady(photoOutput);
                    await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
                    let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
                    // 重命名资产
                    renameAsset(assets[0], `${newTitle}`)
                    await expectEqualPhotoCount(befortCount, capturePhotoNum);
                    assetArray.push(assets[0])
                    if (globalThis.isSupportMovingPhoto) {
                    await IsexistMovingPhotoVideo(assets);
                    }
                    await sleep(3000);
                }
                } else {
                //测试过程
                const befortCount = await getAllPhotoAssetsCount();
                onPhotoOutputPhotoAssetAvailable(photoOutput, helperInstance);
                onCaptureReady(photoOutput);
                await cameraCaptureRelyOnNum(photoOutput, capturePhotoNum);
                let assets = await offPhotoOutputPhotoAssetAvailable(photoOutput, capturePhotoNum, fileNames, true)
                await expectEqualPhotoCount(befortCount, capturePhotoNum);
                if (globalThis.isSupportMovingPhoto) {
                    await IsexistMovingPhotoVideo(assets);
                }
                await sleep(3000);
                }
                //恢复过程
                offCaptureReady(photoOutput);
                offPreviewOutputFrameStart(previewOutPut!);
                stopSession(session);
                releaseInPutStream(cameraInput);
                releaseOutPutStream(previewOutPut)
                releaseOutPutStream(photoOutput)
                releaseSession(session)
                await sleep(4000);
              } catch (error) {
                if (previewOutPut != undefined) {
                offPreviewOutputFrameStart(previewOutPut!);
                }
                if (photoOutput != undefined) {
                offCaptureReady(photoOutput);
                }
                stopSession(session);
                releaseInPutStream(cameraInput);
                releaseOutPutStream(previewOutPut)
                releaseOutPutStream(photoOutput)
                releaseSession(session)
                console.error(`${testNum} error is ${error}`)
                expect().assertFail();
              }
            }
          }
        }
        await sleep(3000);
        await helperInstance.release();
        done();
      } catch (error) {
        console.error(`${testNum} error is ${error}`)
        expect().assertFail();
        done();
      }
    })
  })
}