/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import common from '@ohos.app.ability.common';
import image from '@ohos.multimedia.image';

const TAG = "cameraCaptureSceneTest: ";

let context: common.UIAbilityContext;
let testContext = getContext();
// 拍照设置相关
let captureLocation: cameraObj.Location = {
  latitude: 0,
  longitude: 0,
  altitude: 0,
}

let captureSetting: cameraObj.PhotoCaptureSetting = {
  quality: cameraObj.QualityLevel.QUALITY_LEVEL_HIGH, // 设置图片质量高
  rotation: cameraObj.ImageRotation.ROTATION_0, // 设置图片旋转角度0
  location: captureLocation,
  mirror: false
}

// 输出流相关
let cameraManager: cameraObj.CameraManager;
let cameraDevicesArray: Array<cameraObj.CameraDevice>;
let cameraSession: cameraObj.PhotoSession; 
let cameraInput: cameraObj.CameraInput;
let previewOutput: cameraObj.PreviewOutput;
let photoOutput: cameraObj.PhotoOutput;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

// 权限相关
let permission = ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS',
  'ohos.permission.REVOKE_SENSITIVE_PERMISSIONS',
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE',
  'ohos.permission.MEDIA_LOCATION',
  'ohos.permission.READ_MEDIA',
  'ohos.permission.WRITE_MEDIA',
  'ohos.permission.START_ABILIIES_FROM_BACKGROUND',
  'ohos.permission.START_INVISIBLE_ABILITY',
  'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION',
];

let power: ESObject;

let ability = async () => {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'TestAbility'
  }
  await delegator.startAbility(want)
  await sleep(1000)
}

let isEmpty = (data: ESObject) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

// 创建input参数为cameraDevice的下标
let createInput = async (index: number) => {
  cameraInput = cameraManager.createCameraInput(cameraDevicesArray[index]);
  if (!isEmpty(cameraInput)) {
    await cameraInput.open();
  }
}

// 创建Output参数为cameraDevice的下标、相机模式
let createOutput = (index: number, mode: number, testNum: string) => {
    let cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDevicesArray[index], mode);
    let previewProfile = cameraOutputCap.previewProfiles[0];
    let photoProfile = cameraOutputCap.photoProfiles[0];
    for (const mPreviewProfile of cameraOutputCap.previewProfiles) {
      let foundProfile = cameraOutputCap.photoProfiles.find((photoProfile: cameraObj.Profile) => {
        console.log(TAG + ` find photoProfile: w: ${photoProfile.size.width} h: ${photoProfile.size.height} `);
        console.log(TAG + ` find previewProfile: w: ${mPreviewProfile.size.width} h: ${mPreviewProfile.size.height} `);
        return Math.abs((photoProfile.size.width * mPreviewProfile.size.height) -
          (mPreviewProfile.size.width * photoProfile.size.height)) < Number.EPSILON;
      });
      if (foundProfile) {
        photoProfile = foundProfile
        previewProfile = mPreviewProfile
        break;
      }
    }
    console.log(testNum + ` photoProfile: w: ${photoProfile.size.width} h: ${photoProfile.size.height} `);
    console.log(testNum + ` previewProfile: w: ${previewProfile.size.width} h: ${previewProfile.size.height} `);
    previewOutput = cameraManager.createPreviewOutput(previewProfile, surfaceIds);
    photoOutput = cameraManager.createPhotoOutput(photoProfile);
    console.log(TAG + ` createPhotoOutput ok: ${JSON.stringify(photoOutput)} `)
}

// 创建Session对象参数为相机模式
let createPhotoSession = (mode: number) => {
  cameraSession = cameraManager.createSession(mode);
  cameraSession.beginConfig();
}

// 释放相机资源
let stopCameraSession = async () => {;
  cameraSession.beginConfig();
  if (!isEmpty(cameraInput)) {
    cameraSession.removeInput(cameraInput);
    await cameraInput.close();
  }
  if (!isEmpty(previewOutput)) {
    cameraSession.removeOutput(previewOutput);
    await previewOutput.release();
  }
  if (!isEmpty(photoOutput)) {
    cameraSession.removeOutput(photoOutput);
    await photoOutput.release();
  }
  await cameraSession.release();
}

// 添加相机流参数为cameraDevice的下标、相机模式
let addCommit = async (i: number, mode: number, testNum: string) => {
  console.log(`${testNum} createInput`);
  await createInput(i);
  console.log(`${testNum} createOutput`);
  createOutput(i, mode, testNum);
  if (cameraInput) {
    cameraSession.addInput(cameraInput);
    console.log(`${testNum} successed add input`);
  }
  if (previewOutput) {
    cameraSession.addOutput(previewOutput);
    console.log(`${testNum} successed add output`);
  }
  if (photoOutput) {
    cameraSession.addOutput(photoOutput);
    console.log(`${testNum} successed add output`);
  }
}

let getCameraDevices = () => {
  cameraManager = cameraObj.getCameraManager(context);
  sleep(1000);
  cameraDevicesArray = cameraManager.getSupportedCameras();
  console.log(`cameraDevicesArray:  + ${JSON.stringify(cameraDevicesArray)}`)

  let sceneModes: Array<cameraObj.SceneMode> = cameraManager.getSupportedSceneModes(cameraDevicesArray[0]);
  console.log(`supportedSceneModes:  + ${JSON.stringify(sceneModes)}`)
}

let startCameraSession = async (index: number, mode: number, testNum: string) => {
    getCameraDevices()
    createPhotoSession(mode)
    await addCommit(index, mode, testNum)
    await cameraSession.commitConfig();
    await cameraSession.start().then(() => {
        console.info('Promise returned to indicate the session start success.');
    });
}

let getAssetFromCapture = async (testNum: string) => {
  return new Promise<photoAccessHelper.PhotoAsset | undefined>((resolve, reject) => {
    let photoAssetAvailableCallback = (err: BusinessError, photoAsset: photoAccessHelper.PhotoAsset) => {
      if (err) {
        console.error(`${testNum} photoAssetAvailable error: ${JSON.stringify(err)}.`);
        reject(err);
        return;
      }
      console.info(testNum + " get photoAsset success: " + photoAsset);
      resolve(photoAsset);
    };

    photoOutput.on('photoAssetAvailable', photoAssetAvailableCallback);

    // 使用当前拍照设置进行拍照, 触发回调
    console.info(testNum + " start capture ");
    photoOutput.capture(captureSetting);
  });
};

export default function cameraCaptureSceneTest() {

  class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
      onDataPrepared(data: ArrayBuffer) {
          console.error('data: ' + data);
      }
  }

  let testSegmentedCapture = async (context: common.UIAbilityContext, 
                                    asset: photoAccessHelper.PhotoAsset | undefined, 
                                    requestOptions:photoAccessHelper.RequestOptions | undefined, 
                                    handler: MediaDataHandler | undefined, testNum:string) => {
        // --------------------------------set up---------------------------------------
        let isSuccess = false
        await startCameraSession(0, cameraObj.SceneMode.NORMAL_PHOTO, testNum)
        await sleep(2000);
        console.info(testNum + ' start get asset ');
        // --------------------------------process---------------------------------------
        asset = await getAssetFromCapture(testNum)
        // save asset
        try {
            console.info(testNum + ' context: ' + JSON.stringify(context));
            console.info(testNum + ' asset: ' + asset);
            console.info(testNum + ' requestOptions: ' + JSON.stringify(requestOptions));
            console.info(testNum + ' handler: ' + handler);
            await photoAccessHelper.MediaAssetManager.requestImageData(context, asset, requestOptions, handler);
            console.info(testNum + ' requestImageData successfully');
            isSuccess = true
        } catch (err) {
            console.info(testNum + ' mediaLibRequestBuffer failed to save photoAsset: ' + err.code)
        }

        // --------------------------------tear down---------------------------------------
        stopCameraSession()
        return isSuccess
  }

  describe('cameraCaptureSceneTest', () => {
    console.info(TAG + '----------cameraCaptureSceneTest begin--------------')
    let dr = Driver.create();
    beforeAll(async () => {
      await sleep(2000);
      console.info(TAG + ' beforeAll case ');
      await ability();
      context = AppStorage.get('thisContext') as common.UIAbilityContext;
      await sleep(500);
      for (let i = 0; i < permission.length; i++) {
        power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
        power = null;
        await sleep(500);
      }
    })

    beforeEach(async () => {
      await sleep(1000);
      console.info(TAG + ' beforeEach case ');
    })

    afterEach(async () => {
      console.info(TAG + ' afterEach case ');
    })

    afterAll(() => {
      console.info(TAG + ' afterAll case ');
    })

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0200
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0200
     * @tc.desc   test media photo access helper request image data from capture with errorCode 14000011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0200', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0200';
        console.info(TAG + " --------------Enter SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0200--------------");
        // 启动会话
        await startCameraSession(0, cameraObj.SceneMode.NORMAL_PHOTO, testNum)
        await sleep(2000)
        console.info(testNum + ' start get asset ');
        // 获取asset
        let asset = await getAssetFromCapture(testNum)
        await sleep(2000)
        // 保存asset
        let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        const handler = new MediaDataHandler();
        try {
            console.info(testNum + ' begin to save photoAsset: ' + asset);
            console.info(testNum + ' testContext: ' + JSON.stringify(testContext));
            await photoAccessHelper.MediaAssetManager.requestImageData(testContext, asset, requestOptions, handler);
            console.info(testNum + ' requestImageData successfully ');
            expect().assertFail()
        } catch (err) {
            console.info(testNum + ' mediaLibRequestBuffer to save photoAsset failed, error: ' + err.code)
            expect(err.code == 14000011).assertTrue()
        }
        // 释放会话
        stopCameraSession()
        console.info(TAG + " --------------Exit SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0200--------------");
        done()
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0300
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0300
     * @tc.desc   test media photo access helper request image data from capture with errorCode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0300', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0300';
        console.info(TAG + " --------------Enter SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0300--------------");
        // 启动会话
        await startCameraSession(0, cameraObj.SceneMode.NORMAL_PHOTO, testNum)
        // 保存
        let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        const handler = new MediaDataHandler();
        try {
            console.info(testNum + ' context: ' + JSON.stringify(context));
            await photoAccessHelper.MediaAssetManager.requestImageData(context, null, requestOptions, handler);
            console.info(testNum + ' requestImageData successfully ');
            expect().assertFail()
        } catch (err) {
            console.info(testNum + ' mediaLibRequestBuffer to save photoAsset failed, error: ' + err.code)
            expect(err.code == 401).assertTrue()
        }
        // 释放会话
        stopCameraSession()
        console.info(TAG + " --------------Exit SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0300--------------");
        done()
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0100
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0100
     * @tc.desc   test deliveryMode = HIGH_QUALITY_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0100', Level.LEVEL1, async (done: Function) => {
        let testNum: string = 'SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0100'
        console.info(TAG + " --------------Enter SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0100--------------");
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        const handler = new MediaDataHandler();
        let result = await testSegmentedCapture(context, asset, requestOptions, handler, testNum)
        expect(result).assertTrue()
        console.info(TAG + " --------------Exit SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0100--------------");
        done()
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0400
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0400
     * @tc.desc   test deliveryMode = FAST_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0400', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0400'
        console.info(TAG + " --------------Enter SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0400--------------");
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        const handler = new MediaDataHandler();
        let result = await testSegmentedCapture(context, asset, requestOptions, handler, testNum)
        expect(result).assertTrue()
        console.info(TAG + " --------------Exit SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0400--------------");
        done()
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0500
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0500
     * @tc.desc   test deliveryMode = BALANCE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0500', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0500'
        console.info(TAG + " --------------Enter SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0500--------------");
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        }
        const handler = new MediaDataHandler();
        let result = await testSegmentedCapture(context, asset, requestOptions, handler, testNum)
        expect(result).assertTrue()
        console.info(TAG + " --------------Exit SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0500--------------");
        done()
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0600
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0600
     * @tc.desc   test deliveryMode = -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0600', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0600'
        console.info(TAG + " --------------Enter SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0600--------------");
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: -1,
        }
        const handler = new MediaDataHandler();
        let result = await testSegmentedCapture(context, asset, requestOptions, handler, testNum)
        expect(result).assertFalse()
        console.info(TAG + " --------------Exit SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0600--------------");
        done()
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0700
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0700
     * @tc.desc   test requestOptions = undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0700', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0700'
        console.info(TAG + " --------------Enter SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0700--------------");
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        const handler = new MediaDataHandler();
        let result = await testSegmentedCapture(context, asset, undefined, handler, testNum)
        expect(result).assertFalse()
        console.info(TAG + " --------------Exit SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0700--------------");
        done()
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0800
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0800
     * @tc.desc   test handler = undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0800', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0800'
        console.info(TAG + " --------------Enter SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0800--------------");
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let result = await testSegmentedCapture(context, asset, requestOptions, undefined, testNum)
        expect(result).assertFalse()
        console.info(TAG + " --------------Exit SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0800--------------");
        done()
    });

    /**
     * @tc.name   SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0900
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0900
     * @tc.desc   test the requestID return from request image data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0900', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0900'
        console.info(TAG + " --------------Enter SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0900--------------");
        // 启动会话
        await startCameraSession(0, cameraObj.SceneMode.NORMAL_PHOTO, testNum)
        await sleep(2000)
        // 获取asset
        let asset = await getAssetFromCapture(testNum)
        await sleep(2000)
        // 保存asset
        let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        const handler = new MediaDataHandler();

        await photoAccessHelper.MediaAssetManager.requestImageData(context, asset, requestOptions, handler).then((id: string) => {
            console.info(testNum + " get id success: " + id);
            let requestId = id;
            try {
                photoAccessHelper.MediaAssetManager.cancelRequest(context, requestId);
                console.info(testNum + " request cancelled successfully ");
              } catch (err) {
                console.error(testNum + ` cancelRequest failed with error: ${err.code}, ${err.message} `);
                expect().assertFail()
            }
        })
        // 释放会话
        stopCameraSession()
        console.info(TAG + " --------------Exit SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_FROM_CAPTURE_0900--------------");
        done()
    });

  })
}