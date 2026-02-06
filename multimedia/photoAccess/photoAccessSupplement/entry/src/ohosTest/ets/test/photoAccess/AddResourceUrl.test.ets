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
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, afterAll } from '@ohos/hypium'
import { driveFn, getPermission, sleep, copyImageToSandbox, isEmpty } from '../common'
import common from '@ohos.app.ability.common'
import { JSON } from '@kit.ArkTS';

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info('getEnumMaxValue : ' + maxValue);
  return maxValue;
}

export default function AddResourceChangeRequestUrlSuppTest() {
  let TAG = 'AddResourceChangeRequestUrlSuppTest';
  describe('AddResourceChangeRequestUrlSuppTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      AppStorage.setOrCreate<number>('testNumber', 123);
      AppStorage.setOrCreate<number[]>('testArray', [-1, 0, 1]);
      AppStorage.setOrCreate<string>('testString', 'abc');
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    afterAll(async () => {
      AppStorage.delete('testNumber');
      AppStorage.delete('testArray');
      AppStorage.delete('testString');
    });
    const addResourceFileUriImageErrorTest = async (done: Function, testName: string,
      type: photoAccessHelper.ResourceType, fileUri: string,
      callback: (errCode: number) => void) => {
      try {
        console.info(TAG, testName, 'Start');
        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        const path = isEmpty(fileUri) ? fileUri : 'file://' + testContext.filesDir + "/" + fileUri;
        let assetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        assetChangeRequest.addResource(type, path);
        console.info(TAG, testName, 'Success addResourceFileUriErrorTest');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed addResourceFileUriErrorTest`, error.code, JSON.stringify(error));
        callback(error);
        done();
      }
    }
    const addResourceFileUriVideoErrorTest =
      async (done: Function, testName: string,
        type: photoAccessHelper.ResourceType, fileUri: string,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testName, 'Start');
          let photoType = photoAccessHelper.PhotoType.VIDEO;
          let extension = 'mp4';
          const path = isEmpty(fileUri) ? fileUri : 'file://' + testContext.filesDir + "/" + fileUri;
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
          assetChangeRequest.addResource(type, path);
          console.info(TAG, testName, 'Success addResourceFileUriVideoErrorTest');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, `Failed addResourceFileUriVideoErrorTest`, error.code, JSON.stringify(error));
          callback(error);
          done();
        }
      }
    const addResourceFileUriImageTest =
      async (done: Function, testNum: string, type: photoAccessHelper.ResourceType, fileUri: string,
        type1: photoAccessHelper.ResourceType, fileUri1: string,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          let photoType = photoAccessHelper.PhotoType.IMAGE;
          let extension = 'jpg';
          const path = isEmpty(fileUri) ? fileUri : 'file://' + testContext.filesDir + "/" + fileUri;
          const path1 = isEmpty(fileUri1) ? fileUri1 : 'file://' + testContext.filesDir + "/" + fileUri1;
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
          assetChangeRequest.addResource(type, path);
          assetChangeRequest.addResource(type1, path1);
          console.info(TAG, testNum, 'Success addResourceFileUriImageTest');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testNum, `Failed addResourceFileUriImageTest`, error.code, JSON.stringify(error));
          callback(error);
          done();
        }
      }
    const addResourceFileUriVideoTest =
      async (done: Function, testNum: string, type: photoAccessHelper.ResourceType, fileUri: string,
        type1: photoAccessHelper.ResourceType, fileUri1: string,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          let photoType = photoAccessHelper.PhotoType.VIDEO;
          let extension = 'mp4';
          const path = isEmpty(fileUri) ? fileUri : 'file://' + testContext.filesDir + "/" + fileUri;
          const path1 = isEmpty(fileUri1) ? fileUri1 : 'file://' + testContext.filesDir + "/" + fileUri1;
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
          assetChangeRequest.addResource(type, path);
          assetChangeRequest.addResource(type1, path1);
          console.info(TAG, testNum, 'Success addResourceFileUriImageTest');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testNum, `Failed addResourceFileUriImageTest`, error.code, JSON.stringify(error));
          callback(error);
          done();
        }
      }

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0100', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0100',
          null as ESObject,
          '01.jpg',
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0200', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0200',
          undefined as ESObject, '01.jpg',
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0300', Level.LEVEL2,
      async (done: Function) => {
        let maxEnum = getEnumMaxValue(photoAccessHelper.ResourceType) + 1;
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0300', maxEnum,
          '01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0400', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0400', 1000,
          '01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0500', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0500', 0,
          '01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0600', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0600', -1,
          '01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0700', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0700', -1000,
          '01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0800', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0800',
          AppStorage.get('testString') as ESObject, '01.jpg',
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0900', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_0900',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1000', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1000',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, 'file://01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('13900002');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1100', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1100',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, undefined as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('14000011');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1200', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1200',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('14000011');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1300', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1300',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, AppStorage.get('testNumber') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('13900002');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1500', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1500',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1600', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1600',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, 'file://01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1700', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1700',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, undefined as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1800', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1800',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1900', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_1900',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, AppStorage.get('testNumber') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2000', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2000',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, AppStorage.get('testArray') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2100', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2100',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2200', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2200',
          photoAccessHelper.ResourceType.PHOTO_PROXY, 'file://01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('13900002');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2300', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2300',
          photoAccessHelper.ResourceType.PHOTO_PROXY, undefined as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('14000011');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2400', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2400',
          photoAccessHelper.ResourceType.PHOTO_PROXY, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('14000011');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2500', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2500',
          photoAccessHelper.ResourceType.PHOTO_PROXY, AppStorage.get('testNumber') as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('13900002');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2700', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2700',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2800', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2800',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, 'file://01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2900', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_2900',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, undefined as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3000', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3000',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3100', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3100',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('testNumber') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3200', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3200',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('testArray') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3300', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3300',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, 'file://01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3400', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3400',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3500', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3500',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, undefined as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3600', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3600',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3700', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3700',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('testNumber') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3800', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriImageErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3800',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('testArray') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3900', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_3900', null as ESObject,
          '01.mp4', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4000', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4000',
          undefined as ESObject, '01.mp4',
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4100', Level.LEVEL2,
      async (done: Function) => {
        let maxEnum = getEnumMaxValue(photoAccessHelper.ResourceType) + 1;
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4100', maxEnum,
          '01.mp4', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4200', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4200', 0,
          '01.mp4', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4300', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4300', -1,
          '01.mp4', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4400', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4400',
          AppStorage.get('testString') as ESObject,
          '01.mp4', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });


    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4500', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4500',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4600', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4600',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, 'file://01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4700', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4700',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, undefined as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4800', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4800',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4900', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_4900',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, AppStorage.get('testNumber') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5000', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5000',
          photoAccessHelper.ResourceType.IMAGE_RESOURCE, AppStorage.get('testArray') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5100', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5100',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5200', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5200',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, 'file://01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('13900002');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5300', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5300',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, undefined as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('14000011');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5400', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5400',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('14000011');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5500', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5500',
          photoAccessHelper.ResourceType.VIDEO_RESOURCE, AppStorage.get('testNumber') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('13900002');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5700', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5700',
          photoAccessHelper.ResourceType.PHOTO_PROXY, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5800', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5800',
          photoAccessHelper.ResourceType.PHOTO_PROXY, 'file://test3.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('13900002');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5900', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_5900',
          photoAccessHelper.ResourceType.PHOTO_PROXY, undefined as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('14000011');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6000', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6000',
          photoAccessHelper.ResourceType.PHOTO_PROXY, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('14000011');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6100', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6100',
          photoAccessHelper.ResourceType.PHOTO_PROXY, AppStorage.get('testNumber') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('13900002');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6300', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6300',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6400', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6400',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, 'file://01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6500', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6500',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, undefined as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6600', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6600',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6700', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6700',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('testNumber') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6800', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6800',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('testArray') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6900', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_6900',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7000', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7000',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, 'file://01.jpg', (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7100', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7100',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, undefined as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7200', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7200',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, null as ESObject, (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7300', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7300',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('testNumber') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7400', Level.LEVEL2,
      async (done: Function) => {
        await addResourceFileUriVideoErrorTest(done,
          'SUB_PHOTO_ACCESS_HELPER_MEDIA_ASSET_CHANGE_REQUEST_RESOURCE_FILE_URI_7400',
          photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('testArray') as ESObject,
          (errCode: ESObject) => {
            expect(errCode.code).assertEqual('401');
          });
      });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5300', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5300',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5400', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5400',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5500', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5500',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5600', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5600',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5700', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5700',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5800', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5800',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5900', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_5900',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6000', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6000',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6100', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6100',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6200', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6200',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6300', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6300',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6400', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6400',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6500', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6500',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6600', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6600',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6700', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriImageTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6700',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6800', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6800',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6900', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_6900',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7000', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7000',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7100', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7100',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7200', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7200',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7300', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7300',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7400', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7400',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7500', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7500',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7600', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7600',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE,
        '01.mp4',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7700', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7700',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7800', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7800',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7900', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_7900',
        photoAccessHelper.ResourceType.PHOTO_PROXY, '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8000', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8000',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8100', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8100',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE,
        '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8200', Level.LEVEL2, async (done: Function) => {
      await addResourceFileUriVideoTest(done, 'SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_FILE_URI_8200',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA,
        '01.jpg', (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });
  });
}