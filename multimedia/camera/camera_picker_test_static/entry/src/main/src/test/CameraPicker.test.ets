/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import picker from '@ohos.multimedia.cameraPicker';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level} from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import Context from "application.Context";
import Utils  from './Util.test';
import hilog from '@ohos.hilog';
// import { canIUse } from "@internal.full.global"

const TAG: string = "CameraPickerTest: ";
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
export function executePicker() : boolean {
  // const cameraAvailable: boolean = canIUse('SystemCapability.Multimedia.Camera.Core');
  const cameraAvailable: boolean = true;

  let isSupportedCameras = true;
  let isExecute = false;
  let mCameraManager: cameraObj.CameraManager;
  let mCameraDevicesArray: Array<cameraObj.CameraDevice>;

  console.info(TAG + '  Enter getCameraManagerInstance');
  let appContext: Context = Hypium.get("Context") as Context;
  mCameraManager = cameraObj.getCameraManager(appContext);
  if (mCameraManager == undefined) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  mCameraDevicesArray = mCameraManager.getSupportedCameras();
  if (mCameraDevicesArray == undefined) {
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

    const driveAllowFn = async (): Promise<void> => {
      try {
        console.info(`  driveAllowFn start`); 
        let dr = Driver.create();
        await Utils.msSleep(100)
        console.info(`UiDriver start`); //允许 or 同意 待测试
        let permissionButton = await dr.findComponent(ON.text('同意'));
        await Utils.msSleep(100);
        if (permissionButton != null) {
          await permissionButton.click();
        }
      } catch (err) {
        console.error("  driveAllowFn error: " + err);
      }
    }

    const driveSafeFn = async (): Promise<void> => {
      try {
        console.info(`  driveSafeFn start`); 
        let dr = Driver.create();
        await Utils.msSleep(100)
        console.info(`UiDriver start`); //允许 or 知道了 待测试
        let permissionButton = await dr.findComponent(ON.text('知道了'));
        await Utils.msSleep(100);
        if (permissionButton != null) {
          await permissionButton.click();
        }
      } catch (err) {
        console.error("  driveSafeFn error: " + err);
      }
    }

    let drivePhotoFn = async (): Promise<void> => {
      try {
        console.info(`  drivePhotoFn start`); 
        let dr = Driver.create();
        await Utils.msSleep(1000);
        if (dr == null) {
          console.error("  drivePhotoFn error: Driver.create() returned null");
        }
        console.error("  drivePhotoFn begin find permissionButton");
        let permissionButton = await dr.findComponent(ON.id("COMPONENT_ID_SHUTTER_PHOTO_1"));
        if (permissionButton != null) {
          console.error("  drivePhotoFn permissionButton is not null");
          await permissionButton.click();
        } else {
          console.error("  drivePhotoFn error: permissionButton is null");
        }
        await Utils.msSleep(5000);
          console.error("  drivePhotoFn begin find permissionButton1");
        let permissionButton1 = await dr.findComponent(ON.id("COMPONENT_ID_THIRDPARTYCALL_CONFIRM_1"));
        if (permissionButton1 != null) {
          console.error("  drivePhotoFn permissionButton1 is not null");
          await permissionButton1.click();
        } else {
          console.error("  drivePhotoFn error: permissionButton1 is null");
        }
        await Utils.msSleep(1000);
      } catch (err) {
        console.error("  drivePhotoFn error: " + err);
      }
    }

    const drivePhotoFrontFn = async (): Promise<void> => {
      try {
        console.info(`  drivePhotoFrontFn start`); 
        let dr = Driver.create();
        await Utils.msSleep(1000);
        console.info(`UiDriver start`);
        let permissionButton = await dr.findComponent(ON.id("COMPONENT_ID_SHUTTER_PHOTO_1"));
        if (permissionButton != null) {
          await permissionButton.click();
        }
        await Utils.msSleep(5000);
        let permissionButton1 = await dr.findComponent(ON.id("COMPONENT_ID_THIRDPARTYCALL_CONFIRM_1"));
        if (permissionButton1 != null) {
          await permissionButton1.click();
        }
        await Utils.msSleep(1000);
      } catch (err) {
        console.error("  drivePhotoFrontFn error: " + err);
      }
    }

    const driveVideoFn = async (videoDuration: int): Promise<void> => {
      console.info(`  driveVideoFn start`); 
      let dr = Driver.create();
      await Utils.msSleep(1000);
      console.info(`UiDriver start`);
      let permissionButton = await dr.findComponent(ON.id("COMPONENT_ID_SHUTTER_VIDEO_1"));
      if (permissionButton != null) {
        await permissionButton.click();
      }
      if (videoDuration > 0) {
        await Utils.msSleep(videoDuration * 1000);
      } else {
        await Utils.msSleep(5000);
        let permissionButton1 = await dr.findComponent(ON.id("COMPONENT_ID_SHUTTER_VIDEO_END_1"));
        if (permissionButton1 != null) {
          await permissionButton1.click();
        }
      }
      await Utils.msSleep(5000);
      let permissionButton2 = await dr.findComponent(ON.id("COMPONENT_ID_THIRDPARTYCALL_CONFIRM_1"));
      if (permissionButton2 != null) {
        await permissionButton2.click();
      }
      await Utils.msSleep(1000);
    }

    const driveVideoFrontFn = async (videoDuration: int): Promise<void> => {
      console.info(`  driveVideoFrontFn start`); 
      let dr = Driver.create();
      await Utils.msSleep(1000);
      console.info(`UiDriver start`);
      let permissionButton = await dr.findComponent(ON.id("COMPONENT_ID_SHUTTER_VIDEO_1"));
      if (permissionButton != null) {
        await permissionButton.click();
      }
      if (videoDuration > 0) {
        await Utils.msSleep(videoDuration * 1000);
      } else {
        await Utils.msSleep(5000);
        let permissionButton1 = await dr.findComponent(ON.id("COMPONENT_ID_SHUTTER_VIDEO_END_1"));
        if (permissionButton1 != null) {
          await permissionButton1.click();
        }
      }
      await Utils.msSleep(5000);
      let permissionButton2 = await dr.findComponent(ON.id("COMPONENT_ID_THIRDPARTYCALL_CONFIRM_1"));
      if (permissionButton2 != null) {
        await permissionButton2.click();
      }
      await Utils.msSleep(1000);
    }
    let appContext: Context | null = null;
    beforeAll(() => {
      try {
        console.info('  picker beforeAll start');
        appContext = Hypium.get("Context") as Context;
        await Utils.msSleep(2000);
        console.info('  picker beforeAll case');
      } catch (err) {
        console.error('  picker beforeAll error: ' + err);
      }
    });
    beforeEach(() => {
      await Utils.msSleep(100);
      console.info('  picker beforeEach case');
    });
    afterEach(() => {
      console.info('  picker afterEach case');
      await Utils.msSleep(3000);
    });
    afterAll(() => {
      await Utils.msSleep(100);
      console.info('  picker afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0100
     * @tc.desc   cameraPicker takePhoto api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0100--------------");
      let photoProfile: picker.PickerProfile = {
        cameraPosition: cameraObj.CameraPosition.CAMERA_POSITION_BACK
      };
      await Utils.msSleep(2000);
      picker.pick(appContext!, [picker.PickerMediaType.PHOTO, picker.PickerMediaType.VIDEO], photoProfile)
        .then((data: picker.PickerResult) => {
          hilog.info(domain, TAG, "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0100 get pick result " + JSON.stringify(data));
          expect(data.resultCode == 0).assertTrue();
          expect(data.mediaType == picker.PickerMediaType.PHOTO).assertTrue();
          done();
        })
        .catch((err:Error)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0100 get pick error " + err);
          expect(true).assertFalse();
        });
      await Utils.msSleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await drivePhotoFn();
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0100 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0101
     * @tc.number SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0101
     * @tc.desc   cameraPicker takePhoto api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0101--------------");
      let photoProfile: picker.PickerProfile = {
        cameraPosition: cameraObj.CameraPosition.CAMERA_POSITION_FRONT
      };
      await Utils.msSleep(2000);
      picker.pick(appContext!, [picker.PickerMediaType.PHOTO, picker.PickerMediaType.VIDEO], photoProfile)
        .then((data: picker.PickerResult) => {
          hilog.info(domain, TAG, "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0101 get pick result " + JSON.stringify(data));
          expect(data.resultCode == 0).assertTrue();
          expect(data.mediaType == picker.PickerMediaType.PHOTO).assertTrue();
          done();
        })
        .catch((err:Error)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0101 get pick error " + err);
          expect(true).assertFalse();
        });
      await Utils.msSleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await drivePhotoFrontFn();
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0101 ends here");
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0102
     * @tc.number SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0102
     * @tc.desc   cameraPicker takePhoto api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0102--------------");
      let pathDir = appContext!.filesDir;
      let filePath = pathDir + `/${new Date().getTime()}.jpg}`
      fs.createRandomAccessFileSync(filePath, fs.OpenMode.CREATE);
      let uri = fileUri.getUriFromPath(filePath);
	  expect(uri != null).assertTrue();
      let photoProfile: picker.PickerProfile = {
        cameraPosition: cameraObj.CameraPosition.CAMERA_POSITION_BACK,
        saveUri: uri
      };
      await Utils.msSleep(2000);
      picker.pick(appContext!, [picker.PickerMediaType.PHOTO, picker.PickerMediaType.VIDEO], photoProfile)
        .then((data: picker.PickerResult) => {
          hilog.info(domain, TAG, "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0102 get pick result " + JSON.stringify(data));
          expect(data.resultCode == 0).assertTrue();
          expect(data.resultUri == uri).assertTrue();
          expect(data.mediaType == picker.PickerMediaType.PHOTO).assertTrue();
          done();
        })
        .catch((err:Error)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0102 get pick error " + err);
          expect(true).assertFalse();
        });
      await Utils.msSleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await drivePhotoFn();
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0102 ends here");
    });

    // /**
    //  * @tc.number    : SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103
    //  * @tc.name      : SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103
    //  * @tc.desc      : cameraPicker takePhoto api test
    //  * @tc.size      : MEDIUM
    //  * @tc.type      : Function
    //  * @tc.level     : Level 1
    //  */
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103
     * @tc.number SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103
     * @tc.desc   SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103--------------");
    //   let uri: string = "fail_string";
    //   let photoProfile: picker.PickerProfile = {
    //     cameraPosition: cameraObj.CameraPosition.CAMERA_POSITION_BACK,
    //     saveUri: uri
    //   };
    //   await Utils.msSleep(2000);
    //   picker.pick(appContext!, [picker.PickerMediaType.PHOTO, picker.PickerMediaType.VIDEO], photoProfile)
    //     .then((data: picker.PickerResult) => {
    //       hilog.info(domain, TAG, "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103 get pick result " + JSON.stringify(data));
    //       expect(data.resultCode < 0).assertTrue();
    //       done();
    //     })
    //     .catch((err:Error)=>{
    //       console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103 get pick error " + err);
    //       expect(true).assertFalse();
    //     });
    //   await Utils.msSleep(1000);
    //   await driveAllowFn();
    //   await driveSafeFn();
    //   await drivePhotoFn();
    //   console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_TAKEPHOTO_STATIC_0103 ends here");
    // });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0100
     * @tc.desc   cameraPicker takePhoto api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0100--------------");
      let videoDuration: int = 2;
      let videoProfile: picker.PickerProfile = {
        cameraPosition: cameraObj.CameraPosition.CAMERA_POSITION_BACK,
        videoDuration: videoDuration
      };
      await Utils.msSleep(2000);
      picker.pick(appContext!, [picker.PickerMediaType.VIDEO], videoProfile)
        .then((data: picker.PickerResult) => {
          hilog.info(domain, TAG, "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0100 get pick result " + JSON.stringify(data));
          expect(data.resultCode == 0).assertTrue();
          expect(data.mediaType == picker.PickerMediaType.VIDEO).assertTrue();
          done();
        })
        .catch((err:Error)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0100 get pick error " + err);
          expect(true).assertFalse();
        });
      await Utils.msSleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await driveVideoFn(videoDuration);
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0100 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0101
     * @tc.number SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0101
     * @tc.desc   cameraPicker takePhoto api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0101--------------");
      let videoProfile: picker.PickerProfile = {
        cameraPosition: cameraObj.CameraPosition.CAMERA_POSITION_BACK,
      };
      await Utils.msSleep(2000);
      picker.pick(appContext!, [picker.PickerMediaType.VIDEO], videoProfile)
        .then((data: picker.PickerResult) => {
          hilog.info(domain, TAG, "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0101 get pick result " + JSON.stringify(data));
          expect(data.resultCode == 0).assertTrue();
          expect(data.mediaType == picker.PickerMediaType.VIDEO).assertTrue();
          done();
        })
        .catch((err:Error)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0101 get pick error " + err);
          expect(true).assertFalse();
        });
      await Utils.msSleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await driveVideoFn(0);
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0101 ends here");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0102
     * @tc.number SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0102
     * @tc.desc   cameraPicker takePhoto api test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0102--------------");
      let videoDuration: int  = 2;
      let videoProfile: picker.PickerProfile = {
        cameraPosition: cameraObj.CameraPosition.CAMERA_POSITION_FRONT,
        videoDuration: videoDuration
      };
      await Utils.msSleep(2000);
      picker.pick(appContext!, [picker.PickerMediaType.VIDEO], videoProfile)
        .then((data: picker.PickerResult) => {
          hilog.info(domain, TAG, "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0102 get pick result " + JSON.stringify(data));
          expect(data.resultCode == 0).assertTrue();
          expect(data.mediaType == picker.PickerMediaType.VIDEO).assertTrue();
          done();
        })
        .catch((err:Error)=>{
          console.log("SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0102 get pick error " + err);
          expect(true).assertFalse();
        });
      await Utils.msSleep(1000);
      await driveAllowFn();
      await driveSafeFn();
      await driveVideoFrontFn(videoDuration);
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PICKER_USECASS_RECORDVIDEO_STATIC_0102 ends here");
    });
  })
}