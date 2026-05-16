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

const TAG = 'Image.ImagePropertyKeySyncEnum4B'
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
export default function ImagePropertyKeySyncEnumSoftWare() {
  describe('ImagePropertyKeySyncEnumSoftWare', ()=>{
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_001
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_001
     * @tc.desc   PhotoAccessHelper_Photo:SOFTWARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_001', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_001', 'test_exif_empty.jpg', image.PropertyKey.SOFTWARE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_002
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_002
     * @tc.desc   PhotoAccessHelper_Photo:GPS_DEST_LONGITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_002', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_002', 'test_exif_empty.jpg', image.PropertyKey.GPS_DEST_LONGITUDE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_003
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_003
     * @tc.desc   PhotoAccessHelper_Photo:OFFSET_TIME_DIGITIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_003', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_003', 'test_exif_empty.jpg', image.PropertyKey.OFFSET_TIME_DIGITIZED,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_004
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_004
     * @tc.desc   PhotoAccessHelper_Photo:SUBJECT_LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_004', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_004', 'test_exif_empty.jpg', image.PropertyKey.SUBJECT_LOCATION,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_005
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_005
     * @tc.desc   PhotoAccessHelper_Photo:F_NUMBER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_005', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_005', 'test_exif_empty.jpg', image.PropertyKey.F_NUMBER,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_006
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_006
     * @tc.desc   PhotoAccessHelper_Photo:GPS_ALTITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_006', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_006', 'test_exif_empty.jpg', image.PropertyKey.GPS_ALTITUDE_REF,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_007
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_007
     * @tc.desc   PhotoAccessHelper_Photo:NEW_SUBFILE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_007', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_007', 'test_exif_empty.jpg', image.PropertyKey.NEW_SUBFILE_TYPE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_008
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_008
     * @tc.desc   PhotoAccessHelper_Photo:XMAGE_TOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_008', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_008', 'test_exif_empty.jpg', image.PropertyKey.XMAGE_TOP,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_009
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_009
     * @tc.desc   PhotoAccessHelper_Photo:CONTRAST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_009', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_009', 'test_exif_empty.jpg', image.PropertyKey.CONTRAST,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_010
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_010
     * @tc.desc   PhotoAccessHelper_Photo:SUBJECT_AREA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_010', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_010', 'test_exif_empty.jpg', image.PropertyKey.SUBJECT_AREA,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_011
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_011
     * @tc.desc   PhotoAccessHelper_Photo:SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_011', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_011', 'test_exif_empty.jpg', image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
    })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_012
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_012
     * @tc.desc   PhotoAccessHelper_Photo:FOCAL_PLANE_Y_RESOLUTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_012', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_012', 'test_exif_empty.jpg', image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
    })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_013
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_013
     * @tc.desc   PhotoAccessHelper_Photo:GPS_ALTITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_013', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_013', 'test_exif_empty.jpg', image.PropertyKey.GPS_ALTITUDE,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
    })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_014
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_014
     * @tc.desc   PhotoAccessHelper_Photo:WIND_SNAPSHOT_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_014', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_014', 'test_exif_empty.jpg', image.PropertyKey.WIND_SNAPSHOT_MODE,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_015
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_015
     * @tc.desc   PhotoAccessHelper_Photo:FACE_MOUTH_CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_015', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context,'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_015', 'test_exif_empty.jpg', image.PropertyKey.FACE_MOUTH_CENTER,
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_016
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_016
     * @tc.desc   PhotoAccessHelper_Photo:OECF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_016', Level.LEVEL1, async (done:Function)=> {
      let Context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      getImagePropertySync(done, Context, 'SUB_MEDIA_IMAGE_EXIF_PROPERTY_SYNC_ENUM4B_016', 'test_exif_empty.jpg',
        image.PropertyKey.OECF,
        (data?: string, error?: BusinessError) => {
          expect(error?.code).assertEqual('7700101');
        })
    })

  });
}