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

const TAG = 'Image.ImagePropertyKeySyncEnum10'
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

async function getImagePropertySync4(done: Function, context : Context,testName: string, path: string, propertyKey: image.PropertyKey, callback: (data?: string, error?: BusinessError) => void) {
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
    console.error(TAG, testName, err.message, err.code);
    callback(undefined, err);
    done();
  }
}

export default function ImageGetImagePropertySyncEnumFlashEmpty() {
  describe('ImageGetImagePropertySyncEnumFlashEmpty', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_151
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_151
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_151', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_151', 'test_exif_empty_2.jpg', image.PropertyKey.FLASH,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_152
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_152
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_152', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_152', 'test_exif_empty_2.jpg', image.PropertyKey.GPS_H_POSITIONING_ERROR,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_153
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_153
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_153', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_153', 'test_exif_empty_2.jpg', image.PropertyKey.MODEL,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_154
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_154
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_154', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_154', 'test_exif_empty_2.jpg', image.PropertyKey.SCENE_SUNSET_CONF,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value')
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_155
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_155
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_155', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_155', 'test_exif_empty_2.jpg', image.PropertyKey.FOCAL_PLANE_X_RESOLUTION,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_156
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_156
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_156', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_156', 'test_exif_empty_2.jpg', image.PropertyKey.SCENE_GREEN_PLANT_CONF,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value')
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_157
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_157
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_157', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_157', 'test_exif_empty_2.jpg', image.PropertyKey.MAKER_NOTE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_158
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_158
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_158', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_158', 'test_exif_empty_2.jpg', image.PropertyKey.GPS_DIFFERENTIAL,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_159
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_159
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_159', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_159', 'test_exif_empty_2.jpg', image.PropertyKey.YCBCR_COEFFICIENTS,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_160
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_160
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_160', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_160', 'test_exif_empty_2.jpg', image.PropertyKey.SUBJECT_DISTANCE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_161
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_161
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_161', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_161', 'test_exif_empty_2.jpg', image.PropertyKey.ORIENTATION,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_162
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_162
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_162', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_162', 'test_exif_empty_2.jpg', image.PropertyKey.PIXEL_Y_DIMENSION,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_163
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_163
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_163', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_163', 'test_exif_empty_2.jpg', image.PropertyKey.EXPOSURE_INDEX,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_164
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_164
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_164', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_164', 'test_exif_empty_2.jpg', image.PropertyKey.CLOUD_ENHANCEMENT_MODE,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value')
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_165
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_165
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_165', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_165', 'test_exif_empty_2.jpg', image.PropertyKey.BRIGHTNESS_VALUE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_166
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_166
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_166', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_166', 'test_exif_empty_2.jpg', image.PropertyKey.FLASH_ENERGY,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_167
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_167
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_167', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_167', 'test_exif_empty_2.jpg', image.PropertyKey.FACE_SMILE_SCORE,
        (data?: string, error?: BusinessError) => {
          expect(data).assertEqual('default_exif_value')
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_168
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_168
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_168', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_168', 'test_exif_empty_2.jpg', image.PropertyKey.GPS_VERSION_ID,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_169
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_169
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_169', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_169', 'test_exif_empty_2.jpg', image.PropertyKey.GPS_LONGITUDE_REF,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_170
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_170
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_170', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync4(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM_170', 'test_exif_empty_2.jpg', image.PropertyKey.EXPOSURE_PROGRAM,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
          done();
        })
    })

  });
}