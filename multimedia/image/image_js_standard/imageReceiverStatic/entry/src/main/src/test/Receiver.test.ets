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

import image from "@ohos.multimedia.image";
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach, Hypium} from '../../../hypium/index';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs'
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';
import hilog from '@ohos.hilog';
import { initialize } from './AbilityContextHelper.test';
import camera from '@ohos.multimedia.camera';
import Context from "application.Context"
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import Utils from './Util.test';

const Tag: string = 'ImageReceiver: ';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ImageReceiver'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

const WIDTH = 8192;
const HEIGHT = 8;
const CAPACITY = 8;
const RGBA = 12;
const Jpg_Stride = 1;
const DEVICE_CODE = 801;
const FORMATJPEG = image.ImageFormat.JPEG;

function isString(value: string|undefined) {
  return typeof value === "string";
}

function initCamera(testNum: string, cameraManager: camera.CameraManager, surfaceId1: string, surfaceId2: string) {
  let cameras = cameraManager.getSupportedCameras();
  if (!cameras) {
    console.log(`${testNum} initCamera getSupportedCameras failed!`);
    return;
  }
  let cameraInput = cameraManager.createCameraInput(cameras[0]);
  if (!cameraInput) {
    console.log(`${testNum} initCamera createCameraInput failed!`);
    return;
  }
  waitForCompletion(async () => {await cameraInput.open();})
  let capability: camera.CameraOutputCapability =
    cameraManager.getSupportedOutputCapability(cameras[0], camera.SceneMode.NORMAL_VIDEO);
  if (!capability) {
    console.log(`${testNum} initCamera getSupportedOutputCapability failed!`);
    return;
  }
  let previewProfile: camera.Profile = capability.previewProfiles[0];
  let imageWidth = previewProfile.size.width;
  let imageHeight = previewProfile.size.height;
  console.log(`${testNum} initCamera imageWidth:${imageWidth} imageHeight:${imageHeight}`);
  let previewOutput1 = cameraManager.createPreviewOutput(previewProfile, surfaceId1);
  if (!previewOutput1) {
    console.log(`${testNum} initCamera createPreviewOutput1 failed!`);
    return;
  }
  let previewOutput2 = cameraManager.createPreviewOutput(previewProfile, surfaceId2);
  if (!previewOutput2) {
    console.log(`${testNum} initCamera createPreviewOutput2 failed!`);
    return;
  }
  let tmpSession = cameraManager.createSession<camera.VideoSession>(camera.SceneMode.NORMAL_VIDEO);
  let session = tmpSession as camera.VideoSession;
  if (!session) {
    console.log(`${testNum} initCamera createSession failed!`);
    return;
  }
  console.log(`${testNum} initCamera beginConfig!`);
  session.beginConfig();
  session.addInput(cameraInput);
  session.addOutput(previewOutput1);
  session.addOutput(previewOutput2);
  waitForCompletion(async () => {await session.commitConfig();})
  waitForCompletion(async () => {await session.start();})
  console.log(`${testNum} initCamera initCamera Finished!`);
}

export default function ImageReceiver() {
  let filesDir: string | undefined | null;
  let cacheDir: string | undefined | null;
  let context: common.UIAbilityContext;
  let globalReceiver1: image.ImageReceiver | undefined = undefined;
  let globalReceiver2: image.ImageReceiver | undefined = undefined;
  let globalImg: image.Image | undefined = undefined;
  let globalSize: image.Size = {
    height: HEIGHT,
    width: WIDTH
  }
  let cameraManager: camera.CameraManager | undefined;

  describe("ImageReceiver", (): void => {
    beforeAll(async () => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      cacheDir = Hypium.get('cacheDir') as string | undefined | null;
      context = Hypium.get("context") as common.UIAbilityContext;

      try {
        hilog.info(domain, tag, '%{public}s', ' beforeAll start');
        await Utils.msSleep(2000);
        hilog.info(domain, tag, " uitestOnTest loadup over!!!!!")
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.CAMERA')
        atManager.requestPermissionsFromUser(context, arr,
          (err: BusinessError | null, data: PermissionRequestResult | undefined) => {
            hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
            hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
          });
        let driver = Driver.create();
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000)
        if (permissionButton != null) {
          await permissionButton.click();
        }

        cameraManager = camera.getCameraManager(context);
        if (!cameraManager) {
          console.log("initCamera getCameraManager failed!");
          return;
        }
      } catch (err) {
        hilog.error(0x0000, 'testTag', ' beforeAll failed, err: ' + err);
      }
    })

    afterEach(async () => {
      if (globalImg != undefined) {
        console.info("globalImg release start");
        try {
          await globalImg!.release();
        } catch (error) {
          console.info("globalImg release fail");
        }
      }
      if (globalReceiver1 != undefined) {
        console.info("globalReceiver1 release start");
        try {
          await globalReceiver1!.release();
        } catch (error) {
          console.info("globalReceiver1 release fail");
        }
      }
      if (globalReceiver2 != undefined) {
        console.info("globalReceiver2 release start");
        try {
          await globalReceiver2!.release();
        } catch (error) {
          console.info("globalReceiver2 release fail");
        }
      }
      await Utils.msSleep(1000);
      console.info("afterEach case");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_WITH_SIZE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_WITH_SIZE_STATIC_0100
     * @tc.desc   createImageReceiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_WITH_SIZE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver = image.createImageReceiver(globalSize, image.ImageFormat.JPEG, CAPACITY);
      globalReceiver1 = receiver;
      expect(receiver != undefined).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_STATIC_0100
     * @tc.desc   createImageReceiver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_CREATEIMAGERECEIVER_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver == undefined) {
        expect(false).assertTrue();
        console.info("receiver_001 undefined");
        done();
      } else {
        globalReceiver1 = receiver;
        expect(receiver.size.width == WIDTH).assertTrue();
        expect(receiver.size.height == HEIGHT).assertTrue();
        expect(receiver.capacity == CAPACITY).assertTrue();
        expect(receiver.format == FORMATJPEG).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_STATIC_0100
     * @tc.desc   getReceivingSurfaceId-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver != undefined) {
        globalReceiver1 = receiver;
        try {
          let id = await receiver.getReceivingSurfaceId()
          console.info(
            "SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_STATIC_0100 getReceivingSurfaceId [" +
              id +
              "]"
          );
          expect(isString(id)).assertTrue();
          done();
        } catch (error) {
          console.log("SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_PROMISE_STATIC_0100 error: " + error);
          expect(false).assertTrue();
          done();
        }
      } else {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_STATIC_0100
     * @tc.desc   getReceivingSurfaceId-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver != undefined) {
        globalReceiver1 = receiver;
        receiver.getReceivingSurfaceId((err, id) => {
          console.info(
            "SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_STATIC_0100 getReceivingSurfaceId call back [" +
              id +
              "]"
          );
          expect(isString(id)).assertTrue();
          done();
        });
      } else {
        expect(false).assertTrue();
        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_GETRECEIVINGSURFACEID_CALLBACK_STATIC_0100 finished");
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_STATIC_0100
     * @tc.desc   release-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver != undefined) {
        globalReceiver1 = receiver;
        try {
          receiver.release();
          console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_STATIC_0100 release ");
          done();
        } catch (error) {
          expect(false).assertTrue();
          done();
        }
      } else {
        expect(false).assertTrue();
        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_PROMISE_STATIC_0100 finished");
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_STATIC_0100
     * @tc.desc   release-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver != undefined) {
        globalReceiver1 = receiver;
        receiver.release((err: BusinessError | null) => {
          if (err && err.code) {
            expect(false).assertTrue();
            console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_STATIC_0100 release fail");
            done();
          } else {
            console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_STATIC_0100 release call back");
            done();
          }
        });
      } else {
        expect(false).assertTrue();
        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_RELEASE_CALLBACK_STATIC_0100 finished");
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_ON_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_ON_STATIC_0100
     * @tc.desc   on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_ON_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver1 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      let receiver2 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver1 == undefined || receiver2 == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_ON_STATIC_0100 failed! receiver is undefined!");
        expect(false).assertTrue();
        done();
      } else {
        globalReceiver1 = receiver1;
        globalReceiver2 = receiver2;

        try {
          let surfaceId1 = await receiver1.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_ON_STATIC_0100 surfaceId1[${surfaceId1}]`);
          let surfaceId2 = await receiver2.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_ON_STATIC_0100 surfaceId2[${surfaceId2}]`);

          receiver1.onImageArrival(() => {
            console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_ON_STATIC_0100 on [ENTER]!");
            done();
          });

          initCamera('SUB_MULTIMEDIA_IMAGE_RECEIVER_ON_STATIC_0100', cameraManager!, surfaceId1, surfaceId2);
        } catch (error) {
          console.log(`SUB_MULTIMEDIA_IMAGE_RECEIVER_ON_STATIC_0100 errorCode:${error.code}, errorName:${error.name}, errorMessage:${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_STATIC_0100
     * @tc.desc   off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_STATIC_0100 failed! receiver is undefined!");
        expect(false).assertTrue();
        done();
      } else {
        globalReceiver1 = receiver;

        try {
          receiver.offImageArrival();
          done();
        } catch (error) {
          console.log(`SUB_MULTIMEDIA_IMAGE_RECEIVER_OFF_STATIC_0100 errorCode:${error.code}, errorName:${error.name}, errorMessage:${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100
     * @tc.desc   readLatestImage-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver1 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      let receiver2 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver1 == undefined || receiver2 == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100 failed! receiver is undefined!");
        expect(false).assertTrue();
        done();
      } else {
        globalReceiver1 = receiver1;
        globalReceiver2 = receiver2;

        try {
          let surfaceId1 = await receiver1.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100 surfaceId1[${surfaceId1}]`);
          let surfaceId2 = await receiver2.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100 surfaceId2[${surfaceId2}]`);

          receiver1.onImageArrival(() => {
            console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100 on [ENTER]!");
            let latestImage: image.Image | undefined;
            waitForCompletion(async () => {latestImage = await receiver1!.readLatestImage();})
            globalImg = latestImage;
            if (latestImage != undefined) {
              console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100 latestImage size: (${latestImage!.size.width}, ${latestImage!.size.height})`);
              expect(latestImage != undefined).assertTrue();
              done();
            } else {
              console.log("SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100 readLatestImage failed");
              expect(false).assertTrue();
              done();
            }
          });

          initCamera('SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100', cameraManager!, surfaceId1, surfaceId2);
        } catch (error) {
          console.log(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_PROMISE_STATIC_0100 errorCode:${error.code}, errorName:${error.name}, errorMessage:${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100
     * @tc.desc   readLatestImage-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver1 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      let receiver2 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver1 == undefined || receiver2 == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100 failed! receiver is undefined!");
        expect(false).assertTrue();
        done();
      } else {
        globalReceiver1 = receiver1;
        globalReceiver2 = receiver2;

        try {
          let surfaceId1 = await receiver1.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100 surfaceId1[${surfaceId1}]`);
          let surfaceId2 = await receiver2.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100 surfaceId2[${surfaceId2}]`);

          receiver1.onImageArrival(() => {
            console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100 on [ENTER]!");
            receiver1.readLatestImage((err: BusinessError | null, latestImage: image.Image | undefined) => {
              globalImg = latestImage!;
              console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100 readLatestImage [ENTER]!");
              if ((err && err.code) || latestImage === undefined) {
                console.log("SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100 readLatestImage failed");
                expect(false).assertTrue();
                done();
              } else {
                console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100 latestImage size: (${latestImage.size.width}, ${latestImage.size.height})`);
                expect(latestImage != undefined).assertTrue();
                done();
              }
            });
          });

          initCamera('SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100', cameraManager!, surfaceId1, surfaceId2);
        } catch (error) {
          console.log(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READLATESTIMAGE_CALLBACK_STATIC_0100 errorCode:${error.code}, errorName:${error.name}, errorMessage:${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100
     * @tc.desc   readNextImage-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver1 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      let receiver2 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver1 == undefined || receiver2 == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100 failed! receiver is undefined!");
        expect(false).assertTrue();
        done();
      } else {
        globalReceiver1 = receiver1;
        globalReceiver2 = receiver2;

        try {
          let surfaceId1 = await receiver1.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100 surfaceId1[${surfaceId1}]`);
          let surfaceId2 = await receiver2.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100 surfaceId2[${surfaceId2}]`);

          receiver1.onImageArrival(() => {
            console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100 on [ENTER]!");
            let nextImage: image.Image | undefined;
            waitForCompletion(async () => {nextImage = await receiver1!.readNextImage();})
            globalImg = nextImage;
            if (nextImage != undefined) {
              console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100 nextImage size: (${nextImage!.size.width}, ${nextImage!.size.height})`);
              expect(nextImage != undefined).assertTrue();
              done();
            } else {
              console.log("SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100 readNextImage failed");
              expect(false).assertTrue();
              done();
            }
          });

          initCamera('SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100', cameraManager!, surfaceId1, surfaceId2);
        } catch (error) {
          console.log(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_PROMISE_STATIC_0100 errorCode:${error.code}, errorName:${error.name}, errorMessage:${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100
     * @tc.desc   readNextImage-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receiver1 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      let receiver2 = image.createImageReceiver(globalSize, FORMATJPEG, CAPACITY);
      if (receiver1 == undefined || receiver2 == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100 failed! receiver is undefined!");
        expect(false).assertTrue();
        done();
      } else {
        globalReceiver1 = receiver1;
        globalReceiver2 = receiver2;

        try {
          let surfaceId1 = await receiver1.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100 surfaceId1[${surfaceId1}]`);
          let surfaceId2 = await receiver2.getReceivingSurfaceId();
          console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100 surfaceId2[${surfaceId2}]`);

          receiver1.onImageArrival(() => {
            console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100 on [ENTER]!");
            receiver1.readNextImage((err: BusinessError | null, nextImage: image.Image | undefined) => {
              console.info("SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100 readNextImage [ENTER]!");
              if ((err && err.code) || nextImage === undefined) {
                console.log("SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100 readNextImage failed");
                expect(false).assertTrue();
                done();
              } else {
                globalImg = nextImage;
                console.info(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100 nextImage size: (${nextImage.size.width}, ${nextImage.size.height})`);
                expect(nextImage != undefined).assertTrue();
                done();
              }
            });
          });

          initCamera('SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100', cameraManager!, surfaceId1, surfaceId2);
        } catch (error) {
          console.log(`SUB_MULTIMEDIA_IMAGE_RECEIVER_READNEXTIMAGE_CALLBACK_STATIC_0100 errorCode:${error.code}, errorName:${error.name}, errorMessage:${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }
    });

  });
}
