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
  fetchOption, getPermission, driveFn, sleep, isEmpty, createMovingPhoto
} from '../common'
import common from '@ohos.app.ability.common'
import { dataSharePredicates } from '@kit.ArkData'
import { photoAccessHelper, sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { fileIo, fileIo as fs } from '@kit.CoreFileKit';
import { UIAbility } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { systemDateTime } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';

const TAG ='PhotoAssetsSetSupp';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let fdNumber: number;
async function getFd(fileName: string) {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  let testContext: common.UIAbilityContext = ability.context;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

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

class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let uri = movingPhoto.getUri();
    console.info("moving photo acquired successfully, uri: " + movingPhoto.getUri());
    expect(isEmpty(uri)).assertFalse();
  }
}
let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

class MovingPhotoHandler1 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let imageFileUri: string = '';
    let videoFileUri: string = testContext.filesDir + '/test_mov_1.mp4';
    try {
      await movingPhoto.requestContent(imageFileUri, videoFileUri);
      console.info("moving photo contents retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandler2 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let imageFileUri: string = null as ESObject;
    let videoFileUri: string = testContext.filesDir + '/test_mov_1.mp4';
    try {
      await movingPhoto.requestContent(imageFileUri, videoFileUri);
      console.info("moving photo contents retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandler3 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let imageFileUri: string = undefined as ESObject;
    let videoFileUri: string = testContext.filesDir + '/test_mov_1.mp4';
    try {
      await movingPhoto.requestContent(imageFileUri, videoFileUri);
      console.info("moving photo contents retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandler4 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let imageFileUri: string = testContext.filesDir + '/test_mov_1.jpg';
    let videoFileUri: string = '';
    try {
      await movingPhoto.requestContent(imageFileUri, videoFileUri);
      console.info("moving photo contents retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandler5 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let imageFileUri: string = testContext.filesDir + '/test_mov_1.jpg';
    let videoFileUri: string = null as ESObject;
    try {
      await movingPhoto.requestContent(imageFileUri, videoFileUri);
      console.info("moving photo contents retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandler6 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let imageFileUri: string = testContext.filesDir + '/test_mov_1.jpg';
    let videoFileUri: string = undefined as ESObject;
    try {
      let res = await movingPhoto.requestContent(imageFileUri, videoFileUri);
      console.info("moving photo contents retrieved successfully",res);
    } catch (err) {
      console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
      expect().assertFail();
    }
  }
}

class MovingPhotoHandler7 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let imageFileUri: string = '';
    try {
      await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri);
      console.info("moving photo image content retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve image content of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandler8 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let imageFileUri: string = null as ESObject;
    try {
      await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri);
      console.info("moving photo image content retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve image content of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandler9 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let imageFileUri: string = undefined as ESObject;
    try {
      await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri);
      console.info("moving photo image content retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve image content of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandler10 implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    try {
      let buffer: ArrayBuffer = await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE);
      console.info("moving photo image content retrieved successfully, buffer length: " + buffer.byteLength);
    } catch (err) {
      console.error(`failed to retrieve image content of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
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
        let photoAsset = {uri : '',photoType:2,displayName:''} as photoAccessHelper.PhotoAsset;
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
        let photoAsset = {uri : '',photoType:2,displayName:''} as photoAccessHelper.PhotoAsset;
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
        let photoAsset = {uri : '',photoType:2,displayName:''} as photoAccessHelper.PhotoAsset;
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
        expect(isEmpty(requestId)).assertFalse();
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
        expect(isEmpty(requestId)).assertFalse();
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
        expect(isEmpty(requestId)).assertFalse();
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
        expect(isEmpty(requestId)).assertFalse();
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
        expect(isEmpty(requestId)).assertFalse();
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
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,fileUri, null);
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
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(null, photoAsset, requestOptions,fileUri, undefined);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0029
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0029
     * @tc.desc      close-参数null-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0029', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0029';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.close(null);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.info(TAG, testNum, JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0030
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0030
     * @tc.desc      close-参数undefined-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0030', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0030';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.close(undefined);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`,JSON.stringify(error));
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0031
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0031
     * @tc.desc      close-参数null-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0031', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0031';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.close(null, (err) => {
          if (err === undefined) {
            console.info('asset close succeed.');
          } else {
            console.error(`close failed, error: ${err.code}, ${err.message}`);
          }
        });
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0032
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0032
     * @tc.desc      close-参数undefined-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0032', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLOSE_0032';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.close(undefined, (err) => {
          if (err === undefined) {
            console.info('asset close succeed.');
          } else {
            console.error(`close failed, error: ${err.code}, ${err.message}`);
          }
        });
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0033
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0033
     * @tc.desc      getThumbnail-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0033', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0033';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail((err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect(isEmpty(pixelMap)).assertFalse();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
            expect().assertFail();
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0034
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0034
     * @tc.desc      getThumbnail-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0034', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0034';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let size: image.Size = { width: 720, height: 720 };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect(isEmpty(pixelMap)).assertFalse();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
            expect().assertFail();
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0035
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0035
     * @tc.desc      getThumbnail-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0035', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0035';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(null,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect().assertFail();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
            expect().assertFail();
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0036
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0036
     * @tc.desc      getThumbnail-13900020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0036', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0036';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(undefined,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect(isEmpty(pixelMap)).assertFalse();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
            expect().assertFail();
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0037
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0037
     * @tc.desc      getThumbnail-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0037', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0037';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let size: image.Size = { width: 720, height: 720 };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size).then((pixelMap) => {
          console.info('getThumbnail successful ' + pixelMap);
          expect(isEmpty(pixelMap)).assertFalse();
        }).catch((err: BusinessError) => {
          console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          expect().assertFail();
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0038
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0038
     * @tc.desc      getThumbnail-size为null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0038', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0038';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = null as ESObject;
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size).then((pixelMap) => {
          console.info('getThumbnail successful ' + pixelMap);
          expect(isEmpty(pixelMap)).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        });
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0039
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0039
     * @tc.desc      getThumbnail-size为undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0039', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0039';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = undefined as ESObject;
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size).then((pixelMap) => {
          console.info('getThumbnail successful ' + pixelMap);
          expect(isEmpty(pixelMap)).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          done();
        });
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0040
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0040
     * @tc.desc      clone-正常值success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0040', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0040';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = systemDateTime.getTime().toString();
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect(photoAsset.photoType == newAsset.photoType).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0041
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0041
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0041', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0041';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = null as ESObject;
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0042
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0042
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0042', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0042';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = undefined as ESObject;
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0043
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0043
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0043', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0043';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0044
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0044
     * @tc.desc      clone-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0044', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0044';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '1';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect(isEmpty(newAsset)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0045
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0045
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0045', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0045';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '8z7M8y6N9x115P8w7Q8v6R9u5S8t7T8s6U9r5V8q7W8p6X9o5Y8n7Z8m6a9l5b8k7c8j6d9i5e8h7f8g6g9f5h8e7i8d6j9c5k8b7l8a6m9z5n8y7o8x6p9w5q8v7r8u6s9t5t8s7u8r6v9q5w8p7x8o6y9n5z8m7A8l6B9k5C8j7D8i6E9h5F8g7G8f6H9e5I8d7J8c6K9b5L8a7M8z6N9y5O8x7P8w6Q9v5R8u7S8t6T9s5U8r7V8q6W9p5X8';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0046
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0046
     * @tc.desc      clone-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0046', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_0046';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = 'a9l5b8k7c8j6d9i5e8h7f8g6g9f5h8e7i8d6j9c5k8b7l8a6m9z5n8y7o8x6p9w58v7r8u6s9t5t8s7u8r6v9q5w8p7x8o6y9n5z8m7A8l6B9k5C8j7D8i6E9h5F8g7G8f6H9e5I8d7J8c6K9b5L8a7M8z6N9y5O8x7P8w6Q9v5R8u7S8t6T9s5U8r7V8q6W9p5X8o7Y8n6Z9m5a8l7b8k6c9j5d8i7e8h6f9g5g8f7h8e6i9d5j8c7k8b6l9a5m';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_FIRST_OBJECT_0047
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_FIRST_OBJECT_0047
     * @tc.desc      getFirstObject-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_FIRST_OBJECT_0047', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_FIRST_OBJECT_0047';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        expect(isEmpty(photoAsset)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_0048
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_0048
     * @tc.desc      getLastObject-正常值success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_0048', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_0048';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
        expect(isEmpty(photoAsset)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0049
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0049
     * @tc.desc      getAlbums-枚举值IMAGE-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0049', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0049';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM, sendablePhotoAccessHelper.AlbumSubtype.IMAGE, fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0050
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0050
     * @tc.desc      getAlbums-枚举值VIDEO-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0050', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0050';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM, sendablePhotoAccessHelper.AlbumSubtype.VIDEO, fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0051
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0051
     * @tc.desc      getAlbums-枚举值FAVORITE-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0051', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0051';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM, sendablePhotoAccessHelper.AlbumSubtype.FAVORITE, fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0052
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0052
     * @tc.desc      getAlbums-fetchColumns为null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0052', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0052';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: null as ESObject,
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM, sendablePhotoAccessHelper.AlbumSubtype.IMAGE, fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0053
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0053
     * @tc.desc      getAlbums-fetchColumns为undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0053', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0053';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        const albums = await phAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM, sendablePhotoAccessHelper.AlbumSubtype.IMAGE, undefined);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0054
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0054
     * @tc.desc      getAlbums-fetchColumns为''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0054', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0054';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: '' as ESObject,
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM, sendablePhotoAccessHelper.AlbumSubtype.FAVORITE, fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0055
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0055
     * @tc.desc      getAlbums-fetchColumns非空
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0055', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0055';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM, sendablePhotoAccessHelper.AlbumSubtype.FAVORITE, fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0056
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0056
     * @tc.desc      getAlbums-fetchColumns为空数组
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0056', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0056';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0057
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0057
     * @tc.desc      getAlbums-fetchColumns为空
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0057', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0057';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: '' as ESObject,
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0058
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0058
     * @tc.desc      getAlbums-fetchColumns为null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0058', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0058';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: null as ESObject,
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0059
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0059
     * @tc.desc      getAlbums-fetchColumns为undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0059', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_0059';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: undefined as ESObject,
        predicates: predicates
      };
      try {
        const albums = await phAccessHelper.getAlbums(fetchOption);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0060
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0060
     * @tc.desc      createAsset-subtype枚举值DEFAULT
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0060', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0060';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: sendablePhotoAccessHelper.PhotoSubtype.DEFAULT,
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect(isEmpty(uri)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0061
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0061
     * @tc.desc      createAsset-subtype枚举值SCREENSHOT
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0061', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0061';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: sendablePhotoAccessHelper.PhotoSubtype.SCREENSHOT,
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect(isEmpty(uri)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0062
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0062
     * @tc.desc      createAsset-subtype枚举值MOVING_PHOTO
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0062', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0062';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: sendablePhotoAccessHelper.PhotoSubtype.MOVING_PHOTO,
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect(isEmpty(uri)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0063
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0063
     * @tc.desc      createAsset-subtype枚举值BURST
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0063', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0063';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype: sendablePhotoAccessHelper.PhotoSubtype.BURST,
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect(isEmpty(uri)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0064
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0064
     * @tc.desc      createAsset-extension为''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0064', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0064';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = '';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(14000001);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0065
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0065
     * @tc.desc      createAsset-extension为null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0065', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0065';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = null as ESObject;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0066
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0066
     * @tc.desc      createAsset-extension为undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0066', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0066';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = undefined as ESObject;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0067
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0067
     * @tc.desc      createAsset-extension最小长度
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0067', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0067';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'j';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0068
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0068
     * @tc.desc      createAsset-extension最大长度
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0068', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0068';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'sjdandjansdlkasndalksdnjsakndajksndkjsnakjnjksndjnjksandknqwuewrrwettgsdfdscxsasssdasaadasdwqewqeqwfgfdfvxsaddqwqweqweqwcvbnbnmhjklytqwerttyuuiiophjkdfdgsdfsadzxxczxvcxxvtdvxcasdqwewrzxxcrqweqwdasssdzzxcgtughterertedfasafehuqwrbuwbzmxcnhbqwhbjansdnasbfhhj';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(14000001);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0069
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0069
     * @tc.desc      createAsset-extension最大长度+1
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0069', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_ASSET_0069';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'sjdandjansdlkasndalksdnjsakndajksndkajsnakjnjksndjnjksandknqwuewrrwettgsdfdscxsasssdasaadasdwqewqeqwfgfdfvxsaddqwqweqweqwcvbnbnmhjklytqwerttyuuiiophjkdfdgsdfsadzxxczxvcxxvtdvxcasdqwewrzxxcrqweqwdasssdzzxcgtughterertedfasafehuqwrbuwbzmxcnhbqwhbjansdnasbfhhj';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(14000001);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0070
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0070
     * @tc.desc      getBurstAssets-fetchColumns为空数组
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0070', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0070';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
        await phAccessHelper.getAssets(fetchOption);
      let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let burstKey: string = photoAccessHelper.PhotoKeys.BURST_KEY.toString();
        let photoAccessBurstKey: photoAccessHelper.MemberType = photoAsset.get(burstKey).toString();
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getBurstAssets(photoAccessBurstKey, fetchOption);
        expect(fetchResult).assertUndefined();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0071
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0071
     * @tc.desc      getBurstAssets-fetchColumns非空数组
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0071', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0071';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
        await phAccessHelper.getAssets(fetchOption);
      let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let burstKey: string = photoAccessHelper.PhotoKeys.BURST_KEY.toString();
        let photoAccessBurstKey: photoAccessHelper.MemberType = photoAsset.get(burstKey).toString();
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getBurstAssets(photoAccessBurstKey, fetchOption);
        expect(fetchResult).assertUndefined();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0072
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0072
     * @tc.desc      getBurstAssets-fetchColumns为''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0072', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0072';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: '' as ESObject,
        predicates: predicates
      };
      let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
        await phAccessHelper.getAssets(fetchOption);
      let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let burstKey: string = photoAccessHelper.PhotoKeys.BURST_KEY.toString();
        let photoAccessBurstKey: photoAccessHelper.MemberType = photoAsset.get(burstKey).toString();
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getBurstAssets(photoAccessBurstKey, fetchOption);
        expect(fetchResult).assertUndefined();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0073
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0073
     * @tc.desc      getBurstAssets-burstKey为''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0073', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0073';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getBurstAssets('', fetchOption);
        expect(fetchResult).assertUndefined();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0074
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0074
     * @tc.desc      getBurstAssets-burstKey为null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0074', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0074';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let burstKey: string = null as ESObject;
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getBurstAssets(burstKey, fetchOption);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0075
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0075
     * @tc.desc      getBurstAssets-burstKey为undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0075', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0075';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let burstKey: string = undefined as ESObject;
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getBurstAssets(burstKey, fetchOption);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0076
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0076
     * @tc.desc      getBurstAssets-fetchOption为null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0076', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0076';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
        await phAccessHelper.getAssets(fetchOption);
      let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let burstKey: string = photoAccessHelper.PhotoKeys.BURST_KEY.toString();
        let photoAccessBurstKey: photoAccessHelper.MemberType = photoAsset.get(burstKey).toString();
        let fetchOptions: photoAccessHelper.FetchOptions = null as ESObject;
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getBurstAssets(photoAccessBurstKey, fetchOptions);
        expect(fetchResult).assertUndefined();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0077
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0077
     * @tc.desc      getBurstAssets-fetchOption为undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0077', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_0077';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
        await phAccessHelper.getAssets(fetchOption);
      let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let burstKey: string = photoAccessHelper.PhotoKeys.BURST_KEY.toString();
        let photoAccessBurstKey: photoAccessHelper.MemberType = photoAsset.get(burstKey).toString();
        let fetchOptions: photoAccessHelper.FetchOptions = undefined as ESObject;
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getBurstAssets(photoAccessBurstKey, fetchOptions);
        expect(fetchResult).assertUndefined();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0078
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0078
     * @tc.desc      getAssets-fetchColumns为''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0078', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0078';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: '' as ESObject,
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        expect(isEmpty(fetchResult)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0079
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0079
     * @tc.desc      getAssets-fetchColumns为空数组
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0079', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0079';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let albumFetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE, albumFetchOptions);
      let album: photoAccessHelper.Album = await albumList.getFirstObject();
      try {
        let fetchResult = await album.getAssets(fetchOption);
        expect(isEmpty(fetchResult)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0080
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0080
     * @tc.desc      getAssets-fetchColumns为非空数组
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0080', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0080';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let albumFetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE, albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        let fetchResult = await album.getAssets(fetchOption);
        expect(isEmpty(fetchResult)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0081
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0081
     * @tc.desc      getAssets-fetchColumns为''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0081', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_0081';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let albumFetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: '' as ESObject,
        predicates: predicates
      };
      try {
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE, albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        let fetchResult = await album.getAssets(fetchOption);
        expect(isEmpty(fetchResult)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CLOSE_0082
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CLOSE_0082
     * @tc.desc      getAssets-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CLOSE_0082', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CLOSE_0082';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        fetchResult.close();
        expect(isEmpty(fetchResult)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0083
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0083
     * @tc.desc      getAssets-最小值-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0083', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0083';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(0);
        expect(isEmpty(photoAsset)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0084
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0084
     * @tc.desc      getAssets-最小值-1
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0084', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0084';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(-1);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0085
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0085
     * @tc.desc      getAssets-null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0085', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0085';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(null as ESObject);
        expect(photoAsset).assertUndefined();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0086
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0086
     * @tc.desc      getAssets-undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0086', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_0086';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(undefined as ESObject);
        expect(photoAsset).assertUndefined();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_THUMBNAIL_0087
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_THUMBNAIL_0087
     * @tc.desc      getThumbnail-isEditable-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_THUMBNAIL_0087', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_THUMBNAIL_0087';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let size: image.Size = { width: 720, height: 720 };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size).then((pixelMap) => {
          console.info('getThumbnail successful ' + pixelMap);
          expect(pixelMap.isEditable).assertFalse();
        }).catch((err: BusinessError) => {
          console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          expect().assertFail();
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_THUMBNAIL_0088
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_THUMBNAIL_0088
     * @tc.desc      getThumbnail-isStrideAlignment-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_THUMBNAIL_0088', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_THUMBNAIL_0088';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let size: image.Size = { width: 720, height: 720 };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size).then((pixelMap) => {
          console.info('getThumbnail successful ' + pixelMap);
          expect(isEmpty(pixelMap.isStrideAlignment)).assertFalse();
        }).catch((err: BusinessError) => {
          console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
          expect().assertFail();
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_COMMIT_MODIFY_0089
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_COMMIT_MODIFY_0089
     * @tc.desc      commitModify-139000020
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_COMMIT_MODIFY_0089', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_COMMIT_MODIFY_0089';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE, fetchOption);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        album.albumName = '';
        await album.commitModify();
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0090
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0090
     * @tc.desc      getPhotoAccessHelper-null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0090', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0090';
      let testContext: common.UIAbilityContext = null as ESObject;
      try {
        let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
        expect(isEmpty(phAccessHelper)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0091
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0091
     * @tc.desc      getPhotoAccessHelper-undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0091', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0091';
      let testContext: common.UIAbilityContext = undefined as ESObject;
      try {
        let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
        expect(isEmpty(phAccessHelper)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0092
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0092
     * @tc.desc      getThumbnail-isEditable-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0092', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0092';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let size: image.Size = { width: 720, height: 720 };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect(pixelMap.isEditable).assertFalse();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
            expect().assertFail();
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0093
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0093
     * @tc.desc      getThumbnail-isStrideAlignment-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0093', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_0093';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let size: image.Size = { width: 720, height: 720 };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ' + pixelMap);
            expect(isEmpty(pixelMap.isStrideAlignment)).assertFalse();
          } else {
            console.error(`getThumbnail fail with error: ${err.code}, ${err.message}`);
            expect().assertFail();
          }
        });
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0094
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0094
     * @tc.desc      requestMovingPhoto-FAST_MODE-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0094', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0094';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0095
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0095
     * @tc.desc      requestMovingPhoto-HIGH_QUALITY_MODE-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0095', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0095';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0096
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0096
     * @tc.desc      requestMovingPhoto-BALANCE_MODE-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0096', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0096';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0097
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0097
     * @tc.desc      requestMovingPhoto-testContext-null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0097', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0097';
      let testContext: common.UIAbilityContext = null as ESObject;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0098
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0098
     * @tc.desc      requestMovingPhoto-testContext-undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0098', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0098';
      let testContext: common.UIAbilityContext = undefined as ESObject;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0099
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0099
     * @tc.desc      requestMovingPhoto-photoAsset-null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0099', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0099';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = null;
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0100
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0100
     * @tc.desc      requestMovingPhoto-photoAsset-undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0100', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0100';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = undefined;
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0101
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0101
     * @tc.desc      requestMovingPhoto-requestOptions-null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0101', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0101';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, null, handler);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0102
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0102
     * @tc.desc      requestMovingPhoto-requestOptions-undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0102', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0102';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, undefined, handler);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0103
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0103
     * @tc.desc      requestMovingPhoto-handler-null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0103', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0103';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, null);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0104
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0104
     * @tc.desc      requestMovingPhoto-handler-undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0104', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_0104';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, undefined);
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
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_URI_0105
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_URI_0105
     * @tc.desc      MovingPhoto-getUri-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_URI_0105', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_URI_0105';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0106
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0106
     * @tc.desc      requestContent-imageUri-''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0106', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0106';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler1();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0107
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0107
     * @tc.desc      requestContent-imageUri-null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0107', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0107';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler2();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0108
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0108
     * @tc.desc      requestContent-imageUri-undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0108', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0108';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler3();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0109
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0109
     * @tc.desc      requestContent-videoUri-''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0109', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0109';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler4();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0110
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0110
     * @tc.desc      requestContent-videoUri-null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0110', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0110';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler5();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0111
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0111
     * @tc.desc      requestContent-videoUri-undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0111', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0111';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler6();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0112
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0112
     * @tc.desc      requestContent-fileUri-''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0112', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0112';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler7();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0113
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0113
     * @tc.desc      requestContent-fileUri-null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0113', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0113';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler8();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0114
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0114
     * @tc.desc      requestContent-fileUri-undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0114', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0114';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler9();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0115
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0115
     * @tc.desc      requestContent-resourceType-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0115', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_0115';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler10();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(isEmpty(requestId)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_VIDEO_ASSET_REQUEST_0116
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_VIDEO_ASSET_REQUEST_0116
     * @tc.desc      createVideoAssetRequest-success-属性覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_VIDEO_ASSET_REQUEST_0116', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_CREATE_VIDEO_ASSET_REQUEST_0116';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let fileUri = testContext.filesDir + '/test_mov_1.mp4';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, fileUri);
        expect(isEmpty(assetChangeRequest.comment)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_WRITE_CACHE_HANDLER_0117
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_WRITE_CACHE_HANDLER_0117
     * @tc.desc      getWriteCacheHandler-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_WRITE_CACHE_HANDLER_0117', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_WRITE_CACHE_HANDLER_0117';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        let fd: number = await assetChangeRequest.getWriteCacheHandler();
        expect(isEmpty(fd)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_000001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_000001
     * @tc.desc      getAlbums-第三个参数为undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_000001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_ALBUMS_000001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      try {
        const albums = await phAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM, sendablePhotoAccessHelper.AlbumSubtype.IMAGE, undefined);
        expect(isEmpty(albums)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    });
  }