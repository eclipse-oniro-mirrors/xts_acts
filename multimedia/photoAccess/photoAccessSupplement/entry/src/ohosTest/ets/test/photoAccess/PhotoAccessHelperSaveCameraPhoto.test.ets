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


import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, sleep, isEmpty, copyImageToSandbox } from '../common';
import common from '@ohos.app.ability.common';
import { Driver, MatchPattern, ON } from '@kit.TestKit';

const TAG = LOG_TAG + 'saveCameraPhotoSupp';

async function saveCameraPhotoPromiseTest(done: Function, testName: string, imageType: photoAccessHelper.ImageFileType |null| undefined, callback: (err?: number) => void ) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchAllOption());
    console.info(TAG + 'apply fetchResult successfully');
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
    if (isEmpty(imageType)) {
      await assetChangeRequest.saveCameraPhoto(imageType);
    } else {
      await assetChangeRequest.saveCameraPhoto();
    }
    await  phAccessHelper.applyChanges(assetChangeRequest);
    console.info(TAG ,testName + 'apply saveCameraPhoto successfully');
    done();
  } catch (err) {
    console.error(TAG, `failed; error: ${err},${err.code},${err.message}`, testName);
    callback(err.code)
    done();
  }
}

export default function SaveCameraPhoto() {
  describe('SaveCameraPhoto', () => {
    let dr = Driver.create();
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
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


    /**
     * @tc.name   MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_001
     * @tc.desc   saveCameraPhoto(ImageFileType:0 ): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_001';
      const imageType = 0;
      await saveCameraPhotoPromiseTest(done, testName, imageType, (errCode)=>{
        expect().assertFail();
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_002
     * @tc.desc   saveCameraPhoto(imageFileType: -1): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_002';
      const imageType = -1;
      await saveCameraPhotoPromiseTest(done, testName, imageType,(errCode)=> {
        expect().assertFail();
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_003
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_003
     * @tc.desc   saveCameraPhoto(imageFileType: 3000): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_003';
      const imageType = 3000;
      await saveCameraPhotoPromiseTest(done, testName, imageType,(errCode)=> {
        expect().assertFail();
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_004
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_004
     * @tc.desc   saveCameraPhoto(imageFileType: null): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_004';
      const imageType = null;
      await saveCameraPhotoPromiseTest(done, testName, imageType,(errCode)=> {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_005
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_005
     * @tc.desc   saveCameraPhoto(imageFileType: undefined): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_005';
      const imageType = undefined;
      await saveCameraPhotoPromiseTest(done, testName, imageType,(errCode)=> {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_006
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_006
     * @tc.desc   saveCameraPhoto(): void double save
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_006', Level.LEVEL0, async (done: Function) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchAllOption());
        console.info(TAG ,'apply fetchResult successfully');
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        await assetChangeRequest.saveCameraPhoto();
        await assetChangeRequest.saveCameraPhoto();
        await phAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, 'apply saveCameraPhoto successfully');
        done();
      } catch (errCode) {
        console.error(TAG, `failed; error: ${errCode},${errCode.code},${errCode.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_007
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_007
     * @tc.desc   saveCameraPhoto(): void double Request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_ERROR_007', Level.LEVEL0, async (done: Function,phAccessHelper: photoAccessHelper.PhotoAccessHelper,
      asset: photoAccessHelper.PhotoAsset) => {
      try {
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        console.info(TAG + 'saveCameraPhoto successfully');
        assetChangeRequest.saveCameraPhoto();
        await phAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG + 'apply saveCameraPhoto successfully 1');
        await phAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG + 'apply saveCameraPhoto successfully 2');
        expect().assertFail();
      } catch (err) {
        console.error(TAG + `apply saveCameraPhoto failed with error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('401');
        done();
      }
    })
  })
}