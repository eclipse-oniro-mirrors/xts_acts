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
import { media } from '@kit.MediaKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { sleep } from '../common';

const TAG ='AVImageXts.FetchFrameByTime';
async function ImageFetchFrameByTime1(testName: string, callback :(avImageGenerator: media.AVImageGenerator) =>void ,){
  let avImageGenerator: media.AVImageGenerator = await media.createAVImageGenerator();
  console.info(TAG,testName,'AVImageGenerator',avImageGenerator);
  callback(avImageGenerator);
  console.info(TAG,testName,'succeed');
  await avImageGenerator.release();
}
async function ImageFetchFrameByTime2(testName: string, callback :(avImageGenerator: media.AVImageGenerator) =>void ,){
  let avImageGenerator: media.AVImageGenerator = await media.createAVImageGenerator();
  console.info(TAG,testName,'AVImageGenerator',avImageGenerator);
  callback(avImageGenerator);
  console.info(TAG,testName,'succeed');
  await avImageGenerator.release();
}

async function FetchScaledFrAameByTimeTest(testName: string, callback :(avImageGenerator: media.AVImageGenerator) =>void ,){
  let avImageGenerator: media.AVImageGenerator = await media.createAVImageGenerator();
  console.info(TAG,testName,'AVImageGenerator',avImageGenerator);
  callback(avImageGenerator);
  console.info(TAG,testName,'succeed');
  await avImageGenerator.release();
}

export default function AVImageFetchFrameByTime() {
  describe('AVImageFetchFrameByTime', () => {
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_001
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_001
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_001", Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_001';
      try {
        ImageFetchFrameByTime1(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, null,
            (error: BusinessError, pixelMap) => {
              if (error) {
                console.error(TAG, testName, `Failed to fetch FrameByTime, error: ${error},code: ${error?.code}`);
                expect(error.code).assertEqual(401);
                AVImageGenerator.release()
                done();
                return;
              }
              console.info(TAG, testName, 'pixelMap', pixelMap);
              AVImageGenerator.release()
              done();
            });
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_002
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_002
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_002", Level.LEVEL0, async (done : Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_002';
      try {
        ImageFetchFrameByTime1(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, undefined,(error: BusinessError, pixelMap) => {
            if (error) {
              console.error(TAG,testName,`Failed to fetch FrameByTime, error: ${error},code: ${error?.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
              done();
              return;
            }
            console.info(TAG, testName,'pixelMap',pixelMap);
            AVImageGenerator.release()
            done();
          });
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_003
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_003
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_003", Level.LEVEL0, async (done : Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_003';
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        ImageFetchFrameByTime1(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, param,(error: BusinessError, pixelMap) => {
            if (error) {
              console.error(TAG,testName,`Failed to fetch FrameByTime, error: ${error},code: ${error?.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
              done();
              return;
            }
            console.info(TAG, testName,'pixelMap',pixelMap);
            AVImageGenerator.release()
            done();
          });
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_004
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_004
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_004", Level.LEVEL0, async (done : Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_004';
      try {
        ImageFetchFrameByTime1(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, null,(error: BusinessError, pixelMap) => {
            if (error) {
              console.error(TAG,testName,`Failed to fetch FrameByTime, error: ${error},code: ${error?.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
              done();
              return;
            }
            console.info(TAG, testName,'pixelMap',pixelMap);
            AVImageGenerator.release()
            done();
          });
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_005
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_005
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_005", Level.LEVEL0, async (done : Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_005';
      try {
        ImageFetchFrameByTime1(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, undefined,(error: BusinessError, pixelMap) => {
            if (error) {
              console.error(TAG,testName,`Failed to fetch FrameByTime, error: ${error},code: ${error?.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
              done();
              return;
            }
            console.info(TAG, testName,'pixelMap',pixelMap);
            AVImageGenerator.release()
            done();
          });
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_006
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_006
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_006", Level.LEVEL0, async (done : Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_006';
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        ImageFetchFrameByTime1(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, param,(error: BusinessError, pixelMap) => {
            if (error) {
              console.error(TAG,testName,`Failed to fetch FrameByTime, error: ${error},code: ${error?.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
              done();
              return;
            }
            console.info(TAG, testName,'pixelMap',pixelMap);
            AVImageGenerator.release()
            done();
          });
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_007
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_007
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_007", Level.LEVEL0, async (done : Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_007';
      try {
        ImageFetchFrameByTime1(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, null,(error: BusinessError, pixelMap) => {
            if (error) {
              console.error(TAG,testName,`Failed to fetch FrameByTime, error: ${error},code: ${error?.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
              done();
              return;
            }
            console.info(TAG, testName,'pixelMap',pixelMap);
            AVImageGenerator.release()
            done();
          });
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_008
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_008
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_008", Level.LEVEL0, async (done : Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_008';
      try {
        ImageFetchFrameByTime1(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, undefined,(error: BusinessError, pixelMap) => {
            if (error) {
              console.error(TAG,testName,`Failed to fetch FrameByTime, error: ${error},code: ${error?.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
              done();
              return;
            }
            console.info(TAG, testName,'pixelMap',pixelMap);
            AVImageGenerator.release()
            done();
          });
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_009
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_009
     * @tc.desc      Testing UpdateData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_009", Level.LEVEL0, async (done : Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_009';
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        ImageFetchFrameByTime1(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, param,(error: BusinessError, pixelMap) => {
            if (error) {
              console.error(TAG,testName,`Failed to fetch FrameByTime, error: ${error},code: ${error?.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
              done();
              return;
            }
            console.info(TAG, testName,'pixelMap',pixelMap);
            AVImageGenerator.release()
            done();
          });
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_010
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_010
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_010';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, null)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_011
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_011
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_011';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, undefined)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_012
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_012
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_012';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, param)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_013
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_013
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_013';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, null)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_014
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_014
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_014';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, undefined)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_015
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_015
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_015';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, param)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_016
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_016
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_016';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, null)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_017
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_017
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_017';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, undefined)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_018
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_018
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_018';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, param)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_019
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_019
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_019';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        FetchScaledFrAameByTimeTest(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, null)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_020
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_020
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_020';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        FetchScaledFrAameByTimeTest(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, undefined)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_021
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_021
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_021';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, param)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_022
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_022
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_022';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        FetchScaledFrAameByTimeTest(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, null)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_023
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_023
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_023';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        FetchScaledFrAameByTimeTest(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, undefined)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_024
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_024
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_024';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST, param)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_025
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_025
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_025';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        FetchScaledFrAameByTimeTest(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, null)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_026
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_026
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_026';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        FetchScaledFrAameByTimeTest(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, undefined)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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
     * @tc.number    MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_027
     * @tc.name      MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_027
     * @tc.desc      Testing FetchFrameByTime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_AVIMAGE_EXTRACTOR_FETCHFRAM_BYTIME_027';
      let pixel_map: image.PixelMap | undefined = undefined;
      try {
        AppStorage.setOrCreate('key', '');
        let param: media.PixelMapParams  = AppStorage.get('key') as ESObject;
        ImageFetchFrameByTime2(testName, (AVImageGenerator) => {
          AVImageGenerator.fetchFrameByTime(100000, media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC, param)
            .then((pixelMap: image.PixelMap) => {
              pixel_map = pixelMap;
            })
            .catch((error: BusinessError) => {
              console.error(TAG, testName,`Failed to fetch FrameByTime, error message:${error.message},${error.code}`);
              expect(error.code).assertEqual(401);
              AVImageGenerator.release()
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