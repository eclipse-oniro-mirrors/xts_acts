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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';

const TAG = 'ImageXts.CreatePixelMap'

let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function CreatePixelMapSupp() {
  const CROP_FIRST = image.CropAndScaleStrategy.CROP_FIRST;
  describe('CreatePixelMapSupp', () => {
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
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001';
        let decodeOpts: image.DecodingOptions = {
            sampleSize: 1,
            editable: false,
            desiredSize: { width: 198, height: 202 },
            desiredRegion: { x: 0, y: 0, size: {width: 124, height: 100}},
            cropAndScaleStrategy: CROP_FIRST,
            rotate: 0,
            desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
            index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: {width: 124, height: 100}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: {width: 124, height: 100}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004
     * @tc.desc       createPixelMap cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004';
      try {
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0,
        };
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        await imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
            JSON.stringify(pixelMap));
          expect(pixelMap != undefined).assertTrue();
          done();
        })
      }catch(err) {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertUndefined();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: {width: 124, height: 100}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: {width: 124, height: 100}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: {width: 124, height: 100}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 198, height: 202 },
        desiredRegion: { x: 0, y: 0, size: {width: 124, height: 100}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(null).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(undefined).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012
     * @tc.desc       createPixelMap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012';
      let decodeOpts: image.DecodingOptions = {
        editable: false
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_013
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_013
     * @tc.desc       createPixelMap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_013';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap.isStrideAlignment);
        expect(pixelMap.isStrideAlignment).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: {width: 200, height: 60 }},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: {width: 200, height: 60 }},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: {width: 200, height: 60 }},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017
     * @tc.desc       createPixelMap cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017';
      try {
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 300, height: 70 },
          desiredRegion: { x: 0, y: 0, size: {width: 200, height: 60 }},
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0,
        };
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        await imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
            JSON.stringify(pixelMap));
          expect(pixelMap != undefined).assertTrue();
          done();
        })
      }catch(err) {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertUndefined();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: {width: 200, height: 60 }},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: {width: 200, height: 60 }},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: {width: 200, height: 60 }},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 300, height: 70 },
        desiredRegion: { x: 0, y: 0, size: {width: 200, height: 60 }},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(null).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(undefined).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025
     * @tc.desc       createPixelMap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025';
      let decodeOpts: image.DecodingOptions = {
        editable: false
      };
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_026
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_026
     * @tc.desc       createPixelMap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_026';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap.isStrideAlignment);
        expect(pixelMap.isStrideAlignment).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: {width: 150, height: 150}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: {width: 150, height: 150}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: {width: 150, height: 150}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030
     * @tc.desc       createPixelMap cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030';
      try {
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 200, height: 200 },
          desiredRegion: { x: 0, y: 0, size: {width: 150, height: 150}},
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0,
        };
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        await imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
          console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.',
            JSON.stringify(pixelMap));
          expect(pixelMap != undefined).assertTrue();
          done();
        })
      }catch(err) {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${err.code}, error.message ${err.message}`);
        expect(err.code).assertUndefined();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: {width: 150, height: 150}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: {width: 150, height: 150}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: {width: 150, height: 150}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034';
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: { width: 200, height: 200 },
        desiredRegion: { x: 0, y: 0, size: {width: 150, height: 150}},
        cropAndScaleStrategy: CROP_FIRST,
        rotate: 0,
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
        index: 0,
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(null).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(undefined).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap);
        expect(pixelMap!=undefined).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038
     * @tc.desc       createPixelMap cover isEditable
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038';
      let decodeOpts: image.DecodingOptions = {
        editable: false
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap(decodeOpts).then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap.isEditable);
        expect(pixelMap.isEditable).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_039
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_039
     * @tc.desc       createPixelMap cover isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_039', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_039';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.createPixelMap().then((pixelMap: image.PixelMap) => {
        console.info(TAG,testName,'Succeeded in creating pixelMap object through image decoding parameters.',pixelMap.isStrideAlignment);
        expect(pixelMap.isStrideAlignment).assertFalse();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,testName,`Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
        done();
      })
    })
  })
}