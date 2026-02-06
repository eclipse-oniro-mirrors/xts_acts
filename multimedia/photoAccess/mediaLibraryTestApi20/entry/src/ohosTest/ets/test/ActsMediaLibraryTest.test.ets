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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'
import image from '@ohos.multimedia.image';
import abilityAccessCtrl, { PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl';
import { Driver, MatchPattern, ON, } from '@ohos.UiTest';

let receiver: image.ImageReceiver;
let mPhotoSurface: string;

let getPermissions = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.CAMERA'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError<number>) => {
    console.error('data:' + JSON.stringify(err))
  })
}

let getPermissions1 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.WRITE_MEDIA'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError<number>) => {
    console.error('data:' + JSON.stringify(err))
  })
}

let getPermissions2 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('====data permissions:' + data.permissions)
  }).catch((err: BusinessError<number>) => {
    console.error('===data:' + JSON.stringify(err))
  })
}

let getPermissions3 = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.WRITE_IMAGEVIDEO'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('====data permissions:' + data.permissions)
  }).catch((err: BusinessError<number>) => {
    console.error('===data:' + JSON.stringify(err))
  })
}

async function getPhotoReceiverSurface() {
  receiver = image.createImageReceiver({ width: 1280, height: 960 }, 4, 8);
  if (receiver !== undefined) {
    mPhotoSurface = await receiver.getReceivingSurfaceId();
    console.log('Photo received id: ' + JSON.stringify(mPhotoSurface));
  } else {
    console.error('创建ImageReceiver实例 failed');
  }
}

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let timeId: number = -1;

function photoSleep(ms: number, limit: number, func: () => number) {
  return new Promise<number>((resolve, reject) => {
    testNapi.testOhMediaAsset(mPhotoSurface)
    let count: number = 0;
    timeId = setInterval(() => {
      if (func() == 0) {
        resolve(0)
      } else {
        count += ms
        if (count >= limit) {
          reject(-1)
        }
      }
    }, ms)
  });
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep(500);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  await sleep(500);
  await power?.click();
  await sleep(500);
}

export default function ActsMediaLibraryTest() {
  describe('ActsMediaLibraryTest', () => {
    beforeAll(async () => {
      await getPermissions();
      await driveFn()
      await getPermissions1()
      await driveFn()
      await getPermissions2()
      await driveFn()
      await getPermissions3()
      await driveFn()
      await getPhotoReceiverSurface();
    })
    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100
     * @tc.desc    : test OH_MediaAssetChangeRequest_AddResourceWithUri parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestAddResourceWithUriParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_0100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200
     * @tc.desc    : test OH_MediaAssetChangeRequest_AddResourceWithBuffer parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestAddResourceWithBufferParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_0200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300
     * @tc.desc    : test OH_MediaAssetChangeRequest_GetWriteCacheHandler parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestGetWriteCacheHandlerParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_0300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400
     * @tc.desc    : test OH_MediaAssetChangeRequest_SaveCameraPhoto parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestSaveCameraPhotoParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_SaveCameraPhoto_0400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500
     * @tc.desc    : test OH_MediaAssetChangeRequest_DiscardCameraPhoto parameter error
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestDiscardCameraPhotoParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_DiscardCameraPhoto_0500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetUri_0600
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetUri_0600
     * @tc.desc    : test OH_MediaAsset_GetUri Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetUri_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetUri_0600 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetUriOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetUri_0600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetUri_0600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaType_0700
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaType_0700
     * @tc.desc    : test OH_MediaAsset_GetMediaType Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaType_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaType_0700 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetMediaTypeOk);
          // let result: number = await func;
          // clearInterval(timeId);
          // console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaType_0700 result====",
          //   result);
          // expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaType_0700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaSubType_0800
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaSubType_0800
     * @tc.desc    : test OH_MediaAsset_GetMediaSubType Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaSubType_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaSubType_0800 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetMediaSubTypeOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaSubType_0800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetMediaSubType_0800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDisplayName_0900
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDisplayName_0900
     * @tc.desc    : test OH_MediaAsset_GetDisplayName Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDisplayName_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDisplayName_0900 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetDisplayNameOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDisplayName_0900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDisplayName_0900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetSize_1000
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetSize_1000
     * @tc.desc    : test OH_MediaAsset_GetSize Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetSize_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetSize_1000 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetSizeOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetSize_1000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetSize_1000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAdded_1100
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAdded_1100
     * @tc.desc    : test OH_MediaAsset_GetDateAdded Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAdded_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAdded_1100 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetDateAddedOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAdded_1100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAdded_1100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModified_1200
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModified_1200
     * @tc.desc    : test OH_MediaAsset_GetDateModified Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModified_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModified_1200 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetDateModifiedOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModified_1200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModified_1200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateTaken_1300
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateTaken_1300
     * @tc.desc    : test OH_MediaAsset_GetDateTaken Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateTaken_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateTaken_1300 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetDateTakenOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateTaken_1300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateTaken_1300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAddedMs_1400
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAddedMs_1400
     * @tc.desc    : test OH_MediaAsset_GetDateAddedMs Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAddedMs_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAddedMs_1400 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetDateAddedMsOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAddedMs_1400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateAddedMs_1400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModifiedMs_1500
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModifiedMs_1500
     * @tc.desc    : test OH_MediaAsset_GetDateModifiedMs Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModifiedMs_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModifiedMs_1500 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetDateModifiedMsOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModifiedMs_1500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDateModifiedMs_1500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDuration_1600
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDuration_1600
     * @tc.desc    : test OH_MediaAsset_GetDuration Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDuration_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDuration_1600 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetDurationOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDuration_1600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetDuration_1600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetWidth_1700
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetWidth_1700
     * @tc.desc    : test OH_MediaAsset_GetWidth Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetWidth_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetWidth_1700 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetWidthOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetWidth_1700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetWidth_1700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetHeight_1800
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetHeight_1800
     * @tc.desc    : test OH_MediaAsset_GetHeight Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetHeight_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetHeight_1800 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetHeightOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetHeight_1800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetHeight_1800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetOrientation_1900
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetOrientation_1900
     * @tc.desc    : test OH_MediaAsset_GetOrientation Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetOrientation_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetOrientation_1900 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetOrientationOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetOrientation_1900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetOrientation_1900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_IsFavorite_2000
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_IsFavorite_2000
     * @tc.desc    : test OH_MediaAsset_IsFavorite Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_IsFavorite_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_IsFavorite_2000 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetIsFavoriteOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_IsFavorite_2000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_IsFavorite_2000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetTitle_2100
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetTitle_2100
     * @tc.desc    : test OH_MediaAsset_GetTitle Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetTitle_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetTitle_2100 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetGetTitleOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetTitle_2100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_GetTitle_2100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_Release_2200
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_Release_2200
     * @tc.desc    : test OH_MediaAsset_Release Media Library Ok
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_Release_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_Release_2200 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetReleaseOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_Release_2200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAsset_Release_2200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Image_2300
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Image_2300
     * @tc.desc    : test MEDIA_LIBRARY_IMAGE
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Image_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Image_2300 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaLibraryImageOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Image_2300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Image_2300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Default_2400
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Default_2400
     * @tc.desc    : test MEDIA_LIBRARY_DEFAULT
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Default_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Default_2400 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaLibraryDefaultOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Default_2400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Default_2400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_2500
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_2500
     * @tc.desc    : test OH_MediaAssetChangeRequest_AddResourceWithUri the file does not exist.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_2500 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetChangeRequestAddResourceWithUriNotSuchFile);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_2500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_2500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_Release_2700
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_Release_2700
     * @tc.desc    : test OH_MediaAssetChangeRequest_Release Ok.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_Release_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_Release_2700 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetChangeRequestReleaseOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_Release_2700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_Release_2700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestMovingPhoto_2800
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestMovingPhoto_2800
     * @tc.desc    : test OH_MediaAssetManager_RequestMovingPhoto Ok.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestMovingPhoto_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestMovingPhoto_2800 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetManagerRequestMovingPhotoOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestMovingPhoto_2800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestMovingPhoto_2800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestImage_2900
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestImage_2900
     * @tc.desc    : test OH_MediaAssetManager_RequestImage Ok.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestImage_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestImage_2900 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetManagerRequestImageOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestImage_2900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetManager_RequestImage_2900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_GetUri_3000
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_GetUri_3000
     * @tc.desc    : test OH_MovingPhoto_GetUri Ok.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_GetUri_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_GetUri_3000 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMovingPhotoGetUriOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_GetUri_3000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_GetUri_3000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUris_3100
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUris_3100
     * @tc.desc    : test OH_MovingPhoto_RequestContentWithUris Ok.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUris_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUris_3100 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMovingPhotoRequestContentWithUrisOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUris_3100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUris_3100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUri_3200
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUri_3200
     * @tc.desc    : test OH_MovingPhoto_RequestContentWithUri Ok.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUri_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUri_3200 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMovingPhotoRequestContentWithUriOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUri_3200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithUri_3200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithBuffer_3300
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithBuffer_3300
     * @tc.desc    : test OH_MovingPhoto_RequestContentWithBuffer Ok.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithBuffer_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithBuffer_3300 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMovingPhotoRequestContentWithBufferOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithBuffer_3300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_RequestContentWithBuffer_3300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_Release_3400
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_Release_3400
     * @tc.desc    : test OH_MovingPhoto_Release Ok.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_Release_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_Release_3400 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMovingPhotoReleaseOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_Release_3400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MovingPhoto_Release_3400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_3500
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_3500
     * @tc.desc    : test OH_MediaAssetChangeRequest_AddResourceWithBuffer Operation not supported.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_3500 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetChangeRequestAddResourceWithBufferNotSupported);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_3500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithBuffer_3500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_3600
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_3600
     * @tc.desc    : test OH_MediaAssetChangeRequest_AddResourceWithUri Operation not supported.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_3600 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetChangeRequestAddResourceWithUriNotSupported);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_3600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_AddResourceWithUri_3600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Fast_3700
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Fast_3700
     * @tc.desc    : test MEDIA_LIBRARY_QUALITY_FAST .
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Fast_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Fast_3700 start====");
          let func = photoSleep(100, 6000, testNapi.testMediaLibraryQualityFast);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Fast_3700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Fast_3700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Full_3800
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Full_3800
     * @tc.desc    : test MEDIA_LIBRARY_QUALITY_FULL.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Full_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Full_3800 start====");
          let func = photoSleep(100, 6000, testNapi.testMediaLibraryQualityFull);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Full_3800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Quality_Full_3800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Compressed_3900
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Compressed_3900
     * @tc.desc    : test MEDIA_LIBRARY_COMPRESSED.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Compressed_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Compressed_3900 start====");
          let func = photoSleep(100, 6000, testNapi.testMediaLibraryCompressed);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Compressed_3900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Compressed_3900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Picture_Object_4000
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Picture_Object_4000
     * @tc.desc    : test MEDIA_LIBRARY_PICTURE_OBJECT.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Picture_Object_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Picture_Object_4000 start====");
          let func = photoSleep(100, 6000, testNapi.testMediaLibraryPictureObject);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Picture_Object_4000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Picture_Object_4000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Moving_Photo_4100
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Moving_Photo_4100
     * @tc.desc    : test MEDIA_LIBRARY_MOVING_PHOTO.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Moving_Photo_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Moving_Photo_4100 start====");
          let func = photoSleep(100, 6000, testNapi.testMediaLibraryMovingPhoto);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Moving_Photo_4100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Moving_Photo_4100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Rust_4200
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Rust_4200
     * @tc.desc    : test MEDIA_LIBRARY_BURST.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Rust_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Rust_4200 start====");
          let func = photoSleep(100, 6000, testNapi.testMediaLibraryRust);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Rust_4200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Rust_4200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAccessHelper_ApplyChanges_4300
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_OH_MediaAccessHelper_ApplyChanges_4300
     * @tc.desc    : test OH_MediaAccessHelper_ApplyChanges Ok.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAccessHelper_ApplyChanges_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAccessHelper_ApplyChanges_4300 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAccessHelperApplyChangesOk);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAccessHelper_ApplyChanges_4300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAccessHelper_ApplyChanges_4300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Parameter_Error_4400
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Parameter_Error_4400
     * @tc.desc    : test MEDIA_LIBRARY_PARAMETER_ERROR.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Parameter_Error_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Parameter_Error_4400 start====");
          let result: number = testNapi.testOhMediaAssetChangeRequestAddResourceWithUriParameterError();
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Parameter_Error_4400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Parameter_Error_4400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_No_Such_File_4500
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_No_Such_File_4500
     * @tc.desc    : test MEDIA_LIBRARY_NO_SUCH_FILE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_No_Such_File_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_No_Such_File_4500 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetChangeRequestAddResourceWithUriNotSuchFile);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_No_Such_File_4500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_No_Such_File_4500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_High_Quality_Mode_4700
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_High_Quality_Mode_4700
     * @tc.desc    : test MEDIA_LIBRARY_HIGH_QUALITY_MODE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_High_Quality_Mode_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_High_Quality_Mode_4700 start====");
          let func = photoSleep(100, 6000, testNapi.testMediaLibraryHighQualityMode);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_High_Quality_Mode_4700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_High_Quality_Mode_4700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Balanced_Mode_4800
     * @tc.name    : SUB_Multimedia_MediaLibrary_SDK_Media_Library_Balanced_Mode_4800
     * @tc.desc    : test MEDIA_LIBRARY_BALANCED_MODE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Balanced_Mode_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Balanced_Mode_4800 start====");
          let func = photoSleep(100, 6000, testNapi.testMediaLibraryBalancedMode);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Balanced_Mode_4800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Balanced_Mode_4800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })
  })
}