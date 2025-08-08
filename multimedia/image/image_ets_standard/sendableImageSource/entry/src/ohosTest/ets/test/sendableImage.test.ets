/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll } from '@ohos/hypium'
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import sendableImage from '@ohos.multimedia.sendableImage';
import camera from '@ohos.multimedia.camera';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import taskpool from '@ohos.taskpool';
import worker, { MessageEvents } from '@ohos.worker';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

let filesDir: string | undefined;
let testContext: common.UIAbilityContext;
const TAG = "sendableImageAbilityTest: ";


export function isSupportedCameras() : boolean {
  const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
  let context = testContext;

  let isSupportedCameras = true;
  let isSupportedCameraManager = false;
  let mCameraManager: camera.CameraManager;
  let mCameraDevicesArray: Array<camera.CameraDevice>;

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  console.info(TAG + 'Enter getCameraManagerInstance');
  try {
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      isSupportedCameraManager = false;
      return isSupportedCameraManager;
    }
    console.info(TAG + 'Exit getCameraManagerInstance');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      isSupportedCameras = false;
    }
  } catch (err) {
    console.error(TAG + "getCameraManager FAILED. errorMessage:",err);
    isSupportedCameraManager = false;
    return isSupportedCameraManager;
  }
  if (cameraAvailable && isSupportedCameras) {
    isSupportedCameraManager = true;
  } else {
    isSupportedCameraManager = false;
  }
  return isSupportedCameraManager;
}
let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

async function createPreview(cameraManager: camera.CameraManager,
  receiver: sendableImage.ImageReceiver): Promise<void> {
  // 获取支持的相机设备对象
  let camerasDevices: Array<camera.CameraDevice> = cameraManager.getSupportedCameras();

  // 获取支持的模式类型
  let sceneModes: Array<camera.SceneMode> = cameraManager.getSupportedSceneModes(camerasDevices[0]);
  let isSupportPhotoMode: boolean = sceneModes.indexOf(camera.SceneMode.NORMAL_PHOTO) >= 0;
  if (!isSupportPhotoMode) {
    console.error('photo mode not support');
    return;
  }

  // 获取profile对象
  let profiles: camera.CameraOutputCapability =
    cameraManager.getSupportedOutputCapability(camerasDevices[0], camera.SceneMode.NORMAL_PHOTO); // 获取对应相机设备profiles
  let previewProfiles: Array<camera.Profile> = profiles.previewProfiles;

  // 预览流
  let previewProfilesObj: camera.Profile = previewProfiles[0];

  // 创建 预览流 输出对象
  let imageReceiverSurfaceId: string = await receiver.getReceivingSurfaceId();
  let previewOutput: camera.PreviewOutput =
    cameraManager.createPreviewOutput(previewProfilesObj, imageReceiverSurfaceId);

  // 创建cameraInput对象
  let cameraInput: camera.CameraInput = cameraManager.createCameraInput(camerasDevices[0]);

  // 打开相机
  await cameraInput.open();

  // 会话流程
  let photoSession: camera.PhotoSession =
    cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;

  // 开始配置会话
  photoSession.beginConfig();

  // 把CameraInput加入到会话
  photoSession.addInput(cameraInput);

  // 把 预览流 加入到会话
  photoSession.addOutput(previewOutput);

  // 提交配置信息
  await photoSession.commitConfig();

  // 会话开始
  await photoSession.start();
}

@Concurrent
async function getImgs(img: image.Image) {
  let component = await img.getComponent(4)
  if (component) {
    console.info('0x000 getComponent succeeded')
  } else {
    console.error('0x000 getComponent failed')
  }
  return component
}

@Concurrent
async function getRelease(img: image.Image) {
  await img.release()
  console.info('0x000 img release succeeded')
}


export default function sendableImageSource() {
  describe('sendableImageAbilityTest', () => {

    let filePath: string;
    let fdNumber: number;
    let receiverApi: sendableImage.ImageReceiver
    let cameraM : camera.CameraManager;

    let isEmpty = (temp: ESObject) => {
      if (temp == null || temp == undefined) {
        return true
      }
      return false
    }


    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext
      cameraM = camera.getCameraManager(testContext)
      await ability()
      let driver = Driver.create()
      await sleep(500)
      let button = await driver.findComponent(ON.text('允许', MatchPattern.EQUALS))
      console.info('button is ' + JSON.stringify(button))
      if (button != undefined) {
        console.info('button is ' + JSON.stringify(button))
        await button?.click()
      }
      sleep(3000)
    })

    let ability = async () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator()
      const bundleName = abilityDelegatorRegistry.getArguments().bundleName
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'TestAbility'
      }
      await delegator.startAbility(want)
      await sleep(500)
    }

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath)
      fdNumber = file.fd
      return fdNumber
    }

    const getBuffer = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    const getImageSource = async (fileName: string, type?: string) => {
      let imageSourceApi: sendableImage.ImageSource
      if (type === "buffer") {
        const buffer = await getBuffer(fileName)
        imageSourceApi = sendableImage.createImageSource(buffer)
      } else if (type === "uri") {
        const filePath = fileName ? filesDir + '/' + fileName : ''
        console.info(`getImageSource imageSource uri ${filePath}`)
        imageSourceApi = sendableImage.createImageSource(filePath)
      } else {
        await getFd(fileName)
        imageSourceApi = sendableImage.createImageSource(fdNumber);
      }
      console.info(`getImageSource imageSourceApi ${imageSourceApi}`)
      return imageSourceApi
    }

    const getImageReceiver = async (type: number) => {
      if (type == 1) {
        let size: image.Size = {
          height: 8192,
          width: 8
        }
        receiverApi = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      } else if (type == 2) {
        let size: image.Size = {
          height: 0,
          width: 0
        }
        receiverApi = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      } else if (type == 3) {
        let size: image.Size = {
          height: 8192,
          width: 8
        }
        receiverApi = sendableImage.createImageReceiver(size, image.ImageFormat.YCBCR_422_SP, 8);
      } else if (type == 4) {
        let size: image.Size = {
          height: 8192,
          width: 8
        }
        receiverApi = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, -1);
      }
      return receiverApi
    }

    /**
     * @tc.number    : testCreateImageSourceUri0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0100
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0100"
      let fileName = 'test.jpg'
      try {
        let imageSourceApi = await getImageSource(fileName, "uri")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : testCreateImageSourceUri0200
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0200
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0200', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0200"
      let fileName = 'test.png'
      try {
        let imageSourceApi = await getImageSource(fileName, "uri")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceUri0300
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0300
     * @tc.desc      : 1.create imageSource
     *                 2.set uri is empty
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0300', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_URI_0300"
      let fileName = ''
      try {
        let imageSourceApi = await getImageSource(fileName, "uri")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(imageSourceApi).assertUndefined()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceFd0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0100
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0100"
      let fileName = 'test.gif'
      try {
        let imageSourceApi = await getImageSource(fileName)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceFd0200
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0200
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0200', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "testCreateImageSourceFd0200"
      let fileName = 'test.jpg'
      try {
        let imageSourceApi = await getImageSource(fileName)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceFd0300
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0300
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0300', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0300"
      let fileName = ''
      try {
        let imageSourceApi = await getImageSource(fileName)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceFd0400
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0400
     * @tc.desc      : 1.create imageSource
     *                 2.set fd is -1
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0400', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_FD_0400"
      try {
        let imageSourceApi = await sendableImage.createImageSource(-1)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(imageSourceApi).assertUndefined()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : testCreateImageSourceBuf0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0100
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0100"
      let fileName = 'test.bmp'
      try {
        let imageSourceApi = await getImageSource(fileName, "buffer")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceBuf0200
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0200
     * @tc.desc      : 1.create imageSource
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0200', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0200"
      let fileName = 'test.jpg'
      try {
        let imageSourceApi = await getImageSource(fileName, "buffer")
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(isEmpty(imageSourceApi)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageSourceBuf0300
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0300
     * @tc.desc      : 1.create imageSource
     *                 2.set ArrayBuffer is 0
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0300', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_SOURCE_BUFFER_0300"
      try {
        const buf: ArrayBuffer = new ArrayBuffer(0)
        const imageSourceApi: sendableImage.ImageSource = sendableImage.createImageSource(buf)
        console.info(`0x0000 ${tag} success ${imageSourceApi}`)
        expect(imageSourceApi).assertUndefined()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      }
    })


    /**
     * @tc.number    : testImageSourceCreatePixelMap0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0100
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0100"
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean')
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail()
        done()
      })
    })

    /**
     * @tc.number    : testImageSourceCreatePixelMap0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0200
     * @tc.desc      : 1.create imageSource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0200', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0200"
      let fileName = 'test.dng'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let opt: image.DecodingOptions = {
        editable: true,
        desiredSize: {
          width: 200,
          height: 200
        },
        desiredRegion: {
          size: {
            width: 100,
            height: 100
          },
          x: 0,
          y: 0
        }
      }
      imageSourceApi.createPixelMap(opt).then(async (pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        let info = await pixelMap.getImageInfo()
        console.info(`0x0000 ${tag} pixelMap size is ${info.size.height} ${info.size.width}`);
        expect(opt.desiredSize?.height).assertEqual(info.size.height)
        expect(opt.desiredSize?.width).assertEqual(info.size.width)
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail()
        done()
      })
    })


    /**
     * @tc.number    : testImageSourceCreatePixelMap0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0300
     * @tc.desc      : 1.create imageSource
     *                 2.set sampleSize is 0
     *                 3.create PixelMap
     *                 4.return error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0300', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0300"
      let fileName = 'SVG.svg'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let opt: image.DecodingOptions = {
        sampleSize: 0
      }
      imageSourceApi.createPixelMap(opt).then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(isEmpty(pixelMap)).assertTrue()
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect(true).assertEqual(JSON.stringify(error) != null);
        done()
      })
    })


    /**
     * @tc.number    : testImageSourceCreatePixelMap0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0400
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0400', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_0400"
      let fileName = 'test.ico'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let colorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB);

      let opt: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 1, height: 2 },
        rotate: 10,
        desiredPixelFormat: 3,
        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
        index: 0,
        fitDensity:0,
        desiredDynamicRange:image.DecodingDynamicRange.AUTO,
        desiredColorSpace:colorSpace
      }
      imageSourceApi.createPixelMap(opt).then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean')
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail()
        done()
      })
    })


    /**
     * @tc.number    : testImageSourceRelease0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0100
     * @tc.desc      : 1.create imageSource
     *                 2.imageSource release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0100"
      let fileName = 'test.jpg'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.release().then(() => {
        console.info(`0x0000 ${tag} release success ${JSON.stringify(imageSourceApi.createPixelMap())}`);
        expect(isEmpty(imageSourceApi.createPixelMap())).assertTrue()
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail()
        done()
      })
    })

    /**
     * @tc.number    : testImageSourceRelease0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0200
     * @tc.desc      : 1.create imageSource
     *                 2.imageSource release
     *                 3.create PixelMap
     *                 4.return error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0200', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_RELEASE_0200"
      let fileName = 'test.jpg'
      let imageSourceApi = await getImageSource(fileName, 'uri')
      imageSourceApi.release().then(() => {
        imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
          console.info(`0x0000 ${tag} success ${pixelMap}`)
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`);
          expect(true).assertEqual(JSON.stringify(error) != null);
          done()
        })
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect(true).assertEqual(JSON.stringify(error) != null);
        done()
      })
    })

    /**
     * @tc.number    : testCreateImageReceiver0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0100
     * @tc.desc      : 1.create receiver
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0100"
      let receiver = await getImageReceiver(1)
      console.info(`0x0000 ${tag} success ${receiver}`)
      expect(isEmpty(receiver)).assertFalse()
      done()
    })

    /**
     * @tc.number    : testCreateImageReceiver0200
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0200
     * @tc.desc      : 1.create receiver
     *                 2.set format
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0200', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0200"
      try {
        let receiver = await getImageReceiver(2)
        console.info(`0x0000 ${tag} success ${receiver}`)
        expect(isEmpty(receiver)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect(error.code).assertEqual('401')
        done()
      }
    })


    /**
     * @tc.number    : testCreateImageReceiver0300
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0300
     * @tc.desc      : 1.create receiver
     *                 2.set format image.ImageFormat.YCBCR_422_SP
     *                 3.return error code is 401
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0300', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0300"
      try {
        let receiver = await getImageReceiver(3)
        console.info(`0x0000 ${tag} success ${receiver}`)
        expect(isEmpty(receiver)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect(error.code).assertEqual('401')
        done()
      }
    })

    /**
     * @tc.number    : testCreateImageReceiver0400
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0400
     * @tc.desc      : 1.create receiver
     *                 2.set capacity is -1
     *                 3.return receiver
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0400', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_0400"
      try {
        let receiver = await getImageReceiver(4)
        console.info(`0x0000 ${tag} success ${receiver}`)
        expect(isEmpty(receiver)).assertFalse()
        done()
      } catch (error) {
        console.info(`0x0000 ${tag} failed ${error}`)
        expect(error.code).assertEqual('401')
        done()
      }
    })

    /**
     * @tc.number    : testImageReceiverOn0100
     * @tc.name      : SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_ON_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_ON_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_CREATE_IMAGE_RECEIVER_ON_0100"
      let receiver = await getImageReceiver(1)
      console.info(`0x0000 ${tag} success ${receiver}`)
      console.info(`onImageArrival start`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        expect(isEmpty(receiver.size)).assertFalse()
        done()
      })
      await createPreview(cameraM, receiver)

    })

    /**
     * @tc.number    : testGetReceivingSurfaceId0100
     * @tc.name      : SUB_MULTIMEDIA_GET_RECEIVING_SURFACES_0100
     * @tc.desc      : 1.create receiver
     *                 2.getReceivingSurfaceId
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_GET_RECEIVING_SURFACES_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_GET_RECEIVING_SURFACES_0100"
      let receiver = await getImageReceiver(1)
      receiver.getReceivingSurfaceId().then((id: string) => {
        console.info(`0x0000 ${tag} success ${receiver} ${id}`)
        expect(isEmpty(id)).assertFalse()
        done()
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`)
        expect().assertFail()
        done()
      })
    })


    /**
     * @tc.number    : testReadNextImage0100
     * @tc.name      : SUB_MULTIMEDIA_RECEIVER_READ_NEXT_IMAGE_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_RECEIVER_READ_NEXT_IMAGE_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_RECEIVER_READ_NEXT_IMAGE_0100"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} success receiver`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readNextImage().then((img: image.Image) => {
          console.info(`0x0000 ${tag} readNextImage success`)
          expect(isEmpty(img.clipRect)).assertFalse()
          expect(isEmpty(img.format)).assertFalse()
          expect(isEmpty(img.size)).assertFalse()
          expect(isEmpty(img.timestamp)).assertFalse()
          done()
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect().assertFail()
          done()
        })
      })
    })

    /**
     * @tc.number    : testImageGetComponent0100
     * @tc.name      : SUB_MULTIMEDIA_IMG_GET_COMPONENT_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.getComponent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_GET_COMPONENT_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMG_GET_COMPONENT_0100"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} success ${receiver}`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readNextImage().then((img: image.Image) => {
          let clipRect = img.clipRect
          let format = img.format
          let size = img.size
          let timestamp = img.timestamp
          console.info(`0x0000 ${tag} img attributes ${JSON.stringify(clipRect)} ${JSON.stringify(size)} ${format} ${timestamp}`)
          let componentType = image.ComponentType.JPEG
          img.getComponent(componentType).then((Component: image.Component) => {
            console.info(`0x0000 ${tag} img.getComponent succeeded`)
            expect(isEmpty(Component)).assertFalse()
            console.info(`0x0000 ${tag} componentType is: ${Component.componentType}`)
            console.info(`0x0000 ${tag} rowStride is: ${Component.rowStride}`)
            console.info(`0x0000 ${tag} pixelStride is: ${Component.pixelStride}`)
            console.info(`0x0000 ${tag} byteBuffer is: ${Component.byteBuffer}`)
            expect(Component.componentType).assertEqual(4)
            expect(isEmpty(Component.byteBuffer)).assertFalse()
            done()
          })
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect().assertFail()
          done()
        })
      })
    })

    /**
     * @tc.number    : testImageGetComponent0200
     * @tc.name      : SUB_MULTIMEDIA_IMG_GET_COMPONENT_0200
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.getComponent
     *                 6.set componentType is 5
     *                 7.return error
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_GET_COMPONENT_0200', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMG_GET_COMPONENT_0200"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} success ${receiver}`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readNextImage().then((img: image.Image) => {
          img.getComponent(5).then((Component: image.Component) => {
            console.info(`0x0000 ${tag} img.getComponent succeeded`)
            expect().assertFail()
            done()
          })
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect(true).assertEqual(JSON.stringify(error) != null);
          done()
        })
      })
    })


    /**
     * @tc.number    : testImageGetComponent0300
     * @tc.name      : SUB_MULTIMEDIA_IMG_GET_COMPONENT_0300
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.main thread create image
     *                 5.child thread getComponent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_GET_COMPONENT_0300', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMG_GET_COMPONENT_0300"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} success ${receiver}`)
      receiver.on('imageArrival', async () => {
        console.info(`onImageArrival receiver.on start`)
        let img = await receiver.readNextImage()
        let task1: taskpool.Task = new taskpool.Task(getImgs, img);
        taskpool.execute(task1).then((res: Object) => {
          let Component: ESObject = res
          console.info(`0x0000 ${tag} task1 return value: ${JSON.stringify(res)}`)
          expect(isEmpty(res)).assertFalse()
          console.info(`0x0000 ${tag} componentType is: ${Component.componentType}`)
          console.info(`0x0000 ${tag} rowStride is: ${Component.rowStride}`)
          console.info(`0x0000 ${tag} pixelStride is: ${Component.pixelStride}`)
          console.info(`0x0000 ${tag} byteBuffer is: ${Component.byteBuffer}`)
          expect(isEmpty(Component.byteBuffer)).assertFalse()
          done()
        }).catch((error: BusinessError) => {
          console.info(`0x0000 ${tag} task1 catch error: ${JSON.stringify(error)}`)
          expect().assertFail()
          done()
        })
      })
    })


    /**
     * @tc.number    : testImageGetComponent0400
     * @tc.name      : SUB_MULTIMEDIA_IMG_GET_COMPONENT_0400
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.main thread create image
     *                 5.child thread getComponent
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_GET_COMPONENT_0400', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMG_GET_COMPONENT_0400"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} onImageArrival start`)
      receiver.on('imageArrival', async () => {
        console.info(`onImageArrival receiver.on start`)
        let img = await receiver.readNextImage()
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker')
        console.info(`workerInstance: img ${JSON.stringify(img.clipRect)}`)
        workerInstance.postMessageWithSharedSendable(img);
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`0x0000 ${tag} workerInstance receive data: ${JSON.stringify(e.data)}`)
          expect(e.data).assertTrue()
          done()
        }
        workerInstance.onmessageerror = (e: MessageEvents) => {
          console.info(`0x0000 ${tag} worker error: ${e.data}`)
          expect().assertFail()
          done()
        }
      })
    })

    /**
     * @tc.number    : testReceiverRelease0100
     * @tc.name      : SUB_MULTIMEDIA_IMG_RELEASE_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_RELEASE_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMG_RELEASE_0100"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} onImageArrival start`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readNextImage().then(async (img: image.Image) => {
          let result = await img.release()
          console.info(`0x0000 ${tag} img.release succeeded`)
          expect(isEmpty(result)).assertTrue()
          done()
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect().assertFail()
          done()
        })
      })
    })

    /**
     * @tc.number    : testReceiverRelease0200
     * @tc.name      : SUB_MULTIMEDIA_IMG_RELEASE_0200
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.main thread create image
     *                 6.child thread release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_RELEASE_0200', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMG_RELEASE_0200"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} onImageArrival start`)
      receiver.on('imageArrival', async () => {
        console.info(`onImageArrival receiver.on start`)
        let img = await receiver.readNextImage()
        let task2: taskpool.Task = await new taskpool.Task(getRelease, img)
        taskpool.execute(task2).then((res: Object) => {
          console.info(`0x0000 ${tag} task2 success `)
        }).catch((error: BusinessError) => {
          console.info(`0x0000 ${tag} ttask2 failed `)
        })

        setTimeout(() => {
          console.info(`0x0000 ${tag} img release success `)
          try {
            img.getComponent(4).then((Component: image.Component) => {
              console.info(`0x0000 ${tag} img getComponent succeeded`)
              expect().assertFail()
              done()
            }).catch((error: BusinessError) => {
              console.info(`0x0000 ${tag} img getComponent failed`)
            })
          } catch (error) {
            console.info(`0x0000 ${tag} getComponent failed error ${error}`)
            expect(true).assertEqual(JSON.stringify(error) != null);
            done()
          }
        }, 10)
      })
    })

    /**
     * @tc.number    : testReceiverRelease0300
     * @tc.name      : SUB_MULTIMEDIA_IMG_RELEASE_0300
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readNextImage
     *                 5.main thread create image
     *                 6.child thread releas
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMG_RELEASE_0300', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_IMG_RELEASE_0300"
      let receiver = await getImageReceiver(1)
      await createPreview(cameraM, receiver)
      console.info(`0x0000 ${tag} onImageArrival start`)
      receiver.on('imageArrival', async () => {
        console.info(`onImageArrival receiver.on start`)
        let img = await receiver.readNextImage()
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/workerRelease')
        workerInstance.postMessageWithSharedSendable(img);
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`0x0000 ${tag} workerInstance receive data: ${JSON.stringify(e.data)}`)
          setTimeout(() => {
            console.info(`0x0000 ${tag} img release success `)
            try {
              img.getComponent(4).then((Component: image.Component) => {
                console.info(`0x0000 ${tag} img getComponent succeeded`)
                expect().assertFail()
                done()
              }).catch((error: BusinessError) => {
                console.info(`0x0000 ${tag} img getComponent failed`)
              })
            } catch (error) {
              console.info(`0x0000 ${tag} getComponent failed error ${error}`)
              expect(true).assertEqual(JSON.stringify(error) != null);
              done()
            }
          }, 10)
        }
        workerInstance.onmessageerror = (e: MessageEvents) => {
          console.info(`0x0000 ${tag} worker error: ${e.data}`)
          expect().assertFail()
          done()
        }
      })
    })

    /**
     * @tc.number    : testReadLatestImage0100
     * @tc.name      : SUB_MULTIMEDIA_RECEIVER_READ_LATEST_IMAGE_0100
     * @tc.desc      : 1.create receiver
     *                 2.createPreview
     *                 3.receiver on
     *                 4.readLatestImage
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_RECEIVER_READ_LATEST_IMAGE_0100', 0, async (done: Function) => {
      if(!isSupportedCameras()){
        console.info('Failed to obtain the default camera object.Not support usb camera');
        expect(true).assertTrue();
        done();
      }
      const tag: string = "SUB_MULTIMEDIA_RECEIVER_READ_LATEST_IMAGE_0100"
      let receiver = await getImageReceiver(1)
      console.info(`0x0000 ${tag} success receiver`)
      console.info(`onImageArrival start`)
      receiver.on('imageArrival', () => {
        console.info(`onImageArrival receiver.on start`)
        receiver.readLatestImage().then((img: image.Image) => {
          console.info(`0x0000 ${tag} readLatestImage success`)
          expect(isEmpty(img)).assertFalse()
          done()
        }).catch((error: BusinessError) => {
          console.error(`0x0000 ${tag} failed ${error}`)
          expect().assertFail()
          done()
        })
      })
      await createPreview(cameraM, receiver)
    })
/**
     * @tc.number    : testImageSourceCreatePixelMapSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_Sync_0100
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMapSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_Sync_0100', 0, async (done: Function) => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_PIXEL_MAP_Sync_0100';
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      await sendableImage.createPixelMap(color, opts).then(() => {
        console.info(tag + " Succeeded in creating pixel map");
        expect(true).assertTrue();
        done();
      }).catch((e: BusinessError) => {
        console.error(tag + ' Failed to create the pixel map.' + e);
        expect().assertFail();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceConvertFromPixelMap0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CONVERT_FROM_PIXEL_MAP_0100
     * @tc.desc      : 1.create imageSource
     *                 2.create PixelMapSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CONVERT_FROM_PIXEL_MAP_0100', 0, async (done: Function) => {
      const tag: string = 'SUB_MULTIMEDIA_IMAGE_SOURCE_CONVERT_FROM_PIXEL_MAP_0100';
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      let sendablePixelMap : sendableImage.PixelMap = sendableImage.convertFromPixelMap(pixelMap)
      if (sendablePixelMap != undefined) {
        console.info(tag + " Succeeded in creating pixel map");
        expect(true).assertTrue()
        done();
      } else {
          console.error(tag + ' Failed to create the pixel map.');
          expect().assertFail();
          done();
        }
    })

    /**
     * @tc.number    : testImageSourcereadPixelsToBuffer0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0100"
      const readBuffer: ArrayBuffer = new ArrayBuffer(3301488);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        pixelMap.readPixelsToBuffer(readBuffer).then(() => {
          console.info(tag + ' Succeeded in reading image pixel data.');
          expect(true).assertTrue();
          done();
        })
      })
    })

    /**
     * @tc.number    : testImageSourcereadPixelsToBuffer0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0200
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_TO_BUFFER_0200"
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean')
        if (pixelMap != undefined) {
          pixelMap.readPixelsToBuffer(readBuffer).then(() => {
            console.info(tag + ' Succeeded in reading image pixel data.');
          }).catch((error: BusinessError) => {
            console.error(tag + ` Failed to read image pixel data. errer is ${error}`);
            expect(error).assertEqual(62980115);
            done();
          })
        }
      }).catch((error: BusinessError) => {
        console.error(`0x0000 ${tag} failed ${error}`);
        expect().assertFail();
        done()
      })
    })

    /**
     * @tc.number    : testImageSourcereadPixels0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        pixelMap.readPixels(area).then(() => {
          console.info(tag + ' Succeeded in reading the image data in the area.');
          expect(true).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to read the image data in the area. error is ${error}`);
          expect().assertFail();
          done();
        })
      })
    })

  /**
     * @tc.number    : testImageSourcereadPixelsSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_PIXELS_SYNC_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        try {
          pixelMap.readPixelsSync(area);
          console.info(tag + ' Succeeded in reading the image data in the area.');
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to read the image data in the area. error is ${error}`);
          expect().assertFail();
          done();
          }
      })
    })

    /**
     * @tc.number    : testImageSourceWritePixels0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
          x: 0,
          y: 0}
      };
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let bufferArr: Uint8Array = new Uint8Array(area.pixels);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.writePixels(area);
        console.info(tag + ' Succeeded to write pixelmap into the specified area.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to write pixelmap into the specified area. error is ${error}`);
        expect().assertFail();
        done();
      }
  })

  /**
     * @tc.number    : testImageSourceWritePixelsSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_PIXELS_SYNC_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
          x: 0,
          y: 0}
      };
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let bufferArr: Uint8Array = new Uint8Array(area.pixels);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.writePixelsSync(area);
        console.info(tag + ' Succeeded to write pixelmap into the specified area.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to write pixelmap into the specified area. error is ${error}`);
        expect().assertFail();
        done();
      }
  })

  /**
     * @tc.number    : testImageSourceWriteBufferToPixelsSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_BUFFER_TO_PIXELS_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_BUFFER_TO_PIXELS_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_WRITE_BUFFER_TO_PIXELS_SYNC_0100"
      const color: ArrayBuffer = new ArrayBuffer(96);
      let bufferArr: Uint8Array = new Uint8Array(color);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.writeBufferToPixelsSync(color);
        console.info(tag + ' Succeeded in writing data from a buffer to a PixelMap.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to write data from a buffer to a PixelMap. error is ${error}`);
        expect().assertFail();
        done();
        }
    })

    /**
     * @tc.number    : testImageSourceGetImageInfoSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_IMAGE_INFO_SYNC_0100"
      const color: ArrayBuffer = new ArrayBuffer(96);
      let bufferArr: Uint8Array = new Uint8Array(color);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: 4, width: 6 }
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      if (pixelMap != undefined) {
        try {
          let imageInfo = pixelMap.getImageInfoSync();
          console.info(tag + ' Succeeded in getting image info. imageInfo is ' + imageInfo);
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to get image info. error is ${error}`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : testImageSourceGetBytesNumberPerRow0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_BYTES_NUMBER_PER_ROW_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_BYTES_NUMBER_PER_ROW_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_BYTES_NUMBER_PER_ROW_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        try {
          pixelMap.getBytesNumberPerRow();
          console.info(tag + ' Succeeded in obtaining the number of bytes in the row of the image pixel.');
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to obtain the number of bytes in the row of the image pixel. error is ${error}`);
          expect().assertFail();
          done();
          }
      })
    })

    /**
     * @tc.number    : testImageSourceGetPixelBytesNumber0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_PIXEL_BYTES_NUMBER_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_PIXEL_BYTES_NUMBER_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_PIXEL_BYTES_NUMBER_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        try {
          pixelMap.getPixelBytesNumber();
          console.info(tag + ' Succeeded in obtaining the total bytes of image pixels.');
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to obtain the total number of bytes of image pixels. error is ${error}`);
          expect().assertFail();
          done();
          }
      })
    })

    /**
     * @tc.number    : testImageSourceGetDensity0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_DENSITY_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_DENSITY_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_DENSITY_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 1, width: 2},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        try {
          let density = pixelMap.getDensity();
          console.info(tag + ' Obtaining the pixel density of the current image succeeded.');
          expect(true).assertTrue();
          done();
        } catch (error) {
          console.error(tag + ` Failed to obtain the pixel density of the current image. error is ${error}`);
          expect().assertFail();
          done();
          }
      })
    })

    /**
     * @tc.number    : testImageSourceOpacity0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0100"
      let rate: number = 0.5;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      await pixelMap.opacity(rate).then(() => {
        console.info(tag + ' Succeeded in setting the transparent ratio.');
        expect(true).assertTrue();
        done();
      }).catch((e: BusinessError) => {
        console.info(tag + ` Failed to set the transparent ratio. error is ` + e);
        expect().assertFail();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceOpacity0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0200
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0200"
      let rate: number = 1.1;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      pixelMap.opacity(rate).then(() => {
        console.info(tag + ' Succeeded in setting the transparent ratio.')
        expect(true).assertTrue();
        done();
      }).catch((e: BusinessError) => {
        console.error(tag + ` Failed to set the transparent ratio. error is ` + e);
        expect(e).assertEqual(62980115);
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceOpacity0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0300
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0300', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_OPACTIY_0300"
      let rate: number = -0.1;
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6}
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      pixelMap.opacity(rate).then(() => {
        console.info(tag + ' Succeeded in setting the transparent ratio.')
        expect(true).assertTrue();
        done();
      }).catch((e: BusinessError) => {
        console.error(tag + ` Failed to set the transparent ratio. error is ` + e);
        expect(e).assertEqual(62980115);
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceCreateAlphaPixelMap0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_ALPHA_PIXEL_MAP_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_ALPHA_PIXEL_MAP_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CREATE_ALPHA_PIXEL_MAP_0100"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6},
        alphaType: 3
      };

      let pixelMap = await sendableImage.createPixelMap(color, opts);
      let alphaPixelmap = pixelMap.createAlphaPixelmap().then((alphaPixelMap: sendableImage.PixelMap) => {
        console.info(tag + ' Succeeded in creating alpha pixelmap. AlphaPixelmap is ' + alphaPixelmap);
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to create alpha pixelmap. error is ` + error);
        expect().assertFail();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceScaleSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SCALE_SYNC_0100"
      const color = new ArrayBuffer(96);
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4,width: 6},
        scaleMode: 1
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.scaleSync(scaleX, scaleY);
        console.info(tag + ' The image is zoomed in or out.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to zoom in or out the image. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceCrop0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_0100"
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: 4, width: 6 }
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      pixelMap.crop(region).then(() => {
        console.info(tag + ' Succeeded in cropping pixelmap.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to crop pixelmap. error is ` + error);
        expect().assertFail();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceCropSync0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_SYNC_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_SYNC_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_SYNC_0100"
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: 4, width: 6 }
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.cropSync(region);
        console.info(tag + ' Succeeded in cropping pixelmap.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to crop pixelmap. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceCropSync0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_SYNC_0200
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_SYNC_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_CROP_SYNC_0200"
      let region: image.Region = { x: 0, y: 0, size: { height: 1, width: 1 } };
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: 4, width: 6 }
      };
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      try {
        pixelMap.cropSync(region);
        console.info(tag + ' Succeeded in cropping pixelmap.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to crop pixelmap. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceGetColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0100"
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap()
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceSetColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SET_COLOR_SPACE_0100"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      try {
        await pixelMap.setColorSpace(csm); 
        console.info(tag + ' Succeeded in Setting ColorSpace.');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(tag + ` Failed to set ColorSpace. error is ` + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceApplyColorSpace0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0100"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      pixelMap.applyColorSpace(targetColorSpace).then(() => {
        console.info(tag + ' Succeeded in applying color space for pixelmap object.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to apply color space for pixelmap object. code is ${error.code}, message is ${error.message}`); 
        expect().assertFail();
        done();
        })
      done();
    })

    /**
     * @tc.number    : testImageSourceApplyColorSpace0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0200
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_APPLY_COLOR_SPACE_0200"
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      let pixelMap = await imageSourceApi.createPixelMap();
      pixelMap.applyColorSpace(null!).then(() => {
        console.info(tag + ' Succeeded in applying color space for pixelmap object.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` Failed to apply color space for pixelmap object. error is ${error}`); 
        expect(error).assertEqual(62980115);
        done();
        })
      done();
    })

    /**
     * @tc.number    : testImageSourceSizeHeight0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_AND_WIDTH_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_0100"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: null!, width: null! }
      };
      try {
        await sendableImage.createPixelMap(color, opts);
        console.info(tag + " Succeeded in creating pixel map");
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(tag + ' Failed to create the pixel map.' + error);
        expect().assertFail();
        done();
      }
      done();
    })
    
    /**
     * @tc.number    : testImageSourceSizeHeight0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_AND_WIDTH_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_SIZE_HEIGHT_0100"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: { height: null!, width: null! }
      };
      try {
        await sendableImage.createPixelMap(color, opts);
        console.info(tag + " Succeeded in creating pixel map");
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(tag + ' Failed to create the pixel map.' + error);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : testImageSourceRegionSIZE0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0100"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: 0, width: 0},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        pixelMap.readPixels(area).then(() => {
          console.info(tag + ' Succeeded in reading the image data in the area.');
          expect(true).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to read the image data in the area. error is ${error}`);
          expect().assertFail();
          done();
        })
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceRegionSIZE0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0200
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0200', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_REGION_SIZE_0200"
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: {size: {height: null!, width: null!},
        x: 0,
        y: 0}
      }
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName, "uri")
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        pixelMap.readPixels(area).then(() => {
          console.info(tag + ' Succeeded in reading the image data in the area.');
          expect(true).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.error(tag + ` Failed to read the image data in the area. error is ${error}`);
          expect().assertFail();
          done();
        })
      })
      done();
    })
    
    /**
     * @tc.number    : testImageSourceIsStrideAlignment0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_IS_STRIDE_ALIGNMENT_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_IS_STRIDE_ALIGNMENT_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_IS_STRIDE_ALIGNMENT_0100"
      let fileName = 'test.webp'
      let imageSourceApi = await getImageSource(fileName);
      imageSourceApi.createPixelMap().then((pixelMap: sendableImage.PixelMap) => {
        console.info(`0x0000 ${tag} success pixelMap`);
        expect(pixelMap.isEditable).assertInstanceOf('Boolean');
        let ret = pixelMap.isStrideAlignment
        if (ret == undefined) {
          console.info("pixelMap.isStrideAlignment is undefined");
        } else {
          if (ret == false) {
            console.info("pixelMap.isStrideAlignment is false");
          } else {
            console.info("pixelMap.isStrideAlignment is true");
          }
        }
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` create imageSource failed. error is ${error}`);
        expect().assertFail();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImagePixelMapRelease0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PIXELMAP_RELEASE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAP_RELEASE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_PIXELMAP_RELEASE_0100"
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let pixelMap = await sendableImage.createPixelMap(color, opts);
      pixelMap.release().then(() => {
        console.info(tag + ' Succeeded in releasing pixelmap object.');
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(tag + `Failed to release pixelmap object. error is ${error}`);
        expect().assertFail();
        done();
        })
      done();
    })

    /**
     * @tc.number    : testImageSourceReadLatestImage0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_LATEST_IMAGE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_LATEST_IMAGE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_LATEST_IMAGE_0100"
      let size: image.Size = {
        height: 8192,
        width: 8
      }
      let receiver: sendableImage.ImageReceiver = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver.readLatestImage().then((img: image.Image) => {
          console.info(tag + ' readLatestImage succeeded.');
          expect(true).assertTrue();
          done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` readLatestImage failed. error is  ${error}`);
        expect(error).assertUndefined();
        done();
      })
      done();
    })

    /**
     * @tc.number    : testImageSourceReadNextImage0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_READ_NEXT_IMAGE_0100
     * @tc.desc      : 1.
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_READ_NEXT_IMAGE_0100', 0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_READ_NEXT_IMAGE_0100"
      let size: image.Size = {
        height: 8192,
        width: 8
      }
      let receiver: sendableImage.ImageReceiver = sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, 8);
      receiver.readNextImage().then((img: image.Image) => {
          console.info(tag + ' readNextImage  succeeded.');
          expect(true).assertTrue();
          done();
      }).catch((error: BusinessError) => {
        console.error(tag + ` readNextImage  failed. error is  ${error}`);
        expect(error).assertUndefined();
        done();
      })
      done();
    })


  })
}