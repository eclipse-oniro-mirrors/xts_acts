/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import camera from '@ohos.multimedia.camera';
import picker from '@ohos.multimedia.cameraPicker';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { UiDriver, BY } from '@ohos.UiTest'
import data from '@ohos.telephony.data'
import fileuri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import fileio from '@ohos.fileio';
import { BusinessError } from '@ohos.base'
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

const TAG = "CameraPickerTest: ";

const sleep = (delay: number) => new Promise<void>((resolve) => setTimeout(resolve, delay));

export function executePicker() : boolean {
  const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
  let context = getContext();

  let isSupportedCameras = true;
  let isExecute = false;
  let mCameraManager: camera.CameraManager;
  let mCameraDevicesArray: Array<camera.CameraDevice>;

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  console.info(TAG + 'Enter getCameraManagerInstance');
  mCameraManager = camera.getCameraManager(context);
  if (isEmpty(mCameraManager)) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  mCameraDevicesArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDevicesArray)) {
    isSupportedCameras = false;
  }
  if (cameraAvailable && isSupportedCameras) {
    isExecute = true;
  } else {
    isExecute = false;
  }
  return isExecute;
}

export function cameraPicker() {

  describe('cameraPicker', () => {
    console.info(TAG + '----------CameraPickerTest--------------');

    const driveAllowFn = async () => {
      let driver = await UiDriver.create()
      console.info(`drivePhotoFn is ${JSON.stringify(driver)}`)
      await sleep(100)
      console.info(`UiDriver start`);
      let button = await driver.findComponent(BY.text(`同意`))
      console.info(`button is ${JSON.stringify(button)}`)
      await sleep(100);
      if(button !== null){
        await button.click();
      }
    }

    const driveSafeFn = async () => {
      let driver = await UiDriver.create()
      console.info(`drivePhotoFn is ${JSON.stringify(driver)}`)
      await sleep(100)
      console.info(`UiDriver start`);
      let button = await driver.findComponent(BY.text(`知道了`))
      console.info(`button is ${JSON.stringify(button)}`)
      await sleep(100);
      if(button !== null){
        await button.click();
      }
    }

    const drivePhotoFn = async () => {
      console.info(`enter drivePhotoFn`);
      let driver = await UiDriver.create();
      console.info(`driver is ${JSON.stringify(driver)}`);
      await sleep(1000);
      console.info(`UiDriver start`);
      let button = await driver.findComponent(BY.key("COMPONENT_ID_SHUTTER_PHOTO_1"));
      console.info(`button is ${JSON.stringify(button)}`);
      await button.click();
      await sleep(2000);
      let button2 = await driver.findComponent(BY.key("COMPONENT_ID_THIRDPARTYCALL_CONFIRM_1"));
      console.info(`button is ${JSON.stringify(button2)}`);
      await button2.click();
      await sleep(1000);
    }

    const drivePhotoFrontFn = async () => {
      console.info(`enter drivePhotoFn`);
      let driver = await UiDriver.create();
      console.info(`driver is ${JSON.stringify(driver)}`);
      await sleep(1000);
      console.info(`UiDriver start`);
      let button = await driver.findComponent(BY.key("COMPONENT_ID_SHUTTER_PHOTO_1"));
      console.info(`button is ${JSON.stringify(button)}`);
      await button.click();
      await sleep(2000);
      let button2 = await driver.findComponent(BY.key("COMPONENT_ID_THIRDPARTYCALL_CONFIRM_1"));
      console.info(`button is ${JSON.stringify(button2)}`);
      await button2.click();
      await sleep(1000);
    }

    const driveVideoFn = async (videoDuration: number) => {
      console.info(`enter driveVideoFn`);
      let driver = await UiDriver.create();
      console.info(`driver is ${JSON.stringify(driver)}`);
      await sleep(1000);
      console.info(`UiDriver start`);
      let button = await driver.findComponent(BY.key("COMPONENT_ID_SHUTTER_VIDEO_1"));
      console.info(`button is ${JSON.stringify(button)}`);
      await button.click();
      if (videoDuration > 0) {
        await sleep(videoDuration * 1000);
      } else {
        await sleep(2000);
        let button2 = await driver.findComponent(BY.key("COMPONENT_ID_SHUTTER_VIDEO_END_1"));
        console.info(`button is ${JSON.stringify(button2)}`);
        await button2.click();
      }
      await sleep(2000);
      let saveButt = await driver.findComponent(BY.key("COMPONENT_ID_THIRDPARTYCALL_CONFIRM_1"));
      console.info(`button is ${JSON.stringify(saveButt)}`);
      await saveButt.click();
      await sleep(1000);
    }

    const driveVideoFrontFn = async (videoDuration: number) => {
      console.info(`enter driveVideoFn`);
      let driver = await UiDriver.create();
      console.info(`driver is ${JSON.stringify(driver)}`);
      await sleep(1000);
      console.info(`UiDriver start`);
      let button = await driver.findComponent(BY.key("COMPONENT_ID_SHUTTER_VIDEO_1"));
      console.info(`button is ${JSON.stringify(button)}`);
      await button.click();
      if (videoDuration > 0) {
        await sleep(videoDuration * 1000);
      } else {
        await sleep(2000);
        let button2 = await driver.findComponent(BY.key("COMPONENT_ID_SHUTTER_VIDEO_END_1"));
        console.info(`button is ${JSON.stringify(button2)}`);
        await button2.click();
      }
      await sleep(2000);
      let saveButt = await driver.findComponent(BY.key("COMPONENT_ID_THIRDPARTYCALL_CONFIRM_1"));
      console.info(`button is ${JSON.stringify(saveButt)}`);
      await saveButt.click();
      await sleep(1000);
    }

    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      await sleep(100);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(100);
    });
    afterAll(async () => {
      await sleep(100);
      console.info('afterAll case');
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0100
     * @tc.name      : cameraPicker takePhoto api test
     * @tc.desc      : cameraPicker takePhoto api test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0100--------------");
      let photoProfile: picker.PickerProfile = {
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK
      };
      await sleep(2000);
      picker.pick(getContext(), [picker.PickerMediaType.PHOTO, picker.PickerMediaType.VIDEO], photoProfile)
        .then(data => {
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0100 get pick result " + JSON.stringify(data));
          expect(data.resultCode).assertEqual(0);
          expect(data.mediaType).assertEqual(picker.PickerMediaType.PHOTO);
          done();
        })
        .catch((err:BusinessError)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0100 get pick error " + JSON.stringify(err));
          expect(true).assertFalse();
        });
      await sleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await drivePhotoFn();
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0100 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0101
     * @tc.name      : cameraPicker takePhoto api test
     * @tc.desc      : cameraPicker takePhoto api test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0101', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0101--------------");
      let photoProfile: picker.PickerProfile = {
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FRONT
      };
      await sleep(2000);
      picker.pick(getContext(), [picker.PickerMediaType.PHOTO, picker.PickerMediaType.VIDEO], photoProfile)
        .then(data => {
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0101 get pick result " + JSON.stringify(data));
          expect(data.resultCode).assertEqual(0);
          expect(data.mediaType).assertEqual(picker.PickerMediaType.PHOTO);
          done();
        })
        .catch((err:BusinessError)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0101 get pick error " + JSON.stringify(err));
          expect(true).assertFalse();
        });
      await sleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await drivePhotoFrontFn();
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0101 ends here");
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0102
     * @tc.name      : cameraPicker takePhoto api test
     * @tc.desc      : cameraPicker takePhoto api test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0102', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0102--------------");
      let pathDir = getContext().filesDir;
      let filePath = pathDir + `/${new Date().getTime()}.jpg}`
      fs.createRandomAccessFileSync(filePath, fs.OpenMode.CREATE);
      let uri = fileuri.getUriFromPath(filePath);
      let photoProfile: picker.PickerProfile = {
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        saveUri: uri
      };
      await sleep(2000);
      picker.pick(getContext(), [picker.PickerMediaType.PHOTO, picker.PickerMediaType.VIDEO], photoProfile)
        .then(data => {
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0102 get pick result " + JSON.stringify(data));
          expect(data.resultCode).assertEqual(0);
          expect(data.resultUri).assertEqual(uri);
          expect(data.mediaType).assertEqual(picker.PickerMediaType.PHOTO);
          done();
        })
        .catch((err:BusinessError)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0102 get pick error " + JSON.stringify(err));
          expect(true).assertFalse();
        });
      await sleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await drivePhotoFn();
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0102 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0103
     * @tc.name      : cameraPicker takePhoto api test
     * @tc.desc      : cameraPicker takePhoto api test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0103', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0103--------------");
      let uri: string = "fail_string";
      let photoProfile: picker.PickerProfile = {
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        saveUri: uri
      };
      await sleep(2000);
      picker.pick(getContext(), [picker.PickerMediaType.PHOTO, picker.PickerMediaType.VIDEO], photoProfile)
        .then(data => {
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0103 get pick result " + JSON.stringify(data));
          expect(data.resultCode).assertLess(0);
          done();
        })
        .catch((err:BusinessError)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0103 get pick error " + JSON.stringify(err));
          expect(true).assertFalse();
        });
      await sleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await drivePhotoFn();
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_0103 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0100
     * @tc.name      : cameraPicker takePhoto api test
     * @tc.desc      : cameraPicker takePhoto api test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0100--------------");
      let videoDuration = 2;
      let videoProfile: picker.PickerProfile = {
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
        videoDuration: videoDuration
      };
      await sleep(2000);
      picker.pick(getContext(), [picker.PickerMediaType.VIDEO], videoProfile)
        .then(data => {
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0100 get pick result " + JSON.stringify(data));
          expect(data.resultCode).assertEqual(0);
          expect(data.mediaType).assertEqual(picker.PickerMediaType.VIDEO);
          done();
        })
        .catch((err:BusinessError)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0100 get pick error " + JSON.stringify(err));
          expect(true).assertFalse();
        });
      await sleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await driveVideoFn(videoDuration);
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0100 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0101
     * @tc.name      : cameraPicker takePhoto api test
     * @tc.desc      : cameraPicker takePhoto api test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0101', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0101--------------");
      let videoProfile: picker.PickerProfile = {
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_BACK,
      };
      await sleep(2000);
      picker.pick(getContext(), [picker.PickerMediaType.VIDEO], videoProfile)
        .then(data => {
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0101 get pick result " + JSON.stringify(data));
          expect(data.resultCode).assertEqual(0);
          expect(data.mediaType).assertEqual(picker.PickerMediaType.VIDEO);
          done();
        })
        .catch((err:BusinessError)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0101 get pick error " + JSON.stringify(err));
          expect(true).assertFalse();
        });
      await sleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await driveVideoFn(0);
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0101 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0102
     * @tc.name      : cameraPicker takePhoto api test
     * @tc.desc      : cameraPicker takePhoto api test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0102', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0102--------------");
      let videoDuration = 2;
      let videoProfile: picker.PickerProfile = {
        cameraPosition: camera.CameraPosition.CAMERA_POSITION_FRONT,
        videoDuration: videoDuration
      };
      await sleep(2000);
      picker.pick(getContext(), [picker.PickerMediaType.VIDEO], videoProfile)
        .then(data => {
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0102 get pick result " + JSON.stringify(data));
          expect(data.resultCode).assertEqual(0);
          expect(data.mediaType).assertEqual(picker.PickerMediaType.VIDEO);
          done();
        })
        .catch((err:BusinessError)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0102 get pick error " + JSON.stringify(err));
          expect(true).assertFalse();
        });
      await sleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await driveVideoFrontFn(videoDuration);
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_0102 ends here");
    });
  })
}