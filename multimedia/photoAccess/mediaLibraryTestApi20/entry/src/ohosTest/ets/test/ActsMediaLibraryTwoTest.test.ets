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
  let permissions: Array<Permissions> = ['ohos.permission.READ_MEDIA'];
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

export default function ActsMediaLibraryTwoTest() {
  describe('ActsMediaLibraryTwoTest', () => {
    beforeAll(async () => {
      await getPermissions()
      await driveFn()
      // await getPermissions1()
      // await driveFn()
      await getPermissions2()
      await driveFn()
      await getPhotoReceiverSurface();
    })
    /**
     * @tc.name   SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_2600
     * @tc.number SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_2600
     * @tc.desc   test OH_MediaAssetChangeRequest_GetWriteCacheHandler No authority.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_2600 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetChangeRequestGetWriteCacheHandlerNoAuthority);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_2600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_OH_MediaAssetChangeRequest_GetWriteCacheHandler_2600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Multimedia_MediaLibrary_SDK_Media_Library_Operation_Not_Supported_4600
     * @tc.number SUB_Multimedia_MediaLibrary_SDK_Media_Library_Operation_Not_Supported_4600
     * @tc.desc   test MEDIA_LIBRARY_OPERATION_NOT_SUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Multimedia_MediaLibrary_SDK_Media_Library_Operation_Not_Supported_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Operation_Not_Supported_4600 start====");
          let func = photoSleep(100, 6000, testNapi.testOhMediaAssetChangeRequestGetWriteCacheHandlerNoAuthority);
          let result: number = await func;
          clearInterval(timeId);
          console.info("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Operation_Not_Supported_4600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_Multimedia_MediaLibrary_SDK_Media_Library_Operation_Not_Supported_4600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })
  })
}