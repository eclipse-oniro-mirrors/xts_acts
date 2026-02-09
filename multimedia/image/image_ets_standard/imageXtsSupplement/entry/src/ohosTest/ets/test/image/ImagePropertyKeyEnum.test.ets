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

import {
  sleep,
  isEmpty
} from '../common';

import common from '@ohos.app.ability.common';

const TAG = 'Image.PropertyKey'

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

export default function ImagePropertyKeyTest() {
  describe('ImagePropertyKeyTest', ()=>{
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
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_001
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_001
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_VERSION_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_001', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_001',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_VERSION_ID,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.2.0.0');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_002
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_002
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_LATITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_002', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_002',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_LATITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('N');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_003
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_003
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_LATITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_003', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_003',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_LATITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('39, 54, 20');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_004
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_004
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_LONGITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_004', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_004',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_LONGITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('E');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_005
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_005
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_LONGITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_005', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_005',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_LONGITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('120, 52, 26');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_006
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_006
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_ALTITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_006', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_006',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_ALTITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('Sea level');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_007
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_007
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_ALTITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_007', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_007',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_ALTITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('0.00');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_008
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_008
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_TIME_STAMP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_008', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_008',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_TIME_STAMP,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('11:37:58.00');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_009
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_009
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_SATELLITES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_009', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_009',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_SATELLITES,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('xxx');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_010
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_010
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_STATUS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_010', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_010',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_STATUS,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('A');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_011
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_011
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_MEASURE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_011', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_011',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_MEASURE_MODE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_012
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_012
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_012', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_012',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DOP,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('182');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_013
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_013
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_SPEED_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_013', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_013',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_SPEED_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('N');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_014
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_014
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_SPEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_014', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_014',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_SPEED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('150');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_015
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_015
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_TRACK_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_015', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_015',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_TRACK_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('T');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_016
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_016
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_TRACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_016', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_016',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_TRACK,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('38.0');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_017
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_017
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_IMG_DIRECTION_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_017', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_017',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_IMG_DIRECTION_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('M');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_018
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_018
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_IMG_DIRECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_018', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_018',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_IMG_DIRECTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.23');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_019
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_019
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_MAP_DATUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_019', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_019',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_MAP_DATUM,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('xxx');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_020
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_020
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DEST_LATITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_020', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_020',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_LATITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('N');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_021
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_021
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DEST_LATITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_021', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_021',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_LATITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('33, 22, 11');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_022
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_022
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DEST_LONGITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_022', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_022',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_LONGITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('E');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_023
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_023
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DEST_LONGITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_023', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_023',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_LONGITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('33, 22, 11');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_024
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_024
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DEST_BEARING_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_024', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_024',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_BEARING_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('T');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_025
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_025
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DEST_BEARING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_025', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_025',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_BEARING,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.0');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_026
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_026
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DEST_DISTANCE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_026', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_026',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_DISTANCE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('N');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_027
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_027
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DEST_DISTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_027', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_027',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DEST_DISTANCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('10');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_028
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_028
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_PROCESSING_METHOD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_028', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_028',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_PROCESSING_METHOD,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('CELLID');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_029
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_029
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_AREA_INFORMATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_029', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_029',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_AREA_INFORMATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('arexxx');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_030
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_030
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DATE_STAMP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_030', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_030',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DATE_STAMP,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2025:01:11');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_031
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_031
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_DIFFERENTIAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_031', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_031',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_DIFFERENTIAL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('0');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_032
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_032
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_GPS_H_POSITIONING_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_032', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_032',
        'test_exif_v2.jpg',
        image.PropertyKey.GPS_H_POSITIONING_ERROR,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect(data).assertEqual('2.5');
          }
          if (error != undefined) {
            expect().assertFail();
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_001
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_001
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_VERSION_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_001', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_001',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_VERSION_ID,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_002
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_002
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_LATITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_002', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_002',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_LATITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_003
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_003
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_LATITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_003', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_003',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_LATITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_004
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_004
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_LONGITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_004', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_004',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_LONGITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_005
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_005
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_LONGITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_005', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_005',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_LONGITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_006
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_006
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_ALTITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_006', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_006',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_ALTITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_007
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_007
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_ALTITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_007', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_007',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_ALTITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_008
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_008
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_TIME_STAMP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_008', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_008',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_TIME_STAMP,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_009
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_009
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_SATELLITES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_009', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_009',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_SATELLITES,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_010
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_010
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_STATUS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_010', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_010',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_STATUS,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_011
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_011
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_MEASURE_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_011', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_011',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_MEASURE_MODE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_012
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_012
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_012', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_012',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DOP,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_013
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_013
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_SPEED_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_013', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_013',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_SPEED_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_014
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_014
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_SPEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_014', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_014',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_SPEED,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_015
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_015
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_TRACK_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_015', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_015',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_TRACK_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_016
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_016
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_TRACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_016', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_016',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_TRACK,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_017
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_017
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_IMG_DIRECTION_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_017', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_017',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_IMG_DIRECTION_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_018
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_018
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_IMG_DIRECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_018', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_018',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_IMG_DIRECTION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_019
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_019
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_MAP_DATUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_019', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_019',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_MAP_DATUM,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_020
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_020
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DEST_LATITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_020', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_020',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_LATITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_021
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_021
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DEST_LATITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_021', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_021',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_LATITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_022
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_022
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DEST_LONGITUDE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_022', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_022',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_LONGITUDE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_023
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_023
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DEST_LONGITUDE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_023', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_023',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_LONGITUDE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_024
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_024
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DEST_BEARING_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_024', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_024',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_BEARING_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_025
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_025
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DEST_BEARING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_025', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_025',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_BEARING,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_026
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_026
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DEST_DISTANCE_REF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_026', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_026',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_DISTANCE_REF,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_027
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_027
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DEST_DISTANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_027', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_027',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DEST_DISTANCE,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_028
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_028
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_PROCESSING_METHOD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_028', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_028',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_PROCESSING_METHOD,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_029
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_029
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_AREA_INFORMATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_029', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_029',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_AREA_INFORMATION,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_030
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_030
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DATE_STAMP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_030', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_030',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DATE_STAMP,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_031
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_031
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_DIFFERENTIAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_031', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_031',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_DIFFERENTIAL,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_032
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_032
     * @tc.desc   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_GPS_H_POSITIONING_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_032', Level.LEVEL1, async (done:Function)=> {
      imagePropertyTest(done,
        'SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM_EMPTY_032',
        'test_exif_empty_2.jpg',
        image.PropertyKey.GPS_H_POSITIONING_ERROR,
        (data?: string, error?: BusinessError) => {
          if (data != undefined) {
            expect().assertFail();
          }
          if (error != undefined) {
            expect(error.code).assertEqual('62980123');
          }
        })
    })

  });
}

