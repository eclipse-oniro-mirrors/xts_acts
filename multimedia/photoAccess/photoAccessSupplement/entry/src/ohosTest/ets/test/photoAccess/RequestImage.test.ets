/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image'
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import {
  photoKeys,
  fetchOption, getPermission, driveFn, sleep,
} from '../common'
import common from '@ohos.app.ability.common'
import { dataSharePredicates } from '@kit.ArkData'
import { photoAccessHelper } from '@kit.MediaLibraryKit';

const TAG ='PhotoAssetsSetSupp';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(data: image.ImageSource) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}

class MediaHandlerPicture implements photoAccessHelper.QuickImageDataHandler<image.Picture> {
  onDataPrepared(data: image.Picture, imageSource: image.ImageSource, map: Map<string, string>) {
    console.info('on image data prepared');
  }
}

class MediaDataHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared(data: ArrayBuffer) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}

class MediaDataHandlerVideo implements photoAccessHelper.MediaAssetDataHandler<boolean> {
  onDataPrepared(data: boolean) {
    console.info('on video request status prepared');
  }
}

export default function requestImageTest() {
  describe('requestImageTest', () => {
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0001
     * @tc.desc      requestImage-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:'test'} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0002
     * @tc.desc      requestImage-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:''} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0003
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0003';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
       catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
       }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0004
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0004';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0005
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0005';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '1');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0006
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_0006';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0001
     * @tc.desc      quickRequestImage-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:'test'} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandlerPicture();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0002
     * @tc.desc      quickRequestImage-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:''} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandlerPicture();
        await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0003
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0003';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0004
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0004';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0005
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0005';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '1');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0006
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0006';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0007
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0007
     * @tc.desc      quickRequestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0007', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_QUICK_REQUEST_IMAGE_0007';
      const handler = new MediaHandlerPicture();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.quickRequestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0001
     * @tc.desc      requestImageData-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:'test'} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaDataHandler();
        await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0002
     * @tc.desc      requestImageData-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoAsset = {uri : '',photoType:1,displayName:''} as photoAccessHelper.PhotoAsset;
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaDataHandler();
        await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect().assertFail();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0003
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0003';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0004
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0004';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0005
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0005';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '1');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0006
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_0006';
      const handler = new MediaDataHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0001
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0001';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(null, requestId);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0002
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0002';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(null, '');
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0003
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0003';
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(null, null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0004
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0004';
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(null, undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0005
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0005';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(undefined, requestId);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0006
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0006';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(undefined, '');
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0007
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0007
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0007', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0007';
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(undefined, null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0008
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0008
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0008', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0008';
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(undefined, undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0009
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0009
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0009', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0009';
      const handler = new MediaHandler();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, '');
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0010
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0010
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0010', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0010';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0011
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0011
     * @tc.desc      cancelRequest-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0011', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_0011';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0001
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0001';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '1');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0002
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0002';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0003
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0003
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0003';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0004
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0004
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0004';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0005
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0005
     * @tc.desc      requestVideoFile-801
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0005';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0006
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0006
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0006', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0006';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let phAsset = {uri : '',photoType:photoAsset.photoType,displayName:photoAsset.displayName} as photoAccessHelper.PhotoAsset;
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, phAsset, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0007
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0007
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0007', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0007';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let phAsset = {uri : photoAsset.uri,photoType:photoAsset.photoType,displayName:''} as photoAccessHelper.PhotoAsset;
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, phAsset, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0008
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0008
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0008', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0008';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0009
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0009
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0009', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0009';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(undefined, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0010
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0010
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0010', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0010';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, null, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0011
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0011
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0011', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0011';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, undefined, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0012
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0012
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0012', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0012';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, null,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0013
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0013
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0013', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0013';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, undefined,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0014
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0014
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0014', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0014';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,'', handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0015
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0015
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0015', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0015';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,null, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0016
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0016
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0016', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0016';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,undefined, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0017
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0017
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0017', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0017';
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0018
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0018
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0018', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0018';
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0019
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0019
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0019', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0019';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(undefined, null, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0020
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0020
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0020', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0020';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, null, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0021
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0021
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0021', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0021';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, undefined, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0022
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0022
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0022', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0022';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, null,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0023
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0023
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0023', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0023';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, undefined,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0024
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0024
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0024', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0024';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,'', handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0025
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0025
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0025', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0025';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,null, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0026
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0026
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0026', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0026';
      const handler = new MediaDataHandlerVideo();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions, undefined, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0027
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0027
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0027', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0027';
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,fileUri, null)
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0028
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0028
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0028', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_0028';
      let fileName:string = "demo.mp4";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,fileUri, undefined)
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    });
  }