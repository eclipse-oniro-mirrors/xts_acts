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

const TAG = 'Image.ImagePropertyKeySyncEnum2B'
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
     expect().assertFail();
    }
    console.info(TAG, testName,"imageSourceApi is not null ");
    let propertyKeyName = imageSourceApi.getImagePropertySync(propertyKey)
    console.info(TAG, testName,"bits_per_sample : " + propertyKeyName);
    callback(propertyKeyName,undefined)
  } catch (err) {
    callback(undefined,err)
    console.error(TAG, testName, err.message,"this is catch code", err.code);
  }
  done();
}
export default function ImagePropertyKeySyncEnumGpsTimeTamp() {
  describe('ImagePropertyKeySyncEnumGpsTimeTamp', ()=>{
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_001
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_001
     * @tc.desc   PhotoAccessHelper_Photo:GPS_TIME_STAMP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_001', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_001', 'test_exif_empty.jpg', image.PropertyKey.GPS_TIME_STAMP,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_002
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_002
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_POINTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_002', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_002', 'test_exif_empty.jpg', image.PropertyKey.SCENE_POINTER,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_003
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_003
     * @tc.desc   PhotoAccessHelper_Photo:CAMERA_OWNER_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_003', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_003', 'test_exif_empty.jpg', image.PropertyKey.CAMERA_OWNER_NAME,
        (data?: string, error?: BusinessError) => {
          console.error(TAG, error?.message,"this is catch code", error?.code);
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_004
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_004
     * @tc.desc   PhotoAccessHelper_Photo:BITS_PER_SAMPLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_004', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_004', 'test_exif_empty.jpg', image.PropertyKey.BITS_PER_SAMPLE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_005
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_005
     * @tc.desc   PhotoAccessHelper_Photo:STANDARD_OUTPUT_SENSITIVITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_005', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_005', 'test_exif_empty.jpg', image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_006
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_006
     * @tc.desc   PhotoAccessHelper_Photo:OFFSET_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_006', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_006', 'test_exif_empty.jpg', image.PropertyKey.OFFSET_TIME,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_007
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_007
     * @tc.desc   PhotoAccessHelper_Photo:DATE_TIME_ORIGINAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_007', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_007', 'test_exif_empty.jpg', image.PropertyKey.DATE_TIME_ORIGINAL,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_008
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_008
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_BEACH_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_008', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_008', 'test_exif_empty.jpg', image.PropertyKey.SCENE_BEACH_CONF,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_009
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_009
     * @tc.desc   PhotoAccessHelper_Photo:WHITE_BALANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_009', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_009', 'test_exif_empty.jpg', image.PropertyKey.WHITE_BALANCE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_010
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_010
     * @tc.desc   PhotoAccessHelper_Photo:COMPOSITE_IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_010', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_010', 'test_exif_empty.jpg', image.PropertyKey.COMPOSITE_IMAGE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_011
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_011
     * @tc.desc   PhotoAccessHelper_Photo:GPS_SATELLITES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_011', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_011', 'test_exif_empty.jpg', image.PropertyKey.GPS_SATELLITES,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_012
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_012
     * @tc.desc   PhotoAccessHelper_Photo:SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_012', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_012', 'test_exif_empty.jpg', image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_013
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_013
     * @tc.desc   PhotoAccessHelper_Photo:CFA_PATTERN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_013', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_013', 'test_exif_empty.jpg', image.PropertyKey.CFA_PATTERN,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_014
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_014
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_SNOW_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_014', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_014', 'test_exif_empty.jpg', image.PropertyKey.SCENE_SNOW_CONF,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_015
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_015
     * @tc.desc   PhotoAccessHelper_Photo:APERTURE_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_015', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_015', 'test_exif_empty.jpg', image.PropertyKey.APERTURE_VALUE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_016
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_016
     * @tc.desc   PhotoAccessHelper_Photo:GIF_LOOP_COUNT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_016', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_016', 'test61.gif', image.PropertyKey.GIF_LOOP_COUNT,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('0')
          }
          if (error != undefined) {
            expect().assertFail();
          }
          done();
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_017
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_017
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_CAPTURE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_017', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_017', 'test_exif_empty.jpg', image.PropertyKey.SCENE_CAPTURE_TYPE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_018
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_018
     * @tc.desc   PhotoAccessHelper_Photo:GPS_DOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_018', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_018', 'test_exif_empty.jpg', image.PropertyKey.GPS_DOP,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_019
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_019
     * @tc.desc   PhotoAccessHelper_Photo:JPEG_INTERCHANGE_FORMAT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_019', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_019', 'test_exif_empty.jpg', image.PropertyKey.JPEG_INTERCHANGE_FORMAT,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_020
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_020
     * @tc.desc   PhotoAccessHelper_Photo:SCENE_STAGE_CONF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_020', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM2B_020', 'test_exif_empty.jpg', image.PropertyKey.SCENE_STAGE_CONF,
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

  });
}