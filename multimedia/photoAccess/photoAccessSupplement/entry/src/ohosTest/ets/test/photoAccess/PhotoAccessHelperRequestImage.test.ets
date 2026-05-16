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
import { image } from '@kit.ImageKit';
import { JSON } from '@kit.ArkTS';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { dataSharePredicates } from '@kit.ArkData';


const TAG = LOG_TAG + 'requestImageSupp';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(data: image.ImageSource) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}

class QuickImageDataHandler implements photoAccessHelper.QuickImageDataHandler<image.Picture> {
  onDataPrepared(data: image.Picture, imageSource: image.ImageSource, map: Map<string, string>) {
    console.info('on image data prepared');
  }
}
function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG,'getEnumMaxValue : ' + maxValue);
  return maxValue;
}
async function requestImagePromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions, callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  console.info(TAG, 'testContext successfully', JSON.stringify(testContext));
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  console.info(TAG, 'phAccessHelper successfully', phAccessHelper);
  const handler = new MediaHandler();
  try {
    let fetchResult = await phAccessHelper.getAssets(fetchOptions);
    console.info(TAG, 'fetchResult success' + fetchResult.getCount());
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    console.info(TAG, 'photoAsset success',photoAsset);
    let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
    console.info(TAG, 'requestImage successfully', requestId);
    expect().assertFail();
  } catch (error) {
    console.error(TAG, testName,`failed; error: ${error}`, error.code);
    callback(error.code)
  }
  done();
}

async function requestQuickRequestImageTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions|null|undefined,callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  const handler = new QuickImageDataHandler();
  try {
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      console.info(TAG, 'fetchResult success');
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      console.info(TAG, 'photoAsset success',photoAsset);
    let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler);
    console.info(TAG, 'quickRequestImage successfully',requestId);
    expect().assertFail();
  } catch (error) {
    console.error(TAG,testName, `failed; error: ${error.code}`, testName);
    callback(error.code)
  }
  done();
}

export default function MediaAssetManagerRequestImageTest() {
  describe('MediaAssetManagerRequestImageTest', () => {
    let dr = Driver.create();
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    const fetchOptions = fetchAllOption();

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(500);
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('key');
    });

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_001
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_001
     * @tc.desc   requestImagePromiseTest RequestOptions deliveryMode max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_001';
      const fetchOptions = fetchAllOption();
      let maxEnum = getEnumMaxValue(photoAccessHelper.DeliveryMode);
      let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode:maxEnum + 1,
        };
      await requestImagePromiseTest(done, testName,fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_002
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_002
     * @tc.desc   requestImagePromiseTest RequestOptions deliveryMode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_002';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode:-1,
      };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_003
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_003
     * @tc.desc   requestImagePromiseTest RequestOptions deliveryMode 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_003';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode:1000,
      };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_004
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_004
     * @tc.desc   requestImagePromiseTest RequestOptions compatibleMode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_004';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: -1,
      };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_005
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_005
     * @tc.desc   requestImagePromiseTest RequestOptions compatibleMode max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_005';
      const fetchOptions = fetchAllOption();
      let maxEnum = getEnumMaxValue(photoAccessHelper.CompatibleMode);
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: maxEnum + 1
      };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_006
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_006
     * @tc.desc   requestImagePromiseTest RequestOptions compatibleMode undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_006';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: undefined,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_007
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_007
     * @tc.desc   requestImagePromiseTest RequestOptions mediaAssetProgressHandler undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_007';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          mediaAssetProgressHandler:undefined,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_008
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_008
     * @tc.desc   requestImagePromiseTest RequestOptions mediaAssetProgressHandler all negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_008';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:-1,
          compatibleMode: -1,
          mediaAssetProgressHandler:undefined,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_009
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_009
     * @tc.desc   requestImagePromiseTest RequestOptions mediaAssetProgressHandler all max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_009';
      const fetchOptions = fetchAllOption();
      let maxDeliveryEnum = getEnumMaxValue(photoAccessHelper.DeliveryMode);
      let maxCompatibleEnum = getEnumMaxValue(photoAccessHelper.CompatibleMode);
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode: maxDeliveryEnum +1,
          compatibleMode: maxCompatibleEnum +1,
          mediaAssetProgressHandler:undefined,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_010
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_010
     * @tc.desc   requestImagePromiseTest fetchColumns is ['']
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_010';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates:  new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_011
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_011
     * @tc.desc   requestImagePromiseTest fetchColumns is ['text']
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_011';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['text'],
        predicates:  new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_012
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_012
     * @tc.desc   requestImagePromiseTest predicates is error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_REQUEST_ERROR_012';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri', 'title'],
        predicates: AppStorage.get('') as dataSharePredicates.DataSharePredicates
      };
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
      await requestImagePromiseTest(done, testName, fetchOptions, requestOptions, (errCode) => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_0013
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_0013
     * @tc.desc   requestImagePromiseTest RequestOptions asset null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_0013', Level.LEVEL0, async (done: Function) => {
      const handler = new MediaHandler();
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_0013";
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, null, requestOptions, handler);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.info(TAG ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_0014
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_0014
     * @tc.desc   requestImagePromiseTest RequestOptions asset undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_0014', Level.LEVEL0, async (done: Function) => {
      const handler = new MediaHandler();
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_0014";
      let requestOptions: photoAccessHelper.RequestOptions =
        {
          deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, undefined, requestOptions, handler);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_015
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_015
     * @tc.desc   requestImagePromiseTest RequestOptions requestOptions undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_015', Level.LEVEL0, async (done: Function) => {
      const handler = new MediaHandler();
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_015";
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, undefined, handler);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_016
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_016
     * @tc.desc   requestImagePromiseTest RequestOptions requestOptions null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_016', Level.LEVEL0, async (done: Function) => {
      const handler = new MediaHandler();
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_016";
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, null, handler);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_017
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_017
     * @tc.desc   requestImagePromiseTest RequestOptions requestOptions ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_017', Level.LEVEL0, async (done: Function) => {
      const handler = new MediaHandler();
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_017";
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      AppStorage.setOrCreate('key', '');
      let requestOptions: photoAccessHelper.RequestOptions  = AppStorage.get('key') as ESObject;
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_018
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_018
     * @tc.desc   requestImagePromiseTest testContext undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_018', Level.LEVEL0, async (done: Function) => {
      const handler = new MediaHandler();
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_018";
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(undefined, photoAsset, requestOptions, handler);
        console.info(TAG, 'requestImage successfully', requestId);
      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_019
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_019
     * @tc.desc   requestImagePromiseTest testContext null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_019', Level.LEVEL0, async (done: Function,requestOptions: photoAccessHelper.RequestOptions) => {
      const handler = new MediaHandler();
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_019";
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(null, photoAsset, requestOptions, handler);
        console.info(TAG, 'requestImage successfully', requestId);

      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_020
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_020
     * @tc.desc   requestImagePromiseTest testContext ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_020', Level.LEVEL0, async (done: Function,requestOptions: photoAccessHelper.RequestOptions) => {
      const handler = new MediaHandler();
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_020";
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      AppStorage.setOrCreate('key', '');
      let testContext: Context = AppStorage.get('key') as ESObject;
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
        console.info(TAG, 'requestImage successfully', requestId);
      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_021
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_021
     * @tc.desc   requestImagePromiseTest handler ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_021', Level.LEVEL0, async (done: Function) => {
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_021";
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      AppStorage.setOrCreate('key', '');
      let handler: photoAccessHelper.MediaAssetDataHandler<image.ImageSource>= AppStorage.get('key') as ESObject;
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_022
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_022
     * @tc.desc   requestImagePromiseTest handler null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_022', Level.LEVEL0, async (done: Function) => {
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_022";
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, null);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_REQUEST_ERROR_023
     * @tc.number MEDIA_ASSET_MANAGER_REQUEST_ERROR_023
     * @tc.desc   requestImagePromiseTest handler undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_REQUEST_ERROR_023', Level.LEVEL0, async (done: Function) => {
      const testName ="MEDIA_ASSET_MANAGER_REQUEST_ERROR_023";
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, undefined);
        console.info(TAG, 'requestImage successfully', requestId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })



    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_001
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_001
     * @tc.desc   quickRequestImage input deliveryMode is 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_001';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 10000,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_002
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_002
     * @tc.desc   quickRequestImage input deliveryMode is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_002';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -1,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_003
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_003
     * @tc.desc   quickRequestImage input deliveryMode is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_003';
      const fetchOptions = fetchAllOption();
      let maxEnum = getEnumMaxValue(photoAccessHelper.DeliveryMode);
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: maxEnum + 1,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_004
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_004
     * @tc.desc   quickRequestImage input fetchColumns is " "
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_004';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_005
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_005
     * @tc.desc   quickRequestImage input fetchColumns is ['text']
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'qMEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_005';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['text'],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_006
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_006
     * @tc.desc   quickRequestImage input predicates is error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_006';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri', 'title'],
        predicates: AppStorage.get('') as dataSharePredicates.DataSharePredicates
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestQuickRequestImageTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_007
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_007
     * @tc.desc   quickRequestImage input requestOptions is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_007';
      const fetchOptions = fetchAllOption();
      await requestQuickRequestImageTest(done, testName, fetchOptions, null,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_008
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_008
     * @tc.desc   quickRequestImage input requestOptions is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_008';
      const fetchOptions = fetchAllOption();
      await requestQuickRequestImageTest(done, testName, fetchOptions, undefined,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_009
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_009
     * @tc.desc   quickRequestImage input photoAsset is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_009', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_009';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, undefined, requestOptions, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_0010
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_0010
     * @tc.desc   quickRequestImage input photoAsset is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_0010', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_0010';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, null, requestOptions, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })


    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_011
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_011
     * @tc.desc   quickRequestImage input testContext is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_011', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_011';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      AppStorage.setOrCreate('key', '');
      let testContext: Context = AppStorage.get('key') as ESObject;
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);

      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_012
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_012
     * @tc.desc   quickRequestImage input testContext is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_012', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_012';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(null, photoAsset, requestOptions, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);

      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_013
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_013
     * @tc.desc   quickRequestImage input testContext is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_013', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_013';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(undefined, photoAsset, requestOptions, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);

      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_014
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_014
     * @tc.desc   quickRequestImage input requestOptions is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_014', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_014';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, undefined, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_015
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_015
     * @tc.desc   quickRequestImage input requestOptions is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_015', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_015';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, null, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_016
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_016
     * @tc.desc   quickRequestImage input requestOptions is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_016', Level.LEVEL0, async (done: Function) => {
      const handler = new QuickImageDataHandler();
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_016';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      AppStorage.setOrCreate('key', '');
      let requestOptions: photoAccessHelper.RequestOptions  = AppStorage.get('key') as ESObject;
      try {
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_017
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_017
     * @tc.desc   quickRequestImage input handler is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_017';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      AppStorage.setOrCreate('key', '');
      let handler: photoAccessHelper.QuickImageDataHandler<image.Picture> = AppStorage.get('key') as ESObject;
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_018
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_018
     * @tc.desc   quickRequestImage input handler is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_018';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, null);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_019
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_019
     * @tc.desc   quickRequestImage input handler is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_QUICKREQUEST_ERROR_019';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, undefined);
        console.info(TAG, 'quickRequestImage successfully',requestId);
        expect().assertFail();
      }catch (err) {
        console.error(TAG  ,testName +`failed; error`+ err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })


  })
}