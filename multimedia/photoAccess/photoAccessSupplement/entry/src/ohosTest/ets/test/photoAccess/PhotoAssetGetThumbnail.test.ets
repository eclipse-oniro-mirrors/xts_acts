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
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import image from '@ohos.multimedia.image';
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';
import { getPermission, fetchOption, sleep, driveFn } from '../common';

const TAG = 'createImageSource';
const photoKeys = photoAccessHelper.PhotoKeys;

export default function getThumbnailTest() {
  describe('getThumbnailTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper =
      sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['01.jpg', "01.mp4"];

    beforeAll(async () => {
      await getPermission();
      await driveFn();
      await sleep(2000);
      await createResource(globalContext, fileNameList);
    });

    const getThumbnailPromise =
      async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, size: image.Size | undefined,
        callback: (data: image.Size) => void) => {
        try {
          let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
            await sendablePhAccessHelper.getAssets(fetchOps);
          let asset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          let pixelMap: image.PixelMap;
          pixelMap = await asset.getThumbnail(size);
          const info = await pixelMap.getImageInfo();
          callback(info.size);
          done();
        } catch (error) {
          console.info(TAG, testNum, `failed; error: ${error},code:${error.code}`);
          expect().assertFail();
          done();
        }
      }

    let getThumbnailPromiseAbnormal = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject, callback: (errorCode: number) => void) => {
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await sendablePhAccessHelper.getAssets(fetchOps);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await asset.getThumbnail(size);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, `failed; error: ${error},code:${error.code}`);
        callback(error.code);
        done();
      }
    }

    let createResource = async (context: common.UIAbilityContext, fileNameList: Array<string>) => {
      try {
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
        let imageUri = 'file:///data/storage/el2/base/haps/entry_test/files/01.jpg';
        let videoUri = 'file:///data/storage/el2/base/haps/entry_test/files/01.mp4';
        for (let i = 0; i < fileNameList.length; i++) {
          let fileName = fileNameList[i];
          let displayName = fileName.substring(0, fileName.lastIndexOf("."));
          console.log(`createResource :: displayName is ${displayName}`);
          if (fileName.endsWith(".jpg")) {
            let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
            let extension: string = 'jpg';
            let options: photoAccessHelper.CreateOptions = {
              title: displayName
            }
            let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
              photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, options);
            assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageUri);
            await phAccessHelper.applyChanges(assetChangeRequest);
            console.log(`createResource :: applyChange ${fileName} success !`);
          }
          if (fileName.endsWith(".mp4")) {
            let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
            let extension: string = 'mp4';
            let options: photoAccessHelper.CreateOptions = {
              title: displayName
            }
            let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
              photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, options);
            assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
            await phAccessHelper.applyChanges(assetChangeRequest);
            console.log(`createResource :: applyChange ${fileName} success !`);
          }
        }
      } catch (error) {
        console.log(`createResource :: run failed, message is ${error},code is ${error.code}`);
      }
    }

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0001
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0001
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size: image.Size = {
        height: -1,
        width: 128
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode) => {
        expect(errorCode).assertEqual('3');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0002
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0002
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size: image.Size = {
        width: undefined as ESObject, height: 128
      };
      const expectSize: image.Size = {
        width: 256, height: 128
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0003
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0003
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0003';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size: image.Size = {
        width: null as ESObject, height: 128
      };
      const expectSize: image.Size = {
        width: 256, height: 128
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0004
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0004
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = {
        width: AppStorage.get('key') as ESObject, height: 128
      };
      const expectSize: image.Size = {
        width: 256, height: 128
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0005
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0005
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      AppStorage.setOrCreate('key', []);
      const size: image.Size = {
        width: AppStorage.get('key') as ESObject, height: 128
      };
      const expectSize: image.Size = {
        width: 256, height: 128
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0006
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0006
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0006';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size: image.Size = {
        height: 128,
        width: -1
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode) => {
        expect(errorCode).assertEqual('3');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0007
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0007
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size: image.Size = {
        width: 128, height: null as ESObject
      };
      const expectSize: image.Size = {
        width: 128, height: 256
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0008
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0008
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0008';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size: image.Size = {
        width: 128, height: undefined as ESObject
      };
      const expectSize: image.Size = {
        width: 128, height: 256
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0009
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0009
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0009';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = {
        width: 128, height: AppStorage.get('key') as ESObject
      };
      const expectSize: image.Size = {
        width: 128, height: 256
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0010
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0010
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0010';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      AppStorage.setOrCreate('key', []);
      const size: image.Size = {
        width: 128, height: AppStorage.get('key') as ESObject
      };
      const expectSize: image.Size = {
        width: 128, height: 256
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });


    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0012
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0012
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0012', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size: image.Size = null as ESObject;
      const expectSize: image.Size = {
        width: 256, height: 256
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0013
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0013
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0013', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0013';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size: image.Size = undefined as ESObject;
      const expectSize: image.Size = {
        width: 256, height: 256
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0014
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0014
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0014', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0014';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0015
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0015
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0015', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_0015';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      AppStorage.setOrCreate('key', []);
      const size: image.Size = AppStorage.get('key') as ESObject;
      const expectSize: image.Size = {
        width: 256, height: 256
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
      });
    });
  })
}
