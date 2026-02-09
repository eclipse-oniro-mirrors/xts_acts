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

const TAG = 'ImageSource.createPixelMapList'
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

export default function ImageSourceCreatePixelMapListSupp() {
  describe('ImageSourceCreatePixelMapListSupp', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_001
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_001';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_002
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_002';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG, testName,'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG, testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_003
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_003';
      let decodeOpts: image.DecodingOptions = {
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_004
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_004';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_empty_2.png');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_005
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_005';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v3.webp');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_006
     * @tc.desc   ImageSourceCreatePixelMapList cover pixelMapList.length>0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_006';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      imageSourceApi.createPixelMapList(decodeOpts).then((pixelMapList: Array<image.PixelMap>) => {
        console.info(TAG,testName, 'Succeeded in creating pixelMapList object.', JSON.stringify(pixelMapList));
        expect(pixelMapList.length > 0).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG,testName, `Failed to create pixelMapList object, error code is ${err},${err.code}`);
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_001
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_002
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_002';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_003
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_003';
      const imageSourceApi = await getImageSource('test_exif_v3.webp');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_005
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_005';
      const imageSourceApi = await getImageSource('test_exif_empty_2.png');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_006
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_CALLBACK_PIXELMAP_006';
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      imageSourceApi.createPixelMapList((err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_001
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_001
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_001';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_002
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_002
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_002';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_003
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_003
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_003';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v4.heic');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code == 62980118).assertTrue();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertFalse();
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_004
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_004
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_004';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_empty_2.png');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_005
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_005
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_005';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: { width: 198, height: 202 },
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        index: 0,
      };
      const imageSourceApi = await getImageSource('moving_test_loop0.gif');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_006
     * @tc.number SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_006
     * @tc.desc   createPixelMapList callback: AsyncCallback<Array<PixelMap>>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_DECODEOPTS_CALLBACK_006';
      let decodeOpts: image.DecodingOptions = {
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMapList(decodeOpts,(err: BusinessError, pixelMapList: Array<image.PixelMap>) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMapList object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMapList object.');
          expect(pixelMapList.length > 0).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_001
     * @tc.desc       createPixelMap options: desiredPixelFormat ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_001';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_002
     * @tc.desc       createPixelMap options: desiredPixelFormat BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_002';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_003
     * @tc.desc       createPixelMap options: desiredPixelFormat BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_003';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGB_888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertUndefined();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect().assertFail();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_004
     * @tc.desc       createPixelMap options: desiredPixelFormat BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_004';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertUndefined();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect().assertFail();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_005
     * @tc.desc       createPixelMap options: desiredPixelFormat RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_005';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect().assertFail();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_006
     * @tc.desc       createPixelMap options: desiredPixelFormat NV21
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_006';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect().assertFail();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_007
     * @tc.desc       createPixelMap options: desiredPixelFormat NV12
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_007';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV12,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_008
     * @tc.desc       createPixelMap options: desiredPixelFormat RGBA_1010102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_008';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_009
     * @tc.desc       createPixelMap options: desiredPixelFormat YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_009';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_010
     * @tc.desc       createPixelMap options: desiredPixelFormat YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_010';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_011
     * @tc.desc       createPixelMap options: desiredPixelFormat ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredPixelFormat_011';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_01
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_01
     * @tc.desc       createPixelMap options: desiredDynamicRange AUTO
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_01', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_01';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.AUTO,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_02
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_02
     * @tc.desc       createPixelMap options: desiredDynamicRange HDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_02', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_02';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.HDR,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_03
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_03
     * @tc.desc       createPixelMap options: desiredDynamicRange SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_03', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_desiredDynamicRange_03';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.SDR,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_cropAndScaleStrategy_01
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_cropAndScaleStrategy_01
     * @tc.desc       createPixelMap options: cropAndScaleStrategy SCALE_FIRST
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_cropAndScaleStrategy_01', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_cropAndScaleStrategy_01';
      let decodeOpts: image.DecodingOptions = {
        cropAndScaleStrategy: image.CropAndScaleStrategy.SCALE_FIRST,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertUndefined();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect().assertFail();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_cropAndScaleStrategy_02
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_cropAndScaleStrategy_02
     * @tc.desc       createPixelMap options: cropAndScaleStrategy CROP_FIRST
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_cropAndScaleStrategy_02', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_cropAndScaleStrategy_02';
      let decodeOpts: image.DecodingOptions = {
        cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertUndefined();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect().assertFail();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_options_01
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_options_01
     * @tc.desc       createPixelMap options cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_options_01', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_options_01';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(null,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_options_02
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_options_02
     * @tc.desc       createPixelMap options cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_options_02', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_options_02';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(undefined,(err: BusinessError, pixelMap: image.PixelMap) => {
        if (err) {
          console.error(TAG,testName,`Failed to create pixelMap object, error code is ${err},${err.code}`);
          expect(err.code).assertFalse();
        } else {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelMap);
          expect(pixelMap!=undefined).assertTrue();
        }
        imageSourceApi.release();
        done();
      })
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_01
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_01
     * @tc.desc       createPixelMapUsingAllocator options editable:false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_01', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_01';
      let decodeOpts: image.DecodingOptions = {
        editable: false,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',JSON.stringify(pixelmap));
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_02
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_02
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_02', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_02';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_03
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_03
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_03', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_03';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_04
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_04
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_04', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_04';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_05
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_05
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_05', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_05';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_06
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_06
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_06', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_06';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_07
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_07
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.NV21
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_07', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_07';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_08
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_08
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_08', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_08';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_09
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_09
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_09', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_09';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_010
     * @tc.desc       createPixelMapUsingAllocator options desiredPixelFormat: image.PixelMapFormat.ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_010';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_011
     * @tc.desc       createPixelMapUsingAllocator options desiredDynamicRange: image.desiredDynamicRange.HDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_011';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.HDR,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_012
     * @tc.desc       createPixelMapUsingAllocator options desiredDynamicRange: image.desiredDynamicRange.SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_012';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.SDR,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_013
     * @tc.desc       createPixelMapUsingAllocator options desiredDynamicRange: image.desiredDynamicRange.AUTO
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_USING_ALLOCATOR_013';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.AUTO,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapUsingAllocator(decodeOpts, image.AllocatorType.AUTO);
        if (pixelmap != undefined) {
          console.info(TAG,testName,'Succeeded in creating pixelMap object.',pixelmap);
          expect(pixelmap!=undefined).assertTrue();
        } else {
          console.error(TAG,testName,`Failed to create pixelMap object `);
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_01
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_01
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_01', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_01';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName,'Succeeded in creating pixelMap object.');
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName,'Failed to create pixelMap.');
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_02
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_02
     * @tc.desc       createPixelMapSync options desiredPixelFormat:image.PixelMapFormat.ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_02', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_02';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_03
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_03
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_03', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_03';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_04
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_04
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_04', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_04';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect().assertFail();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `,pixelmap);
          expect(pixelmap).assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_05
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_05
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_05', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_05';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_06
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_06
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.NV21
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_06', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_06';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV21,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_07
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_07
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_07', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_07';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_08
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_08
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_08', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_08';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_09
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_09
     * @tc.desc       createPixelMapSync options desiredPixelFormat: image.PixelMapFormat.ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_09', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_09';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_010
     * @tc.desc       createPixelMapSync options desiredDynamicRange: SDR
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_010';
      let decodeOpts: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.SDR,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect(pixelmap != undefined).assertTrue();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_011
     * @tc.desc       createPixelMapSync options cropAndScaleStrategy: SCALE_FIRST
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_011';
      let decodeOpts: image.DecodingOptions = {
        cropAndScaleStrategy: image.CropAndScaleStrategy.SCALE_FIRST,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect().assertFail();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `,pixelmap);
          expect(pixelmap).assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_012
     * @tc.desc       createPixelMapSync options cropAndScaleStrategy: CROP_FIRST
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_012';
      let decodeOpts: image.DecodingOptions = {
        cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object.', pixelmap);
          expect().assertFail();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect(pixelmap).assertUndefined();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_013
     * @tc.desc       createPixelMapSync : pixelmap.isStrideAlignment cover false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_013';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelmap.isStrideAlignment is false.', pixelmap.isStrideAlignment);
          expect(pixelmap.isStrideAlignment).assertFalse();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_014
     * @tc.desc       createPixelMapSync : pixelmap.isEditable cover false
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CREATE_PIXELMAP_createPixelMapSync_014';
      let decodeOpts: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      };
      const imageSourceApi = await getImageSource('test_exif_v3.webp');
      try {
        let pixelmap = imageSourceApi.createPixelMapSync(decodeOpts);
        if (pixelmap != undefined) {
          console.info(TAG, testName, 'Succeeded in creating pixelmap.isEditable is true.', pixelmap.isEditable);
          expect(pixelmap.isEditable).assertFalse();
        } else {
          console.error(TAG, testName, `Failed to create pixelMap object `);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create pixelMap object, ${err.message},${err.code}`);
        expect().assertFail();
      }
      imageSourceApi.release();
      done();
    })





  });
}