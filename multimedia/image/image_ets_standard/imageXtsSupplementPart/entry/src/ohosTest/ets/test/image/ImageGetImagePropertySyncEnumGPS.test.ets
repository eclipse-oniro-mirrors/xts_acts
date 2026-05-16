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

const TAG = 'Image.ImagePropertyKeySyncEnum1A'
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

async function getImagePropertySync(done: Function, context : Context,testName: string, path: string, propertyKey: image.PropertyKey, callback: (data?: string, error?: BusinessError) => void) {
  console.info(TAG, testName + '- start');
  try {
    const imageSourceApi = await getImageSource(path);
    if (imageSourceApi == null) {
      return;
    }
    let propertyKeyName = imageSourceApi.getImagePropertySync(propertyKey)
    console.info(TAG, testName,"bits_per_sample : " + propertyKeyName);
    callback(propertyKeyName,undefined)
  } catch (err) {
    expect().assertFail();
    console.error(TAG, testName, err.message, err.code);
    done();
  }
}


export default function ImagePropertyKeySyncEnumGPS() {
  describe('ImagePropertyKeySyncEnumGPS', ()=>{
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_001
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_001
     * @tc.desc   PhotoAccessHelper_Photo:LENS_SERIAL_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_001', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_001', 'test_exif_v2.jpg', image.PropertyKey.GPS_SPEED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('150');
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_002
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_002
     * @tc.desc   PhotoAccessHelper_Photo:XMAGE_RIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_002', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_002', 'test_exif_v2.jpg', image.PropertyKey.XMAGE_RIGHT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('default_exif_value')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })

    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_003
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_003
     * @tc.desc   PhotoAccessHelper_Photo:COMPRESSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_003', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_003', 'test_exif_v2.jpg', image.PropertyKey.COMPRESSION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Uncompressed')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_004
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_004
     * @tc.desc   PhotoAccessHelper_Photo:ROWS_PER_STRIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_004', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_004', 'test_exif_v2.jpg', image.PropertyKey.ROWS_PER_STRIP,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('123')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_005
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_005
     * @tc.desc   PhotoAccessHelper_Photo:RELATED_SOUND_FILE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_005', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_005', 'test_exif_v2.jpg', image.PropertyKey.RELATED_SOUND_FILE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('/usr/home')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_006
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_006
     * @tc.desc   PhotoAccessHelper_Photo:IMAGE_UNIQUE_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_006', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_006', 'test_exif_v2.jpg', image.PropertyKey.IMAGE_UNIQUE_ID,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('FXIC012')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_007
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_007
     * @tc.desc   PhotoAccessHelper_Photo:EXPOSURE_BIAS_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_007', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_007', 'test_exif_v2.jpg', image.PropertyKey.EXPOSURE_BIAS_VALUE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('23.00 EV')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_008
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_008
     * @tc.desc   PhotoAccessHelper_Photo:PHOTOMETRIC_INTERPRETATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_008', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_008', 'test_exif_v2.jpg', image.PropertyKey.PHOTOMETRIC_INTERPRETATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Reversed mono')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_009
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_009
     * @tc.desc   PhotoAccessHelper_Photo:USER_COMMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_009', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_009', 'test_exif_v2.jpg', image.PropertyKey.USER_COMMENT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('place for user comments')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_010
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_010
     * @tc.desc   PhotoAccessHelper_Photo:SPATIAL_FREQUENCY_RESPONSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_010', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_010', 'test_exif_v2.jpg', image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('13')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_011
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_011
     * @tc.desc   PhotoAccessHelper_Photo:GPS_IMG_DIRECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_011', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_011', 'test_exif_v2.jpg', image.PropertyKey.GPS_IMG_DIRECTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.23')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_012
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_012
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_VERSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_012', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_012', 'test_exif_v2.jpg', image.PropertyKey.SCENE_VERSION,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_013
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_013
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_BLUE_SKY_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_013', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_013', 'test_exif_v2.jpg', image.PropertyKey.SCENE_BLUE_SKY_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('4')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_014
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_014
     * @tc.desc   PhotoAccessHelper_Photo:METERING_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_014', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_014', 'test_exif_v2.jpg', image.PropertyKey.METERING_MODE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Pattern')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_015
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_015
     * @tc.desc   PhotoAccessHelper_Photo:TRANSFER_FUNCTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_015', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_015', 'test_exif_v2.jpg', image.PropertyKey.TRANSFER_FUNCTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('3 bytes undefined data')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_016
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_016
     * @tc.desc   PhotoAccessHelper_Photo:SATURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_016', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_016', 'test_exif_v2.jpg', image.PropertyKey.SATURATION,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_017
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_017
     * @tc.desc   PhotoAccessHelper_Photo:GPS_TRACK_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_017', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_017', 'test_exif_v2.jpg', image.PropertyKey.GPS_TRACK_REF,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_018
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_018
     * @tc.desc   PhotoAccessHelper_Photo:XMAGE_LEFT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_018', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_018', 'test_exif_v2.jpg', image.PropertyKey.XMAGE_LEFT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('default_exif_value')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_019
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_019
     * @tc.desc   PhotoAccessHelper_Photo:JPEG_INTERCHANGE_FORMAT_LENGTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_019', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_019', 'test_exif_v2.jpg', image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('4')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_020
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_020
     * @tc.desc   PhotoAccessHelper_Photo:COPYRIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_020', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM1A_020', 'test_exif_v2.jpg', image.PropertyKey.COPYRIGHT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('undefined (Photographer) - [None] (Editor)')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
  });
}