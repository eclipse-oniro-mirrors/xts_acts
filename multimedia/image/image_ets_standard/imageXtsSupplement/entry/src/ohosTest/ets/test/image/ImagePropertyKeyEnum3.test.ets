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

const TAG = 'Image.PropertyKey3'
let fdNumber: number;
async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG,'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG,"image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG,"image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG,"image case open fd err " + err);
  })
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

async function imagePropertyTest(done: Function, testName: string, path: string, propertyKey: image.PropertyKey, callback: (data?: string, error?: BusinessError) => void) {
  console.info(TAG, testName + '- start');
  try {
    const imageSourceApi = await getImageSource(path);
    console.info(TAG, testName, 'getImageSource: ',imageSourceApi);
    imageSourceApi.getImageProperty(propertyKey)
      .then((data: string) => {
        console.info(TAG, testName, "get key    ", propertyKey, 'value: ', data);
        callback(data,undefined);
      })
      .catch((error: BusinessError) => {
        console.info(TAG, testName,'getImageProperty error' , error.message, error.code);
        callback(undefined,error);
      })
      .finally(() => {
        console.info(TAG, testName + '- end');
        imageSourceApi.release();
        done();
      })
  } catch (err) {
    expect().assertFail();
    console.error(TAG, testName, err.message, err.code);
    done();
  }
}
export default function ImagePropertyKeyTest3() {
  describe('ImagePropertyKeyTest3', ()=>{
      beforeAll(async ()=>{
        console.info('beforeAll case');
      });
      beforeEach(async ()=>{
        console.info('beforeEach case');
      });
      afterEach(async ()=>{
        console.info('afterEach case');
      });
      afterAll(()=>{
        console.info('afterAll case');
      });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_301
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_301
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_301', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_301',
        'test_exif_v2.jpg',
        image.PropertyKey.LENS_SERIAL_NUMBER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('qxhc')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_302
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_302
     * @tc.desc   PhotoAccessHelper_Photo:LENS_MODEL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_302', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_302',
        'test_exif_v2.jpg',
        image.PropertyKey.LENS_MODEL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('txaw')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_303
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_303
     * @tc.desc   PhotoAccessHelper_Photo:LENS_MAKE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_303', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_303',
        'test_exif_v2.jpg',
        image.PropertyKey.LENS_MAKE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('xxwx')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_304
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_304
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SPECIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_304', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_304',
        'test_exif_v2.jpg',
        image.PropertyKey.LENS_SPECIFICATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('0.8, 2.5, 1.5, 0.5')

          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_305
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_305
     * @tc.desc   PhotoAccessHelper_Photo:COMPOSITE_IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_305', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_305',
        'test_exif_v2.jpg',
        image.PropertyKey.COMPOSITE_IMAGE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_306
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_306
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_306', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_306',
        'test_exif_v2.jpg',
        image.PropertyKey.SCENE_TYPE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Directly photographed')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_307
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_307
     * @tc.desc   PhotoAccessHelper_Photo:EXPOSURE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_307', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_307',
        'test_exif_v2.jpg',
        image.PropertyKey.EXPOSURE_MODE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Auto exposure')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_308
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_308
     * @tc.desc   PhotoAccessHelper_Photo:FILE_SOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_308', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_308',
        'test_exif_v2.jpg',
        image.PropertyKey.FILE_SOURCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('DSC')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_309
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_309
     * @tc.desc   PhotoAccessHelper_Photo:SENSING_METHOD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_309', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_309',
        'test_exif_v2.jpg',
        image.PropertyKey.SENSING_METHOD,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Two-chip color area sensor')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_310
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_310
     * @tc.desc   PhotoAccessHelper_Photo:EXPOSURE_INDEX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_310', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_310',
        'test_exif_v2.jpg',
        image.PropertyKey.EXPOSURE_INDEX,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1.5')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_311
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_311
     * @tc.desc   PhotoAccessHelper_Photo:SUBJECT_LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_311', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_311',
        'test_exif_v2.jpg',
        image.PropertyKey.SUBJECT_LOCATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('0, 1')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_312
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_312
     * @tc.desc   PhotoAccessHelper_Photo:FOCAL_PLANE_RESOLUTION_UNIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_312', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_312',
        'test_exif_v2.jpg',
        image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Inch')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_313
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_313
     * @tc.desc   PhotoAccessHelper_Photo:FOCAL_PLANE_Y_RESOLUTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_313', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_313',
        'test_exif_v2.jpg',
        image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('880')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_314
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_314
     * @tc.desc   PhotoAccessHelper_Photo:FOCAL_PLANE_X_RESOLUTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_314', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_314',
        'test_exif_v2.jpg',
        image.PropertyKey.FOCAL_PLANE_X_RESOLUTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1080')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_315
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_315
     * @tc.desc   PhotoAccessHelper_Photo:CFA_PATTERN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_315', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_315',
        'test_exif_v2.jpg',
        image.PropertyKey.CFA_PATTERN,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1 bytes undefined data')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_316
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_316
     * @tc.desc   PhotoAccessHelper_Photo:CUSTOM_RENDERED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_316', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_316',
        'test_exif_v2.jpg',
        image.PropertyKey.CUSTOM_RENDERED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Normal process')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_317
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_317
     * @tc.desc   PhotoAccessHelper_Photo:WHITE_BALANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_317', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_317',
        'test_exif_v2.jpg',
        image.PropertyKey.WHITE_BALANCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Manual white balance')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_318
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_318
     * @tc.desc   PhotoAccessHelper_Photo:DIGITAL_ZOOM_RATIO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_318', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_318',
        'test_exif_v2.jpg',
        image.PropertyKey.DIGITAL_ZOOM_RATIO,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('321')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_319
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_319
     * @tc.desc   PhotoAccessHelper_Photo:FOCAL_LENGTH_IN_35_MM_FILM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_319', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_319',
        'test_exif_v2.jpg',
        image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_320
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_320
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_CAPTURE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_320', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_320',
        'test_exif_v2.jpg',
        image.PropertyKey.SCENE_CAPTURE_TYPE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Standard')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })

    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_321
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_321
     * @tc.desc   PhotoAccessHelper_Photo:GAIN_CONTROL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_321', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_321',
        'test_exif_v2.jpg',
        image.PropertyKey.GAIN_CONTROL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Normal')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_322
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_322
     * @tc.desc   PhotoAccessHelper_Photo:CONTRAST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_322', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_322',
        'test_exif_v2.jpg',
        image.PropertyKey.CONTRAST,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Normal')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_323
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_323
     * @tc.desc   PhotoAccessHelper_Photo:SATURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_323', Level.LEVEL1, async (done: Function) => {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_323',
        'test_exif_v2.jpg',
        image.PropertyKey.SATURATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Normal')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_324
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_324
     * @tc.desc   PhotoAccessHelper_Photo:SHARPNESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_324', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_324',
        'test_exif_v2.jpg',
        image.PropertyKey.SHARPNESS,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Normal')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_325
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_325
     * @tc.desc   PhotoAccessHelper_Photo:DEVICE_SETTING_DESCRIPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_325', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_325',
        'test_exif_v2.jpg',
        image.PropertyKey.DEVICE_SETTING_DESCRIPTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2xxx')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_326
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_326
     * @tc.desc   PhotoAccessHelper_Photo:SUBJECT_DISTANCE_RANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_326', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_326',
        'test_exif_v2.jpg',
        image.PropertyKey.SUBJECT_DISTANCE_RANGE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Unknown')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_327
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_327
     * @tc.desc   PhotoAccessHelper_Photo:IMAGE_UNIQUE_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_327', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_327',
        'test_exif_v2.png',
        image.PropertyKey.IMAGE_UNIQUE_ID,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('FXIC012')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_328
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_328
     * @tc.desc   PhotoAccessHelper_Photo:CAMERA_OWNER_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_328', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_328',
        'test_exif_v2.png',
        image.PropertyKey.CAMERA_OWNER_NAME,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('c.uec')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_329
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_329
     * @tc.desc   PhotoAccessHelper_Photo:BODY_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_329', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_329',
        'test_exif_v2.png',
        image.PropertyKey.BODY_SERIAL_NUMBER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('exoch')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_330
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_330
     * @tc.desc   PhotoAccessHelper_Photo empty:FOCAL_PLANE_X_RESOLUTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_330', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_330',
        'test_exif_empty.jpg',
        image.PropertyKey.FOCAL_PLANE_X_RESOLUTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_331
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_331
     * @tc.desc   PhotoAccessHelper_Photo empty:FOCAL_PLANE_Y_RESOLUTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_331', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_331',
        'test_exif_empty.jpg',
        image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_332
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_332
     * @tc.desc   PhotoAccessHelper_Photo empty:FOCAL_PLANE_RESOLUTION_UNIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_332', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_332',
        'test_exif_empty.jpg',
        image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_333
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_333
     * @tc.desc   PhotoAccessHelper_Photo empty:SUBJECT_LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_333', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_333',
        'test_exif_empty.jpg',
        image.PropertyKey.SUBJECT_LOCATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_334
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_334
     * @tc.desc   PhotoAccessHelper_Photo empty:EXPOSURE_INDEX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_334', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_334',
        'test_exif_empty.jpg',
        image.PropertyKey.EXPOSURE_INDEX,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_335
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_335
     * @tc.desc   PhotoAccessHelper_Photo empty:SENSING_METHOD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_335', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_335',
        'test_exif_empty.jpg',
        image.PropertyKey.SENSING_METHOD,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_336
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_336
     * @tc.desc   PhotoAccessHelper_Photo empty:FILE_SOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_336', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_336',
        'test_exif_empty.jpg',
        image.PropertyKey.FILE_SOURCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_337
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_337
     * @tc.desc   PhotoAccessHelper_Photo empty:SCENE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_337', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_337',
        'test_exif_empty.jpg',
        image.PropertyKey.SCENE_TYPE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_338
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_338
     * @tc.desc   PhotoAccessHelper_Photo empty:CFA_PATTERN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_338', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_338',
        'test_exif_empty.jpg',
        image.PropertyKey.CFA_PATTERN,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_339
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_339
     * @tc.desc   PhotoAccessHelper_Photo empty:CUSTOM_RENDERED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_339', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_339',
        'test_exif_empty.jpg',
        image.PropertyKey.CUSTOM_RENDERED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_340
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_340
     * @tc.desc   PhotoAccessHelper_Photo empty:EXPOSURE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_340', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_340',
        'test_exif_empty.jpg',
        image.PropertyKey.EXPOSURE_MODE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_341
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_341
     * @tc.desc   PhotoAccessHelper_Photo empty:WHITE_BALANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_341', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_341',
        'test_exif_empty.jpg',
        image.PropertyKey.WHITE_BALANCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_342
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_342
     * @tc.desc   PhotoAccessHelper_Photo empty:DIGITAL_ZOOM_RATIO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_342', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_342',
        'test_exif_empty.jpg',
        image.PropertyKey.DIGITAL_ZOOM_RATIO,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_343
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_343
     * @tc.desc   PhotoAccessHelper_Photo empty:FOCAL_LENGTH_IN_35_MM_FILM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_343', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_343',
        'test_exif_empty.jpg',
        image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_344
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_344
     * @tc.desc   PhotoAccessHelper_Photo empty:SCENE_CAPTURE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_344', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_344',
        'test_exif_empty.jpg',
        image.PropertyKey.SCENE_CAPTURE_TYPE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_345
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_345
     * @tc.desc   PhotoAccessHelper_Photo empty:GAIN_CONTROL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_345', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_345',
        'test_exif_empty.jpg',
        image.PropertyKey.GAIN_CONTROL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_346
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_346
     * @tc.desc   PhotoAccessHelper_Photo empty:CONTRAST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_346', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_346',
        'test_exif_empty.jpg',
        image.PropertyKey.CONTRAST,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_347
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_347
     * @tc.desc   PhotoAccessHelper_Photo empty:SATURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_347', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_347',
        'test_exif_empty.jpg',
        image.PropertyKey.SATURATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_348
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_348
     * @tc.desc   PhotoAccessHelper_Photo empty:SHARPNESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_348', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_348',
        'test_exif_empty.jpg',
        image.PropertyKey.SHARPNESS,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_349
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_349
     * @tc.desc   PhotoAccessHelper_Photo empty:DEVICE_SETTING_DESCRIPTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_349', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_349',
        'test_exif_empty.jpg',
        image.PropertyKey.DEVICE_SETTING_DESCRIPTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_350
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_350
     * @tc.desc   PhotoAccessHelper_Photo empty:SUBJECT_DISTANCE_RANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_350', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_350',
        'test_exif_empty.jpg',
        image.PropertyKey.SUBJECT_DISTANCE_RANGE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_351
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_351
     * @tc.desc   PhotoAccessHelper_Photo empty:IMAGE_UNIQUE_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_351', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_351',
        'test_exif_empty.jpg',
        image.PropertyKey.IMAGE_UNIQUE_ID,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_352
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_352
     * @tc.desc   PhotoAccessHelper_Photo empty:CAMERA_OWNER_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_352', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_352',
        'test_exif_empty.jpg',
        image.PropertyKey.CAMERA_OWNER_NAME,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_353
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_353
     * @tc.desc   PhotoAccessHelper_Photo empty:BODY_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_353', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_353',
        'test_exif_empty.jpg',
        image.PropertyKey.BODY_SERIAL_NUMBER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_354
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_354
     * @tc.desc   PhotoAccessHelper_Photo empty:LENS_SPECIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_354', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_354',
        'test_exif_empty.jpg',
        image.PropertyKey.LENS_SPECIFICATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_355
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_355
     * @tc.desc   PhotoAccessHelper_Photo empty:LENS_MAKE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_355', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_355',
        'test_exif_empty.jpg',
        image.PropertyKey.LENS_MAKE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_356
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_356
     * @tc.desc   PhotoAccessHelper_Photo empty:LENS_MODEL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_356', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_356',
        'test_exif_empty.jpg',
        image.PropertyKey.LENS_MODEL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_357
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_357
     * @tc.desc   PhotoAccessHelper_Photo empty:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_357', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_357',
        'test_exif_empty.jpg',
        image.PropertyKey.LENS_SERIAL_NUMBER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_358
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_358
     * @tc.desc   PhotoAccessHelper_Photo empty:COMPOSITE_IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_358', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_358',
        'test_exif_empty.jpg',
        image.PropertyKey.COMPOSITE_IMAGE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code == 62980123).assertTrue();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_001
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_001
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_001', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_001---------')
      expect(image.PropertyKey.FOCAL_PLANE_X_RESOLUTION == 'FocalPlaneXResolution').assertTrue();
      expect(image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION == 'FocalPlaneYResolution').assertTrue();
      expect(image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT == 'FocalPlaneResolutionUnit').assertTrue();
      expect(image.PropertyKey.SUBJECT_LOCATION == 'SubjectLocation').assertTrue();
      expect(image.PropertyKey.EXPOSURE_INDEX == 'ExposureIndex').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_001,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_002
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_002
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_002', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_002---------')
      expect(image.PropertyKey.SENSING_METHOD == 'SensingMethod').assertTrue();
      expect(image.PropertyKey.FILE_SOURCE == 'FileSource').assertTrue();
      expect(image.PropertyKey.SCENE_TYPE == 'SceneType').assertTrue();
      expect(image.PropertyKey.CFA_PATTERN == 'CFAPattern').assertTrue();
      expect(image.PropertyKey.CUSTOM_RENDERED == 'CustomRendered').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_002,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_003
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_003
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_003', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_003---------')
      expect(image.PropertyKey.EXPOSURE_MODE == 'ExposureMode').assertTrue();
      expect(image.PropertyKey.WHITE_BALANCE == 'WhiteBalance').assertTrue();
      expect(image.PropertyKey.DIGITAL_ZOOM_RATIO == 'DigitalZoomRatio').assertTrue();
      expect(image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM == 'FocalLengthIn35mmFilm').assertTrue();
      expect(image.PropertyKey.SCENE_CAPTURE_TYPE == 'SceneCaptureType').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_003,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_004
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_004
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_004', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_004---------')
      expect(image.PropertyKey.GAIN_CONTROL == 'GainControl').assertTrue();
      expect(image.PropertyKey.CONTRAST == 'Contrast').assertTrue();
      expect(image.PropertyKey.SATURATION == 'Saturation').assertTrue();
      expect(image.PropertyKey.SHARPNESS == 'Sharpness').assertTrue();
      expect(image.PropertyKey.DEVICE_SETTING_DESCRIPTION == 'DeviceSettingDescription').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_004,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_005
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_005
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_005', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_005---------')
      expect(image.PropertyKey.SUBJECT_DISTANCE_RANGE == 'SubjectDistanceRange').assertTrue();
      expect(image.PropertyKey.IMAGE_UNIQUE_ID == 'ImageUniqueID').assertTrue();
      expect(image.PropertyKey.CAMERA_OWNER_NAME == 'CameraOwnerName').assertTrue();
      expect(image.PropertyKey.BODY_SERIAL_NUMBER == 'BodySerialNumber').assertTrue();
      expect(image.PropertyKey.LENS_SPECIFICATION == 'LensSpecification').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_005,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_006
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_006
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_006', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_006---------')
      expect(image.PropertyKey.LENS_MAKE == 'LensMake').assertTrue();
      expect(image.PropertyKey.LENS_MODEL == 'LensModel').assertTrue();
      expect(image.PropertyKey.LENS_SERIAL_NUMBER == 'LensSerialNumber').assertTrue();
      expect(image.PropertyKey.COMPOSITE_IMAGE == 'CompositeImage').assertTrue();
      expect(image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE == 'SourceImageNumberOfCompositeImage').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM1_List_006,end here---------')
      done();
    })

  });
}