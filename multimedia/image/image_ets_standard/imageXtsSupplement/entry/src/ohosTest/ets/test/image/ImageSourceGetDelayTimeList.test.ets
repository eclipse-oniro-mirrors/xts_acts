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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';

const TAG = 'ImageSource.getDelayTimeList'
let fdNumber: number;

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function ImageSourceGetDelayTimeListSupp() {
  describe('ImageSourceGetDelayTimeListSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_001
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_001';
      const imageSourceApi = await getImageSource('pixel_webp_6144x8192.webp');
      imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.',JSON.stringify(delayTimes));
          expect(delayTimes).assertDeepEquals([]);
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_002
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_002';
      const imageSourceApi = await getImageSource('pixel_webp_3072x4096.webp');
      imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.',JSON.stringify(delayTimes));
          expect(delayTimes).assertDeepEquals([]);
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_003
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_003';
      const imageSourceApi = await getImageSource('pixel_webp_1440x1920.webp');
      imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.',JSON.stringify(delayTimes));
          expect(delayTimes).assertDeepEquals([]);
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_004
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_004';
      const imageSourceApi = await getImageSource('pixel_webp_481x361.webp');
      imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.',JSON.stringify(delayTimes));
          expect(delayTimes).assertDeepEquals([]);
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_005
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_005';
      const imageSourceApi = await getImageSource('pixel_webp_480x360.webp');
      imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.',JSON.stringify(delayTimes));
          expect(delayTimes).assertDeepEquals([]);
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_006
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_006';
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.',JSON.stringify(delayTimes));
          expect(delayTimes.length >0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_007
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_007';
      const imageSourceApi = await getImageSource('pixel_gif_6144x8192.gif');
      imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.',JSON.stringify(delayTimes));
          expect(delayTimes.length >0).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_008
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_008
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_008';
      const imageSourceApi = await getImageSource('pixel_gif_3072x4096.gif');
      imageSourceApi.getDelayTimeList((err: BusinessError, delayTimes: Array<number>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('62980149');
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.',JSON.stringify(delayTimes));
          expect(delayTimes.length >0).assertFalse();
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_009
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_009
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GET_DELAY_TIME_LIST_CALLBACK_009';
      const imageSourceApi = await getImageSource('pixel_gif_481x361.gif');
      imageSourceApi.createPixelMapList((err: BusinessError, delayTimes: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.',JSON.stringify(delayTimes));
          expect(delayTimes.length >0).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_001
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_001';
      const imageSourceApi = await getImageSource('pixel_webp_6144x8192.webp');
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes).assertDeepEquals([]);
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_002
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_002';
      const imageSourceApi = await getImageSource('pixel_webp_3072x4096.webp');
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes).assertDeepEquals([]);
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_003
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_003';
      const imageSourceApi = await getImageSource('pixel_webp_1440x1920.webp');
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes).assertDeepEquals([]);
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_004
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_004';
      const imageSourceApi = await getImageSource('pixel_webp_481x361.webp');
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes).assertDeepEquals([]);
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_005
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_005';
      const imageSourceApi = await getImageSource('pixel_webp_480x360.webp');
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes).assertDeepEquals([]);
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_006
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_006';
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes.length >0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        expect(err).assertFalse();
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_007
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_007
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_007';
      const imageSourceApi = await getImageSource('pixel_gif_6144x8192.gif');
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes.length >0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        expect(err).assertFalse();
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_008
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_008
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_008';
      const imageSourceApi = await getImageSource('pixel_gif_3072x4096.gif');
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes.length >0).assertFalse();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('62980149');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_009
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_009
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_PROMISE_009';
      const imageSourceApi = await getImageSource('pixel_gif_481x361.gif');
      imageSourceApi.getDelayTimeList().then((delayTimes: Array<number>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(delayTimes));
        expect(delayTimes.length >0).assertFalse();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('62980149');
        done();
      })
    })
  });
}