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
import { driveFn, getPermission, sleep } from '../common'
import common from '@ohos.app.ability.common'
import { JSON } from '@kit.ArkTS';

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info('getEnumMaxValue : ' + maxValue);
  return maxValue;
}

export default function AddResourceChangeRequestSuppTest() {
  let TAG = 'AddResourceChangeRequestSuppTest';
  describe('AddResourceChangeRequestSuppTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      AppStorage.setOrCreate<number>('uriList1', 1);
      AppStorage.setOrCreate<string>('uriList2', 'test');
      AppStorage.setOrCreate<number[]>('testArray', [-1, 0, 1]);
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    afterAll(async () => {
      AppStorage.delete('uriList1');
      AppStorage.delete('uriList2');
      AppStorage.delete('testArray');
    });
    const testInvalidResourceDataIMAGE =
      async (testNum: string, resourceType: photoAccessHelper.ResourceType, resourceData: ArrayBuffer, done: Function,
        callback: (errCode: ESObject) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          let photoType = photoAccessHelper.PhotoType.IMAGE;
          let extension = 'jpg';
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
          assetChangeRequest.addResource(resourceType, resourceData);
          console.info(TAG, testNum, 'Success testInvalidResourceDataIMAGE');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testNum, `Failed testInvalidResourceDataIMAGE`, error.code, JSON.stringify(error));
          callback(error);
          done();
        }
      }
    const testInvalidResourceDataIMAGE1 =
      async (testNum: string, done: Function, fun: () => void, callback: (errCode: ESObject) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          fun();
          console.info(TAG, testNum, 'Success testInvalidResourceDataIMAGE');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testNum, `Failed testInvalidResourceDataIMAGE`, error.code, JSON.stringify(error));
          callback(error);
          done();
        }
      }
    const testInvalidResourceDataVIDEO =
      async (testNum: string, resourceType: photoAccessHelper.ResourceType, resourceData: ArrayBuffer,
        done: Function, callback: (errCode: ESObject) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          let photoType = photoAccessHelper.PhotoType.VIDEO;
          let extension = 'mp4';
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
          assetChangeRequest.addResource(resourceType, resourceData);
          console.info(TAG, testNum, 'Success testInvalidResourceDataVIDEO');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testNum, `Failed testInvalidResourceDataVIDEO`, error.code, JSON.stringify(error));
          callback(error);
          done();
        }
      }
    const testInvalidResourceDataIVIDEO1 =
      async (testNum: string, done: Function, fun: () => void, callback: (errCode: ESObject) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          fun();
          console.info(TAG, testNum, 'Success testInvalidResourceDataIMAGE');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testNum, `Failed testInvalidResourceDataIMAGE`, error.code, JSON.stringify(error));
          callback(error);
          done();
        }
      }
    const testInvalidIMAGE =
      async (testNum: string, resourceType: photoAccessHelper.ResourceType, resourceData: ArrayBuffer,
        done: Function, resourceType1: photoAccessHelper.ResourceType, resourceData1: ArrayBuffer,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          let photoType = photoAccessHelper.PhotoType.IMAGE;
          let extension = 'jpg';
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
          assetChangeRequest.addResource(resourceType, resourceData);
          assetChangeRequest.addResource(resourceType1, resourceData1);
          console.info(TAG, testNum, 'Success testInvalidIMAGE');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testNum, `Failed testInvalidIMAGE`, error.code, JSON.stringify(error));
          callback(error);
          done();
        }
      }
    const testInvalidVIDEO =
      async (testNum: string, resourceType: photoAccessHelper.ResourceType, resourceData: ArrayBuffer,
        done: Function, resourceType1: photoAccessHelper.ResourceType, resourceData1: ArrayBuffer,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testNum, 'Start');
          let photoType = photoAccessHelper.PhotoType.VIDEO;
          let extension = 'mp4';
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
          assetChangeRequest.addResource(resourceType, resourceData);
          assetChangeRequest.addResource(resourceType1, resourceData1);
          console.info(TAG, testNum, 'Success testInvalidIMAGE');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testNum, `Failed testInvalidIMAGE`, error.code, JSON.stringify(error));
          callback(error);
          done();
        }
      }

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0100', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0100', null as ESObject,
        new ArrayBuffer(1024),
        done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0200', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0200',
        undefined as ESObject, new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0300', Level.LEVEL2, async (done: Function) => {
      let maxEnum = getEnumMaxValue(photoAccessHelper.ResourceType) + 1;
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0300', maxEnum,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0400', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0400', 0,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0500', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0500', -1,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0600', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0600',
        AppStorage.get('uriList2') as ESObject, new ArrayBuffer(1024),
        done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0700', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0700', null as ESObject,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0800', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0800',
        undefined as ESObject, new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0900', Level.LEVEL2, async (done: Function) => {
      let maxEnum = getEnumMaxValue(photoAccessHelper.ResourceType) + 1;
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0900', maxEnum,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1000', 0,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1100', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1100', -1,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1200', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1200',
        AppStorage.get('uriList2') as ESObject, new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1300', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1300',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1400', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1400',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, undefined as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1500', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1500',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1600', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1600',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1700', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1700',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1800', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1800',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, undefined as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1900', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_1900',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2000',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2100', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2100',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2200', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2200',
        photoAccessHelper.ResourceType.PHOTO_PROXY, undefined as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2300', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2300',
        photoAccessHelper.ResourceType.PHOTO_PROXY, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2400', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2400',
        photoAccessHelper.ResourceType.PHOTO_PROXY, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2500', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2500',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2600', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2600',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, undefined as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2700', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2700',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2800', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2800',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2900', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_2900',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3000',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, undefined as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3100', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3100',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3200', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3200',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3300', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3300',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3400', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3400',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, undefined as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3500', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3500',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3600', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3600',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3700', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3700',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3800', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3800',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, undefined as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3900', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_3900',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4000',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4100', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4100',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4200', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4200',
        photoAccessHelper.ResourceType.PHOTO_PROXY, undefined as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4300', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4300',
        photoAccessHelper.ResourceType.PHOTO_PROXY, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4400', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4400',
        photoAccessHelper.ResourceType.PHOTO_PROXY, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000011');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4500', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4500',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4600', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4600',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, undefined as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4700', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4700',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4800', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4800',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4900', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_4900',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(0), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5000',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, undefined as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5100', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5100',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, null as ESObject, done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5200', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5200',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('uriList1') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5300', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5300',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5400', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5400',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5500', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5500',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5600', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5600',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5700', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5700',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5800', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5800',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5900', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_5900',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6000', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6000',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6100', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6100',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6200', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6200',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6300', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6300',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6400', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6400',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6500', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6500',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6600', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6600',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6700', Level.LEVEL2, async (done: Function) => {
      await testInvalidIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6700',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6800', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6800',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6900', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_6900',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7000', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7000',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7100', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7100',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7200', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7200',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7300
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7300', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7300',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7400
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7400', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7400',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7500
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7500', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7500',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7600
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7600', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7600',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7700
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7700', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7700',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7800
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7800', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7800',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7900
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7900', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_7900',
        photoAccessHelper.ResourceType.PHOTO_PROXY, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('14000016');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8000
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8000', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8000',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8100', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8100',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8200
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8200', Level.LEVEL2, async (done: Function) => {
      await testInvalidVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8200',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), done,
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, new ArrayBuffer(1024), (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        })
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8300
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8300', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8300', -1000,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8400
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8400', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8400', 1000,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8500
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8500', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8500',
        AppStorage.get('testArray') as ESObject, new ArrayBuffer(1024),
        done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8600
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8600', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8600', -1000,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8700
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8700', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8700', 1000,
        new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8800
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8800', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_8800',
        AppStorage.get('testArray') as ESObject, new ArrayBuffer(1024), done, (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });


    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9000
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9000',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, AppStorage.get('testArray') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9300
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9300', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9300',
        photoAccessHelper.ResourceType.VIDEO_RESOURCE, AppStorage.get('uriList2') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9500
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9500', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9500',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('uriList2') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9600
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9600
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9600', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9600',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('testArray') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9700
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9700
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9700', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9700',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('uriList2') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9800
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9800', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataIMAGE('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9800',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('testArray') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9900
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9900', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_9900',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, AppStorage.get('uriList2') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_10000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_10000
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_10000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_10000',
        photoAccessHelper.ResourceType.IMAGE_RESOURCE, AppStorage.get('testArray') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_15000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_15000
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_15000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_15000',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('uriList2') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_16000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_16000
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_16000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_16000',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, AppStorage.get('testArray') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_17000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_17000
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_17000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_17000',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('uriList2') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_18000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_18000
     * @tc.desc   add resource by invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_18000', Level.LEVEL2, async (done: Function) => {
      await testInvalidResourceDataVIDEO('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_18000',
        photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, AppStorage.get('testArray') as ESObject, done,
        (errCode: ESObject) => {
          expect(errCode.code).assertEqual('401');
        });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_20000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_20000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_20000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_20000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('14000011');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_21000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_21000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_21000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_21000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_22000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_22000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_22000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_22000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PHOTO_PROXY, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('14000011');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_23000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_23000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_23000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_23000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_24000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_24000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_24000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_24000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_25000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_25000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_25000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_25000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('14000011');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_26000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_26000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_26000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_26000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_27000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_27000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_27000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_27000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PHOTO_PROXY, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('14000011');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_28000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_28000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_28000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_28000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_29000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_29000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_29000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_29000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_31000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_31000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_31000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_31000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, '')
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_33000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_33000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_33000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_33000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, '')
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_34000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_34000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_34000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.IMAGE;
      let extension = 'jpg';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIMAGE1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_34000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '')
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_35000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_35000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_35000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_35000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_36000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_36000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_36000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_36000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('14000011');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_37000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_37000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_37000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_37000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PHOTO_PROXY, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('14000011');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_38000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_38000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_38000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_38000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_39000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_39000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_39000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_39000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, null)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_40000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_40000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_40000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_40000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_41000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_41000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_41000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_41000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('14000011');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_42000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_42000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_42000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_42000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PHOTO_PROXY, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('14000011');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_43000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_43000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_43000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_43000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_44000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_44000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_44000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_44000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, undefined)
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_45000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_45000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_45000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_45000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, '')
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_48000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_48000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_48000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_48000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_RESOURCE, '')
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });

    /**
     * @tc.number SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_49000
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_49000
     * @tc.desc   add resource by invalid
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_49000', Level.LEVEL2, async (done: Function) => {
      let photoType = photoAccessHelper.PhotoType.VIDEO;
      let extension = 'mp4';
      let assetChangeRequest =
        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      await testInvalidResourceDataIVIDEO1('SUB_PHOTO_ACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_49000', done, () => {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.PRIVATE_MOVING_PHOTO_METADATA, '')
      }, (errCode: ESObject) => {
        expect(errCode.code).assertEqual('401');
      });
    });
  });
}