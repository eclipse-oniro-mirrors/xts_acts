/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  fetchOption,
  getFileAsset,
} from '../../../../../../../common'

export default function getThumbnailTest () {
  describe('getThumbnailTest', function () {

    async function getThumbnailCallback1 (done, testNum, fetchOps) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        asset.getThumbnail(async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await pixelMap.getImageInfo();
              const defaultSize = {width: 256, height: 256};
              expect(info.size.width).assertEqual(defaultSize.width);
              expect(info.size.height).assertEqual(defaultSize.height);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getThumbnailCallback2 (done, testNum, fetchOps, size, expectSize) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        asset.getThumbnail(size, async (err, pixelMap) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const info = await pixelMap.getImageInfo();
              expect(info.size.width).assertEqual(expectSize.width);
              expect(info.size.height).assertEqual(expectSize.height);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getThumbnailCallbackAbnormal (done, testNum, fetchOps, size) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        asset.getThumbnail(size, async (err, pixelMap) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(true).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(true).assertTrue();
        done();
      }
    }

    async function getThumbnailCallbackNormal (done, testNum, fetchOps, size) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        asset.getThumbnail(size, async (err, pixelMap) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          } else {
            expect(true).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getThumbnailPromise1 (done, testNum, fetchOps) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        const pixelMap = await asset.getThumbnail();
        console.info(`${testNum} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        const defaultSize = {width: 256, height: 256};
        expect(info.size.width).assertEqual(defaultSize.width);
        expect(info.size.height).assertEqual(defaultSize.height);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getThumbnailPromise2 (done, testNum, fetchOps, size: image.Size, expectSize) {
      try {
        let asset: photoAccessHelper.PhotoAsset;
        asset = await getFileAsset(testNum, fetchOps);
        let pixelMap: image.PixelMap;
        pixelMap = await asset.getThumbnail(size);
        console.info(`${testNum} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        expect(info.size.width).assertEqual(expectSize.width);
        expect(info.size.height).assertEqual(expectSize.height);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getThumbnailPromiseAbnormal (done, testNum, fetchOps, size) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        await asset.getThumbnail(size);
        expect(false).assertTrue()
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(true).assertTrue();
        done();
      }
    }

    async function getThumbnailPromiseNormal (done, testNum, fetchOps, size) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        await asset.getThumbnail(size);
        expect(true).assertTrue()
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    //callback
    //image
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0000
     * @tc.name      : getThumbnail_callback_000
     * @tc.desc      : getThumbnail(image) by no size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_callback_000', 0, async function (done) {
      const testNum = 'getThumbnail_callback_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await getThumbnailCallback1(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0100
     * @tc.name      : getThumbnail_callback_001
     * @tc.desc      : getThumbnail(image) by { width: 128, height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_callback_001', 0, async function (done) {
      const testNum = 'getThumbnail_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 128, height: 128 };
      const expectSize = { width: 128, height: 128 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0200
     * @tc.name      : getThumbnail_callback_002
     * @tc.desc      : getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_002', 2, async function (done) {
      const testNum = 'getThumbnail_callback_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 1, height: 1024 };
      const expectSize = { width: 1, height: 1024 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0300
     * @tc.name      : getThumbnail_callback_003
     * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_003', 2, async function (done) {
      const testNum = 'getThumbnail_callback_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 1024, height: 1 };
      const expectSize = { width: 1024, height: 1 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0400
     * @tc.name      : getThumbnail_callback_004
     * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_004', 2, async function (done) {
      const testNum = 'getThumbnail_callback_004';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 1024, height: 1024 };
      const expectSize = { width: 1024, height: 1024 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0500
     * @tc.name      : getThumbnail_callback_005
     * @tc.desc      : getThumbnail(image) by { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_005', 2, async function (done) {
      const testNum = 'getThumbnail_callback_005';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 1, height: 1 };
      const expectSize = { width: 1, height: 1 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0600
     * @tc.name      : getThumbnail_callback_006
     * @tc.desc      : getThumbnail(image) by { height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_006', 2, async function (done) {
      const testNum = 'getThumbnail_callback_006';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { height: 128 };
      const expectSize = { width: 256, height: 128 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0700
     * @tc.name      : getThumbnail_callback_007
     * @tc.desc      : getThumbnail(image) by { width: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_007', 2, async function (done) {
      const testNum = 'getThumbnail_callback_007';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 128 };
      const expectSize = { width: 128, height: 256 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0800
     * @tc.name      : getThumbnail_callback_008
     * @tc.desc      : getThumbnail(image) by undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_008', 2, async function (done) {
      const testNum = 'getThumbnail_callback_008';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = undefined;
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_0900
     * @tc.name      : getThumbnail_callback_009
     * @tc.desc      : getThumbnail(image) by { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_009', 2, async function (done) {
      const testNum = 'getThumbnail_callback_009';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 0, height: 0 };
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1000
     * @tc.name      : getThumbnail_callback_010
     * @tc.desc      : getThumbnail(image) by { width: -1, height: -1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_010', 2, async function (done) {
      const testNum = 'getThumbnail_callback_010';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: -1, height: -1 };
      await getThumbnailCallbackNormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1100
     * @tc.name      : getThumbnail_callback_011
     * @tc.desc      : getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_011', 2, async function (done) {
      const testNum = 'getThumbnail_callback_011';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 99999, height: 99999 };
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    //video
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1200
     * @tc.name      : getThumbnail_callback_012
     * @tc.desc      : getThumbnail(video) by no size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_callback_012', 0, async function (done) {
      const testNum = 'getThumbnail_callback_012';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await getThumbnailCallback1(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1300
     * @tc.name      : getThumbnail_callback_013
     * @tc.desc      : getThumbnail(video) by { width: 128, height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_callback_013', 0, async function (done) {
      const testNum = 'getThumbnail_callback_013';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 128, height: 128 };
      const expectSize = { width: 128, height: 128 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1400
     * @tc.name      : getThumbnail_callback_014
     * @tc.desc      : getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_014', 2, async function (done) {
      const testNum = 'getThumbnail_callback_014';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 1, height: 1024 };
      const expectSize = { width: 1, height: 1024 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1500
     * @tc.name      : getThumbnail_callback_015
     * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_015', 2, async function (done) {
      const testNum = 'getThumbnail_callback_015';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 1024, height: 1 };
      const expectSize = { width: 1024, height: 1 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1600
     * @tc.name      : getThumbnail_callback_016
     * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_016', 2, async function (done) {
      const testNum = 'getThumbnail_callback_016';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 1024, height: 1024 };
      const expectSize = { width: 1024, height: 1024 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1700
     * @tc.name      : getThumbnail_callback_017
     * @tc.desc      : getThumbnail(video) by { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_017', 2, async function (done) {
      const testNum = 'getThumbnail_callback_017';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 1, height: 1 };
      const expectSize = { width: 1, height: 1 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1800
     * @tc.name      : getThumbnail_callback_018
     * @tc.desc      : getThumbnail(video) by { height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_018', 2, async function (done) {
      const testNum = 'getThumbnail_callback_018';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { height: 128 };
      const expectSize = { width: 256, height: 128 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_1900
     * @tc.name      : getThumbnail_callback_019
     * @tc.desc      : getThumbnail(video) by { width: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_019', 2, async function (done) {
      const testNum = 'getThumbnail_callback_019';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 128 };
      const expectSize = { width: 128, height: 256 };
      await getThumbnailCallback2(done, testNum, fetchOps, size, expectSize);
    });
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2000
     * @tc.name      : getThumbnail_callback_020
     * @tc.desc      : getThumbnail(video) by undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_020', 2, async function (done) {
      const testNum = 'getThumbnail_callback_020';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = undefined;
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2100
     * @tc.name      : getThumbnail_callback_021
     * @tc.desc      : getThumbnail(video) by { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_021', 2, async function (done) {
      const testNum = 'getThumbnail_callback_021';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 0, height: 0 };
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2200
     * @tc.name      : getThumbnail_callback_022
     * @tc.desc      : getThumbnail(video) by { width: -1, height: -1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_022', 2, async function (done) {
      const testNum = 'getThumbnail_callback_022';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: -1, height: -1 };
      await getThumbnailCallbackNormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_THUMBNAIL_2300
     * @tc.name      : getThumbnail_callback_023
     * @tc.desc      : getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_callback_023', 2, async function (done) {
      const testNum = 'getThumbnail_callback_023';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 99999, height: 99999 };
      await getThumbnailCallbackAbnormal(done, testNum, fetchOps, size);
    });
    
    //promise
    //image
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0000
     * @tc.name      : getThumbnail_promise_000
     * @tc.desc      : getThumbnail(image) by no size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_promise_000', 0, async function (done) {
      const testNum = 'getThumbnail_promise_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await getThumbnailPromise1(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0100
     * @tc.name      : getThumbnail_promise_001
     * @tc.desc      : getThumbnail(image) by { width: 128, height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_promise_001', 0, async function (done) {
      const testNum = 'getThumbnail_promise_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 128, height: 128 };
      const expectSize = { width: 128, height: 128 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0200
     * @tc.name      : getThumbnail_promise_002
     * @tc.desc      : getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_002', 2, async function (done) {
      const testNum = 'getThumbnail_promise_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 1, height: 1024 };
      const expectSize = { width: 1, height: 1024 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0300
     * @tc.name      : getThumbnail_promise_003
     * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_003', 2, async function (done) {
      const testNum = 'getThumbnail_promise_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 1024, height: 1 };
      const expectSize = { width: 1024, height: 1 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0400
     * @tc.name      : getThumbnail_promise_004
     * @tc.desc      : getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_004', 2, async function (done) {
      const testNum = 'getThumbnail_promise_004';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 1024, height: 1024 };
      const expectSize = { width: 1024, height: 1024 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0500
     * @tc.name      : getThumbnail_promise_005
     * @tc.desc      : getThumbnail(image) by { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_005', 2, async function (done) {
      const testNum = 'getThumbnail_promise_005';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 1, height: 1 };
      const expectSize = { width: 1, height: 1 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0600
     * @tc.name      : getThumbnail_promise_006
     * @tc.desc      : getThumbnail(image) by { height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_006', 2, async function (done) {
      const testNum = 'getThumbnail_promise_006';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: undefined, height: 128 };
      const expectSize = { width: 256, height: 128 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0700
     * @tc.name      : getThumbnail_promise_007
     * @tc.desc      : getThumbnail(image) by { width: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_007', 2, async function (done) {
      const testNum = 'getThumbnail_promise_007';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 128, height: undefined };
      const expectSize = { width: 128, height: 256 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0800
     * @tc.name      : getThumbnail_promise_008
     * @tc.desc      : getThumbnail(image) by undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_008', 2, async function (done) {
      const testNum = 'getThumbnail_promise_008';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = undefined;
      const expectSize = { width: 256, height: 256 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_0900
     * @tc.name      : getThumbnail_promise_009
     * @tc.desc      : getThumbnail(image) by { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_009', 2, async function (done) {
      const testNum = 'getThumbnail_promise_009';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 0, height: 0 };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1000
     * @tc.name      : getThumbnail_promise_010
     * @tc.desc      : getThumbnail(image) by { width: -1, height: -1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_010', 2, async function (done) {
      const testNum = 'getThumbnail_promise_010';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: -1, height: -1 };
      await getThumbnailPromiseNormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1100
     * @tc.name      : getThumbnail_promise_011
     * @tc.desc      : getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_011', 2, async function (done) {
      const testNum = 'getThumbnail_promise_011';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const size = { width: 99999, height: 99999 };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
    });

    //video
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1200
     * @tc.name      : getThumbnail_promise_012
     * @tc.desc      : getThumbnail(video) by no size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_promise_012', 0, async function (done) {
      const testNum = 'getThumbnail_promise_012';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await getThumbnailPromise1(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1300
     * @tc.name      : getThumbnail_promise_013
     * @tc.desc      : getThumbnail(video) by { width: 128, height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getThumbnail_promise_013', 0, async function (done) {
      const testNum = 'getThumbnail_promise_013';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 128, height: 128 };
      const expectSize = { width: 128, height: 128 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1400
     * @tc.name      : getThumbnail_promise_014
     * @tc.desc      : getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_014', 2, async function (done) {
      const testNum = 'getThumbnail_promise_014';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 1, height: 1024 };
      const expectSize = { width: 1, height: 1024 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1500
     * @tc.name      : getThumbnail_promise_015
     * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_015', 2, async function (done) {
      const testNum = 'getThumbnail_promise_015';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 1024, height: 1 };
      const expectSize = { width: 1024, height: 1 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1600
     * @tc.name      : getThumbnail_promise_016
     * @tc.desc      : getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_016', 2, async function (done) {
      const testNum = 'getThumbnail_promise_016';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 1024, height: 1024 };
      const expectSize = { width: 1024, height: 1024 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1700
     * @tc.name      : getThumbnail_promise_017
     * @tc.desc      : getThumbnail(video) by { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_017', 2, async function (done) {
      const testNum = 'getThumbnail_promise_017';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 1, height: 1 };
      const expectSize = { width: 1, height: 1 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1800
     * @tc.name      : getThumbnail_promise_018
     * @tc.desc      : getThumbnail(video) by { height: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_018', 2, async function (done) {
      const testNum = 'getThumbnail_promise_018';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: undefined, height: 128 };
      const expectSize = { width: 256, height: 128 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_1900
     * @tc.name      : getThumbnail_promise_019
     * @tc.desc      : getThumbnail(video) by { width: 128 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_019', 2, async function (done) {
      const testNum = 'getThumbnail_promise_019';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 128, height: undefined };
      const expectSize = { width: 128, height: 256 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_2000
     * @tc.name      : getThumbnail_promise_020
     * @tc.desc      : getThumbnail(video) by undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_020', 2, async function (done) {
      const testNum = 'getThumbnail_promise_020';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = undefined;
      const expectSize = { width: 256, height: 256 };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_2100
     * @tc.name      : getThumbnail_promise_021
     * @tc.desc      : getThumbnail(video) by { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_021', 2, async function (done) {
      const testNum = 'getThumbnail_promise_021';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 0, height: 0 };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_2200
     * @tc.name      : getThumbnail_promise_022
     * @tc.desc      : getThumbnail(video) by { width: -1, height: -1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_022', 2, async function (done) {
      const testNum = 'getThumbnail_promise_022';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: -1, height: -1 };
      await getThumbnailPromiseNormal(done, testNum, fetchOps, size);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_THUMBNAIL_2300
     * @tc.name      : getThumbnail_promise_023
     * @tc.desc      : getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getThumbnail_promise_023', 2, async function (done) {
      const testNum = 'getThumbnail_promise_023';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const size = { width: 99999, height: 99999 };
      await getThumbnailPromiseAbnormal(done, testNum, fetchOps, size);
    });
  })
}
