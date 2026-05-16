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

import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { camera } from '@kit.CameraKit';
import { indexSurfaceId } from '../../testability/pages/Index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import { colorSpaceManager } from '@kit.ArkGraphics2D';
import { cameraErrorCode, getEnumMaxValue, getEnumValueList, getPermission, driveFn } from '../common';

const TAG = "CameraXts.createCameraInputTest";
let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.PhotoSession;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput | null = null;
let mPhotoOutput: cameraObj.PhotoOutput | null = null;
let mPhotoSurface: string;
let receiver: image.ImageReceiver;
let power: ESObject;
let context = getContext();
let dr = Driver.create();


let sleep = (ms: number = 66): Promise<string> => {
    return new Promise((resolve) => {
      setTimeout(() => { resolve(''); }, ms)
    })
}

let isEmpty = (data: ESObject) => {
  if (data == null || data == undefined) { return true; }
  return false;
}

let createInput = async (idx: number) => {
  mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
  if (isEmpty(mCameraInput)) { return false; }
  await mCameraInput.open();
  await sleep(100);
  return true;
}

let createCameraSessionInstance = () => {
  try {
    mCameraSession = mCameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO) as cameraObj.PhotoSession;
  } catch { console.info(TAG + 'createSession FAILED'); }
  if (isEmpty(mCameraSession)) { return false; }
  return true;
}

let createOutput = (idx: number) => {
  let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx],
    cameraObj.SceneMode.NORMAL_PHOTO);
  if (!isEmpty(cameraOutputCap)) {
    if (!isEmpty(cameraOutputCap.previewProfiles)) {
      for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
        mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], indexSurfaceId);
        if (!isEmpty(mPreviewOutput)) { break; }
      }
    }
    if (!isEmpty(cameraOutputCap.photoProfiles)) {
      for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
        mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i], mPhotoSurface);
        if (!isEmpty(mPhotoOutput)) { break; }
      }
    }
  }
  return true;
}

let getCameraManagerInstance = () => {
  mCameraManager = cameraObj.getCameraManager(context);
  if (isEmpty(mCameraManager)) { return false; }
  return true;
}

let getCameraSupportDevicesArray = () => {
  mCameraDevicesArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDevicesArray)) { return false; }
  mCameraNum = mCameraDevicesArray.length;
  return true;
}

let startCameraSession = async (idx: number) => {
    await createInput(idx);
    createOutput(idx);
    await sleep(1);
    mCameraSession.beginConfig();
    if (!isEmpty(mCameraInput)) { mCameraSession.addInput(mCameraInput); }
    if (!isEmpty(mPreviewOutput)) { mCameraSession.addOutput(mPreviewOutput!); }
    if (!isEmpty(mPhotoOutput)) { mCameraSession.addOutput(mPhotoOutput!); }
    await sleep(30);
    await mCameraSession.commitConfig();
    await sleep(50);
    await mCameraSession.start();
    await sleep(100);
    return true;
}

let ability = async () => {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName
  const want: Want = { bundleName: bundleName, abilityName: 'TestAbility' }
  await delegator.startAbility(want)
  await sleep(1000)
}

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

let getPhotoReceiverSurface = async () => {
  console.info(TAG + 'Entering getPhotoReceiverSurface');
  receiver = image.createImageReceiver(640, 480, 4, 8);
  if (receiver !== undefined) {
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.info(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.info(TAG + 'Photo receiver is created failed');
  }
}

export default function colorManagementTest() {
    describe('colorManagementTest', () => {
      beforeAll(async () => {
        await sleep(100);
        await getPhotoReceiverSurface();
        if (receiver !== undefined) {
          receiver.on('imageArrival', () => {
            receiver.readNextImage((err: BusinessError, img: image.Image) => {
              if (img !== undefined) { img.release(); }
            });
          });
        }
        console.info(TAG + 'beforeAll case');
        await ability();
        getCameraManagerInstance();
        getCameraSupportDevicesArray();
        await getPermission();
        await driveFn();
      });
  
      beforeEach(() => {
        console.info(TAG, 'beforeEach case.');
      });
  
      afterEach(() => {
        console.info(TAG, 'afterEach case.');
      });
  
      afterAll(() => {
        console.info(TAG, 'afterAll case.');
      });

      // ══════════════════════════════════════════════════════════
      //  getActiveColorSpace(): colorSpaceManager.ColorSpace
      // ══════════════════════════════════════════════════════════

      /**
       * @tc.name   SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0100
       * @tc.number SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0100
       * @tc.desc   Create photo session setColorSpace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0100', Level.LEVEL2, async (done: Function) => {
        let testNum = 'SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0100';
        if (mCameraNum == 0) {
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance();
        await startCameraSession(0);
        let colorSpaces: Array<colorSpaceManager.ColorSpace> = [];
        let currentColorSpace: colorSpaceManager.ColorSpace | undefined = undefined;
        try {
            colorSpaces = mCameraSession.getSupportedColorSpaces();
            if (colorSpaces.length>0&&!isEmpty(colorSpaces)) {
                for (let i = 0; i < colorSpaces.length; i++) {
                  await mCameraSession.setColorSpace(colorSpaces[i])
                  currentColorSpace = mCameraSession.getActiveColorSpace();
                  console.info(TAG + "currentColorSpace is " + currentColorSpace);
                  expect(currentColorSpace === colorSpaces[i]).assertTrue();
                }
                console.info(TAG + testNum + " Success " );
            }
        } catch (err) {
          console.info(TAG + testNum + " FAILED" + err.code);
            expect(true).assertFalse();
        }
        done();
      })

      // ══════════════════════════════════════════════════════════
      //  setColorSpace(colorSpace: colorSpaceManager.ColorSpace): void
      // ══════════════════════════════════════════════════════════

      /**
       * @tc.name   SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0800
       * @tc.number SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0800
       * @tc.desc   without session setColorSpace, error code is: 7400103
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0800', Level.LEVEL2, async (done: Function) => {
        let testNum = 'SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0800';
        if (mCameraNum == 0) {
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance();
        await startCameraSession(0);
        let colorSpaces: Array<colorSpaceManager.ColorSpace> = [];
        let currentColorSpace: colorSpaceManager.ColorSpace | undefined = undefined;
        colorSpaces = mCameraSession.getSupportedColorSpaces();
        if (colorSpaces.length>0&&!isEmpty(colorSpaces)) {
          for (let i = 0; i < colorSpaces.length; i++) {
          try {
            await mCameraSession.setColorSpace(colorSpaces[i]);
            await mCameraSession.release();
            currentColorSpace = mCameraSession.getActiveColorSpace();
            console.info(TAG + "currentColorSpace is " + currentColorSpace);
            expect().assertFail();
            } catch (err) {
              console.info(TAG + testNum + " FAILED" + err.code);
              expect(err.code).assertEqual(cameraErrorCode.SESSION_NOT_CONFIG.toString());
            }
          }
          console.info(TAG + testNum + " Success " );
        }
        done();
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0200
       * @tc.number SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0200
       * @tc.desc   setColorSpace ColorSpace is max + 1，error code 7400101
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0200', Level.LEVEL2, async (done: Function) => {
        let testNum = 'SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0200';
        if (mCameraNum == 0) {
          expect(true).assertFail();
          done();
          return;
        }
        createCameraSessionInstance();
        await startCameraSession(0);
        let currentColorSpace: colorSpaceManager.ColorSpace | undefined = undefined;
        try {
            currentColorSpace = await mCameraSession.getActiveColorSpace();
            console.info(TAG + "currentColorSpace is " + currentColorSpace);
            console.info(TAG + testNum + " Success " );
            let maxColorSpaces = getEnumMaxValue(colorSpaceManager.ColorSpace);
            await mCameraSession.setColorSpace(maxColorSpaces + 1);
            expect().assertFail();
        } catch (err) { 
          let error: BusinessError = err as BusinessError;
          console.info(TAG + testNum + " FAILED " + err.code + ' ,error code type is: ' + typeof(error.code));
          expect(Number(error.code)).assertEqual(cameraErrorCode.INVALID_ARGUMENT);
        }
        done();
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0300
       * @tc.number SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0300
       * @tc.desc   setColorSpace ColorSpace is -1，error code 7400101
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0300', Level.LEVEL2, async (done: Function) => {
        let testNum = 'SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0300';
        if (mCameraNum == 0) {
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance();
        await startCameraSession(0);
        let currentColorSpace: colorSpaceManager.ColorSpace | undefined = undefined;
        try {
            currentColorSpace = await mCameraSession.getActiveColorSpace();
            console.info(TAG + "currentColorSpace is " + currentColorSpace);
            console.info(TAG + testNum + " Success " );
            await mCameraSession.setColorSpace(-1);
            expect().assertFail();
        } catch (err) {
            console.info(TAG + testNum + " FAILED" + err.code);
            expect(err.code).assertEqual(cameraErrorCode.INVALID_ARGUMENT.toString());
        }
        done();
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0400
       * @tc.number SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0400
       * @tc.desc   setColorSpace ColorSpace is undefined，error code 7400101
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0400', Level.LEVEL2, async (done: Function) => {
        let testNum = 'SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0400';
        if (mCameraNum == 0) {
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance();
        await startCameraSession(0);
        let currentColorSpace: colorSpaceManager.ColorSpace | undefined = undefined;
        try {
            currentColorSpace = await mCameraSession.getActiveColorSpace();
            console.info(TAG + "currentColorSpace is " + currentColorSpace);
            console.info(TAG + testNum + " Success " );
            let maxColorSpaces = getEnumMaxValue(colorSpaceManager.ColorSpace);
            await mCameraSession.setColorSpace(undefined);
            expect().assertFail();
        } catch (err) {
            console.info(TAG + testNum + " FAILED" + err.code);
            expect(err.code).assertEqual(cameraErrorCode.INVALID_ARGUMENT.toString());
        }
        done();
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0500
       * @tc.number SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0500
       * @tc.desc   setColorSpace ColorSpace is null，error code 7400101
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0500', Level.LEVEL2, async (done: Function) => {
        let testNum = 'SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0500';
        if (mCameraNum == 0) {
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance();
        await startCameraSession(0);
        let currentColorSpace: colorSpaceManager.ColorSpace | undefined = undefined;
        try {
            currentColorSpace = await mCameraSession.getActiveColorSpace();
            console.info(TAG + "currentColorSpace is " + currentColorSpace);
            console.info(TAG + testNum + " Success " );
            let maxColorSpaces = getEnumMaxValue(colorSpaceManager.ColorSpace);
            await mCameraSession.setColorSpace(null);
            expect().assertFail();
        } catch (err) {
            console.info(TAG + testNum + " FAILED, error code is: " + err.code);
            expect(err.code).assertEqual(cameraErrorCode.INVALID_ARGUMENT.toString());
        }
        done();
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0600
       * @tc.number SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0600
       * @tc.desc   setColorSpace -> unSupport -> error code: 7400101
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0600', Level.LEVEL2, async (done: Function) => {
        let testNum = 'SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0600';
        if (mCameraNum == 0) {
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance();
        await startCameraSession(0);
        let colorSpaces: Array<colorSpaceManager.ColorSpace> = [];
        let currentColorSpace: colorSpaceManager.ColorSpace | undefined = undefined;
        colorSpaces = mCameraSession.getSupportedColorSpaces();
        let allColorSpaces = getEnumValueList(colorSpaceManager.ColorSpace); 
        const colorSpacesSet = new Set(colorSpaces);
        const unSupportColorSpaces = allColorSpaces.filter(item => !colorSpacesSet.has(item));
        if (unSupportColorSpaces.length>0&&!isEmpty(unSupportColorSpaces)) {
          for (let i = 0; i < unSupportColorSpaces.length; i++) {
            try {
              console.info(TAG + testNum + " unSupportColorSpace is: " + unSupportColorSpaces[i]);
              await mCameraSession.setColorSpace(unSupportColorSpaces[i]);
              currentColorSpace = await mCameraSession.getActiveColorSpace();
              console.info(TAG + testNum + "currentColorSpace is " + currentColorSpace);
              expect(currentColorSpace === unSupportColorSpaces[i]).assertTrue();
              console.info(TAG + testNum + " Success " );
            } catch (err) {
              console.info(TAG + testNum + " FAILED, error code is: " + err.code);
              expect(err.code).assertEqual(cameraErrorCode.INVALID_ARGUMENT.toString());
            }
          }
        }
        done();
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0700
       * @tc.number SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0700
       * @tc.desc   setColorSpace -> unSupport -> error code: 7400103
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0700', Level.LEVEL2, async (done: Function) => {
        let testNum = 'SUB_MULTIMEDIA_GET_SET_COLOR_SPACE_0700';
        if (mCameraNum == 0) {
        expect(true).assertFail();
        done();
        return;
        }
        createCameraSessionInstance();
        await startCameraSession(0);
        let colorSpaces: Array<colorSpaceManager.ColorSpace> = [];
        let currentColorSpace: colorSpaceManager.ColorSpace | undefined = undefined;
        colorSpaces = mCameraSession.getSupportedColorSpaces();
        if (colorSpaces.length>0&&!isEmpty(colorSpaces)) {
          await mCameraSession.release();
          for (let i = 0; i < colorSpaces.length; i++) {
            try {
              console.info(TAG + testNum + " colorSpaces is: " + colorSpaces[i]);
              await mCameraSession.setColorSpace(colorSpaces[i]);
              console.info(TAG + testNum + "currentColorSpace is " + currentColorSpace);
              expect().assertFail();
            } catch (err) {
              console.info(TAG + testNum + " FAILED, error code is: " + err.code);
              expect(err.code).assertEqual(cameraErrorCode.SESSION_NOT_CONFIG.toString());
            }
          }
        }
        done();
      })
    })
}