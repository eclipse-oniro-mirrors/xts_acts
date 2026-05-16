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
import { JSON } from '@kit.ArkTS';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { dataSharePredicates } from '@kit.ArkData';



const TAG = LOG_TAG + 'requestImageDataSupp';

class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared(data: ArrayBuffer) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
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
async function requestImageDataPromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions,callback: (errCode: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  const handler = new MediaDataHandler();
  try {
    let fetchResult = await phAccessHelper.getAssets(fetchOptions);
    console.info(TAG, 'fetchResult success');
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    console.info(TAG, 'photoAsset success',photoAsset);
    let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
    console.info(TAG, 'requestImageData successfully',requestId);
    expect().assertFail();
  } catch (error) {
    console.error(TAG, testName,`failed; error:${error.code} ${error}`);
    callback(error.code);
  }
  done();
}
async function requestImageDataPromiseTest1(done: Function, testName: string, callback: () => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  const handler = new MediaDataHandler();
  try {
   callback();
    expect().assertFail();
  } catch (error) {
    console.error(TAG, testName,`failed; error:${error.code} ${error}`);
  }
  done();
}
let power: ESObject;

export default function MediaAssetManagerRequestImageDataTest() {
  describe('MediaAssetManagerRequestImageDataTest', () => {
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
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_001
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_001
     * @tc.desc   requestImageDataPromiseTest deliveryMode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_001';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode:-1,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_002
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_002
     * @tc.desc   requestImageDataPromiseTest deliveryMode 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_002';
      const fetchOptions = fetchAllOption();
      const maxEnum = getEnumMaxValue(photoAccessHelper.DeliveryMode);
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode:maxEnum + 1,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003
     * @tc.desc   requestImageDataPromiseTest input deliveryMode is 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 10000,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_003 + requestImageDataPromiseTest: " + requestImageDataPromiseTest);
      await sleep(10);
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_004
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_004
     * @tc.desc   requestImageDataPromiseTest compatibleMode -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_004';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: -1,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_005
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_005
     * @tc.desc   requestImageDataPromiseTest compatibleMode 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_005';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: 2,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_006
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_006
     * @tc.desc   requestImageDataPromiseTest compatibleMode undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_006';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: undefined,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_007
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_007
     * @tc.desc   requestImageDataPromiseTest mediaAssetProgressHandler undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_007';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        mediaAssetProgressHandler:undefined,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_008
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_008
     * @tc.desc   requestImageDataPromiseTest mediaAssetProgressHandler all negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_008';
      const fetchOptions = fetchAllOption();
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -1,
        compatibleMode: -1,
        mediaAssetProgressHandler:undefined,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_009
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_009
     * @tc.desc   requestImageDataPromiseTest mediaAssetProgressHandler all max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_009';
      const fetchOptions = fetchAllOption();
      let maxEnum = getEnumMaxValue(photoAccessHelper.CompatibleMode);
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        compatibleMode:maxEnum + 1,
        mediaAssetProgressHandler:undefined,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('401');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0010
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0010
     * @tc.desc   requestImageDataPromiseTest predicates is error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0010';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri', 'title'],
        predicates: AppStorage.get('') as dataSharePredicates.DataSharePredicates
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('14000011');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0011
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0011
     * @tc.desc   requestImageDataPromiseTest fetchColumns is ['']
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0011';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates:  new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0012
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0012
     * @tc.desc   requestImageDataPromiseTest fetchColumns ['text']
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0012';
      const fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['text'],
        predicates:  new dataSharePredicates.DataSharePredicates()
      };
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      await requestImageDataPromiseTest(done, testName, fetchOptions, requestOptions,(errCode) => {
        expect(errCode).assertEqual('13900020');
      })
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013
     * @tc.desc   requestImageDataPromiseTest asset null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      try {
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, null, requestOptions, handler);
        console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0013 + requestId: " + requestId);
      }
      catch (err) {
        console.info(TAG ,testName + err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014
     * @tc.desc   requestImageDataPromiseTest asset undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: 2,
      };
      try {
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, undefined, requestOptions, handler);
        console.info(TAG + "MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_0014 + requestId: " + requestId);
      }
      catch (err) {
        console.info(TAG ,testName + err + err.code);
        expect(err.code).assertEqual('401');
      }
      done();
    })




    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_017
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_017
     * @tc.desc   requestImageDataPromiseTest requestOptions is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_017', Level.LEVEL0, async (done: Function) => {
    const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_017';
    let fetchResult = await phAccessHelper.getAssets(fetchOptions);
    const handler = new MediaDataHandler();
      AppStorage.setOrCreate('key', '');
      let requestOptions: photoAccessHelper.RequestOptions  = AppStorage.get('key') as ESObject;
    try{
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      console.info(TAG, testName,'photoAsset success',photoAsset);
      let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
      console.info(TAG, testName,'requestImageData successfully',requestId);
    }catch (error) {
      console.error(TAG, testName,`failed; error:${error.code} ${error}`);
      expect(error.code).assertEqual('401');
    }
    done();
  })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_018
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_018
     * @tc.desc   requestImageDataPromiseTest requestOptions is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_018';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      const handler = new MediaDataHandler();
      try{
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.info(TAG, testName,'photoAsset success',photoAsset);
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, null, handler);
        console.info(TAG, testName,'requestImageData successfully',requestId);
      }catch (error) {
        console.error(TAG, testName,`failed; error:${error.code} ${error}`);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_019
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_019
     * @tc.desc   requestImageDataPromiseTest requestOptions is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_019';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      const handler = new MediaDataHandler();
      try{
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.info(TAG, testName,'photoAsset success',photoAsset);
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, undefined, handler);
        console.info(TAG, testName,'requestImageData successfully',requestId);
      }catch (error) {
        console.error(TAG, testName,`failed; error:${error.code} ${error}`);
        expect(error.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_020
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_020
     * @tc.desc   requestImageDataPromiseTest Context is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_020';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      const handler = new MediaDataHandler();
      try{
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.info(TAG, testName,'photoAsset success',photoAsset);
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(null, photoAsset, requestOptions, handler);
        console.info(TAG, testName,'requestImageData successfully',requestId);
      }catch (error) {
        console.error(TAG, testName,`failed; error:${error.code} ${error}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_021
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_021
     * @tc.desc   requestImageDataPromiseTest Context is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_021';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      const handler = new MediaDataHandler();
      try{
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.info(TAG, testName,'photoAsset success',photoAsset);

        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(undefined, photoAsset, requestOptions, handler);
        console.info(TAG, testName,'requestImageData successfully',requestId);
      }catch (error) {
        console.error(TAG, testName,`failed; error:${error.code} ${error}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_022
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_022
     * @tc.desc   requestImageDataPromiseTest Context is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_022';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      const handler = new MediaDataHandler();
      try{
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.info(TAG, testName,'photoAsset success',photoAsset);
        AppStorage.setOrCreate('key', '');
        let Context: Context = AppStorage.get('key') as ESObject;
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(Context, photoAsset, requestOptions, handler);
        console.info(TAG, testName,'requestImageData successfully',requestId);
      }catch (error) {
        console.error(TAG, testName,`failed; error:${error.code} ${error}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_023
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_023
     * @tc.desc   requestImageDataPromiseTest handler is ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_023';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      try{
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.info(TAG, testName,'photoAsset success',photoAsset);
        AppStorage.setOrCreate('key', '');
        let handler: photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> = AppStorage.get('key') as ESObject;
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
        console.info(TAG, testName,'requestImageData successfully',requestId);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error:${error.code} ${error}`);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_024
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_024
     * @tc.desc   requestImageDataPromiseTest handler is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_024';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      try{
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.info(TAG, testName,'photoAsset success',photoAsset);
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, null);
        console.info(TAG, testName,'requestImageData successfully',requestId);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error:${error.code} ${error}`);
        expect(error.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.name   MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_025
     * @tc.number MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_025
     * @tc.desc   requestImageDataPromiseTest handler is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ASSET_MANAGER_CONSTRUCTOR_ERROR_025';
      let fetchResult = await phAccessHelper.getAssets(fetchOptions);
      try{
        let requestOptions: photoAccessHelper.RequestOptions =
          {
            deliveryMode:photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          };
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.info(TAG, testName,'photoAsset success',photoAsset);
        let requestId = await  photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, undefined);
        console.info(TAG, testName,'requestImageData successfully',requestId);
        expect().assertFail();
      }catch (error) {
        console.error(TAG, testName,`failed; error:${error.code} ${error}`);
        expect(error.code).assertEqual('401');
      }
      done();
    })

  })
}