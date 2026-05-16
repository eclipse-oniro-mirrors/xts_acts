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

const TAG = 'Image.ImagePropertyKeySyncEnum3'
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
    console.info(TAG,"image case open fd fail" + err)
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

async function getImagePropertySync3(done: Function, context : Context,testName: string, path: string, propertyKey: image.PropertyKey, callback: (data?: string, error?: BusinessError) => void) {
  console.info(TAG, testName + '- start');
  try {
    const imageSourceApi = await getImageSource(path);
    if (imageSourceApi == null) {
      return;
    }
    let propertyKeyName = imageSourceApi.getImagePropertySync(propertyKey)
    console.info(TAG, testName,"bits_per_sample : " + propertyKeyName);
    callback(propertyKeyName,undefined);
    done();
  } catch (err) {
    expect().assertFail();
    console.error(TAG, testName, err.message, err.code);
    done();
  }
}
export default function ImageGetImagePropertySyncEnumISO() {
  describe('ImageGetImagePropertySyncEnumISO', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_031
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_031
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_031', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_031', 'test_exif_v2.jpg', image.PropertyKey.ISO_SPEED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_032
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_032
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_032', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_032', 'test_exif_v2.jpg', image.PropertyKey.LIGHT_SOURCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Daylight')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_033
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_033
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_033', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_033', 'test_exif_v2.jpg', image.PropertyKey.FOCUS_MODE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('7')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_034
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_034
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_034', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_034', 'test_exif_v2.jpg', image.PropertyKey.YCBCR_POSITIONING,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Centered')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_035
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_035
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_035', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_035', 'test_exif_v2.jpg', image.PropertyKey.FACE_VERSION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_036
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_036
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_036', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_036', 'test_exif_v2.jpg', image.PropertyKey.GPS_PROCESSING_METHOD,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('CELLID')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_037
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_037
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_037', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_037', 'test_exif_v2.jpg', image.PropertyKey.DNG_VERSION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2, 2, 3, 1')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_038
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_038
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_038', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_038', 'test_exif_v2.jpg', image.PropertyKey.GPS_AREA_INFORMATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('arexxx')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_039
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_039
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_039', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_039', 'test_exif_v2.jpg', image.PropertyKey.LENS_MODEL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('txaw')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_040
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_040
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_040', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_040', 'test_exif_v2.jpg', image.PropertyKey.LENS_SPECIFICATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('0.8, 2.5, 1.5, 0.5')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_041
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_041
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_041', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_041', 'test_exif_v2.jpg', image.PropertyKey.GPS_DATE_STAMP,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2025:01:11')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_042
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_042
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_042', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_042', 'test_exif_v2.jpg', image.PropertyKey.FACE_RECT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_043
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_043
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_043', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_043', 'test_exif_v2.jpg', image.PropertyKey.COMPONENTS_CONFIGURATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Y R G B')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_044
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_044
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_044', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_044', 'test_exif_v2.jpg', image.PropertyKey.COLOR_SPACE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('sRGB')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_045
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_045
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_045', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync3(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_045', 'test_exif_v2.jpg', image.PropertyKey.DATE_TIME,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2024:12:31')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })


  });
}