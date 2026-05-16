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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import { image } from "@kit.ImageKit";
import { BusinessError } from '@kit.BasicServicesKit';
import { sleep } from "../common";

const TAG ='MediaXts.fetchFrameByTime';
async function testFetchFrameByTime(testName: string, callback :(avMetadataExtractor: media.AVMetadataExtractor) =>void ,){
  let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
  console.info(TAG,testName,'createImageSource',avMetadataExtractor);
  callback(avMetadataExtractor);
  await avMetadataExtractor.release();
}
export default function AVMetaFetchFrameByTime() {
  describe('AVMetaFetchFrameByTime', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('testString', 'abc');
      AppStorage.setOrCreate('testArray', [-1, 0, 1]);

    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(async () => {
      AppStorage.delete('testString');
      AppStorage.delete('testArray');
      console.info(TAG, 'afterAll case.');
      await sleep(2000);
    });

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_001
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_001
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_001';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        testFetchFrameByTime(testName, (AVMetadataExtractor) => {
          AVMetadataExtractor.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, null)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(5400108);
              AVMetadataExtractor.release();
              done();
            });
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_002
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_002
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_002';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        testFetchFrameByTime(testName, (AVMetadataExtractor) => {
          AVMetadataExtractor.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, undefined)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;

            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(5400108);
              AVMetadataExtractor.release();
              done();
            });
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_003
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_003
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_003';
      let pixel_map: image.PixelMap | undefined = undefined;

      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        testFetchFrameByTime(testName, (AVMetadataExtractor) => {
          AVMetadataExtractor.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, param)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(5400108);
              AVMetadataExtractor.release();
              done();
            });
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_004
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_004
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_004';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        testFetchFrameByTime(testName, (AVMetadataExtractor) => {
          AVMetadataExtractor.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, null)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(5400108);
              AVMetadataExtractor.release();
              done();
            });
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_005
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_005
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_005';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        testFetchFrameByTime(testName, (AVMetadataExtractor) => {
          AVMetadataExtractor.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, undefined)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(5400108);
              AVMetadataExtractor.release();
              done();
            });
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_006
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_006
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_006';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        testFetchFrameByTime(testName, (AVMetadataExtractor) => {
          AVMetadataExtractor.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, param)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(5400108);
              AVMetadataExtractor.release();
              done();
            });
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_007
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_007
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_007';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        testFetchFrameByTime(testName, (AVMetadataExtractor) => {
          AVMetadataExtractor.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, null)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(5400108);
              AVMetadataExtractor.release();
              done();
            });
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_008
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_008
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_008';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        testFetchFrameByTime(testName, (AVMetadataExtractor) => {
          AVMetadataExtractor.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, undefined)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(5400108);
              AVMetadataExtractor.release();
              done();
            });
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_009
     * @tc.name      MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_009
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVMETADATA_EXTRACTOR_FETCHFRAM_BYTIME_009';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        testFetchFrameByTime(testName, (AVMetadataExtractor) => {
          AVMetadataExtractor.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, param)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(5400108);
              AVMetadataExtractor.release();
              done();
            });
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
  })
}