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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { common } from '@kit.AbilityKit'
import {
  sleep,
  driveFn,
  getPermission
} from '../../util/common';

export default function createAssetTest () {
  describe('createAssetTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
    });

    const createAssetPromise1 = async (done: Function, testNum: string, type: sendablePhotoAccessHelper.PhotoType,
      extension: string, options: photoAccessHelper.CreateOptions) => {
      try {
        await sendablePhAccessHelper.createAsset(type, extension, options);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetPromise2 = async (done: Function, testNum: string, type: sendablePhotoAccessHelper.PhotoType,
      extension: string) => {
      try {
        await sendablePhAccessHelper.createAsset(type, extension);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const createAssetAbnormalPromise1 = async (done: Function, testNum: string,
      type: sendablePhotoAccessHelper.PhotoType, extension: string,
      options: photoAccessHelper.CreateOptions | undefined) => {
      try {
        await sendablePhAccessHelper.createAsset(type, extension, options);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }

    /**
     * @tc.name   createImage_promise_000
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_001
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createImage_promise_000';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.name   createImage_promise_001
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_002
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createImage_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createImage_promise_001';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      await createAssetPromise2(done, testNum, type, extension);
    });

    /**
     * @tc.name   createImage_promise_003
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_003
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_promise_003';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = '123';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.name   createImage_promise_005
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_004
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_promise_005';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.name   createImage_promise_006
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_005
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createImage_promise_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createImage_promise_006';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.name   createVideo_promise_000
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_006
     * @tc.desc   createAsset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createVideo_promise_000';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.name   createVideo_promise_001
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_007
     * @tc.desc   createAsset without CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createVideo_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'createVideo_promise_001';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      await createAssetPromise2(done, testNum, type, extension);
    });

    /**
     * @tc.name   createVideo_promise_003
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_008
     * @tc.desc   createAsset with invalid extension
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_promise_003';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = '123';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.name   createVideo_promise_005
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_009
     * @tc.desc   createAsset with undefined title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_promise_005';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions = {
        title: undefined
      };
      await createAssetPromise1(done, testNum, type, extension, options);
    });

    /**
     * @tc.name   createVideo_promise_006
     * @tc.number Sub_Photo_Access_Sendable_Create_Asset_010
     * @tc.desc   createAsset with undefined CreateOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('createVideo_promise_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'createVideo_promise_006';
      const type: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.VIDEO;
      const extension = 'mp4';
      const options: photoAccessHelper.CreateOptions | undefined = undefined;
      await createAssetAbnormalPromise1(done, testNum, type, extension, options);
    });
    /**
     * @tc.name   sendable_error_create_asset_mp4_extension_000
     * @tc.number SUB_PHOTO_ACCESS_SENADABLE_ERROR_CREATE_ASSET_0000
     * @tc.desc   createAsset with mp4 extension and IMAGE photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("sendable_error_create_asset_mp4_extension_000", Level.LEVEL0, async (done: Function) => {
      const testNum = "sendable_error_create_asset_mp4_extension_000";
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testVideo'
        };
        let uri: string = await sendablePhAccessHelper.createAsset(photoType, extension, options);
        console.info(`${testNum} :: createAsset uri ${uri}`);
        console.info(`${testNum} :: createAsset successfully`);
        expect(false).assertTrue(true);
        done();
      } catch (error) {
        console.error(`${testNum} :: createAsset failed, error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    });
    /**
     * @tc.name   sendable_error_create_asset_undefined_photoType_001
     * @tc.number SUB_PHOTO_ACCESS_SENADABLE_ERROR_CREATE_ASSET_0100
     * @tc.desc   createAsset with undefined photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("sendable_error_create_asset_undefined_photoType_001", Level.LEVEL0, async (done: Function) => {
      const testNum = "sendable_error_create_asset_undefined_photoType_001";
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = undefined as ESObject;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        };
        let uri: string = await sendablePhAccessHelper.createAsset(photoType, extension, options);
        console.info(`${testNum} :: createAsset uri ${uri}`);
        console.info(`${testNum} :: createAsset successfully`);
        expect(false).assertTrue(true);
        done();
      } catch (error) {
        console.error(`${testNum} :: createAsset failed, error: ${error.code}, ${error.message}`);
        expect(String(error.code) === '13900020' || String(error.code) === '401').assertTrue();
        done();
      }
    });
  })
}