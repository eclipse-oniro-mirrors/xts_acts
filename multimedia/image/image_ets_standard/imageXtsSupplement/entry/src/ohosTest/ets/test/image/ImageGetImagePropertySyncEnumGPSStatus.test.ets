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

const TAG = 'Image.ImagePropertyKeySyncEnum6'
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

async function getImagePropertySync6(done: Function, context : Context,testName: string, path: string, propertyKey: image.PropertyKey, callback: (data?: string, error?: BusinessError) => void) {
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

export default function ImageGetImagePropertySyncEnumGPSStatus() {
  describe('ImageGetImagePropertySyncEnumGPSStatus', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_086
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_086
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_086', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_086', 'test_exif_v2.jpg', image.PropertyKey.GPS_STATUS,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('A')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_087
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_087
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_087', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_087', 'test_exif_v2.jpg', image.PropertyKey.GAMMA,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.5')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_088
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_088
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_088', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_088', 'test_exif_v2.jpg', image.PropertyKey.FACE_LEYE_CENTER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1 2 3 4')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_089
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_089
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_089', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_089', 'test_exif_v2.jpg', image.PropertyKey.FACE_COUNT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_090
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_090
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_090', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_090', 'test_exif_v2.jpg', image.PropertyKey.GPS_DEST_DISTANCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('10')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_091
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_091
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_091', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_091', 'test_exif_v2.jpg', image.PropertyKey.FOCAL_LENGTH,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('0.0 mm')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_092
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_092
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_092', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_092', 'test_exif_v2.jpg', image.PropertyKey.GPS_DEST_LONGITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('E')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_093
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_093
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_093', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_093', 'test_exif_v2.jpg', image.PropertyKey.FILE_SOURCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('DSC')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_094
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_094
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_094', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_094', 'test_exif_v2.jpg', image.PropertyKey.GPS_DEST_BEARING_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('T')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_095
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_095
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_095', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_095', 'test_exif_v2.jpg', image.PropertyKey.SHARPNESS,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Normal')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_096
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_096
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_096', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_096', 'test_exif_v2.jpg', image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_097
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_097
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_097', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_097', 'test_exif_v2.jpg', image.PropertyKey.RESOLUTION_UNIT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Inch')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_098
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_098
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_098', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_098', 'test_exif_v2.jpg', image.PropertyKey.LENS_MAKE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('xxwx')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_099
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_099
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_099', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_099', 'test_exif_v2.jpg', image.PropertyKey.WHITE_POINT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('252, 0/0')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_100
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_100
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_100', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_100', 'test_exif_v2.jpg', image.PropertyKey.SENSING_METHOD,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Two-chip color area sensor')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_101
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_101
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_101', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_101', 'test_exif_v2.jpg', image.PropertyKey.SCENE_TEXT_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('11')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_102
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_102
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_102', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_102', 'test_exif_v2.jpg', image.PropertyKey.FACE_POINTER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('122')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_103
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_103
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_103', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_103', 'test_exif_v2.jpg', image.PropertyKey.SUBJECT_DISTANCE_RANGE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Unknown')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_104
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_104
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_104', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_104', 'test_exif_v2.jpg', image.PropertyKey.DIGITAL_ZOOM_RATIO,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('321')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_105
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_105
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_105', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync6(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_105', 'test_exif_v2.jpg', image.PropertyKey.FACE_REYE_CENTER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('5 6 7 8')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

  });
}
