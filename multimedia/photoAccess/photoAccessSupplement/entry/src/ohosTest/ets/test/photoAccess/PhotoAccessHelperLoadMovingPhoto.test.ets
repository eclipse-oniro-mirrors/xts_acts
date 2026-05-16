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

const TAG = LOG_TAG + 'LoadMovingPhotoSupp';

export default function PhotoAccessHelperLoadMovingPhoto() {
  describe('PhotoAccessHelperLoadMovingPhoto', () => {
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
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001', Level.LEVEL0, async (done: Function, videoPahUri: string, imagePathUri: string) => {
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(undefined, '', '');
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001 + loadMovingPhotoPromiseTest photo: " +movingPhoto.getUri());
        expect(movingPhoto.getUri().length < 2).assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_001 + loadMovingPhotoPromiseTest: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002', Level.LEVEL0, async (done: Function) => {
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(null, '', '');
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002 + loadMovingPhotoPromiseTest photo: " +movingPhoto.getUri());
        expect(movingPhoto.getUri().length < 2).assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_002 + loadMovingPhotoPromiseTest: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003', Level.LEVEL0, async (done: Function) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, '', '');
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003 + loadMovingPhotoPromiseTest photo: " +movingPhoto.getUri());
        expect(movingPhoto.getUri().length < 2).assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_003 + loadMovingPhotoPromiseTest: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_004
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_004
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_004', Level.LEVEL0, async (done: Function, imagePathUri: string) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let imageFileUri: string = 'file://' + testContext.filesDir + "/" + imagePathUri;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, '');
        let uri = movingPhoto.getUri();
        const uris = uri.split(';') as string[];
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007 + loadMovingPhotoPromiseTest photo: " + uris.length);
        expect(uris[0].length > 0).assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_004 + loadMoving errcode: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005', Level.LEVEL0, async (done: Function, imagePathUri: string) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let imageFileUri: string = 'file://' + testContext.filesDir + "/" + imagePathUri;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, null);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005 + loadMovingPhotoPromiseTest photo: " +movingPhoto.getUri());
        expect().assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_005 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006', Level.LEVEL0, async (done: Function, imagePathUri: string) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let imageFileUri: string = 'file://' + testContext.filesDir + "/" + imagePathUri;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, undefined);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_006 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007', Level.LEVEL0, async (done: Function,videoPahUri: string, imagePathUri: string,) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let videoFileUri: string = 'file://' + testContext.filesDir + "/" + videoPahUri;
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, '', videoFileUri);
        let uri = movingPhoto.getUri();
        const uris = uri.split(';') as string[];
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007 + loadMovingPhotoPromiseTest photo: " + uris.length);
        expect(uris[1].length > 0).assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_007 + loadMovingPhotoPromiseTest: " + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008', Level.LEVEL0, async (done: Function,videoPahUri: string, imagePathUri: string,) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let videoFileUri: string = 'file://' + testContext.filesDir + "/" + videoPahUri;
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, null, videoFileUri);
        expect().assertTrue();
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008 + loadMovingPhotoPromiseTest photo: " + movingPhoto);
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_008 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009', Level.LEVEL0, async (done: Function,videoPahUri: string, imagePathUri: string,) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let videoFileUri: string = 'file://' + testContext.filesDir + "/" + videoPahUri;
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, undefined, videoFileUri);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009 + loadMovingPhotoPromiseTest photo: " + movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_009 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010', Level.LEVEL0, async (done: Function) => {
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(null, null, null);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0010 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(undefined, undefined, undefined);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0011 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, undefined, '');
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0012 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013
     * @tc.number MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013', Level.LEVEL0, async (done: Function) => {
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, '', undefined);
        console.info(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013 + loadMovingPhotoPromiseTest photo: " +movingPhoto);
        expect().assertTrue();
      } catch (err) {
        console.error(TAG + "MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_0013 + loadMovingPhotoPromiseTest: " + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })


  })
}