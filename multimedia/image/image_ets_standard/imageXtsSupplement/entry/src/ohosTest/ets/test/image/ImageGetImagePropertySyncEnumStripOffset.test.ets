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

const TAG = 'Image.ImagePropertyKeySyncEnum3A'
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


export default function ImageGetImagePropertySyncEnumStripOffset() {
  describe('ImageGetImagePropertySyncEnumStripOffset', ()=>{
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
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_001
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_001
     * @tc.desc   PhotoAccessHelper_Photo:STRIP_OFFSETS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_001', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_001', 'test_exif_v2.jpg', image.PropertyKey.STRIP_OFFSETS,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('123');
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_002
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_002
     * @tc.desc   PhotoAccessHelper_Photo:GPS_LONGITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_002', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_002', 'test_exif_v2.jpg', image.PropertyKey.GPS_LONGITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('120, 52, 26')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })

    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_003
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_003
     * @tc.desc   PhotoAccessHelper_Photo:GPS_MEASURE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_003', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_003', 'test_exif_v2.jpg', image.PropertyKey.GPS_MEASURE_MODE,
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
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_004
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_004
     * @tc.desc   PhotoAccessHelper_Photo:ROLL_ANGLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_004', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_004', 'test_exif_v2.jpg', image.PropertyKey.ROLL_ANGLE,
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
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_005
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_005
     * @tc.desc   PhotoAccessHelper_Photo:GPS_DEST_LATITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_005', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_005', 'test_exif_v2.jpg', image.PropertyKey.GPS_DEST_LATITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('N')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_006
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_006
     * @tc.desc   PhotoAccessHelper_Photo:GPS_SPEED_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_006', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_006', 'test_exif_v2.jpg', image.PropertyKey.GPS_SPEED_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('N')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_007
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_007
     * @tc.desc   PhotoAccessHelper_Photo:PRIMARY_CHROMATICITIES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_007', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_007', 'test_exif_v2.jpg', image.PropertyKey.PRIMARY_CHROMATICITIES,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual(' 0')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_008
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_008
     * @tc.desc   PhotoAccessHelper_Photo:PLANAR_CONFIGURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_008', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_008', 'test_exif_v2.jpg', image.PropertyKey.PLANAR_CONFIGURATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Chunky format')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_009
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_009
     * @tc.desc   PhotoAccessHelper_Photo:SPECTRAL_SENSITIVITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_009', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_009', 'test_exif_v2.jpg', image.PropertyKey.SPECTRAL_SENSITIVITY,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('abc')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_010
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_010
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_FLOWERS_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_010', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_010', 'test_exif_v2.jpg', image.PropertyKey.SCENE_FLOWERS_CONF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('9')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_011
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_011
     * @tc.desc   PhotoAccessHelper_Photo:Y_RESOLUTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_011', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_011', 'test_exif_v2.jpg', image.PropertyKey.Y_RESOLUTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual(' 0')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_012
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_012
     * @tc.desc   PhotoAccessHelper_Photo:PHOTOGRAPHIC_SENSITIVITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_012', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_012', 'test_exif_v2.jpg', image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY,
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
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_013
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_013
     * @tc.desc   PhotoAccessHelper_Photo:GPS_IMG_DIRECTION_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_013', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_013', 'test_exif_v2.jpg', image.PropertyKey.GPS_IMG_DIRECTION_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('M')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })

    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_014
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_014
     * @tc.desc   PhotoAccessHelper_Photo:PIXEL_X_DIMENSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_014', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_014', 'test_exif_v2.jpg', image.PropertyKey.PIXEL_X_DIMENSION,
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
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_015
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_015
     * @tc.desc   PhotoAccessHelper_Photo:FACE_MOUTH_CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_015', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_015', 'test_exif_v2.jpg', image.PropertyKey.FACE_MOUTH_CENTER,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('1 2 3 4 5 6 7 8')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_016
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_016
     * @tc.desc   PhotoAccessHelper_Photo:GAIN_CONTROL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_016', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_016', 'test_exif_v2.jpg', image.PropertyKey.GAIN_CONTROL,
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
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_017
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_017
     * @tc.desc   PhotoAccessHelper_Photo:PHYSICAL_APERTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_017', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_017', 'test_exif_v2.jpg', image.PropertyKey.PHYSICAL_APERTURE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('6')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_018
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_018
     * @tc.desc   PhotoAccessHelper_Photo:GPS_LATITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_018', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_018', 'test_exif_v2.jpg', image.PropertyKey.GPS_LATITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('39, 54, 20')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_019
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_019
     * @tc.desc   PhotoAccessHelper_Photo:ISO_SPEED_RATINGS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_019', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_019', 'test_exif_v2.jpg', image.PropertyKey.ISO_SPEED_RATINGS,
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
     * @tc.name   ImageGetImagePropertySyncEnumStripOffset_020
     * @tc.number ImageGetImagePropertySyncEnumStripOffset_020
     * @tc.desc   PhotoAccessHelper_Photo:X_RESOLUTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageGetImagePropertySyncEnumStripOffset_020', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'ImageGetImagePropertySyncEnumStripOffset_020', 'test_exif_v2.jpg', image.PropertyKey.X_RESOLUTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual(' 0')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })


  });
}