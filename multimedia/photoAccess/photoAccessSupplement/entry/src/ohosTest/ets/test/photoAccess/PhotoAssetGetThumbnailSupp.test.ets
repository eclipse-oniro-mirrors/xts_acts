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

export default function getThumbnailTestSupp() {
  describe('getThumbnailTestSupp', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = [ "01.mp4",'01.mpeg','01.png','01.gif','stm_RAW.dng'];

    beforeAll(async () => {
      await getPermission();
      await driveFn();
      await sleep(2000);
    });

    const getThumbnailPromise =
      async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, size: image.Size | undefined,
        callback: (data: image.Size) => void) => {
        try {
          let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
            await sendablePhAccessHelper.getAssets(fetchOps);
          let asset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          console.info(TAG,'asset successful ' + asset);
          let pixelMap: image.PixelMap;
          pixelMap = await asset.getThumbnail(size);
          console.info(TAG,'getThumbnail successful ' + pixelMap);
          const info = await pixelMap.getImageInfo();
          callback(info.size);
          done();
        } catch (error) {
          console.info(TAG, testNum, `failed; error: ${error},code:${error.code}`);
          console.info(TAG, testNum, `error code is 3, device does not support`);
          expect(String(error.code)).assertEqual("3");
          done();
        }
      }

    let getThumbnailPromiseAbnormal = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: ESObject, callback: (errorCode: number) => void) => {
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await sendablePhAccessHelper.getAssets(fetchOps);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.info(TAG,'asset successful ' + asset);
        await asset.getThumbnail(size);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, `failed; error: ${error},code:${error.code}`);
        callback(error.code);
        done();
      }
    }

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_001
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_001
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size: image.Size = {
        height: -1,
        width: 128
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode) => {
        expect(errorCode).assertEqual('3');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_002
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_002
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_003
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_003
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_003';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_004
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_004
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_005
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_005
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_006
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_006
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_006';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size: image.Size = {
        height: 128,
        width: -1
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode) => {
        expect(errorCode).assertEqual('3');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_007
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_007
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_008
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_008
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_008';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_009
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_009
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_009';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_010
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_010
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_010';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_011
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_011
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_011', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_011';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_012
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_012
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_012', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_013
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_013
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_013', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_013';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_014
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_014
     * @tc.desc   getThumbnail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_014', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_014';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
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



    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_015
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_015
     * @tc.desc   getThumbnail Abnormal .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_015', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_015';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
      const size: image.Size = {
        height: -1,
        width: 128
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode) => {
        expect(errorCode).assertEqual('3');
      });
    });
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_016
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_016
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_016', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_016';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
      console.info(TAG,testNum,'fetchOps successful ' + fetchOps);
      const size: image.Size = {
        width: undefined as ESObject, height: 128
        // width: 256, height: 128
      };
      const expectSize: image.Size = {
        width: 256, height: 128
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        console.info(TAG,'photoAsset:data.width,expectSize.width : ' + data.width,expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
        console.info(TAG,'photoAsset:data.width,expectSize.width : ' + data.width,expectSize.width);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_018
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_018
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_018', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_018';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_019
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_019
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_019', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_019';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_020
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_020
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_020', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_020';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_021
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_021
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_021', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_021';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_022
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_022
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_022', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_022';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_023
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_023
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_023', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_023';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_024
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_024
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_024', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_024';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_025
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_025
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_025', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_025';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_026
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_026
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_026', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_026';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_027
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_027
     * @tc.desc   getThumbnail .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_027', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_027';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
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
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_028
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_028
     * @tc.desc   getThumbnail Abnormal .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_028', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_028';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_029
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_029
     * @tc.desc   getThumbnail Abnormal .01.gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_029', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_029';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.gif');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });





    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_030
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_030
     * @tc.desc   getThumbnail Abnormal .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_030', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_030';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
      const size: image.Size = {
        height: -1,
        width: 128
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode) => {
        expect(errorCode).assertEqual('3');
      });
    });
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_031
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_031
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_031', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_031';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_032
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_032
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_032', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_032';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_033
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_033
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_033', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_033';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_034
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_034
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_034', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_034';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_035
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_035
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_035', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_035';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_036
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_036
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_036', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_036';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_037
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_037
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_037', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_037';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_038
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_038
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_038', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_038';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_039
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_039
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_039', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_039';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_040
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_040
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_040', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_040';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_041
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_041
     * @tc.desc   getThumbnail .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_041', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_041';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
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
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_042
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_042
     * @tc.desc   getThumbnail Abnormal .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_042', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_042';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_043
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_043
     * @tc.desc   getThumbnail Abnormal .mpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_043', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_043';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mpeg');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });








    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_044
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_044
     * @tc.desc   getThumbnail Abnormal .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_044', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_044';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
      const size: image.Size = {
        height: -1,
        width: 128
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode) => {
        expect(errorCode).assertEqual('3');
      });
    });
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_045
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_045
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_045', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_045';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
      console.info(TAG,testNum,'fetchOps successful ' + fetchOps);
      const size: image.Size = {
        width: undefined as ESObject, height: 128
        // width: 256, height: 128
      };
      const expectSize: image.Size = {
        width: 256, height: 128
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        console.info(TAG,'photoAsset:data.width,expectSize.width : ' + data.width,expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
        console.info(TAG,'photoAsset:data.width,expectSize.width : ' + data.width,expectSize.width);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_046
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_046
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_046', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_046';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_047
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_047
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_047', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_047';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_048
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_048
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_048', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_048';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_049
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_049
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_049', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_049';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_050
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_050
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_050', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_050';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_051
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_051
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_051', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_051';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_052
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_052
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_052', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_052';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_053
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_053
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_053', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_053';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_054
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_054
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_054', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_054';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_055
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_055
     * @tc.desc   getThumbnail .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_055', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_055';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
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
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_056
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_056
     * @tc.desc   getThumbnail Abnormal .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_056', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_056';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_057
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_057
     * @tc.desc   getThumbnail Abnormal .01.png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_057', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_057';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.png');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });






    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_058
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_058
     * @tc.desc   getThumbnail Abnormal stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_058', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_058';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
      const size: image.Size = {
        height: -1,
        width: 128
      };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode) => {
        expect(errorCode).assertEqual('3');
      });
    });
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_059
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_059
     * @tc.desc   getThumbnail .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_059', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_059';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
      console.info(TAG,testNum,'fetchOps successful ' + fetchOps);
      const size: image.Size = {
        width: undefined as ESObject, height: 128
        // width: 256, height: 128
      };
      const expectSize: image.Size = {
        width: 256, height: 128
      };
      await getThumbnailPromise(done, testNum, fetchOps, size, (data: image.Size) => {
        expect(data.width).assertEqual(expectSize.width);
        console.info(TAG,'photoAsset:data.width,expectSize.width : ' + data.width,expectSize.width);
        expect(data.height).assertEqual(expectSize.height);
        console.info(TAG,'photoAsset:data.width,expectSize.width : ' + data.width,expectSize.width);
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_060
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_060
     * @tc.desc   getThumbnail .01.stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_060', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_060';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_061
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_061
     * @tc.desc   getThumbnail stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_061', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_061';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_062
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_062
     * @tc.desc   getThumbnail .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_062', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_062';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_063
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_063
     * @tc.desc   getThumbnail .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_063', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_063';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_064
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_064
     * @tc.desc   getThumbnail stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_064', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_064';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_065
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_065
     * @tc.desc   getThumbnail .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_065', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_065';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_066
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_066
     * @tc.desc   getThumbnail .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_066', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_066';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_067
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_067
     * @tc.desc   getThumbnail .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_067', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_067';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_068
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_068
     * @tc.desc   getThumbnail .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_068', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_068';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_069
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_069
     * @tc.desc   getThumbnail .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_069', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_069';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
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
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_070
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_070
     * @tc.desc   getThumbnail Abnormal .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_070', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_070';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_071
     * @tc.number SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_071
     * @tc.desc   getThumbnail Abnormal .stm_RAW.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_071', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_MEDIA_PHOTO_ASSET_SENDABLE_ASSET_GET_THUMBNAIL_071';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'stm_RAW.dng');
      AppStorage.setOrCreate('key', '');
      const size: image.Size = AppStorage.get('key') as ESObject;
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size, (errorCode: number) => {
        expect(errorCode).assertEqual('13900020');
      });
    });




  })
}
