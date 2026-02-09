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
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { driveFn, getPermission, LOG_TAG, photoType, copyImageToSandbox } from '../../common';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';
import { fileUri } from '@kit.CoreFileKit';

const TAG = LOG_TAG + 'createPhotoAssetTest';

export default function createPhotoAssetTest() {
  describe('createPhotoAssetTest', () => {
    const testTitle = 'createPhotoAssetTest';

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_001
     * @tc.name       createPhotoAsset_image_title_001
     * @tc.desc       createPhotoAsset, image, with title, extension->jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createPhotoAsset_image_title_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoAsset_image_title_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        let uri = await helper.createPhotoAsset(type, extension, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_002
     * @tc.name       createPhotoAsset_image_title_abnormal_001
     * @tc.desc       createPhotoAsset, image, with title, extension->invalid
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_image_title_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_image_title_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'invalid';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_003
     * @tc.name       createPhotoAsset_image_title_abnormal_002
     * @tc.desc       createPhotoAsset, image, with title, type->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_image_title_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_image_title_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'jpg';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper.createPhotoAsset(type, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_004
     * @tc.name       createPhotoAsset_image_title_abnormal_003
     * @tc.desc       createPhotoAsset, image, with title, type-> -1
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_image_title_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_image_title_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = -1;
      const extension = 'jpg';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_005
     * @tc.name       createPhotoAsset_image_title_abnormal_004
     * @tc.desc       createPhotoAsset, image, with title, extension->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_image_title_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_image_title_abnormal_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = undefined;
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper.createPhotoAsset(type, extension, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_006
     * @tc.name       createPhotoAsset_image_title_abnormal_005
     * @tc.desc       createPhotoAsset, image, with title, title->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createPhotoAsset_image_title_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoAsset_image_title_abnormal_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const title = undefined;
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_007
     * @tc.name       createPhotoAsset_image_title_abnormal_006
     * @tc.desc       createPhotoAsset, image, with title, title->'a[]]b'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createPhotoAsset_image_title_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoAsset_image_title_abnormal_006';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      const title = 'a[]]b';
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_008
     * @tc.name       createPhotoAsset_image_001
     * @tc.desc       createPhotoAsset, image, extension->jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createPhotoAsset_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoAsset_image_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'jpg';
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_009
     * @tc.name       createPhotoAsset_image_abnormal_001
     * @tc.desc       createPhotoAsset, image, type->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_image_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_image_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'jpg';
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_010
     * @tc.name       createPhotoAsset_image_abnormal_002
     * @tc.desc       createPhotoAsset, image, type-> -1
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_image_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_image_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = -1;
      const extension = 'jpg';
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })
    
    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_011
     * @tc.name       createPhotoAsset_image_abnormal_003
     * @tc.desc       createPhotoAsset, image, extension->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_image_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_image_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = undefined;
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_012
     * @tc.name       createPhotoAsset_image_abnormal_004
     * @tc.desc       createPhotoAsset, image, extension->invalid
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_image_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_image_abnormal_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.IMAGE;
      const extension = 'invalid';
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_013
     * @tc.name       createPhotoAsset_video_title_001
     * @tc.desc       createPhotoAsset, video, with title, extension->mp4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createPhotoAsset_video_title_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoAsset_video_title_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        let uri = await helper.createPhotoAsset(type, extension, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_014
     * @tc.name       createPhotoAsset_video_title_abnormal_001
     * @tc.desc       createPhotoAsset, video, with title, type->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_video_title_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_video_title_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'mp4';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper.createPhotoAsset(type, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_015
     * @tc.name       createPhotoAsset_video_title_abnormal_002
     * @tc.desc       createPhotoAsset, video, with title, type-> -1
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_video_title_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_video_title_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = -1;
      const extension = 'mp4';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })
    
    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_016
     * @tc.name       createPhotoAsset_video_title_abnormal_003
     * @tc.desc       createPhotoAsset, video, with title, extension->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_video_title_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_video_title_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = undefined;
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_017
     * @tc.name       createPhotoAsset_video_title_abnormal_004
     * @tc.desc       createPhotoAsset, video, with title, extension->invalid
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_video_title_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoAsset_video_title_abnormal_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'invalid';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })
    
    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_018
     * @tc.name       createPhotoAsset_video_title_abnormal_005
     * @tc.desc       createPhotoAsset, video, with title, title->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createPhotoAsset_video_title_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoAsset_video_title_abnormal_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const title = undefined;
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_019
     * @tc.name       createPhotoAsset_video_title_abnormal_006
     * @tc.desc       createPhotoAsset, video, with title, title-> 'aa/.[]bb'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createPhotoAsset_video_title_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoAsset_video_title_abnormal_006';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      const title = 'aa/.[]bb';
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_020
     * @tc.name       createPhotoAsset_video_001
     * @tc.desc       createPhotoAsset, video, extension->mp4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('createPhotoAsset_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPhotoAsset_video_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'mp4';
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_021
     * @tc.name       createPhotoAsset_video_abnormal_001
     * @tc.desc       createPhotoAsset, video, type->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_video_abnormal_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_video_abnormal_001';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = undefined;
      const extension = 'mp4';
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_022
     * @tc.name       createPhotoAsset_video_abnormal_002
     * @tc.desc       createPhotoAsset, video, type-> -1
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_video_abnormal_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_video_abnormal_002';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType | undefined = -1;
      const extension = 'mp4';
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_023
     * @tc.name       createPhotoAsset_video_abnormal_003
     * @tc.desc       createPhotoAsset, video, extension->undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_video_abnormal_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_video_abnormal_003';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = undefined;
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_024
     * @tc.name       createPhotoAsset_video_abnormal_004
     * @tc.desc       createPhotoAsset, video, extension->invalid
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_video_abnormal_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_video_abnormal_004';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = 'invalid';
      try {
        const uri = await helper.createPhotoAsset(type, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_025
     * @tc.name       createPhotoAsset_video_abnormal_005
     * @tc.desc       createPhotoAsset, video, title length 256
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('createPhotoAsset_video_abnormal_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'createPhotoAsset_video_abnormal_005';
      console.info(TAG, testName);
      const type: photoAccessHelper.PhotoType = photoType.VIDEO;
      const extension = '.mp4';
      let title = ''
      for (let index = 0; index < 256; index++) {
        title += 'a'
      }
      try {
        const uri = await helper.createPhotoAsset(type as photoAccessHelper.PhotoType, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error?.code == '23800151').assertTrue();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_026
     * @tc.name       mediaAlbumChangeRequest_comment_001
     * @tc.desc       mediaAlbumChangeRequest, comment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('mediaAlbumChangeRequest_comment_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_comment_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        console.info(TAG, 'change request album comment: ' + albumChangeRequest.comment);
        expect(albumChangeRequest.comment).assertEqual('Add, delete and update asset or album');
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_027
     * @tc.name       mediaAssetChangeRequest_comment_001
     * @tc.desc       mediaAssetChangeRequest, comment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('mediaAssetChangeRequest_comment_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAssetChangeRequest_comment_001';
      const fileName = 'test.jpg';
      const path = 'test.jpg';
      await copyImageToSandbox(fileName, path);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let uri = fileUri.getUriFromPath(testContext.filesDir + "/" + path);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          await photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, uri);
        console.info(TAG, 'change request asset comment: ' + assetChangeRequest.comment);
        expect(assetChangeRequest.comment).assertEqual('Add, delete and update asset or album');
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}