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
import image from '@ohos.multimedia.image';
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from '../../../../hypium/index'
import Context from "application.Context"
import hilog from '@ohos.hilog'
import { fetchOption, getFileAsset, getPermission, driveFn, sleep, pushCreateAsset } from '../Common.test.ets'
import { BusinessError } from '@ohos.base'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function getThumbnailTest() {

  const fileNameList = ["getThumb.jpg", "getThumb.mp4"];
  describe('getThumbnailTest', (): void => {

    let getThumbnailCallback1 = async (done: () => void, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions): Promise<void> => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        asset.getThumbnail((err: BusinessError | null, pixelMap: image.PixelMap | undefined): void => {
          try {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s', `${testNum} getThumbnail failed; error: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await (pixelMap as image.PixelMap).getImageInfo();
              const defaultSize: image.Size = {
                width: 256, height: 256
              };
              expect(info.size.width).assertEqual(defaultSize.width);
              expect(info.size.height).assertEqual(defaultSize.height);
            }
          } catch (error) {
            hilog.info(domain, tag, '%{public}s', `${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let getThumbnailCallback2 = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: image.Size, expectSize: image.Size): Promise<void> => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        asset.getThumbnail(size, (err:BusinessError<void> | null, pixelMap: image.PixelMap | undefined):void => {
          try {
            if (err == undefined) {
              hilog.info(domain, tag, '%{public}s', `${testNum} getThumbnail failed; error: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await (pixelMap as image.PixelMap).getImageInfo();
              expect(info?.size.width).assertEqual(expectSize.width);
              expect(info?.size.height).assertEqual(expectSize.height);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let getThumbnailCallbackAbnormal =
      async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
        size: image.Size | undefined): Promise<void> => {
        try {
          let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
          asset.getThumbnail(size as image.Size, (err, pixelMap): void => {
            if (err) {
              hilog.info(domain, tag, '%{public}s', `${testNum} getThumbnail failed; error: ${err}`);
            } else {
              expect(false).assertTrue();
            }
            done();
          })
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
          done();
        }
      }

    let getThumbnailCallbackNormal = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: image.Size): Promise<void> => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        asset.getThumbnail(size, (err: BusinessError | null, pixelMap): void => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', `${testNum} getThumbnail failed; error: ${err}`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let getThumbnailPromise1 = async (done: () => void, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions): Promise<void> => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        const pixelMap = await asset.getThumbnail();
        hilog.info(domain, tag, '%{public}s', `${testNum} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        const defaultSize: image.Size = {
          width: 256, height: 256
        };
        expect(info.size.width).assertEqual(defaultSize.width);
        expect(info.size.height).assertEqual(defaultSize.height);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let getThumbnailPromise2 = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: image.Size | undefined, expectSize: image.Size): Promise<void> => {
      try {
        let asset: photoAccessHelper.PhotoAsset;
        asset = await getFileAsset(testNum, fetchOps);
        hilog.info(domain, tag, '%{public}s', `[WHAN]${testNum} asset: ${JSON.stringify(asset)}`);
        let pixelMap: image.PixelMap;
        pixelMap = await asset.getThumbnail(size);
        hilog.info(domain, tag, '%{public}s', `${testNum} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        expect(info.size.width).assertEqual(expectSize.width);
        expect(info.size.height).assertEqual(expectSize.height);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let getThumbnailPromiseAbnormal =
      async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
        size: image.Size): Promise<void> => {
        try {
          let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
          await asset.getThumbnail(size);
          expect(false).assertTrue()
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
          done();
        }
      }

    let getThumbnailPromiseNormal = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      size: image.Size): Promise<void> => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        await asset.getThumbnail(size);
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      let testContext: Context = Hypium.get("context") as Context;
      await getPermission();
      await driveFn();
      await sleep(1000);
      await pushCreateAsset(testContext, fileNameList);
    });

    /**
     * @tc.name   getThumbnail_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0000
     * @tc.desc   getThumbnail(image) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_000';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        await getThumbnailCallback1(done, testNum, fetchOps);
      });

    /**
     * @tc.name   getThumbnail_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0100
     * @tc.desc   getThumbnail(image) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_001';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 128, height: 128
        };
        const expectSize: image.Size = {
          width: 128, height: 128
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0200
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_002';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 1, height: 1024
        };
        const expectSize: image.Size = {
          width: 1, height: 1024
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0300
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_003';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 1024, height: 1
        };
        const expectSize: image.Size = {
          width: 1024, height: 1
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0400
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_004';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 1024, height: 1024
        };
        const expectSize: image.Size = {
          width: 1024, height: 1024
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_005
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0500
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_005';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 1, height: 1
        };
        const expectSize: image.Size = {
          width: 1, height: 1
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_006
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0600
     * @tc.desc   getThumbnail(image) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_006';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          height: 128, width: 0
        };
        const expectSize: image.Size = {
          width: 256, height: 128
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_007
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0700
     * @tc.desc   getThumbnail(image) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_007';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 128, height: 0
        };
        const expectSize: image.Size = {
          width: 128, height: 256
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_008
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0800
     * @tc.desc   getThumbnail(image) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_008';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size | undefined = undefined;
        await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_callback_static_009
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_0900
     * @tc.desc   getThumbnail(image) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_009';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 0, height: 0
        };
        await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_callback_static_010
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1000
     * @tc.desc   getThumbnail(image) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_010';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: -1, height: -1
        };
        await getThumbnailCallbackNormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_callback_static_011
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1100
     * @tc.desc   getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_011';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 99999, height: 99999
        };
        await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
      });

    //video
    /**
     * @tc.name   getThumbnail_callback_static_012
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1200
     * @tc.desc   getThumbnail(video) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_callback_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_012';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        await getThumbnailCallback1(done, testNum, fetchOps);
      });

    /**
     * @tc.name   getThumbnail_callback_static_013
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1300
     * @tc.desc   getThumbnail(video) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_callback_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_013';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 128, height: 128
        };
        const expectSize: image.Size = {
          width: 128, height: 128
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_014
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1400
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_014';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 1, height: 1024
        };
        const expectSize: image.Size = {
          width: 1, height: 1024
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_015
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1500
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_015';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 1024, height: 1
        };
        const expectSize: image.Size = {
          width: 1024, height: 1
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_016
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1600
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_016';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 1024, height: 1024
        };
        const expectSize: image.Size = {
          width: 1024, height: 1024
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_017
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1700
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_017';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 1, height: 1
        };
        const expectSize: image.Size = {
          width: 1, height: 1
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_018
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1800
     * @tc.desc   getThumbnail(video) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_018';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          height: 128, width: 0
        };
        const expectSize: image.Size = {
          width: 256, height: 128
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_019
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_1900
     * @tc.desc   getThumbnail(video) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_019';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 128, height: 0
        };
        const expectSize: image.Size = {
          width: 128, height: 256
        };
        await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_callback_static_020
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_2000
     * @tc.desc   getThumbnail(video) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_020';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size | undefined = undefined;
        await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_callback_static_021
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_2100
     * @tc.desc   getThumbnail(video) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_021';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 0, height: 0
        };
        await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_callback_static_022
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_2200
     * @tc.desc   getThumbnail(video) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_022';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: -1, height: -1
        };
        await getThumbnailCallbackNormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_callback_static_023
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_STATIC_2300
     * @tc.desc   getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_callback_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_callback_static_023';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 99999, height: 99999
        };
        await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
      });

    //promise
    //image
    /**
     * @tc.name   getThumbnail_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0000
     * @tc.desc   getThumbnail(image) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_000';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        await getThumbnailPromise1(done, testNum, fetchOps);
      });

    /**
     * @tc.name   getThumbnail_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0100
     * @tc.desc   getThumbnail(image) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_001';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 128, height: 128
        };
        const expectSize: image.Size = {
          width: 128, height: 128
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0200
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_002';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 1, height: 1024
        };
        const expectSize: image.Size = {
          width: 1, height: 1024
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0300
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_003';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 1024, height: 1
        };
        const expectSize: image.Size = {
          width: 1024, height: 1
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0400
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_004';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 1024, height: 1024
        };
        const expectSize: image.Size = {
          width: 1024, height: 1024
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_005
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0500
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_005';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 1, height: 1
        };
        const expectSize: image.Size = {
          width: 1, height: 1
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_006
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0600
     * @tc.desc   getThumbnail(image) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_006';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          height: 128, width: 0
        };
        const expectSize: image.Size = {
          width: 256, height: 128
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });
    
    /**
     * @tc.name   getThumbnail_promise_static_007
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0700
     * @tc.desc   getThumbnail(image) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_007';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 128, height: 0
        };
        const expectSize: image.Size = {
          width: 128, height: 256
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });
    
    /**
     * @tc.name   getThumbnail_promise_static_008
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0800
     * @tc.desc   getThumbnail(image) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_008';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size | undefined = undefined;
        const expectSize: image.Size = {
          width: 256, height: 256
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_009
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_0900
     * @tc.desc   getThumbnail(image) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_009';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 0, height: 0
        };
        await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_promise_static_010
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1000
     * @tc.desc   getThumbnail(image) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_010';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: -1, height: -1
        };
        await getThumbnailPromiseNormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_promise_static_011
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1100
     * @tc.desc   getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_011';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.jpg');
        const size: image.Size = {
          width: 99999, height: 99999
        };
        await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
      });

    //video
    /**
     * @tc.name   getThumbnail_promise_static_012
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1200
     * @tc.desc   getThumbnail(video) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_012';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        await getThumbnailPromise1(done, testNum, fetchOps);
      });

    /**
     * @tc.name   getThumbnail_promise_static_013
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1300
     * @tc.desc   getThumbnail(video) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_013';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 128, height: 128
        };
        const expectSize: image.Size = {
          width: 128, height: 128
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_014
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1400
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_014';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 1, height: 1024
        };
        const expectSize: image.Size = {
          width: 1, height: 1024
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_015
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1500
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_015';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 1024, height: 1
        };
        const expectSize: image.Size = {
          width: 1024, height: 1
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_016
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1600
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_016';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 1024, height: 1024
        };
        const expectSize: image.Size = {
          width: 1024, height: 1024
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_017
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1700
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_017';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 1, height: 1
        };
        const expectSize: image.Size = {
          width: 1, height: 1
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_018
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1800
     * @tc.desc   getThumbnail(video) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_018';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          height: 128, width: 0
        };
        const expectSize: image.Size = {
          width: 256, height: 128
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });
    
    /**
     * @tc.name   getThumbnail_promise_static_019
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_1900
     * @tc.desc   getThumbnail(video) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_019';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 128, height: 0
        };
        const expectSize: image.Size = {
          width: 128, height: 256
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });
    
    /**
     * @tc.name   getThumbnail_promise_static_020
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_2000
     * @tc.desc   getThumbnail(video) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_020';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size | undefined = undefined;
        const expectSize: image.Size = {
          width: 256, height: 256
        };
        await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
      });

    /**
     * @tc.name   getThumbnail_promise_static_021
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_2100
     * @tc.desc   getThumbnail(video) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_021';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 0, height: 0
        };
        await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_promise_static_022
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_2200
     * @tc.desc   getThumbnail(video) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_022';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: -1, height: -1
        };
        await getThumbnailPromiseNormal(done, testNum, fetchOps, size);
      });

    /**
     * @tc.name   getThumbnail_promise_static_023
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_STATIC_2300
     * @tc.desc   getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'getThumbnail_promise_static_023';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'getThumb.mp4');
        const size: image.Size = {
          width: 99999, height: 99999
        };
        await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
      });
  })
}