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

const TAG = 'Image.PropertyKey2'
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
        console.info(TAG, testName, "get key : ", propertyKey, 'value: ', data);
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
export default function ImagePropertyKeyTest2() {
  describe('ImagePropertyKeyTest2', ()=>{
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_201
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_201
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_TEXT_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_201', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_201',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_TEXT_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('11')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_202
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_202
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_NIGHT_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_202', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_202',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_NIGHT_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('10')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_203
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_203
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_POINTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_203', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_203',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_POINTER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('256')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_204
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_204
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_VERSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_204', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_204',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_VERSION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_205
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_205
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_FOOD_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_205', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_205',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_FOOD_CONF,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_206
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_206
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_STAGE_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_206', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_206',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_STAGE_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('3')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_207
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_207
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_BLUE_SKY_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_207', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_207',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_BLUE_SKY_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('4')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_208
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_208
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_GREEN_PLANT_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_208', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_208',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_GREEN_PLANT_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('5')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_209
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_209
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_BEACH_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_209', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_209',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_BEACH_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('6')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_210
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_210
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_SNOW_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_210', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_210',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_SNOW_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('7')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_211
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_211
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_SUNSET_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_211', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_211',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_SUNSET_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('8')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_212
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_212
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_FLOWERS_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_212', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_212',
        'test_exif_v2.png',
        image.PropertyKey.SCENE_FLOWERS_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('9')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_213
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_213
     * @tc.desc   PhotoAccessHelper_Photo:ISO_SPEED_RATINGS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_213', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_213',
        'test_exif_v2.png',
        image.PropertyKey.ISO_SPEED_RATINGS,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_214
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_214
     * @tc.desc   PhotoAccessHelper_Photo:PHOTOGRAPHIC_SENSITIVITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_214', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_214',
        'test_exif_v2.png',
        image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_215
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_215
     * @tc.desc   PhotoAccessHelper_Photo:OECF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_215', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_215',
        'test_exif_v2.png',
        image.PropertyKey.OECF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('4 bytes undefined data')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_216
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_216
     * @tc.desc   PhotoAccessHelper_Photo:SENSITIVITY_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_216', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_216',
        'test_exif_v2.png',
        image.PropertyKey.SENSITIVITY_TYPE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Standard output sensitivity (SOS) and ISO speed')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_217
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_217
     * @tc.desc   PhotoAccessHelper_Photo:STANDARD_OUTPUT_SENSITIVITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_217', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_217',
        'test_exif_v2.png',
        image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('5')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_218
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_218
     * @tc.desc   PhotoAccessHelper_Photo:RECOMMENDED_EXPOSURE_INDEX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_218', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_218',
        'test_exif_v2.png',
        image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('123')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_219
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_219
     * @tc.desc   PhotoAccessHelper_Photo:ISO_SPEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_219', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_219',
        'test_exif_v2.png',
        image.PropertyKey.ISO_SPEED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_220
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_220
     * @tc.desc   PhotoAccessHelper_Photo:ISO_SPEED_LATITUDE_YYY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_220', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_220',
        'test_exif_v2.png',
        image.PropertyKey.ISO_SPEED_LATITUDE_YYY,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1456')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_221
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_221
     * @tc.desc   PhotoAccessHelper_Photo:ISO_SPEED_LATITUDE_ZZZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_221', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_221',
        'test_exif_v2.png',
        image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1456')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_222
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_222
     * @tc.desc   PhotoAccessHelper_Photo:EXIF_VERSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_222', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_222',
        'test_exif_v2.png',
        image.PropertyKey.EXIF_VERSION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Exif Version 1.1')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_223
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_223
     * @tc.desc   PhotoAccessHelper_Photo:DATE_TIME_ORIGINAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_223', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_223',
        'test_exif_v2.png',
        image.PropertyKey.DATE_TIME_ORIGINAL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2024:01:25 05:51:34')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_224
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_224
     * @tc.desc   PhotoAccessHelper_Photo:DATE_TIME_DIGITIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_224', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_224',
        'test_exif_v2.png',
        image.PropertyKey.DATE_TIME_DIGITIZED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2022:06:02 15:51:34')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_225
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_225
     * @tc.desc   PhotoAccessHelper_Photo:OFFSET_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_225', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_225',
        'test_exif_v2.png',
        image.PropertyKey.OFFSET_TIME,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2024:01:25')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_226
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_226
     * @tc.desc   PhotoAccessHelper_Photo:OFFSET_TIME_ORIGINAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_226', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_226',
        'test_exif_v2.png',
        image.PropertyKey.OFFSET_TIME_ORIGINAL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('chex')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_227
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_227
     * @tc.desc   PhotoAccessHelper_Photo:OFFSET_TIME_DIGITIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_227', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_227',
        'test_exif_v2.png',
        image.PropertyKey.OFFSET_TIME_DIGITIZED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('cfh')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_228
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_228
     * @tc.desc   PhotoAccessHelper_Photo:COMPONENTS_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_228', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_228',
        'test_exif_v2.png',
        image.PropertyKey.COMPONENTS_CONFIGURATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Y R G B')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_229
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_229
     * @tc.desc   PhotoAccessHelper_Photo:COMPRESSED_BITS_PER_PIXEL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_229', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_229',
        'test_exif_v2.png',
        image.PropertyKey.COMPRESSED_BITS_PER_PIXEL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('24')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_230
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_230
     * @tc.desc   PhotoAccessHelper_Photo:SHUTTER_SPEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_230', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_230',
        'test_exif_v2.png',
        image.PropertyKey.SHUTTER_SPEED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.50 EV (1/6 sec.)')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_231
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_231
     * @tc.desc   PhotoAccessHelper_Photo:APERTURE_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_231', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_231',
        'test_exif_v2.png',
        image.PropertyKey.APERTURE_VALUE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('4.00 EV (f/4.0)')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_232
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_232
     * @tc.desc   PhotoAccessHelper_Photo:BRIGHTNESS_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_232', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_232',
        'test_exif_v2.png',
        image.PropertyKey.BRIGHTNESS_VALUE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.50 EV (19.38 cd/m^2)')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_233
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_233
     * @tc.desc   PhotoAccessHelper_Photo:EXPOSURE_BIAS_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_233', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_233',
        'test_exif_v2.png',
        image.PropertyKey.EXPOSURE_BIAS_VALUE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('23.00 EV')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_234
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_234
     * @tc.desc   PhotoAccessHelper_Photo:MAX_APERTURE_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_234', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_234',
        'test_exif_v2.png',
        image.PropertyKey.MAX_APERTURE_VALUE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.50 EV (f/2.4)')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_235
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_235
     * @tc.desc   PhotoAccessHelper_Photo:SUBJECT_DISTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_235', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_235',
        'test_exif_v2.png',
        image.PropertyKey.SUBJECT_DISTANCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.5 m')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_236
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_236
     * @tc.desc   PhotoAccessHelper_Photo:METERING_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_236', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_236',
        'test_exif_v2.png',
        image.PropertyKey.METERING_MODE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Pattern')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_237
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_237
     * @tc.desc   PhotoAccessHelper_Photo:LIGHT_SOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_237', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_237',
        'test_exif_v2.png',
        image.PropertyKey.LIGHT_SOURCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Daylight')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_238
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_238
     * @tc.desc   PhotoAccessHelper_Photo:FLASH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_238', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_238',
        'test_exif_v2.png',
        image.PropertyKey.FLASH,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Strobe return light not detected')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_239
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_239
     * @tc.desc   PhotoAccessHelper_Photo:FOCAL_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_239', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_239',
        'test_exif_v2.png',
        image.PropertyKey.FOCAL_LENGTH,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('0.0 mm')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_240
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_240
     * @tc.desc   PhotoAccessHelper_Photo:SUBJECT_AREA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_240', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_240',
        'test_exif_v2.png',
        image.PropertyKey.SUBJECT_AREA,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('(x,y) = (12,13)')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_241
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_241
     * @tc.desc   PhotoAccessHelper_Photo:MAKER_NOTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_241', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_241',
        'test_exif_v2.png',
        image.PropertyKey.MAKER_NOTE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,HwMnoteFrontCamera:3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,HwMnoteFacePointer:122,HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,HwMnoteSceneTextConf:11')
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_242
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_242
     * @tc.desc   PhotoAccessHelper_Photo path empty:ISO_SPEED_RATINGS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_242', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_242',
        'test_exif_empty_2.png',
        image.PropertyKey.ISO_SPEED_RATINGS,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_243
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_243
     * @tc.desc   PhotoAccessHelper_Photo path empty:PHOTOGRAPHIC_SENSITIVITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_243', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_243',
        'test_exif_empty_2.png',
        image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_244
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_244
     * @tc.desc   PhotoAccessHelper_Photo path empty:OECF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_244', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_244',
        'test_exif_empty_2.png',
        image.PropertyKey.OECF,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_245
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_245
     * @tc.desc   PhotoAccessHelper_Photo path empty:SENSITIVITY_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_245', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_245',
        'test_exif_empty_2.png',
        image.PropertyKey.SENSITIVITY_TYPE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_246
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_246
     * @tc.desc   PhotoAccessHelper_Photo path empty:STANDARD_OUTPUT_SENSITIVITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_246', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_246',
        'test_exif_empty_2.png',
        image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_247
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_247
     * @tc.desc   PhotoAccessHelper_Photo path empty:RECOMMENDED_EXPOSURE_INDEX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_247', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_247',
        'test_exif_empty_2.png',
        image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_248
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_248
     * @tc.desc   PhotoAccessHelper_Photo path empty:ISO_SPEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_248', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_248',
        'test_exif_empty_2.png',
        image.PropertyKey.ISO_SPEED,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_249
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_249
     * @tc.desc   PhotoAccessHelper_Photo path empty:ISO_SPEED_LATITUDE_YYY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_249', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_249',
        'test_exif_empty_2.png',
        image.PropertyKey.ISO_SPEED_LATITUDE_YYY,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_250
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_250
     * @tc.desc   PhotoAccessHelper_Photo path empty:ISO_SPEED_LATITUDE_ZZZ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_250', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_250',
        'test_exif_empty_2.png',
        image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_251
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_251
     * @tc.desc   PhotoAccessHelper_Photo path empty:EXIF_VERSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_251', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_251',
        'test_exif_empty_2.png',
        image.PropertyKey.EXIF_VERSION,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_252
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_252
     * @tc.desc   PhotoAccessHelper_Photo path empty:DATE_TIME_ORIGINAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_252', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_252',
        'test_exif_empty_2.png',
        image.PropertyKey.DATE_TIME_ORIGINAL,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_253
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_253
     * @tc.desc   PhotoAccessHelper_Photo path empty:DATE_TIME_DIGITIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_253', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_253',
        'test_exif_empty_2.png',
        image.PropertyKey.DATE_TIME_DIGITIZED,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_254
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_254
     * @tc.desc   PhotoAccessHelper_Photo path empty:OFFSET_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_254', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_254',
        'test_exif_empty_2.png',
        image.PropertyKey.OFFSET_TIME,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_255
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_255
     * @tc.desc   PhotoAccessHelper_Photo path empty:OFFSET_TIME_ORIGINAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_255', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_255',
        'test_exif_empty_2.png',
        image.PropertyKey.OFFSET_TIME_ORIGINAL,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_256
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_256
     * @tc.desc   PhotoAccessHelper_Photo path empty:OFFSET_TIME_DIGITIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_256', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_256',
        'test_exif_empty_2.png',
        image.PropertyKey.OFFSET_TIME_DIGITIZED,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_257
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_257
     * @tc.desc   PhotoAccessHelper_Photo path empty:COMPONENTS_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_257', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_257',
        'test_exif_empty_2.png',
        image.PropertyKey.COMPONENTS_CONFIGURATION,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_258
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_258
     * @tc.desc   PhotoAccessHelper_Photo path empty:COMPRESSED_BITS_PER_PIXEL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_258', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_258',
        'test_exif_empty_2.png',
        image.PropertyKey.COMPRESSED_BITS_PER_PIXEL,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_259
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_259
     * @tc.desc   PhotoAccessHelper_Photo path empty:SHUTTER_SPEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_259', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_259',
        'test_exif_empty_2.png',
        image.PropertyKey.SHUTTER_SPEED,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_260
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_260
     * @tc.desc   PhotoAccessHelper_Photo path empty:APERTURE_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_260', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_260',
        'test_exif_empty_2.png',
        image.PropertyKey.APERTURE_VALUE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_261
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_261
     * @tc.desc   PhotoAccessHelper_Photo path empty:BRIGHTNESS_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_261', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_261',
        'test_exif_empty_2.png',
        image.PropertyKey.BRIGHTNESS_VALUE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_262
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_262
     * @tc.desc   PhotoAccessHelper_Photo path empty:EXPOSURE_BIAS_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_262', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_262',
        'test_exif_empty_2.png',
        image.PropertyKey.EXPOSURE_BIAS_VALUE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_263
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_263
     * @tc.desc   PhotoAccessHelper_Photo path empty:MAX_APERTURE_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_263', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_263',
        'test_exif_empty_2.png',
        image.PropertyKey.MAX_APERTURE_VALUE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_264
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_264
     * @tc.desc   PhotoAccessHelper_Photo path empty:SUBJECT_DISTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_264', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_264',
        'test_exif_empty_2.png',
        image.PropertyKey.SUBJECT_DISTANCE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_265
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_265
     * @tc.desc   PhotoAccessHelper_Photo path empty:METERING_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_265', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_265',
        'test_exif_empty_2.png',
        image.PropertyKey.METERING_MODE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_266
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_266
     * @tc.desc   PhotoAccessHelper_Photo path empty:LIGHT_SOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_266', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_266',
        'test_exif_empty_2.png',
        image.PropertyKey.LIGHT_SOURCE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_267
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_267
     * @tc.desc   PhotoAccessHelper_Photo path empty:FLASH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_267', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_267',
        'test_exif_empty_2.png',
        image.PropertyKey.FLASH,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_268
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_268
     * @tc.desc   PhotoAccessHelper_Photo path empty:FOCAL_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_268', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_268',
        'test_exif_empty_2.png',
        image.PropertyKey.FOCAL_LENGTH,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_269
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_269
     * @tc.desc   PhotoAccessHelper_Photo path empty:SUBJECT_AREA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_269', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_269',
        'test_exif_empty_2.png',
        image.PropertyKey.SUBJECT_AREA,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_270
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_270
     * @tc.desc   PhotoAccessHelper_Photo path empty:MAKER_NOTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_270', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_270',
        'test_exif_empty_2.png',
        image.PropertyKey.MAKER_NOTE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_271
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_271
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_POINTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_271', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_271',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_POINTER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_272
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_272
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_VERSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_272', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_272',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_VERSION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_273
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_273
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_FOOD_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_273', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_273',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_FOOD_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_274
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_274
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_STAGE_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_274', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_274',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_STAGE_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_275
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_275
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_BLUE_SKY_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_275', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_275',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_BLUE_SKY_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_276
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_276
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_GREEN_PLANT_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_276', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_276',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_GREEN_PLANT_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_277
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_277
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_BEACH_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_277', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_277',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_BEACH_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_278
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_278
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_SNOW_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_278', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_278',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_SNOW_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_279
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_279
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_SUNSET_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_279', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_279',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_SUNSET_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_280
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_280
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_FLOWERS_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_280', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_280',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_FLOWERS_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_281
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_281
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_NIGHT_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_281', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_281',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_NIGHT_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_282
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_282
     * @tc.desc   PhotoAccessHelper_Photo path empty:SCENE_TEXT_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_282', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_282',
        'test_exif_empty_2.png',
        image.PropertyKey.SCENE_TEXT_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(isEmpty(data)).assertFalse();
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_001
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_001
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_001', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_001---------')
      expect(image.PropertyKey.SCENE_TEXT_CONF == 'HwMnoteSceneTextConf').assertTrue();
      expect(image.PropertyKey.ISO_SPEED_RATINGS == 'ISOSpeedRatings').assertTrue();
      expect(image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY == 'PhotographicSensitivity').assertTrue();
      expect(image.PropertyKey.OECF == 'OECF').assertTrue();
      expect(image.PropertyKey.SENSITIVITY_TYPE == 'SensitivityType').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_001,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_002
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_002
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_002', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_002---------')
      expect(image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY == 'StandardOutputSensitivity').assertTrue();
      expect(image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX == 'RecommendedExposureIndex').assertTrue();
      expect(image.PropertyKey.ISO_SPEED == 'ISOSpeedRatings').assertTrue();
      expect(image.PropertyKey.ISO_SPEED_LATITUDE_YYY == 'ISOSpeedLatitudeyyy').assertTrue();
      expect(image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ == 'ISOSpeedLatitudezzz').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_002,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_003
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_003
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_003', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_003---------')
      expect(image.PropertyKey.EXIF_VERSION == 'ExifVersion').assertTrue();
      expect(image.PropertyKey.DATE_TIME_ORIGINAL == 'DateTimeOriginal').assertTrue();
      expect(image.PropertyKey.DATE_TIME_DIGITIZED == 'DateTimeDigitized').assertTrue();
      expect(image.PropertyKey.OFFSET_TIME == 'OffsetTime').assertTrue();
      expect(image.PropertyKey.OFFSET_TIME_ORIGINAL == 'OffsetTimeOriginal').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_003,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_004
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_004
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_004', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_004---------')
      expect(image.PropertyKey.OFFSET_TIME_DIGITIZED == 'OffsetTimeDigitized').assertTrue();
      expect(image.PropertyKey.COMPONENTS_CONFIGURATION == 'ComponentsConfiguration').assertTrue();
      expect(image.PropertyKey.COMPRESSED_BITS_PER_PIXEL == 'CompressedBitsPerPixel').assertTrue();
      expect(image.PropertyKey.SHUTTER_SPEED == 'ShutterSpeedValue').assertTrue();
      expect(image.PropertyKey.APERTURE_VALUE == 'ApertureValue').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_004,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_005
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_005
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_005', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_005---------')
      expect(image.PropertyKey.BRIGHTNESS_VALUE == 'BrightnessValue').assertTrue();
      expect(image.PropertyKey.EXPOSURE_BIAS_VALUE == 'ExposureBiasValue').assertTrue();
      expect(image.PropertyKey.MAX_APERTURE_VALUE == 'MaxApertureValue').assertTrue();
      expect(image.PropertyKey.SUBJECT_DISTANCE == 'SubjectDistance').assertTrue();
      expect(image.PropertyKey.METERING_MODE == 'MeteringMode').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_005,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_006
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_006
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_006', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_006---------')
      expect(image.PropertyKey.LIGHT_SOURCE == 'LightSource').assertTrue();
      expect(image.PropertyKey.FLASH == 'Flash').assertTrue();
      expect(image.PropertyKey.FOCAL_LENGTH == 'FocalLength').assertTrue();
      expect(image.PropertyKey.SUBJECT_AREA == 'SubjectArea').assertTrue();
      expect(image.PropertyKey.MAKER_NOTE == 'MakerNote').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_006,end here---------')
      done();
    })
      /**
       * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_007
       * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_007
       * @tc.desc   PhotoAccessHelper_Photo property enum
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_007', Level.LEVEL1, async (done:Function)=> {
        console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_007---------')
        expect(image.PropertyKey.SCENE_POINTER == 'HwMnoteScenePointer').assertTrue();
        expect(image.PropertyKey.SCENE_VERSION == 'HwMnoteSceneVersion').assertTrue();
        expect(image.PropertyKey.SCENE_FOOD_CONF == 'HwMnoteSceneFoodConf').assertTrue();
        expect(image.PropertyKey.SCENE_STAGE_CONF == 'HwMnoteSceneStageConf').assertTrue();
        expect(image.PropertyKey.SCENE_BLUE_SKY_CONF == 'HwMnoteSceneBlueSkyConf').assertTrue();
        console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_007,end here---------')
        done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_008
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_008
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_008', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_008---------')
      expect(image.PropertyKey.SCENE_GREEN_PLANT_CONF == 'HwMnoteSceneGreenPlantConf').assertTrue();
      expect(image.PropertyKey.SCENE_BEACH_CONF == 'HwMnoteSceneBeachConf').assertTrue();
      expect(image.PropertyKey.SCENE_SNOW_CONF == 'HwMnoteSceneSnowConf').assertTrue();
      expect(image.PropertyKey.SCENE_SUNSET_CONF == 'HwMnoteSceneSunsetConf').assertTrue();
      expect(image.PropertyKey.SCENE_FLOWERS_CONF == 'HwMnoteSceneFlowersConf').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_008,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_009
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_009
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_009', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_009---------')
      expect(image.PropertyKey.SCENE_NIGHT_CONF == 'HwMnoteSceneNightConf').assertTrue();
      expect(image.PropertyKey.FACE_POINTER == 'HwMnoteFacePointer').assertTrue();
      expect(image.PropertyKey.FACE_VERSION == 'HwMnoteFaceVersion').assertTrue();
      expect(image.PropertyKey.FACE_COUNT == 'HwMnoteFaceCount').assertTrue();
      expect(image.PropertyKey.FACE_CONF == 'HwMnoteFaceConf').assertTrue();
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_List_009,end here---------')
      done();
    })
  });
}

